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
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


//Initialise Bootstrap Carousel Touch Slider
// Curently there are no option available.






  /*商品页调整商品数量*/
$(document).ready(function() {
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


// 图片切换
$(document).on('mouseover', '.productDetail-left-imageList-item', function () {
  var src = $(this).find('img').attr('src') //从被鼠标选中的图片的src里面拿到图片链接
  $('.productDetail-left-bigImage').find('img').attr('src', src) //把图片链接设置到大图的src里面
})


// product页面滑动
$(document).ready(function () {
  $('#myCarousel').carousel({
    interval: 2000 //目前是2秒播放一张，可以根据需要调整这个值
  })
})


//
