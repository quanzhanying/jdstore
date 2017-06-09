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
//= require bootstrap
//= require_tree .


$(window).scroll(function() {
  /*===== Welcome#index - 首頁導航列變化 =====*/
  if ($(this).scrollTop() > 325) {
    $('#navbar').removeClass('show_bgcolor')
  } else {
    $('#navbar').addClass('show_bgcolor')
  }

})


/*===== Products#show - 更改显示图片=====*/
$(document).on('mouseover', '.list-image', function() {
  var src_other = $(this).attr('src') //抓取小图图片路径
  var src_main = src_other.toString().replace("small_", "large_") //更改小图图片路径

  $('.main-image').attr('src', src_main) //变更大图图片路径

  $('.list-image').removeClass('list-image-active') //其他小图移除图片阴影
  $(this).addClass('list-image-active') //当前小图新增图片阴影
})




/*===== Products#show - 调整购买数量 =====*/
$(document).on('turbolinks:load', function() {
  /*===== 增加购买数量 =====*/
  $("#quantity-up").click(function(e) {
    var num = parseInt($("#quantity").val()); //num变量存入输入的数量
    var numMax = $("#quantity").attr("max"); //numMax变量存入最大数量max=@product.quantity（库存）
    if (num < numMax) { // 判断输入数量是否大于库存
      $("#quantity").val(num += 1); //不大于库存的情况下数量可以加1
    }
    e.preventDefault(); //返回
  });

  /*===== 减少购买数量 =====*/
  $("#quantity-down").click(function(e) {
    var num = parseInt($("#quantity").val()); //num变量存入输入的数量
    if (num > 1) { // 判断输入数量是否大于1
      $("#quantity").val(num -= 1); //大于1的情况下可以数量可以减1
    }
    e.preventDefault();
  });

  /*===== 检查购买数量不能超库存 =====*/
  $("#quantity").blur(function(e) {
    var num = parseInt($(this).val()); // 取到当前id（this=#quantity）的数量，也就是用户输入的数量
    var numMax = $(this).attr("max"); //取数量上限max=@product.quantity,不能超过库存
    if (num > numMax) { //当输入数量超过库存时，数量变为库存量
      num = numMax;
    } else if (num < 0) { //当输入数量小于0的时候，数量变为1
      num = 1;
    }
    $(this).val(num);
    e.preventDefault();
  });


  /*===== 確認購買數量（不能超出庫存數量） =====*/
  $(".cart-quantity-input").blur(function(e) {
    var num = parseInt($(this).val());
    var numMax = $(this).attr("max");
    if (num > numMax) {
      num = numMax;
    } else if (num < 0) {
      num = 1
    }
    $(this).val(num);
    e.preventDefault();

    var id = $(this).attr("id");
    $.ajax({
      type: "PATCH",
      url: "/cart_items/" + id,
      dataType: 'json',
      data: {
        quantity: num
      },
    });

    window.location.reload();
  });

});
