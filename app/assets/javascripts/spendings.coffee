$(document).bind 'reinstall_behavior', ->
  elements = $('table.spendings .edit-button:not(.spendings-inline-editor-installed)')
  elements.addClass('spendings-inline-editor-installed')
  
  # Upon clicking 'Edit'...
  elements.click (event)->
    event.preventDefault()
    
    # ...hide the edit link and show 'editing...'
    $(this).hide()
    $(this).parent().find('.editing-button').show()
    
    # ...load the editor panel into a row below
    $.get $(this).attr('href'), (html)=>
      row  = $(this).closest('tr')
      cols = row.find('td').length
      newRow = $('<tr class="drawer"><td colspan="' + cols + '"><div class="shell"></div></td></tr>')
      div  = undefined
      form = undefined
      
      stopEditing = =>
        div.slideUp =>
          newRow.remove()
          $(this).show()
          $(this).parent().find('.editing-button').hide()
      
      onSubmit = (event)=>
        event.preventDefault()
        if event.target.nodeName == 'FORM'
          form = $(event.target)
        else
          form = $(event.target).closest('form')
        $.post form.attr('action'), form.serialize(), (response)=>
        if response.indexOf('error_explanation') == -1
          stopEditing()
          $(response).insertAfter(row)
          row.remove()
          $(document).trigger('reinstall_behavior')
        else
          setContents(response)
          div.show()
          div.find('#error_explanation')[0].scrollIntoView()
      
      setContents = (html)=>
        div = newRow.find('> td > .shell')
        div.hide()
        div.html(html)
        div.find('> h1:first-child').remove()
        
        # Cancel button behavior
        div.find('.cancel').click(stopEditing)
        
        # Submit button behavior
        form = div.find('form')
        form.submit (event)=>
          event.preventDefault()
          $.post form.attr('action'), form.serialize(), (response)=>
            if response.indexOf('error_explanation') == -1
              stopEditing()
              $(response).insertAfter(row)
              row.remove()
              $(document).trigger('reinstall_behavior')
            else
              setContents(response)
              div.show()
              div.find('#error_explanation')[0].scrollIntoView()
      
      # Display editor panel
      setContents(html)
      newRow.insertAfter(row)
      div.slideDown ->
        $(document).trigger('reinstall_behavior')
