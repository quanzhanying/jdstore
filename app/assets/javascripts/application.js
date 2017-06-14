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
//= require  bootstrap/dropdown
//= require  autosize.min
//= require  jquery.countdown.min
//= require  wow.min
//= require_tree .


$(document).ready(function(){
  new WOW().init();
})

//------设定回到顶端按钮的触发行为------//

$(window).scroll(function () {
  if ($(this).scrollTop() > 2500) {   // 指的是当屏幕滚动到2500px的高度时，所触发的行为
    $(".goTop").fadeIn(100);          // 指的是按钮淡入显示的时间，100为0.1秒
  } else {
    $(".goTop").fadeOut(200);         // 指的是按钮淡出显示的时间，200为0.2秒
  }

  $(".goTop").click(                  // 指的是当点击按钮时，所触发的动作
    function() {
      $('html,body').animate({        // 指的是将屏幕上移至高度为0的地方，700为上移速度
          scrollTop: 0
      }, 700);
    });
})
