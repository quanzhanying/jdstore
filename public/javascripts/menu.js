/* Main JS Scripts file dedicated to this template */

var hasChaser = 1;	// Enable Chaser menu (open on scroll) ?   1 - Yes / 0 - No
/*
* Closure for Page Load
*/
(function($, window, document) {

	"use strict";

	/**
	 * Define global vars
	 */
	var $window = $(window);

	/* Chaser Menu */ 
	/*
 * Creates and updates the chaser menu depending on the loaded header
 * @wpk
 */

    

    // whether or not the chaser is visible
    var visible = false;

    // Enable Chaser menu 1 - Yes / 0 - No
    var hasChaser = 1;

//<editor-fold dec=">>> KT_CHASER">
    var KT_Chaser = {

        update: function( $header, headerStyleNumber )
        {
            if(headerStyleNumber < 1){
                console.warn('[KT_Chaser::update] Error: Invalid header style number provided.');
                return;
            }

            // Clone needed elements from $header depending on the headerStyleNumber and generate chaser menu
            this._createChaserByHeaderStyle( $header, headerStyleNumber );
        },

        // Clone needed elements from $header depending on the headerStyleNumber and generate chaser menu
        _createChaserByHeaderStyle: function( $header, headerStyleNumber )
        {
            // Show top bar when headerStyleNumber = [1,2,3]
            var populateTopBar = ($.inArray(parseInt(headerStyleNumber,10), [1,2,3]));

            // Update chaser's content
            this._updateChaserHtml( $header, populateTopBar );
        },

        // Update the chaser menu's content
        _updateChaserHtml: function( $header, populateTopBar ){
            populateTopBar = (populateTopBar > -1);

            // Create new html structure
            var chaserMenu = $('body .chaser');
            if( ! chaserMenu){
                return;
            }

            // Create chaser menu
            $('#chaserMenuRow').html('')
                .append('<div class="col-sm-2 col-md-2" id="left-container"></div>')
                .append('<div class="col-sm-10 col-md-10" id="right-container"></div>');

            // Add logo
            $('#left-container').html($('.logo-container', $header).clone(true));

            // Add the content in the right area
            var rightContainer = $('#right-container');
            rightContainer.
                // Adding top bar
                append('<div id="_wpk-custom-bar" class="col-sm-12 col-md-12"></div>')
                // add main menu
                .append('<div id="push-main" class="col-sm-11 col-md-11"></div>')
                // Add cta button
                .append('<div id="_wpk-cta-button" class="col-sm-1 col-md-1"></div>');

            // Add content in the newly created sections
            if(populateTopBar) {
                if($header.attr('data-header-style') == '2'){
                    $('#_wpk-custom-bar').html( $('<div style="height:40px;"></div>') );
                }
                else if($header.attr('data-header-style') == '3'){
                    $('#_wpk-custom-bar').html( $('.kl-top-header').clone(true) );
                }
                else {
                    $('#_wpk-custom-bar').html( $('.kl-top-header').clone(true) );
                }
            }
            else {
                $('#_wpk-custom-bar').html( $('<div style="height:40px;"></div>') );
            }

            $('#_wpk-cta-button').html($('#ctabutton', $header).clone(true));

            $('#push-main').html($('#menu-main-menu', $header).clone(true));
        }
    };
//</editor-fold dec=">>> KT_CHASER">


    if(hasChaser)
    {
//<editor-fold desc=">>> ON LOAD">
        $(function(){
                // the reference to the default header element
            var _header = $('#header'),
                // Default value for chaser's visibility
                forch = 300;

            // ENABLE HEADER STYLE CHANGING (the dropdown in options)
            var header_style_option = _header.attr('data-header-style') || '1';

            // Setup references
            var docMainMenu = $('#main-menu > ul');
            if(docMainMenu)
            {
                // Set the default style for header
                _header.attr('data-header-style', header_style_option);

                // Create chaser menu
                $('<div id="chaserMenuRow" class="row"></div>')
                    .appendTo(document.body)
                    .wrap('<div class="chaser"><div class="container"></div></div>');

                // Update the forch depending on the position of #content
                var _content = $('.hg_section').first();
                if(_content && _content.length > 0) {
                    forch = _content.first().offset().top;
                }

                // Set the chaser's visibility
                var scrolled = $(window).scrollTop(),
                // Get the reference to the chaser menu
                    _chaser = $('body .chaser');
                if(scrolled > forch) {
                    _chaser.addClass('visible');
                    visible = true;
                }
            }
            // END if(docMainMenu)

            
            // END onScroll
        });
//</editor-fold desc=">>> ON LOAD">
    }
    // END if(hasChaser)



	/**
     * RESPONSIVE MENU // DO NOT TOUCH! (unless you know what you're doing)
     */

    var page_wrapper = $('#page_wrapper'),
        responsive_trigger = $('.menu-trigger'),
        zn_back_text = 'Back',
        back_text = '<li class="menu-go-back"><span class="menu-back-icon glyphicon glyphicon-chevron-left"></span><a href="#">'+zn_back_text+'</a></li>',
        cloned_menu = $('#main-menu > ul').clone().attr({id:"push-mega-menu", "class":""});

    var start_responsive_menu = function(){

        var responsive_menu = cloned_menu.prependTo(page_wrapper);

        // BIND OPEN MENU TRIGGER
        responsive_trigger.click(function(e){
            e.preventDefault();
            
            responsive_menu.addClass('menu-show');
            set_height();

        });

        // Close the menu when a link is clicked
	    responsive_menu.find( 'a:not([rel*="mfp-"])' ).on('click',function(e){
	     $( '.menu-go-back' ).first().trigger( 'click' );
	    });

        // ADD ARROWS TO SUBMENUS TRIGGERS
        responsive_menu.find('li:has(> ul)').addClass('menu-sub-menu').prepend('<span class="menu-sub-menu-trigger glyphicon glyphicon-chevron-right"></span>');
        // ADD BACK BUTTONS
        responsive_menu.find('.menu-sub-menu > ul').addBack().prepend(back_text);

        // REMOVE BACK BUTTON LINK
        $( '.menu-go-back' ).click(function(e){
            e.preventDefault();
            var active_menu = $(this).closest('.menu-show');
            active_menu.removeClass('menu-show');
            set_height();
            if( active_menu.is('#push-mega-menu') ) {
                page_wrapper.css({'height':'auto'});
            }
        });

        // OPEN SUBMENU'S ON CLICK
        $('.menu-sub-menu-trigger').click(function(e){
            e.preventDefault();
            $(this).siblings('ul').addClass('menu-show');
            set_height();
        });

    }

    var set_height = function(){
        var height = $('.menu-show').last().css({height:'auto'}).outerHeight(true),
            window_height  = $(window).height(),
            adminbar_height = 0,
            admin_bar = $('#wpadminbar');

        // CHECK IF WE HAVE THE ADMIN BAR VISIBLE
        if(height < window_height) {
            height = window_height;
            if ( admin_bar.length > 0 ) {
                adminbar_height = admin_bar.outerHeight(true);
                height = height - adminbar_height;
            }
        }

        $('.menu-show').last().attr('style','');
        page_wrapper.css({'height':height});
    };

    // MAIN TRIGGER FOR ACTIVATING THE RESPONSIVE MENU
    var menu_activated = false,
        triggerMenu = function(){
            if ( $(window).width() < 1200 ) {
                if ( !menu_activated ){
                    start_responsive_menu();
                    menu_activated = true;
                }
                page_wrapper.addClass('push-mega-menu-open');
            }
            else{
                // WE SHOULD HIDE THE MENU
                $('.menu-show').removeClass('menu-show');
                page_wrapper.css({'height':'auto'}).removeClass('push-mega-menu-open');
            }
        };
    $(document).ready(function() {
        triggerMenu();
    });
    $( window ).on( 'resize' , function(){
       triggerMenu();
    });


	// FIX mask for Safari Browser
	var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
	if(isSafari){
		document.getElementsByTagName('body')[0].className+=' is-safari';
	}


})(window.jQuery, window, document);