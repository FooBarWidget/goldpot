$(document).ready ->
  $('input, textarea').change ->
    $(this).addClass('changed')
  
  $('input.combobox').each ->
    values = $(this).data('combobox-values')
    $(this).combobox(values)

