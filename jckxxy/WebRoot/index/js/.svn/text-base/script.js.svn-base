var $ = jQuery.noConflict();


$(document).ready(function($) {
	"use strict";	

	$(".megamenu").megamenu();

	var winDow = $(window);

	/* preloader function */
	winDow.load( function(){
		var mainDiv = $('#container'),
			preloader = $('.preloader');
			preloader.fadeOut(400, function(){
				mainDiv.delay(400).addClass('active');
			});
	});

	

	$('#bx1').bxSlider({
		mode:'fade',
		auto:1,
		controls:0,
		pause:8000,
		responsive:true,
		pagerCustom: '#bx-pager',
		onSlideBefore: function(){
			$('.cap').animate({
				left:180,opacity:0
			},100,'linear');
		},
		onSlideAfter: function(){
			$('.cap').animate({left:0,opacity:1},500,'linear');
		}
	});
	//$('#bx2').bxSlider({mode:'fade',auto:1,controls:0,pager:0,responsive:false});
	
	//Click
	/**
    $('.searchbox .searchbox-icon,.searchbox .searchbox-inputtext').bind('click', function() {
        var $search_tbox = $('.searchbox .searchbox-inputtext');
        $search_tbox.css('width', '120px');
        $search_tbox.focus();
        $('.searchbox', this).addClass('searchbox-focus');
    });
**/
    //Blur
    /***
    $('.top-bar .searchbox-inputtext,body').bind('blur', function() {
        var $search_tbox = $('.searchbox .searchbox-inputtext');
        $search_tbox.css('width', '0px');
        $('.searchbox', this).removeClass('searchbox-focus');
    }); 
	***/
	//Click
    $('#searchtext').bind('click', function() {
        var $search_tbox = $('.searchbox .searchbox-inputtext');
        $('#searchtext').removeClass('animate-out');
		$('#searchtext').addClass('animate-in');
        $search_tbox.focus();
    });

	

	/*-------------------------------------------------*/
	/* =  Animated content
	/*-------------------------------------------------*/
	try {
		/* ================ ANIMATED CONTENT ================ */
		if ($(".animated")[0]) {
			$('.animated').css('opacity', '0');
		}

		$('.triggerAnimation').waypoint(function() {
			var animation = $(this).attr('data-animate');
			$(this).css('opacity', '');
			$(this).addClass("animated " + animation);

		},
			{
				offset: '80%',
				triggerOnce: true
			}
		);
	} catch(err) {
	}

	
	/*$('#bx3').bxSlider({auto:1,controls:0,pager:0,responsive:false});*/
	$('#bx4').bxSlider({mode:'vertical',auto:1,controls:0,pager:0,responsive:false});
	/*$('#bx5').bxSlider({auto:0,controls:0,startSlide:0,pagerCustom: '#bx-pager-5'});
*/
	

	/*-------------------------------------------------*/
	/* = slider Testimonial
	/*-------------------------------------------------*/

	
	/*-------------------------------------------------*/
	/* =  Scroll to TOP
	/*-------------------------------------------------*/

	var animateTopButton = $('.gotop'),
		htmBody = $('html, body');
		
	animateTopButton.click(function(){
	htmBody.animate({scrollTop: 0}, 'slow');
		return false;
	});

});