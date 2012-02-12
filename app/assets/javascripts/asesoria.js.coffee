# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#asesorium_fecha_desde_est").datepicker({ 
                                    minDate: -0, 
                                    maxDate: "+1M +90D",
                                    showOn: "button",
                                    buttonImage: "/assets/calendar.gif",
                                    buttonImageOnly: true 
                                    });
  $("#asesorium_fecha_hasta_est").datepicker({ 
                                    minDate: -0, 
                                    maxDate: "+1M +90D",
                                    showOn: "button",
                                    buttonImage: "/assets/calendar.gif",
                                    buttonImageOnly: true 
                                    });
  $("#asesorium_fecha_desde_est").attr('readonly', true)
  $("#asesorium_fecha_hasta_est").attr('readonly', true)
    
    
jQuery ->
  $('#asesorium_paciente_comuna').attr('disabled', true)
  comunas = $('#asesorium_paciente_comuna').html()
  $('#asesorium_paciente_region').change ->
    region = $('#asesorium_paciente_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('#asesorium_paciente_comuna').html(options)
      $('#asesorium_paciente_comuna').attr('disabled', false)
    else
      $('#asesorium_paciente_comuna').empty()
      $('#asesorium_paciente_comuna').attr('disabled', true)
      
  $('#asesorium_paciente_region').blur ->
    region = $('#asesorium_paciente_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('#asesorium_paciente_comuna').html(options)
      $('#asesorium_paciente_comuna').attr('disabled', false)
      $('#asesorium_paciente_comuna').focus()
    else
      $('#asesorium_paciente_comuna').empty()
      $('#asesorium_paciente_comuna').attr('disabled', true)
