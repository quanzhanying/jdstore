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
//= require bootstrap-sprockets
//= require_tree .

// --首頁圖片輪播--
$(function(){
    var $item = $('.carousel .item');
    var $wHeight = $(window).height();
    $item.height($wHeight);
    $item.addClass('full-screen');

    $('.carousel img').each(function() {
      var $src = $(this).attr('src');
      var $color = $(this).attr('data-color');
      $(this).parent().css({
        'background-image' : 'url(' + $src + ')',
        'background-color' : $color
      });
      $(this).remove();
    });

    //下方自動加入控制圓鈕
    var total = $('.carousel .carousel-inner div.item').size();
    append_li();
    function append_li()
    {
        var li = "";
        var get_ac = $( ".carousel .active" );
        var ac =  $( ".carousel .carousel-inner div" ).index( get_ac );

        for (var i=0; i <= total-1; i++){
            if(i == (ac)/2){
                li += "<li data-target='#mycarousel' data-slide-to='"+i+"' class='active'></li>";
            }else{
                li += "<li data-target='#mycarousel' data-slide-to='"+i+"' class=''></li>";
                }
            }
            $(".carousel-indicators").append(li);
        }

    //單則隱藏控制鈕
    if ($('.carousel .carousel-inner div.item').length < 2 ) {
            $('.carousel-indicators, .carousel-control').hide();
    }

    //縮放視窗調整視窗高度
    $(window).on('resize', function (){
      $wHeight = $(window).height();
      $item.height($wHeight);
    });

    //輪播秒數與滑入停止
    $('.carousel').carousel({
      interval: 5000,
      pause: "hover"
    });
});
// --首頁圖片輪播--
