

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
	
	$(window).scroll(function(e) {
		if ( _menuPosY <= $(window).scrollTop() ) {
			$("#block-nav").css('position', 'fixed');
			$("#block-nav").css('top', '0px');
			$("#header").css("margin-bottom", $("#block-nav").height()+"px")
			/*$("#nav").css('left', '50%');*/
			/*$("#nav").css('margin-left', _marginMenu);*/
			/*$("#content").css('margin-top', _marginTopContent);*/
		} else {
			$("#block-nav").css('position', 'relative');
			$("#header").css("margin-bottom", "0px")
			/*$("#nav").css('margin', _navMarginTop + ' auto ' + _navMarginBottom + ' auto');*/
			/*$("#content").css('margin-top', '0');*/
		}
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
	
	

	
});


// ACORDEON PREGUNTAS FRECUENTES

$(document).ready(function(){
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
	
	/** ARTICULOS **/
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
});





