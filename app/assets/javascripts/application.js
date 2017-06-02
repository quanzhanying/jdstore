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
//= require 'china_city/jquery.china_city'
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//------首页轮播--------
$(document).ready(function() {
    $('#myCarousel').carousel({interval: 4000})
    $(window).trigger('scroll') // 一开始就触发一下滚动事件
});

//-------回到顶部--------
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
//商品index页面
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

// 商品详情页面的图片切换
$(document).on('mouseover', '.productDetail-left-imageList-item', function () {
  var src = $(this).find('img').attr('src') //从被鼠标选中的图片的src里面拿到图片链接
  $('.productDetail-left-bigImage').find('img').attr('src', src) //把图片链接设置到大图的src里面
})


//products/show页面 购买商品数量的改变
// $(document).on('turbolinks:load', function() {    //见报错记录023 http://majing-blog.logdown.com/posts/1905683
$(document).ready(function(){
  slideUpAlert();

  /*增加数量*/
  $("#quantity-plus").click(function(e) {
    var num = parseInt($("#quantity-input").val()) + 1;
    $("#quantity-minus").removeClass("disabled");
    $("#quantity-input").val(num);
    e.preventDefault();
  });

  /*减少数量*/
  $("#quantity-minus").click(function(e) {
    var num = parseInt($("#quantity-input").val());
    if (num > 1) {
      $("#quantity-input").val(num -= 1);
      $("#quantity-plus").removeClass("disabled");
    }
    if (num <= 1) {
      $("#quantity-minus").addClass("disabled");
    }
    e.preventDefault();
  });
});
// 收起通知信息
function slideUpAlert() {
  // 消息停留3000毫秒（3秒），消失动画时间250毫秒
  $(".alert").delay(3000).slideUp(250, function() {
    $(this).remove();
  });
}
