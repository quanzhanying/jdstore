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
//= require bootstrap
//= require test-code.js
//= require_tree .

//轮播大图
$(document).ready(function () {
  $('#myCarousel').carousel({
    interval: 3000 //目前是2秒播放一张，可以根据需要调整这个值
  })
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


// products index页的hover出现查看详情、加入购物车
$(document).ready(function() {
  $(".menu").hover(function(){
    $(".menu-price", this).css("visibility","hidden");
    $(".operator", this).css("visibility","visible");
  },
    function() {
    $(".menu-price", this).css("visibility","visible");
    $(".operator", this).css("visibility","hidden");
  });
});
