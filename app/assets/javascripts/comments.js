$(
    function() {
        $('.rating>li').on('mouseover', function() {
            var selectedCssClass = 'selected';
            var $this = $(this);
            //给现在鼠标所在的元素以及它前面的元素加上变色样式
            $this.addClass(selectedCssClass)
            //标记鼠标所在的元素
            $this.prevAll().addClass(selectedCssClass)
            $this.addClass('hover')
        }).on('click', function() {
            var selectedCssClass = 'selected';
            var $this = $(this);
            // 先清空以前因为各种原因存在的样式以便重新选
            $this.siblings('.' + selectedCssClass).removeClass(selectedCssClass);
            // $('.hover').removeClass('hover')
            $('.active-s').removeClass('active-s')
            //标记鼠标所点击的元素
            $this.addClass('active-s')
            //给现在鼠标所点击的元素以及它前面的元素加上变色样式
            $this.addClass(selectedCssClass)
            $this.prevAll().addClass(selectedCssClass)
            //至少要有一星的评价，所以点击事件发生后给第一个元素加上样式
            $('.rating li:eq(0)').addClass(selectedCssClass)
            //显示评价了几分
            var index =$this.attr('data-index')
            $('.star-info').val(index);
        }).on('mouseleave', function() {
            var selectedCssClass = 'selected';
            //将因mouseover事件变红的星星样式变为初始没颜色的样子，不能让它影响以后的评价
            $('.' + selectedCssClass).removeClass(selectedCssClass);
            //因为mouseover事件增加了hover样式，现在鼠标离开了，把因mouseover增加的hover元素去掉
            $('.hover').removeClass('hover') //好像这东西没用到过
            //被点击的星星.active-s以及它前面的星星全部加上样式
            $('.active-s').addClass(selectedCssClass)
            $('.active-s').prevAll().addClass(selectedCssClass)
        });
    }
);
