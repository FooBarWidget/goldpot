$(document).bind 'reinstall_behavior', ->
  elements = $('table.spendings .edit:not(.spendings-inline-editor-installed)')
  elements.addClass('spendings-inline-editor-installed')
  elements.click (event)->
    event.preventDefault()
    $(this).hide()
    $(this).parent().find('.editing').show()
    $.get $(this).attr('href'), (html)=>
      row = $(this).closest('tr')
      cols = row.find('td').length
      newRow = $('<tr class="drawer"><td colspan="' + cols + '"><div class="shell"></div></td></tr>')
      
      div = newRow.find('> td > .shell')
      div.hide()
      div.html(html)
      div.find('> h1:first-child').remove()
      div.find('.cancel').click =>
        div.slideUp =>
          newRow.remove()
          $(this).show()
          $(this).parent().find('.editing').hide()
      
      newRow.insertAfter(row)
      div.slideDown ->
        $(document).trigger('reinstall_behavior')
