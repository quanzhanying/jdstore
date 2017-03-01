// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require_tree .

$(function() {

    $('a[href="#toggle-search"], .navbar-bootsnipp .bootsnipp-search .input-group-btn > .btn[type="reset"]').on('click', function(event) {
		event.preventDefault();
		$('.navbar-bootsnipp .bootsnipp-search .input-group > input').val('');
		$('.navbar-bootsnipp .bootsnipp-search').toggleClass('open');
		$('a[href="#toggle-search"]').closest('li').toggleClass('active');

		if ($('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
			/* I think .focus dosen't like css animations, set timeout to make sure input gets focus */
			setTimeout(function() {
				$('.navbar-bootsnipp .bootsnipp-search .form-control').focus();
			}, 100);
		}
	});

$(document).on('keyup', function(event) {
		if (event.which == 27 && $('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
			$('a[href="#toggle-search"]').trigger('click');
		}
	});

});

var tl = new TimelineMax();
var bgd = $('#background rect');
var table = $('#table_legs, #table');
var lampLeg = $('#lamp > .lamp-leg');
var lampbt = $('#lamp-bottom');
var lampLight = $('#lamp > .light');
var lampLine = $('#lamp-line');
var lampLineB = $('#lamp-line-b');
var lampLineT = $('#lamp-line-t');
var lampCircle = $('#lamp-circle');
var lampHead = $('#lamp-head');
var lampHeader = $('#lamp-header');
var lampBody = $('#lamp-body');
var computer = $('#computer > *');
var keyboard = $('#keyboard > *');
var asset = $('#computer_mouse > * , #coffee_mug > *');

tl.from(bgd, 0.2, {opacity:0, scale:0, transformOrigin: 'center center'})
	.staggerFrom(table, 0.2, {y:"-=200", opacity: 0, ease: Elastic.easeOut}, 0.1)
	.from(lampLeg, 0.2, {opacity:0, x: "-200", ease: Elastic.easeOut})
	.from(lampbt, 0.2, {opacity:0, scale:0, transformOrigin: 'center center'})
	.from(lampLineB, 0.3,{opacity:0, transformOrigin: '100% 100%', rotation: '-180deg'})
	.from(lampCircle,0.1,{opacity:0, x: '-=100', y: '-=100'})
  .from(lampLineT, 0.3,{opacity:0, transformOrigin: '0% 100%', rotation: '-180deg'})
	.from(lampHead, 0.2, {opacity:0, scale:0, ease: Elastic.easeOut})
	.from(lampHeader, 0.5, {transformOrigin: '60% 60%', rotation: '60deg'})
	.from(lampBody, 0.5, {transformOrigin: '70% 70%', rotation: '-25deg'})
	.staggerFrom(computer, 1, {opacity: 0, scale: 0, transformOrigin: 'center center', ease: Back .easeOut}, 0.2)
	.staggerFrom(keyboard, 0.5, {opacity: 0, y: '-=100', ease: Linear.easeInOut }, 0.05)
	.staggerFrom(asset, 0.5, {opacity: 0}, 0.05)
	.to(lampLight, 0.2, {opacity:0.8, ease: Elastic.easeOut, delay:0.5}, "a")
  .to(lampLight, 0.1, {opacity:0}, "b")
  .to(lampLight, 0.1, {opacity:0.2}, "c")
	.to(bgd, 0.2, {opacity: 0.1, delay:0.5}, "a-=0.05")
	.to(bgd, 0.1, {opacity: 1}, "b-=0.05")
	.to(bgd, 0.1, {opacity: 0.5}, "c-=0.05")
	.to(bgd, 0.2, {opacity: 1, fill: '#FDD10D'})
	.fromTo(lampLine, 0.2, {opacity: 0},{opacity: 0.2, delay:0.5}, "a-=0.05")
	.to(lampLine, 0.1, {opacity: 1}, "b-=0.05")
	.to(lampLine, 0.1, {opacity: 0.5}, "c-=0.05");

$(document).on('click', '#gotop', function () {
  $('body').animate({'scrollTop': 0}, 500) //在500ms的时间内，慢慢地回到顶部
})；
