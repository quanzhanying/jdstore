

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


$(window).scroll(function () {
  /*===== Welcome#index - 首頁導航列變化 =====*/
	if ($(this).scrollTop() < 325) {
		$('#navbar').addClass('show_bgcolor')
	} else {
		$('#navbar').removeClass('show_bgcolor')
	}

})


/*===== Products#show - 更改显示图片=====*/
$(document).on('mouseover', '.list-image', function () {
  var src_other = $(this).attr('src') //抓取小图图片路径
  var src_main = src_other.toString().replace("small_", "large_") //更改小图图片路径

  $('.main-image').attr('src', src_main) //变更大图图片路径

  $('.list-image').removeClass('list-image-active') //其他小图移除图片阴影
  $(this).addClass('list-image-active') //当前小图新增图片阴影
})
