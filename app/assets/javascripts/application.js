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
//= require bootstrap/carousel
//= require bootstrap
//= require_tree .

$(document).on('click','#gotop',function(){
    $('body').animate({'scrollTop':0},500)
  })

 $(window).scroll(function(){
  if($(this).scrollTop()>500){
    $('#gotop').fadeIn() //当页面向下滚动的距离大于500px时，慢慢地显示【回到顶部按钮】
  }else{
    $('#gotop').fadeOut() //否则慢慢地隐藏【回到顶部按钮】
  }
 })

   $(document).on('click','.productDetail-left-imageList-item',function(){
    var src = $(this).find('img').attr('src')
    $('.productDetail-left-bigImage').find('img').attr('src', src)
  })

  $(window).scroll(function(){
    var menu_top = $('#menu_wrap').offset().top;
    if ($(window).scrollTop() >= menu_top) {
      $('.menu').addClass('menuFixed')
    }
    else{
      $('.menu').removeClass('menuFixed')
    }
  })

$(document).ready(function() {
  $('#myCarousel').carousel({interval: 2000});
});
