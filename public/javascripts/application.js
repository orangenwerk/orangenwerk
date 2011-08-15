imageLoaderDefaultConfig = {
    LoadingImage: 'img/image-loader.gif',
    FailImage: 'img/image-loader-error.jpg'
}

jQuery.fn.loadImage = function(pConfig, pCallback) {
    if (pConfig)
	var config = jQuery.extend(imageLoaderDefaultConfig, pConfig);
    else
	var config = imageLoaderDefaultConfig;

    var loader = jQuery(this);    

    loader.html('<img src="' + config.LoadingImage + '"/>');

    var img_src = loader.attr('src');
    loader.removeAttr('src');

    img = jQuery(new Image());
    img.hide();

    img.load(function(){

	if (loader.get(0).hasAttribute('onload')){
	    cb_js = loader.get(0).getAttribute('onload')
	    onload_cb = function() { eval(cb_js); }
	    loader.removeAttr('onload');
	} else
	    onload_cb = null;

	loader.html(this);

	jQuery(this).show();

	if (onload_cb)
	    onload_cb(jQuery(this));

	if (pCallback)
	    pCallback(jQuery(this));
    })
    .attr('src', img_src)
    .error(function(){ jQuery(this).attr('src', config.FailImage); })
    .show();

    
}

jQuery.fn.loadImages = function(pConfig, pCallback){
    this.each(function(){
	jQuery(this).loadImage(pConfig, pCallback)
    })
}

// // Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function remove_fields(link) {
	$('#web_ref_add_link').fadeIn();
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function remove_fieldz(link) {
  $(link).find("input[type=hidden]").val("1");
  $(link).hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function add_webref_fields(link, association, content) {
  remove_fieldz('#ref_pics_in_refs');
	$('#web_ref_add_link').fadeOut();
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){ //Examples of how to assign the ColorBox event to elements 
// loadable_kunden_icon
	
	/* jQuery('.loadable_kunden_icon').loadImages({ LoadingImage: '/images/loading.gif', FailImage: '/images/loading.gif' },
	 	function(){ 
		var img = jQuery(arguments[0]); 
		var pix = img.attr('height');
		var pic = Math.round((119-pix)/2);
		img.attr('style', 'margin-top:'+pic+'px');	 
	}); */
	
	$('.loadable_kunden_icon').loadImages({ LoadingImage: '/images/loading.gif', FailImage: '/images/loading.gif' },
	 	function(){ 
		var img = jQuery(arguments[0]); 	 
	});
	
	$('.loadable-image').loadImages({ LoadingImage: '/images/loading.gif', FailImage: '/images/loading.gif' },
	 	function(){ 
		var img = jQuery(arguments[0]); 	 
	});
	
	
	$('.resize_picas').hover(function() {
			jQuery(this).find('.icon_text').slideDown('1500');
		},function() {
			jQuery(this).find('.icon_text').stop(true, true).slideUp('300');
			});
	
	$('.referenz_icon').hover(function() {
			jQuery(this).find('.icon_schimmer').fadeOut('200');
		},function() {
			jQuery(this).find('.icon_schimmer').stop(true, true).fadeIn('500');
			});
			
			
	$('.referenz_icon_med').hover(function() {
			jQuery(this).find('.icon_schimmer').fadeOut('200');
			jQuery(this).find('.icon_text').slideDown('1500');
		},function() {
			jQuery(this).find('.icon_schimmer').stop(true, true).fadeIn('500');
			jQuery(this).find('.icon_text').stop(true, true).slideUp('300');
			});
	$('.referenz_icon_nav').hover(function() {
			jQuery(this).find('.icon_schimmer').fadeOut('200');
			jQuery(this).find('.icon_text').slideDown('1500');
		},function() {
			jQuery(this).find('.icon_schimmer').stop(true, true).fadeIn('500');
			jQuery(this).find('.icon_text').stop(true, true).slideUp('300');
			});		
	
	$("#tabs").tabs();

	
	jQuery('#hida_form').hide();
	
	jQuery('#hida_formshower').toggle(
      function () {
        jQuery('#hida_form').fadeIn();
      },
      function () {
        jQuery('#hida_form').fadeOut();
      }
    );

	$("#referenz_webref").click(function() {
		if( $("#referenz_webref").attr("checked"))
		{
   			$('#ref_pics_in_refs').hide();
			$('#web_refs_in_refs').show();
		}
		else
		{
   			$('#web_refs_in_refs').hide();
			$('#ref_pics_in_refs').show();
		};
	});
	
	if( $("#referenz_webref").attr("checked"))
		{
   			$('#ref_pics_in_refs').hide();
		}
		else
		{
   			$('#web_refs_in_refs').hide();
		};

	
});


 
	// init the checkboxes at dom ready
	$(document).ready( function () {
		/*
		* first example - defaults
		*/
		if( $("#aktion_aktiv").attr("checked")) { var aktion_aktiv = 'on' } else { var aktion_aktiv = 'off' };
		$('#aktion_aktiv').iCheckbox(aktion_aktiv);
		
		if( $("#aktion_link").attr("checked")) { var akt_link = 'on' } else { var akt_link = 'off' };
		$('#aktion_link').iCheckbox(akt_link);
		
		if( $("#aktion_all_area").attr("checked")) { var aktion_all_area = 'on' } else { var aktion_all_area = 'off' };
		$('#aktion_all_area').iCheckbox(aktion_all_area);
		
		if( $("#aktion_zeitlimit").attr("checked")) { var aktion_zeitlimit = 'on' } else { var aktion_zeitlimit = 'off' };
		$('#aktion_zeitlimit').iCheckbox(aktion_zeitlimit);
		
		$('.Pagez_remote_link').click(function (event) {
	        event.preventDefault();
	        $.ajax({type: 'GET', url: this.href, data: ({authenticity_token: AUTH_TOKEN}), success: function(r){ $('#Pagez__stuff').html(r);} });
	      });
	
		
		 $(".toggle_container").hide(); 
		 $(".trigger").click(function(){ 
			$(this).toggleClass("active").next().slideToggle("slow");
			$(this).parent().toggleClass('o_border');
			});
			
			$(".trigger").hover(function(){ 
					$(this).parent().animate({backgroundColor: "#f1f1f1"}, 900);
				},function() {
					if ( $(this).parent().hasClass('o_border') ) {
						$(this).parent().stop(true, true).animate({backgroundColor: "#f9f9f9"}, 500);
					}
					else {
						$(this).parent().stop(true, true).animate({backgroundColor: "#fff"}, 500);
						}
			});
				 
		$('.trigger.active').next().show();
		$('.trigger.active').parent().addClass('o_border');
		


	
	});
	
	
function add_fields(target, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(target).parent().append(content.replace(regexp, new_id));
}

jQuery('a.remove_fields').live('click', function() {
  $(this).prev("input[type=hidden]").val("1");
  $(this).closest(".fields").hide();
  return false;
});

jQuery(".observe_field").live('change', function() {
  target = $(this).attr("data-update");
  ajax_indicator = $(this).attr("data-ajax-indicator") || '#busy_indicator';
  $(target).hide();
  $(ajax_indicator).show();
  $.get($(this).attr("data-base-url")+encodeURIComponent($(this).val()),
    function(data) {
      $(target).html(data);
      $(ajax_indicator).hide();
      $(target).show();
    }
  );
});
