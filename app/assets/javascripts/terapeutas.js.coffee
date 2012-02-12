# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  region = $('#terapeuta_region :selected').text().replace /^\s+|\s+$/g, ""
  if region.length == 0
    $('#terapeuta_comuna').attr('disabled', true)
  else
    $('#terapeuta_comuna').attr('disabled', false)
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
  comunas = $('#terapeuta_comuna').html()
  $('#terapeuta_region').change ->
    region = $('#terapeuta_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('#terapeuta_comuna').html(options)
      $('#terapeuta_comuna').attr('disabled', false)
    else
      $('#terapeuta_comuna').empty()
      $('#terapeuta_comuna').attr('disabled', true)

  $('#terapeuta_region').blur ->
    region = $('#terapeuta_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('#terapeuta_comuna').html(options)
      $('#terapeuta_comuna').attr('disabled', false)
      $('#terapeuta_comuna').focus()
    else
      $('#terapeuta_comuna').empty()
      $('#terapeuta_comuna').attr('disabled', true)

