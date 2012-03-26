# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#event_period').change ->
    seleccion = $('#event_period :selected').text().replace /^\s+|\s+$/g, ""
    if seleccion != "No se repite"
      $('#event_frequency').show()
    else
      $('#event_frequency').hide()

  $('div#create-event').click ->
    $('div#event-form').animate({opacity: 'toggle', height: 'toggle'}, "fast")
    $('#create-event').hide()
    
   $('div#close-event').click ->
     $('div#event-form').animate({opacity: 'toggle', height: 'toggle'}, "fast")
     $('#create-event').show()