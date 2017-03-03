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
//= require bootstrap/dropdown
//= require bootstrap/carousel
//= require jquery.raty
//= require ratyrate
//= require_tree .
// 首页轮播
$(document).ready(function() {
    $('#myCarousel').carousel({interval: 3000});

    $(".hotpic img").parent().height($(".hotpic img").height());
    $(".hotpic img").hover(function(){
        $(this).animate({
          "width":"200%",
          "height":"200%",
          "marginLeft":"-25%",
          "marginTop":"-25%"
        },"fast");
      //  $("").silibings(".fh5co-listing-copy").children("h3").animate()

      },function(){
        $(this).animate({
          "width":"100%",
          "height":"100%",
          "marginLeft":"0",
          "marginTop":"0"
        },200);
      });


});

// 图片切换
$(document).on('mouseover', '.intro-preview-item', function () {
  var src = $(this).find('img').attr('src') //从被鼠标选中的图片的src里面拿到图片链接
  $('.gods-main-pic').find('img').attr('src', src) //把图片链接设置到大图的src里面
})

//


// 菜单栏切换
$(document).on('click', '.nav-item', function () {
  var index = $(this).index() //拿到这个「选项卡」的index，第一个是0，第二个是1，以此类推
  $('.test-item').hide() //所有的内容都隐藏
  $('.test-item').eq(index).show() //只显示对于index的内容
})

// 放大镜
$('#preview').css('visibility', 'hidden')
var evt = new Event(),
    m = new Magnifier(evt);
m.attach({
    thumb: '#thumb',
    large: $('.intro-preview-activeItem img').attr('src'),
    largeWrapper: 'preview',
    zoom: 2
})
