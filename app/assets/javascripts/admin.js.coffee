# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  status = $('#asesoria_status :selected').text().replace /^\s+|\s+$/g, ""
  if status == "agendado"
     $('#terapeuta_asignado').show()
  else
     $('#terapeuta_asignado').hide()
  $('#asesoria_status').change ->
    status = $('#asesoria_status :selected').text().replace /^\s+|\s+$/g, ""
    if status == "agendado"
      $('#terapeuta_asignado').show()
    else
      $('#terapeuta_asignado').hide()
