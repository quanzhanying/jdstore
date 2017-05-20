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
//= require_tree .


// ------------    tabs     ---------------
function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

//  轮播时间
$(document).ready(function () {
  $('#myCarousel').carousel({
    interval: 2000 //目前是2秒播放一张，可以根据需要调整这个值
  })
})

// 回到顶部
// $(document).on('click', '#gotop', function () {
//   $('body').animate({'scrollTop': 0}, 500) //在500ms的时间内，慢慢地回到顶部
// })
//
// $(window).scroll(function () {
//   if ($(this).scrollTop() > 500) {
//     $('#gotop').fadeIn() // 当页面向下滚动的距离大于500px时，慢慢地显示「回到顶部按钮」
//   } else {
//     $('#gotop').fadeOut() // 否则慢慢地隐藏「回到顶部按钮」
//   }
// })


$(document).on('click', '.working', function () {
 alert('功能暂未完成，敬请期待...')
 // return false
}).on('click', '.backtop', function () {
 $('body').animate({'scrollTop': 0}, 500)
}).on('mouseenter', '.support', function () {
 $('.ewm').show().stop().animate({left: '-136px', opacity: 1}, 500)
}).on('mouseleave', '.support', function () {
 $('.ewm').stop().animate({opacity: 0}, 500, function () {
  $(this).css('left', 0).hide()
 })
})

$(window).scroll(function () {
 var $navbar = $('#navbar')
 if ($(this).scrollTop() > 100) {
  $navbar.addClass('black').removeClass('transparent')
 } else {
  $navbar.removeClass('black').addClass('transparent')
 }

 if ($(this).scrollTop() > 500) {
  $('#sidebar').fadeIn()
 } else {
  $('#sidebar').fadeOut()
 }
})
