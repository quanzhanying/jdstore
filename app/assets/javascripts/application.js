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

$(document).ready(function(){
  $(function(){
    $(document).on('scroll', function(){
      if ($(window).scrollTop() > 100){
        $('.scroll-top-wrapper').addClass('show')
      }
      else{
        $('.scroll-top-wrapper').removeClass('show')
      }
    });
    $('.scroll-top-wrapper').on('click', scrollToTop);
  });
  function scrollToTop(){
    verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
    element = $('body');
    offset = element.offset();
    offsetTop = offset.top;
    $('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
  }
});

$(document).on('click', '.productDecription-menuList-item', function () {
  var index = $(this).index() //拿到这个「选项卡」的index，第一个是0，第二个是1，以此类推
  $('.productDecription-content-item').hide() //所有的内容都隐藏
  $('.productDecription-content-item').eq(index).show() //只显示对于index的内容
})
