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
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require bootstrap-sprockets
// require bootstrap/carousel
// require jquery.min
// require jquery.SuperSlide.2.1.1
//= require autosize.min
//= require jquery.countdown.min
//= require wow.min
//= require_tree .

$(document).ready(function(){
  new WOW().init();
})

$(document).on('mouseover', '.list-image', function () {
  var src_other = $(this).attr('src') //抓取小图图片路径
  var src_main = src_other.toString().replace("other", "main") //更改小图图片路径

  $('.main-image').attr('src', src_main) //变更大图图片路径

  $('.list-image').removeClass('list-image-active') //其他小图移除图片阴影
  $(this).addClass('list-image-active') //当前小图新增图片阴影
})
