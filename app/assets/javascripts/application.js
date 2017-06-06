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
//= require bootstrap/dropdown
//= require bootstrap/alert
//= require bootstrap/collapse
//= require bootstrap/transition
//= require bootstrap/carousel
//= require bootstrap/tab
//= require autosize.min
//= require wow.min
//= require jquery.countdown.min
//= require select2
//= require_tree .

$(document).ready(function(){
  new WOW().init();
})

$(document).on('click', '#gotop', function () {
  $('body').animate({'scrollTop': 0}, 500) //在500ms的时间内，慢慢地回到顶部
})

$(window).scroll(function () {
  if ($(this).scrollTop() > 500) {
    $('#gotop').fadeIn() // 当页面向下滚动的距离大于500px时，慢慢地显示「回到顶部按钮」
  } else {
    $('#gotop').fadeOut() // 否则慢慢地隐藏「回到顶部按钮」
  }
})

$(document).on('click', '.productDecription-menuList-item', function () {
  var index = $(this).index() //拿到这个「选项卡」的index，第一个是0，第二个是1，以此类推
  $('.productDecription-content-item').hide() //所有的内容都隐藏
  $('.productDecription-content-item').eq(index).show() //只显示对于index的内容
})
