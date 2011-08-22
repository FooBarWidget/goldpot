$.fn.autoFillValue = (value)->
  $this = $(this)
  if !$this.hasClass('changed')
    $this.val(value)
    $this.removeClass('changed')

installChangeMarks = ->
  $('input, textarea').change ->
    $(this).addClass('changed')

installComboboxes = ->
  $('input.combobox').each ->
    values = $(this).data('combobox-values')
    $(this).combobox(values)

installAutoFill = ->  
  $('form.spending input, form.spending textarea').change ->
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
      

$(document).ready ->
  installChangeMarks()
  installComboboxes()
  installAutoFill()
  
