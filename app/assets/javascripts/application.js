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
//= require bootstrap
//= require_tree .

//购物车飞入动画
// (function () {
//     var cart_wrap = $('.cart-wrap')
//         carLeft = cart_wrap.offset().left;
//         carTop = cart_wrap.offset().top
//     $('.addCartBtn').click(function () {
//         var product = $(this).parent().parent().find('.thumbnail')
//         console.log(product)
//         productLeft = product.offset().left
//         productTop = product.offset().top
//         if (product.is(':animated')) {
//             return
//         }
//         var product_fly_image = product.clone();
//
//         $('body').append(product_fly_image);
//         product_fly_image.css({position: 'absolute', left: productLeft, top: productTop, border: '5px #f00 solid'})
//         product_fly_image.animate({
//             width: 80,
//             height: 80,
//             left: carLeft,
//             top: carTop,
//             opacity: 1
//         }, 800, function () {
//             product_fly_image.remove()
//         });
//     });
// })();
