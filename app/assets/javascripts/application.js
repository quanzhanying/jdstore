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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap
//= require bootstrap/dropdown
// = require bootstrap/modal
//= require select2
//= require_tree .

/*===== 首页导览列变化特效 =====*/
$(window).scroll(function () {
	if ($(this).scrollTop() > 125) {  //当画面高度至125px时触发效果
		$('#navbar').addClass('scroll_navbar')  //navbar 增加 scroll_navbar CSS
	} else {
		$('#navbar').removeClass('scroll_navbar') //navbar 移除 scroll_navbar CSS
	}
})

$(document).ready(function () {
  $('#myCarousel').carousel({
    interval: 2500 //目前是2秒播放一张，可以根据需要调整这个值
  })
})
