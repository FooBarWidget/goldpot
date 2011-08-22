$.fn.autoFillValue = (value)->
  $this = $(this)
  if !$this.hasClass('changed')
    $this.val(value)
    $this.removeClass('changed')

installChangeMarks = ->
  elements = $('input:not(.change-marks-installed), textarea:not(.change-marks-installed)')
  elements.addClass('change-marks-installed')
  elements.change ->
    $(this).addClass('changed')

installComboboxes = ->
  elements = $('input.combobox:not(.combobox-installed)')
  elements.addClass('combobox-installed')
  elements.each ->
    values = $(this).data('combobox-values')
    $(this).combobox(values)

installAutoFill = ->  
  elements = $('form.spending input:not(.auto-fill-installed), form.spending textarea:not(.auto-fill-installed)')
  elements.addClass('auto-fill-installed')
  elements.change ->
    form = $(this).closest('form')
    
    valueOf = (fieldName)=>
      $elem = $('#spending_' + fieldName, form)
      elem = $elem[0]
      if elem.nodeName == "SELECT"
        option = elem.options[elem.selectedIndex]
        $(option).text()
      else
        $elem.val()
    
    autoFill = (fieldName, value)=>
      $elem = $('#spending_' + fieldName, form)
      if $elem.hasClass('percentage') && value == parseInt(value.toFixed(0))
        value = value + '.0'
      $elem.autoFillValue(value)
    
    spendingKindName = valueOf('spending_kind')
    spendingKind = spendingKinds[spendingKindName] || spendingKinds['Overig']
    amountExVat = valueOf('amount_ex_vat')
    
    
    if amountExVat == ''
      autoFill('vat', '')
    else
      div = (1 + spendingKind.vat / 10000)
      autoFill('vat', (amountExVat - amountExVat / div).toFixed(2))
    autoFill('opvoerbaarheid_pct', spendingKind.opvoerbaar / 100)


$(document).bind 'reinstall_behavior', ->
  installChangeMarks()
  installComboboxes()
  installAutoFill()

