/*
Theme Name: Stark
Version: 1.0.0
Author: webpentagon
Author URI: http://www.webpentagon.com
Description: Multi-Purpose Theme by webpentagon
*/

/*	IE 10 Fix*/

/* 
	-----------------------------------------------------------
		[Table of contents]
	-----------------------------------------------------------

		1. PRELOADER
		2. STICKY MENU
		3. DROPDOWN MENU 
		4. Navbar Scroll Function
		5. ACCORDION TAB
		6. TESTIMONIAL SLIDE
		7. LATEST NEWS SLIDE
		8. RELATED ITEM SLIDE
		9. MAGNIFIC POPUP
		10. TEAM HOVER EFFECT
		11. PAGE SCROLLING EFFECT
		12. Fun Facts
		13. SKILL BARS
		14. FLICKR STREAME
		15. PORTFOLIO CUSTOM
		16. PARTICLES EFFECT
		17. WOW EFFECT
		18. ANIMISITION
		
*/

var doc = document.documentElement;
doc.setAttribute('data-useragent', navigator.userAgent);

	var $window = $(window),
    $winWidth = $window.width(),
    $page = $("#page");
	
	var testMobile;
	var isMobile = {
		Android: function() {
			return navigator.userAgent.match(/Android/i);
		},
		BlackBerry: function() {
			return navigator.userAgent.match(/BlackBerry/i);
		},
		iOS: function() {
			return navigator.userAgent.match(/iPhone|iPad|iPod/i);
		},
		Opera: function() {
			return navigator.userAgent.match(/Opera Mini/i);
		},
		Windows: function() {
			return navigator.userAgent.match(/IEMobile/i);
		},
		any: function() {
			return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		}
	};
	
(function($){
	"use strict";
		
		/* ==============================================
	PRELOADER
	=============================================== */
		
		$("#preloader").delay(500).fadeOut(4000);
		$("#tout").addClass('fadeOutUp');
		
		/* ==============================================
	Sticky
	=============================================== */
		
		$(".navbar-sticky, .navbar-sticky-bottom").sticky({
			topSpacing: 0,
			className: 'sticky'
		});
		
	
		/* ==============================================
	DROPDOWN MENU 
	=============================================== */	
		
		$(".dropdown-toggle  ul").parent("li").append();
				
		$(".dropdown-toggle ").on("mouseenter", function() {
		   $(this).find(">ul").stop().slideDown();
		});
		
		$(".dropdown-toggle ").on("mouseleave", function() {
		   $(this).find(">ul").stop().slideUp();
		});
		
			
		/* ==============================================
	Navbar Toggle Mobile Menu On Click Function
	=============================================== */
	
		$('.navbar-collapse ul li a:not(.dropdown-toggle)').on('click', function(event){
			$('.navbar-toggle:visible').click();
		});
		
		
		/* ==============================================
	ACCORDION TAB
	=============================================== */
		
		$('.collapse').on('shown.bs.collapse', function() {
			$(this).parent().find(".fa-plus").removeClass("fa-plus").addClass("fa-minus");
		}).on('hidden.bs.collapse', function() {
			$(this).parent().find(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
		});

		/* ==============================================
	ACCORDION TAB HEADING COLOR CHANGE
	=============================================== */
		
		$('.collapse').on('shown.bs.collapse', function() {
			$(this).parent().find(".panel-heading").addClass("panel-active");
		}).on('hidden.bs.collapse', function() {
			$(this).parent().find(".panel-heading").removeClass("panel-active")
		});
		
		/* ==============================================
	MAIN SLIDER
	=============================================== */
		$('.main-slider').owlCarousel({
			loop:true,
			autoplay: true,
			margin:10,
			items:1,
			nav:true,
			dots: false,
			smartSpeed:1000,
			responsive:{
				0:{
					items:1
				},
				600:{
					items:1
				},
				1000:{
					items:1
				}
			}
		});

			/* ==============================================
	CLIENT SAY SLIDE
	=============================================== */
		$('.client-say-slide').owlCarousel({
			loop:true,
			autoplay: true,
			margin:10,
			items:1,
			nav:false,
			responsive:{
				0:{
					items:1
				},
				600:{
					items:1
				},
				1000:{
					items:1
				}
			}
		});
			
		/* ==============================================
	PARTNER LOGO SLIDER
	=============================================== */
		$('.partner-slider').owlCarousel({
			loop:true,
			autoplay: true,
			margin:10,
			items:4,
			nav:false,
			dots: false,
			smartSpeed:1000,
			responsive:{
				0:{
					items:2
				},
				600:{
					items:3
				},
				1000:{
					items:4
				}
			}
		});
			
	
	/* ==============================================
	Fun Facts
	=============================================== */
		
		$('.fun-number').each(function () {
			$(this).prop('Counter',0).animate({
				Counter: $(this).text()
			}, {
				duration: 4000,
				easing: 'swing',
				step: function (now) {
					$(this).text(Math.ceil(now));
				}
			});
		});
		
		if ($(".progress-bar").length) {
            var $progress_bar = $('.progress-bar');
            $progress_bar.appear();
            $(document.body).on('appear', '.progress-bar', function() {
                var current_item = $(this);
                if (!current_item.hasClass('appeared')) {
                    $(this).css('width', $(this).attr('aria-valuenow')+'%').addClass('appeared');
                }
            });
        };
	
		/* ==============================================
	Google Map Styles Two
	=============================================== */		  
		
		$('#map').gmap3({
			map:{
			options:{
			center:[1.357509, 103.867194],
			zoom: 14,
			scrollwheel:false,
			styles: 
				[
					{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"off"}]},
					{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},
					{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},
					{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},
					{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":-18},{"visibility":"on"}]},
					{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"off"}]},
					{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},
					{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20},{"saturation":-100}]},
					{"featureType":"water","elementType":"geometry","stylers":[{"hue": "#6aaf08" },{"lightness":-60},{"saturation":0}]}
				]
			}
		  },
		  marker:{
			values:[
			  {address:"1.357509, 103.867194", data:"Perpignan ! <br> GO USAP !", options:{icon: "assets/images/marker.png"}}
			],
			options:{
			  draggable: false
			}
		  }
		});
		
		/* ==============================================
	Minicart Button
	=============================================== */
		function toggleMiniCartBtn() {
			var miniCartBtn = $(".navbar-mini-cart-btn"),
				miniCart = $(".navbar-mini-cart");

			miniCart.hide();
			miniCartBtn.on("click", function(e) {
				e.preventDefault();
				miniCart.slideToggle();
				return false;
			})
		}
		if ($(".navbar-mini-cart-wrapper").length) {
			toggleMiniCartBtn();
		}
		
		// Instagram Feed
		//if ($('#instagram-feed').length) {
		//	$.fn.spectragram.accessData = {
		//		accessToken: '2985464939.7329358.026dd38d94c046c3aac748818d3c50c2',
		//		clientID: '7329358a04c0403c8389201ef5e4733b'
		//	};

		//	var instagramUser = document.getElementById("instagram-feed").getAttribute("data-instagram-username");
		//	$('#instagram-feed ul').spectragram('getUserFeed', {
		//		query: instagramUser,
		//		max: 6,
		//		size: 'small'
		//	});
		//}
		
		$(".form-method-check a").on("click", function(){
			$(".login-method").slideDown("slow");
		});
	
		
})(jQuery);

$(document).ready(function($) {
	function checkWidth() {
			if ($(window).width() < 992){
				$('.sidebar-menu ul.sidebar-ul').addClass('cat_accordion');
				$('.cat_accordion').cutomAccordion({
					saveState: false,
					autoExpand: true
				});
			}else{
				$('.sidebar-menu ul.sidebar-ul').removeClass('cat_accordion');
			}
		}
		$(window).resize(checkWidth);
});


