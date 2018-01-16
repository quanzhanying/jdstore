//选择屏幕左上方的预览图
$(
  function () {
    var init_preview_photo = $('.preview-photo')
    $('.to-preview-item').click(function () {
      var selectedPreview = 'selectd-preview-item'
      $(this).siblings().removeClass('selectd-preview-item')
      //点击预览图片，被选中的图片出现红色边框
      $(this).addClass('selectd-preview-item')
      //上方的默认展示大图变成被选中的预览图的大图形式
      var replacePhotoSrc = $(this).find('.to-preview-thumnail').attr('src')
      $('.product-modal').find('.preview-photo').attr('src',replacePhotoSrc)
    })
  }
)

//开启大图预览模式
$(function () {
  $('.close-Magnifier').click(function () {
    $('#product-Magnifier').css('display','none')
  })

  $('.product-modal').click(function () {
    $('#product-Magnifier').css('display','block')
    $('.mySlides').each(function () {
      var data_index = $(this).attr('data-index')
      if (data_index == 0) {
        $(this).css('display','block')
      }
    })
  })

  $('.demo').click(function () {
    var id = $(this).attr('id')
    showSlides(id);
  })

  function showSlides(n) {
    var slides = $(".mySlides");
    var dots = $('.demo')
    $(".mySlides").each(function (){
      $(this).css('display','none')
    })
    $('.demo').each(function (){
      $(this).toggleClass("active")
    })
    slides.eq(n).css('display','block')
    dots.eq(n).addClass('active')
  }
})

//product.show页面的下方商品详情和商品评价切换按钮
$(document).on('click.product.show.menu', '[data-toggle="tab"]', function(e) {
    //得到被点击的元素，并取出它的option，看是“商品详情”还是“商品评论”
    var $this = $(this);
    var option = $this.attr('data-option');

    var i, tabcontent, tablinks;
    //先将所有tabcontent隐藏
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tabcontent[0].style.display = "block";
    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(option).style.display = "block";
    e.currentTarget.className += " active";

})

//显示商品评价的星级
$(
  function () {
    var selectedCssClass = 'selected'
    $this = $('.star-experience')
    var width = $('.star-experience').attr('data-score')
    var star_html = "<ul class='rating'>"
    for (var i = 0; i < 5; i++) {
      star_html += "<li> &star;</li>"
    }
      star_html += "</ul>"
    $this.html(star_html);
    var $selected_star = $('.star-experience li').eq(width-1)
    $selected_star.addClass(selectedCssClass)
    $selected_star.prevAll().addClass(selectedCssClass)
  }
)

//购物车飞入动画
$(function () {
    var cart_wrap = $('.cart-wrap')
        carLeft = cart_wrap.offset().left
        carTop = cart_wrap.offset().top
    $('.addCartBtn').click(function () {
        var product = $(this).parent().parent().find('.thumbnail')
        console.log(product)
        productLeft = product.offset().left
        productTop = product.offset().top
        if (product.is(':animated')) {
            return
        }
        var product_fly_image = product.clone();

        $('body').append(product_fly_image);
        product_fly_image.css({position: 'absolute', left: productLeft, top: productTop, border: '5px #f00 solid'})
        product_fly_image.animate({
            width: 80,
            height: 80,
            left: carLeft,
            top: carTop,
            opacity: 1
        }, 800, function () {
            product_fly_image.remove()
        });
    });
})
