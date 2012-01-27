# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#asesorium_fecha_desde_est").datepicker()
  $("#asesorium_fecha_hasta_est").datepicker()
  $('#asesorium_paciente_comuna').parent().hide()
  comunas = $('#asesorium_paciente_comuna').html()
  $('#asesorium_paciente_region').change ->
    region = $('#asesorium_paciente_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('#asesorium_paciente_comuna').html(options)
      $('#asesorium_paciente_comuna').parent().show() 
    else
      $('#asesorium_paciente_comuna').empty()
      $('#asesorium_paciente_comuna').parent().hide()