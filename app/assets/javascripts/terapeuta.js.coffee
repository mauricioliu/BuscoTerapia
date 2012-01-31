# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#terapeutum_comuna').attr('disabled', true)
  comunas = $('#terapeutum_comuna').html()
  $('#terapeutum_region').change ->
    region = $('#terapeutum_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('#terapeutum_comuna').html(options)
      $('#terapeutum_comuna').attr('disabled', false)
    else
      $('#terapeutum_comuna').empty()
      $('#terapeutum_comuna').attr('disabled', true)

