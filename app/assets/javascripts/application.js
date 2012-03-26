// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ujs
//= require_tree .
//= require rails.validations
//= require fullcalendar
//= require calendar
//= require jquery.rest
//= require jquery-ui-1.8.18.custom.min
//= require jquery-ui-timepicker-addon

jQuery(function($){
	  $('#event_starts_at').datetimepicker({
	  stepHour: 1,
	  stepMinute: 5,
	  hourMin: 8,
	  hourMax: 23,
      onClose: function(dateText, inst) {
          var endDateTextBox = $('#event_ends_at');
          if (endDateTextBox.val() != '') {
              var testStartDate = new Date(dateText);
              var testEndDate = new Date(endDateTextBox.val());
              if (testStartDate > testEndDate)
                  endDateTextBox.val(dateText);
          }
          else {
              endDateTextBox.val(dateText);
          }
      },
      onSelect: function (selectedDateTime){
          var start = $(this).datetimepicker('getDate');
          $('#event_ends_at').datetimepicker('option', 'minDate', new Date(start.getTime()));
      }
  });
  
  $('#event_ends_at').datetimepicker({
	  stepHour: 1,
	  stepMinute: 5,
	  hourMin: 8,
	  hourMax: 23,
      onClose: function(dateText, inst) {
          var startDateTextBox = $('#event_starts_at');
          if (startDateTextBox.val() != '') {
              var testStartDate = new Date(startDateTextBox.val());
              var testEndDate = new Date(dateText);
              if (testStartDate > testEndDate)
                  startDateTextBox.val(dateText);
          }
          else {
              startDateTextBox.val(dateText);
          }
      },
      onSelect: function (selectedDateTime){
          var end = $(this).datetimepicker('getDate');
          $('#event_starts_at').datetimepicker('option', 'maxDate', new Date(end.getTime()) );
      }
  });
	
	$.datepicker.regional['es'] = {
		closeText: 'Cerrar',
		prevText: '&#x3c;Ant',
		nextText: 'Sig&#x3e;',
		currentText: 'Hoy',
		monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		'Jul','Ago','Sep','Oct','Nov','Dic'],
		dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
		dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['es']);
});

