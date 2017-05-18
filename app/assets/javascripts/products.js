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

// Get the element with id="defaultOpen" and click on it
// $(function() {
//     document.getElementById("defaultOpen").click();
// });


// $(
//     function() {
//         $('.rating>li').on('mouseover', function() {
//             var selectedCssClass = 'selected';
//             var $this = $(this);
//             //给现在鼠标所在的元素以及它前面的元素加上变色样式
//             $this.addClass(selectedCssClass)
//             //标记鼠标所在的元素
//             $this.prevAll().addClass(selectedCssClass)
//             $this.addClass('hover')
//         }).on('click', function() {
//             var selectedCssClass = 'selected';
//             var $this = $(this);
//             // 先清空以前因为各种原因存在的样式以便重新选
//             $this.siblings('.' + selectedCssClass).removeClass(selectedCssClass);
//             // $('.hover').removeClass('hover')
//             $('.active-s').removeClass('active-s')
//             //标记鼠标所点击的元素
//             $this.addClass('active-s')
//             //给现在鼠标所点击的元素以及它前面的元素加上变色样式
//             $this.addClass(selectedCssClass)
//             $this.prevAll().addClass(selectedCssClass)
//             //至少要有一星的评价，所以点击事件发生后给第一个元素加上样式
//             $('.rating li:eq(0)').addClass(selectedCssClass)
//             //显示评价了几分
//             var index =$this.attr('data-index')
//             $('.star-info').text(index+"分");
//         }).on('mouseleave', function() {
//             var selectedCssClass = 'selected';
//             //将因mouseover事件变红的星星样式变为初始没颜色的样子，不能让它影响以后的评价
//             $('.' + selectedCssClass).removeClass(selectedCssClass);
//             //因为mouseover事件增加了hover样式，现在鼠标离开了，把因mouseover增加的hover元素去掉
//             $('.hover').removeClass('hover') //好像这东西没用到过
//             //被点击的星星.active-s以及它前面的星星全部加上样式
//             $('.active-s').addClass(selectedCssClass)
//             $('.active-s').prevAll().addClass(selectedCssClass)
//         });
//     }
// );

$(
  function () {
    var selectedCssClass = 'selected'
    $this = $('.star-experience')
    var width = $('.star-experience').attr('data-score')
    console.log(width);
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
