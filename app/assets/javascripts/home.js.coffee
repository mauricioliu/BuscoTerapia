# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#search_tabs").tabs()
  $('.psicologo_comuna').attr('disabled', true)
  comunas = $('.psicologo_comuna').html()
  $('.psicologo_region').change ->
    region = $('.psicologo_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('.psicologo_comuna').html(options)
      $('.psicologo_comuna').attr('disabled', false)
    else
      $('.psicologo_comuna').empty()
      $('.psicologo_comuna').attr('disabled', true)

jQuery ->
  $('.alternativo_comuna').attr('disabled', true)
  comunas = $('.alternativo_comuna').html()
  $('.alternativo_region').change ->
    region = $('.alternativo_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('.alternativo_comuna').html(options)
      $('.alternativo_comuna').attr('disabled', false)
    else
      $('.alternativo_comuna').empty()
      $('.alternativo_comuna').attr('disabled', true)
      
jQuery ->
  $('.psiquiatra_comuna').attr('disabled', true)
  comunas = $('.psiquiatra_comuna').html()
  $('.psiquiatra_region').change ->
    region = $('.psiquiatra_region :selected').text().replace /^\s+|\s+$/g, ""
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(comunas).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('.psiquiatra_comuna').html(options)
      $('.psiquiatra_comuna').attr('disabled', false)
    else
      $('.psiquiatra_comuna').empty()
      $('.psiquiatra_comuna').attr('disabled', true)
