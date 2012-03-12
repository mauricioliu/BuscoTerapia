

	/** MENSAJE ALERT **/

function alertMsj(titulo,texto,duration){
	if(duration == undefined) duration = 1000;
	$('#mjs-alert').html("")
	strHtml = '<div id="bg-mjs-alert"></div><div id="box-mjs-alert">';
	if(titulo != undefined && titulo != "")
	strHtml += '<h1>'+titulo+'</h1>';
	if(texto != undefined && texto != "")
	strHtml += '<p>'+texto+'</p>';
	strHtml += '</div>';
	$('#mjs-alert').html(strHtml).attr("rel", duration)
	$('#mjs-alert').fadeIn("slow",function(){
		setTimeout('$("#mjs-alert").fadeOut("fast")',$(this).attr("rel"));
	})
}	
  /*
  ejemplos de uso:
$(document).ready(function() {
	alertMsj("Bienvenido José Soler", "Este es un texto de bajada", 3000)
	//alertMsj("Bienvenido José Soler")
});
  */

$(document).ready(function(e) {
	// MENSAJE ALERT div
	$('body').append('<div id="mjs-alert"></div>');
	
	$("#nav ul li:last-child").addClass("lastChild")
	
	// Click boton cerrar mensaje home
	$('.boton-cerrar-mensaje').click(function(e) {
		$($(this).attr("obj")).animate({opacity: 'toggle', height: 'toggle'}, "slow")
	});

	
	$("#unfocus-bg-login-form").click(function () {
		$('#loginForm').animate({opacity: 'hide', height: 'hide'}, "fast")
		$("#unfocus-bg-login-form").css("display","none");
	});

	
	// Click del boton
	$('div#login').click(function(e) {
		e.preventDefault();
		$('div#loginForm').animate({opacity: 'toggle', height: 'toggle'}, "fast")
		$("#unfocus-bg-login-form").css("display","block");
		$("#user_field").focus();
		/*$('div#loginForm').toggle("fast");*/
	});
	
	// Movimiento del menú superior
	
	var _menuPosY = 116;//$('#block-nav').position().top;
	var _marginMenu = -$('#block-nav').width() / 2; 
	var _marginTopContent = $('#block-nav').height() + parseInt($('#block-nav').css('margin-bottom'));
	var _navMarginTop = $("#block-nav").css('margin-top');
	var _navMarginBottom = $("#block-nav").css('margin-bottom');

	/*Preguntas frecuentes vars*/
	if($('#scrollDownFaq').length != 0){
		var _faqPosY = $('#scrollDownFaq').offset().top;
		var _faqPosX = $('#scrollDownFaq').offset().left;
	}

	
	//alert(_faqPosY)
	//var _faqMarginLeft = $('#scrollDownFaq').css("margin-left");
	function moverPreguntas(){
		if($('#scrollDownFaq').length != 0){
			/*Preguntas frecuentes mover*/
			if($('#scrollDownFaq').offset().top >= $('#block-content').offset().top+$('#block-content').height()-$('#scrollDownFaq').height() && $(window).scrollTop() > $('#scrollDownFaq').offset().top - 45){
				$('#scrollDownFaq').css({position:"absolute",right:"0px",top:($('#block-content').height()-$('#scrollDownFaq').height())+'px',zIndex:100});
			}else if ( _faqPosY <= $(window).scrollTop() + 45) {
				//$('#scrollDownFaq').css('position', 'fixed').css({top:45+'px',left:_faqPosX+'px',marginLeft:'0px',zIndex:100});
				$('#scrollDownFaq').css({position:"absolute",right:"0px",top:($(window).scrollTop()+45-$('#block-content').offset().top)+'px',zIndex:100});
			} else {
				//$('#scrollDownFaq').css('position', 'relative').css({top:'0px',left:'0px',marginLeft:_faqMarginLeft,zIndex:0});
				$('#scrollDownFaq').css({position:"relative",right:"none",top:'0px',zIndex:0});
			}
			//alert("mover")
		}
	}
	moverPreguntas()
	
	function moverMenu(){
		if ( _menuPosY <= $(window).scrollTop() ) {
			$("#block-nav").css('position', 'fixed');
			$("#block-nav").css('top', '0px');
			$("#header").css("margin-bottom", $("#block-nav").height()+"px")
		} else {
			$("#block-nav").css('position', 'relative');
			$("#header").css("margin-bottom", "0px")
		}
	}
	moverMenu()
	$(window).scroll(function(e) {
		moverMenu()
		moverPreguntas()
		
	});
	
	
	
	
	
	// Selector de terapias
	
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content
	//On Click Event
		$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
			var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
			return false;
	});
	
	
// ACORDEON PREGUNTAS FRECUENTES

	acordeonActual = ""
	strBotonesAcordeon='<div class="acordeon-boton acordeon-menos"></div>'
	strBotonesAcordeon+='<div class="acordeon-boton acordeon-mas"></div>'
	$(".acordeon-lista ul li").each(function(index){
		$(this).find(".acordeon-header").append(strBotonesAcordeon)
		if($(this).attr("id") == "" || $(this).attr("id") == undefined  || $(this).attr("id") == "undefined" ){
			$(this).attr("id", "acordeon-li-id-"+index)
		}
		$(this).find(".acordeon-content").css("display","none")
		
		$(this).find(".acordeon-img").each(function(){
			if($(this).html() == "" || $(this).find("img").attr("src") == ""){
				$(this).css("display","none")
			}
		})
	})
	$(".acordeon-lista ul li").click(function(){
		if(acordeonActual != $(this).attr("id")){
			if(acordeonActual != ""){
				$("#"+acordeonActual).removeClass("active")
				$("#"+acordeonActual + " .acordeon-content").slideToggle("fast")
			}
			acordeonActual = $(this).attr("id")
			$(this).addClass("active")
			$(this).find(".acordeon-content").slideToggle("fast")
			
		}
	})
	$(".acordeon-lista ul li:first-child").trigger("click")
	
});



function printContent(id, title){
	str=document.getElementById(id).innerHTML
	newwin=window.open('','printwin','left=100,top=100,width=400,height=400')
	newwin.document.write('<HTML>\n<HEAD>\n')
	newwin.document.write('<TITLE>'+title+'</TITLE>\n')
	newwin.document.write('<style>\n')
	newwin.document.write('.no-print{display:none;}\n')
	newwin.document.write('body{font:12px Verdana, Arial, sans-serif;}\n')
	newwin.document.write('</style>\n')
	newwin.document.write('<script>\n')
	newwin.document.write('function chkstate(){\n')
	newwin.document.write('if(document.readyState=="complete"){\n')
	newwin.document.write('window.close()\n')
	newwin.document.write('}\n')
	newwin.document.write('else{\n')
	newwin.document.write('setTimeout("chkstate()",2000)\n')
	newwin.document.write('}\n')
	newwin.document.write('}\n')
	newwin.document.write('function print_win(){\n')
	newwin.document.write('window.print();\n')
	newwin.document.write('chkstate();\n')
	newwin.document.write('}\n')
	newwin.document.write('<\/script>\n')
	newwin.document.write('</HEAD>\n')
	newwin.document.write('<BODY onload="print_win()">\n')
	newwin.document.write('<h2>buscoterapia.cl</h2>\n')
	newwin.document.write(str)
	newwin.document.write('</BODY>\n')
	newwin.document.write('</HTML>\n')
	newwin.document.close()
}

	//carrousel
	
		$.fn.infiniteCarousel = function () {
		
		    function repeat(str, num) {
		        return new Array( num + 1 ).join( str );
		    }
		  
		    return this.each(function () {
		        var $wrapper_carousel = $('> div', this).css('overflow', 'hidden'),
		            $slider = $wrapper_carousel.find('> ul'),
		            $items = $slider.find('> li'),
		            $single = $items.filter(':first'),
		            
		            singleWidth = $single.outerWidth(), 
		            visible = Math.ceil($wrapper_carousel.innerWidth() / singleWidth), // note: doesn't include padding or border
		            currentPage = 1,
		            pages = Math.ceil($items.length / visible);            
					totalItemsInicial = $items.length

		        // 1. Pad so that 'visible' number will always be seen, otherwise create empty items
		        if (($items.length % visible) != 0) {
		            $slider.append(repeat('<li class="empty" />', visible - ($items.length % visible)));
		            $items = $slider.find('> li');
		        }
		
		        // 2. Top and tail the list with 'visible' number of items, top has the last section, and tail has the first
		        $items.filter(':first').before($items.slice(- visible).clone().addClass('cloned'));
		        $items.filter(':last').after($items.slice(0, visible).clone().addClass('cloned'));
		        $items = $slider.find('> li'); // reselect
		        
		        // 3. Set the left position to the first 'real' item
		        $wrapper_carousel.scrollLeft(singleWidth * visible);
		        
		        // 4. paging function
		        function gotoPage(page) {
		            var dir = page < currentPage ? -1 : 1,
		                n = Math.abs(currentPage - page),
		                left = singleWidth * dir * visible * n;
		            
		            $wrapper_carousel.filter(':not(:animated)').animate({
		                scrollLeft : '+=' + left
		            }, 1000, function () {
		                if (page == 0) {
		                    $wrapper_carousel.scrollLeft(singleWidth * visible * pages);
		                    page = pages;
		                } else if (page > pages) {
		                    $wrapper_carousel.scrollLeft(singleWidth * visible);
		                    // reset back to start position
		                    page = 1;
		                } 
		
		                currentPage = page;
		            });                
		            
		            return false;
		        }
				if(totalItemsInicial > 3){
		        $wrapper_carousel.after('<a class="arrow back" alt="&lt;"></a><a class="arrow forward" alt="&gt;"></a>');
				}
		        // 5. Bind to the forward and back buttons
		        $('a.back', this).click(function () {
		            return gotoPage(currentPage - 1);                
		        });
		        
		        $('a.forward', this).click(function () {
		            return gotoPage(currentPage + 1);
		        });
		        
		        // create a public interface to move to a specific page
		        $(this).bind('goto', function (event, page) {
		            gotoPage(page);
		        });
		    });  
		};
		
		$(document).ready(function () {
		  $('.infiniteCarousel').infiniteCarousel();
		});

		
		
		

//RESULTADOS DE BUSQUEDA DE TERAPEUTAS
idGenericoUnico = 0
	
$(document).ready(function () {
	//ver mapa grande on roll over
	$('.map-container iframe').mouseenter(function(){
		if(!$(this).parent().hasClass("abierto")){
			$(this).parent().addClass("abierto").stop().animate({left:-464}, 500);
			$(this).stop().animate({width:615,height:350}, 500);
			$(this).attr("src",$(this).attr("src"));
		}
	});
	$('.map-container iframe').mouseleave(function(){
		$(this).parent().stop().animate({left:0}, 500);
		$(this).stop().animate({width:151,height:182}, 500,
		function(){
			$(this).parent().removeClass("abierto")
			$(this).attr("src",$(this).attr("src"));
		}
		);
		
	});
	
	$(".ficha-persona").each(function(){
		$(this).append('<div class="bt-descr-completa"><span>Descripción completa</span></div>');

		$(this).find(".bt-descr-completa").click(function(){
			if($(this).parent().hasClass("ficha-simple")){
				this_speed = "fast"
			}else{
				this_speed = "slow"
			}
			if($(this).parent().hasClass("abierta")){
				$(this).parent().removeClass("abierta").find(".descripcion-full").animate({opacity: 'hide', height: 'hide'}, "fast")
			}else{
				$('html,body').animate({scrollTop: $(this).parent().offset().top-45},'slow');
				$(this).parent().find(".descripcion-full").animate({opacity: 'show', height: 'show'}, this_speed,
				
				function(){
					$(this).parent().parent().addClass("abierta");
					$(this).find(".map-container iframe").attr("src",$(this).attr("src"));
				}
				
				);
				
			}
		});
		$(this).find(".contenido-ficha").click(function(){
			if($(this).parent().hasClass("ficha-simple")){
				this_speed = "fast"
			}else{
				this_speed = "slow"
			}
			if(!$(this).parent().hasClass("abierta")){
				$('html,body').animate({scrollTop: $(this).parent().offset().top-45},'slow');
				$(this).find(".descripcion-full").animate({opacity: 'show', height: 'show'}, this_speed,
				function(){
					$(this).parent().parent().addClass("abierta")
					$(this).find(".map-container iframe").attr("src",$(this).find(".map-container iframe").attr("src"));
				}
				);
			}
		});
	});
		
	$(".pagination ul li").each(function(){
		$(this).click(function(){
			window.location.href = $(this).find("a").attr("href");
		})
	})


	
	
	
	
	$(".ficha-terapias").each(function(index){
		titulo_ficha = $(this).find(".nombre-ficha").html();
		if( $(this).attr("id") == 'undefined' || $(this).attr("id") == "" || $(this).attr("id") == undefined ){
			this_id = "ficha-terapias-auto_id-"+index
			$(this).attr("id", this_id)
		}else{
			this_id = $(this).attr("id")
		}
		$(this).find(".bt-ver-mas").append("Ver más").attr("rel",this_id).click(function(){
				$('html,body').animate({scrollTop: $("#"+$(this).attr("rel")).offset().top-45},'slow');
				$("#"+$(this).attr("rel") + " .descripcion-resumen").animate({opacity: 'hide', height: 'hide'}, 'fast');
				$("#"+$(this).attr("rel") + " .descripcion-full").animate({opacity: 'show', height: 'show'}, 'slow');
				
		});
		
		//boton imprimir:
		$(this).find(".bt-print").attr("href","#imprimir").attr("rel",this_id).attr("title",titulo_ficha).click(function(e){
				e.preventDefault();
				printContent($(this).attr('rel'), 'Buscaterapia.cl - '+$(this).attr('title'));
		});
		
	});
	
	
	/** ARTICULOS **/
	$(".ficha-articulo").each(function(index){
		titulo_ficha = $(this).find(".encabezado h3").html();
		if( $(this).attr("id") == 'undefined' || $(this).attr("id") == "" || $(this).attr("id") == undefined ){
			this_id = "ficha-articulo-auto_id-"+index
			$(this).attr("id", this_id)
		}else{
			this_id = $(this).attr("id")
		}
		//boton imprimir:
		$(this).find(".bt-print").attr("href","#imprimir").attr("rel",this_id).attr("title",titulo_ficha).click(function(e){
				e.preventDefault();
				printContent($(this).attr('rel'), 'Buscaterapia.cl - '+$(this).attr('title'));
		});
		
	});
	
	/** Noticias **/
	$(".ficha-noticia").each(function(index){
		titulo_ficha = $(this).find(".encabezado h3").html();
		if( $(this).attr("id") == 'undefined' || $(this).attr("id") == "" || $(this).attr("id") == undefined ){
			this_id = "ficha-articulo-auto_id-"+index
			$(this).attr("id", this_id)
		}else{
			this_id = $(this).attr("id")
		}
		//boton imprimir:
		$(this).find(".bt-print").attr("href","#imprimir").attr("rel",this_id).attr("title",titulo_ficha).click(function(e){
				e.preventDefault();
				printContent($(this).attr('rel'), 'Buscaterapia.cl - '+$(this).attr('title'));
		});
		
	});
	
	//codigo twitter (botoncitos de twitiar)
	!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
	
	
	
	
	
	/**** MI FICHA home privado ****/
	
	$(".dinamic-swich").each(function(index){
		input_value = $(this).find(".dinamic-value").val();
		$(this).find(".input_field").append("<p class='display-text'>"+input_value+"</p><div class='edit-icon'></div>")
		.find(".display-text").click(function(){
			$(this).parent().addClass("editando")
			$(this).parent().find(".dinamic-value").focus();
		}).parent().find('.edit-icon').click(function(){
			if($(this).parent().hasClass("editando")){
				input_value_move = $(this).parent().find(".dinamic-value").val();
				$(this).parent().find(".display-text").html(input_value_move)
				$(this).parent().removeClass("editando")
				if($(this).parent().find(".dinamic-value").val() == "" && $(this).parent().parent().parent().hasClass("multiples-campos-container")){
					objetoPadre = $(this).parent().parent().parent()
					$(this).parent().parent().remove();
					repasarNamesInput(objetoPadre);
				}
			}else{
				$(this).parent().addClass("editando")
				$(this).parent().find(".dinamic-value").focus();
			}
		}).parent().find('.dinamic-value').blur(function(){
			if($(this).val() == "" && $(this).parent().parent().parent().hasClass("multiples-campos-container")){
				objetoPadre = $(this).parent().parent().parent()
				$(this).parent().parent().remove();
				repasarNamesInput(objetoPadre);
			}
			
		})
		/*.parent().find('.dinamic-value').blur(function(){
			
			if($(this).parent().hasClass("editando")){
				$(this).parent().find('.edit-icon').trigger("click");
				input_value_move = $(this).parent().find(".dinamic-value").val();
				$(this).parent().find(".display-text").html(input_value_move)
				$(this).parent().removeClass('editando')
			}
			
			
		}).bind('focus', function(){
			$(this).attr("rel","editando")
		});*/
	});

	
	
	$(".multiples-campos-boton-agregar").click(function(){
		labelToPut = $(this).parent().find(".multiples-campos-container").attr("label")
		htmlInput = $(this).parent().find(".multiples-campos-plantilla-input").html()
		strNuevoCampo  = '			<div id="nuevo-campo-'+idGenericoUnico+'" class="form-block one-line dinamic-swich">'
		strNuevoCampo += '				<div class="label">'+labelToPut+'</div>'
		strNuevoCampo += '				<div class="input_field">'
		strNuevoCampo += htmlInput
		strNuevoCampo += '				</div>'
		strNuevoCampo += '			</div>'
		input_value = "";
		$(this).parent().find(".multiples-campos-container").append(strNuevoCampo)
		$('#nuevo-campo-'+idGenericoUnico).find(".input_field").append("<p class='display-text'>"+input_value+"</p><div class='edit-icon'></div>")
		.find(".display-text").click(function(){
			$(this).parent().addClass("editando")
			$(this).parent().find(".dinamic-value").focus();
		}).parent().find('.edit-icon').click(function(){
			if($(this).parent().hasClass("editando")){
				input_value_move = $(this).parent().find(".dinamic-value").val();
				$(this).parent().find(".display-text").html(input_value_move)
				$(this).parent().removeClass("editando")
				if($(this).parent().find(".dinamic-value").val() == "" && $(this).parent().parent().parent().hasClass("multiples-campos-container")){
					objetoPadre = $(this).parent().parent().parent()
					$(this).parent().parent().remove();
					repasarNamesInput(objetoPadre);
				}
			}else{
				$(this).parent().addClass("editando")
				$(this).parent().find(".dinamic-value").focus();
			}

		}).parent().find('.dinamic-value').blur(function(){
			if($(this).val() == "" && $(this).parent().parent().parent().hasClass("multiples-campos-container")){
				objetoPadre = $(this).parent().parent().parent()
				$(this).parent().parent().remove();
				repasarNamesInput(objetoPadre);
			}
			
		})
		repasarNamesInput($(this).parent().find(".multiples-campos-container"));
		$('#nuevo-campo-'+idGenericoUnico+' .edit-icon').trigger("click")
		idGenericoUnico++
	})
	function repasarNamesInput(divEditar){
		nombreArray = divEditar.attr("name")
		divEditar.find(".dinamic-value").each(function(index){
			$(this).attr("name", nombreArray+'['+index+']')
		})
	}
	$(".multiples-campos").each(function(){
		repasarNamesInput($(this).find(".multiples-campos-container"));
	})

});


	/** MENSAJE PREVIEW FICHA **/

function previewFicha(strHtml){
	
	$('#box-mjs-preview').html("")
	$('#box-mjs-preview').html("<div id='bt-cerrar-mjs-preview'>cerrar X</div>"+strHtml)
	$("#bt-cerrar-mjs-preview").click(function(e){
		cerrarPreviewFicha()
	})
	$('#mjs-preview').fadeIn("slow")
	$('html,body').animate({scrollTop: 0},'slow');
}
function cerrarPreviewFicha(){
	$('#mjs-preview').fadeOut("fast", function(){
		$('#box-mjs-preview').html("")
	})
}	
$(document).ready(function () {
	// MENSAJE preview div base
	$('body').append('<div id="mjs-preview"><div id="bg-mjs-preview"></div><div id="box-mjs-preview"><div id="bt-cerrar-mjs-preview"></div></div></div>');
	//fondo negro:	
	$("#bg-mjs-preview").click(function(e){
		cerrarPreviewFicha()
	})
	
	//boton para previsualizar la ficha actual:	
	
	$(".previsualizar-ficha a").click(function(e){
		e.preventDefault();
		previewFicha(generarFichaPersona())
	})

	//boton (derecha) para previsualizar la ficha más bakan:
	
	$("#previsualizar-otra-ficha").click(function(e){
		e.preventDefault();
		previewFicha(generarFichaPersona())
	
	})
	
	
	
});
//aca creamos el div de una ficha tipo, con todos los tags html iguales a los de antes...
//hay que insertarle los valores reales, se pueden obtener de los inputs cuando tengan id o nombre
function generarFichaPersona(){
	fichaPersona = '			<div class="busqueda-box-center">'
	fichaPersona += '				<div class="ficha-persona">'
	fichaPersona += '					<div class="foto"><img src="http://fpoimg.com/42x42" alt="Esteban Soto" width="42" height="42" border="0" /></div>'
	fichaPersona += '					<div class="contenido-ficha">'
	fichaPersona += '						'
	fichaPersona += '						<p class="nombre-ficha">Esteban Encina Zúñiga</p>'
	fichaPersona += '						<p>'
	fichaPersona += '							<strong>Psicólogo. Universidad de Chile</strong><br/>'
	fichaPersona += '							Centro de Medicinas Alternativas La Legua<br/>'
	fichaPersona += '							29 años'
	fichaPersona += '						</p>'
	fichaPersona += '						<div class="descripcion-full">'
	fichaPersona += '							<h3>Descripción del psicologo como en los nuevos cv’s consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</h3>'
	fichaPersona += '							<div class="ficha-columna">'
	fichaPersona += '								<h3>Información de experiencia y formación académica:</h3>'
	fichaPersona += '								<ul>'
	fichaPersona += '									<li><span><strong>Especialidades:</strong> Lorem ipsum dolor si amet consecuteur.</span></li>'
	fichaPersona += '									<li><span><strong>Experiencia:</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></li>'
	fichaPersona += '									<li><span><strong>Formación y Estudios Acreditados:</strong> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure.</span></li>'
	fichaPersona += '								</ul>'
	fichaPersona += '								'
	fichaPersona += '								<h3>Costo y formas de pago:</h3>'
	fichaPersona += '								<ul>'
	fichaPersona += '									<li><span><strong>Arancel por sesión:</strong> $25.000.-</span></li>'
	fichaPersona += '									<li><span><strong>Formas de Pago:</strong> Cheque, Transferencia, Recompra.</span></li>'
	fichaPersona += '									<li><span><strong>Convenios: </strong> Ut enim ad minim veniam, quis nostrud exercitation ullamco.</span></li>'
	fichaPersona += '								</ul>'
	fichaPersona += '								'
	fichaPersona += '								<h3>Datos de Contacto:</h3>'
	fichaPersona += '								<ul>'
	fichaPersona += '									<li><span><strong>Dirección:</strong> Patagonia 12345, La Pintana.</span></li>'
	fichaPersona += '									<li><span><strong>Teléfonos de contacto:</strong> +56 9 8675 4323</span></li>'
	fichaPersona += '									<li><span><strong>Correo electrónico:</strong> huaqui@huaqui.cl</span></li> '
	fichaPersona += '									<li><span><strong>Sitio web:</strong> <a href="http://www.huaiqui.cl">huaiqui.cl</a></span></li>'
	fichaPersona += '								</ul>'
	fichaPersona += '								'
	fichaPersona += '								<input type="button" value="Contactar al Terapeuta" class="boton-morado" />'
	fichaPersona += '							</div><!-- ficha-columna -->'
	fichaPersona += '							<div class="ficha-sidebar">'
	fichaPersona += '								<div class="box box-descuentos">'
	fichaPersona += '								<h3>Descuentos</h3>'
	fichaPersona += '								<img src="http://fpoimg.com/151x126" alt="Esteban Soto" width="151" height="126" border="0" />'
	fichaPersona += '								</div>'
	fichaPersona += '								'
	fichaPersona += '								<div class="box box-mapa">'
	fichaPersona += '									<h3>Mapa de Ubicación</h3>'
	fichaPersona += '									<div class="map-container">'
	fichaPersona += '										<iframe width="151" height="182" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.cl/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=Isidora+Goyenechea,+Santiago&amp;aq=0&amp;oq=isidora+&amp;sll=-35.675147,-71.542969&amp;sspn=80.816499,137.988281&amp;ie=UTF8&amp;hq=&amp;hnear=Isidora+Goyenechea,+Las+Condes,+Santiago,+Regi%C3%B3n+Metropolitana&amp;t=m&amp;ll=-33.414249,-70.599003&amp;spn=0.013039,0.012875&amp;z=14&amp;output=embed"></iframe>'
	fichaPersona += '									</div>'
	fichaPersona += '									<a target="_blank" href="http://maps.google.cl/maps?f=q&amp;source=embed&amp;hl=es&amp;geocode=&amp;q=Isidora+Goyenechea,+Santiago&amp;aq=0&amp;oq=isidora+&amp;sll=-35.675147,-71.542969&amp;sspn=80.816499,137.988281&amp;ie=UTF8&amp;hq=&amp;hnear=Isidora+Goyenechea,+Las+Condes,+Santiago,+Regi%C3%B3n+Metropolitana&amp;t=m&amp;ll=-33.414249,-70.599003&amp;spn=0.013039,0.012875&amp;z=14" class="link-mapa-google">Ver mapa en grande</a>'
	fichaPersona += '								</div>'
	fichaPersona += '								<div class="box box-entrevista">'
	fichaPersona += '									<a href="#">Ver entrevista.</a>'
	fichaPersona += '								</div>'
	fichaPersona += ''
	fichaPersona += '							</div><!-- ficha-sidebar -->'
	fichaPersona += '						</div><!--descirpcion full-->'
	fichaPersona += '					</div><!--contenido ficha-->'
	fichaPersona += '					'
	fichaPersona += '				</div><!--ficha persona-->'
	fichaPersona += '			</div><!--box center-->'
	return fichaPersona;
}



$(document).ready(function () {
	$("#bt-comenzar-ahora").click(function(){
		
		$('html,body').animate({scrollTop: $(".columna-planes").offset().top-45},'slow');
	})

	
	
	
	$(".ficha-persona").each(function(){
	
		$(this).find("#boton-contactar-terapeuta").click(function(){
			rootFicha = $(this)
			while(!rootFicha.hasClass("ficha-persona")){
				rootFicha = rootFicha.parent()
			}
			fichaContacto = '			<div class="busqueda-box-center">'
			fichaContacto += '				<div class="ficha-persona">'
			fichaContacto += '				<form method="post" action="/contactar_terapeuta" accept-charset="UTF-8">'
			fichaContacto += '				<input type="hidden" value="'+rootFicha.find(".nombre-ficha").html()+'" name="terapeuta_nombre" id="terapeuta_nombre">'
			fichaContacto += '				<div class="foto"><img src="'+rootFicha.find(".foto img").attr("src")+'" width="42" height="42" border="0" /></div>'
			fichaContacto += '					<div class="contenido-ficha">'
			fichaContacto += '						<p class="nombre-ficha">'+rootFicha.find(".nombre-ficha").html()+'</p>'
			fichaContacto += '					<div class="contactarTerapeutaForm">'
			fichaContacto += '					<div class="columna50">'
			fichaContacto += '						<div class="form-block">'
			fichaContacto += '							<div class="label">Tu nombre</div>'
			fichaContacto += '							<div class="input_field">'
			fichaContacto += '								<input type="text" name="nombre" id="nombre">'
			fichaContacto += '							</div>'
			fichaContacto += '						</div>'
			fichaContacto += '					</div>'
			fichaContacto += '					<div class="columna50 last">'
			fichaContacto += '						<div class="form-block">'
			fichaContacto += '							<div class="label">Tu apellido</div>'
			fichaContacto += '							<div class="input_field">'
			fichaContacto += '								<input type="text" name="apellido" id="apellido">'
			fichaContacto += '							</div>'
			fichaContacto += '						</div>'
			fichaContacto += '					</div>'
			fichaContacto += '					<div class="form-block">'
			fichaContacto += '						<div class="label">Mensaje</div>'
			fichaContacto += '						<div class="input_field">'
			fichaContacto += '							<textarea name="mensaje" id="mensaje" class="area_med"></textarea>'
			fichaContacto += '						</div>'
			fichaContacto += '					</div>'
			fichaContacto += '					<div class="form-block">'
			fichaContacto += '						<input type="hidden" name="identificador_unico_para_accionar" value="'+$(this).attr("rel")+'"/>'
			fichaContacto += '						<input type="submit" value="Enviar mensaje" name="commit" class="boton-morado">'
			fichaContacto += '					</div>'
			fichaContacto += '					</div><!--contactarTerapeutaForm-->'
			fichaContacto += '					</div><!--contenido ficha-->'
			fichaContacto += '					</form>'
			fichaContacto += '				</div>'
			fichaContacto += '			</div>'
			previewFicha(fichaContacto)
		})
	})
	
})
