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
//= require social-share-button
//= require social-share-button/wechat
//= require bootstrap-sprockets
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require bootstrap/alert
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

// 推荐商品轮播图
$(document).ready(function() {
	$('#myCarousel').carousel1({
	interval: 5000
	})

    $('#myCarousel').on('slid.bs.carousel1', function() {
    	//alert("slid");
	});
});

/* carousel effect  */

// $('.carousel').carousel()

/* scroll effect  */
(function ($) {
  $(document).ready(function(){
    $('.index').hide();
    $(function () {
        $(window).scroll(function () {

            if ($(this).scrollTop() > 1000) {
                $('.index').fadeIn();
            } else {
                $('.index').fadeOut();
            }
        });
    });

    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('.animated').fadeOut();
            } else {
                $('.animated').fadeIn();
            }
        });
    });

});
  }(jQuery));
// 推荐商品轮播图结束

// 首页和全商品页面回到顶部和点赞链接的功能
$(document).on('click', '.working', function () {
	alert('功能暂未完成，敬请期待...')
	// return false
}).on('click', '.backtop', function () {
	$('body').animate({'scrollTop': 0}, 500)
}).on('mouseenter', '.support', function () {
	$('.ewm').show().stop().animate({left: '-150px', opacity: 1}, 500)
}).on('mouseleave', '.support', function () {
	$('.ewm').stop().animate({opacity: 0}, 500, function () {
		$(this).css('left', 0).hide()
	})
})

// navbar
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
// 首页和全商品页面回到顶部和点赞链接的功能结束

// 添加单一商品页面选项卡功能
$(document).on('click', '.productDetail-tabList-tab', function () {
  var index = $(this).index() //拿到这个「选项卡」的index，第一个是0，第二个是1，以此类推
  $('.productDetail-content').hide() //所有的内容都隐藏
  $('.productDetail-content').eq(index).show() //只显示对于index的内容
})
// 添加单一商品页面选项卡功能结束

// 放大镜开始
$('#preview').css('visibility', 'hidden')
var evt = new Event(),
    m = new Magnifier(evt);
m.attach({
    thumb: '#thumb',
    large: $('.intro-preview-activeItem img').attr('src'),
    largeWrapper: 'preview',
    zoom: 2
})
// 放大镜结束
