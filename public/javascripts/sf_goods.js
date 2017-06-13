$(function(){
	
	/******商品详情页单选属性点击效果********/
	$(".chooseType ul li").click(function(){
		var a = $(this).find(":radio");
		a.prop("checked",true);
		$(this).parents(".chooseType").find(".selected").removeClass("selected");
		$(this).addClass("selected");
		changePrice();
	})	
	/******销售排行切换效果********/

	$(".sidlist_slide li").hover(function() {
            $(this).find("u").stop(true).animate({
                right: -50
            },
            100);
            $(this).stop(true).animate({
                marginLeft: -20
            },
            200);
        },
        function() {
            $(this).stop(true).animate({
                marginLeft: 45
            },
            200);
            $(this).find("u").stop(true).animate({
                right: 52
            },
            200);
     })
	 
	 
	 
	var e = $("#J_des");
	var a = $("#J_fixedDes");
	var d = $("#J_asideFixed");
	var c = d.find(">ul");
	var b = true;
	
	
	
	$(window).scroll(function() {

		var f = $("#J_des").offset().top;
		var g = $(window).scrollTop();
		if (g >= f) {
			a.show();
			if (b && c.css("display") == "none") {
				c.show().prev().css("display", "block")
			} else {
				if (b == false && c.css("display") == "block") {
					c.hide().prev().hide()
				}
			}
		} else {
			a.hide();
			c.hide().prev().hide()
		}
		if (g > 200) {
			d.show()
		} else {
			d.hide()
		}
	});
	
	$("#detail_gottop").click(function(f) {
		$(window).scrollTop(0)
	})
	
	//弹出评论层
	$(".open_comment").click(function(){
		easyDialog.open({
			container : 'comment_show',
			fixed : true,
			drag : true
		});
	})
	
	$(".popwinClose").click(function(){
		easyDialog.close();
	})
	
	
	
	//商品详情页数量
	$("#product_amount").keyup(function(){
		var a = $("#product_amount").val();
		if(a < 1)
		{
			alert("最小购买数量为1件")	
		}
		else if(a == 1)
		{
			if($(".p-reduce").length < 1)
			{
				$(this).addClass("disable");
			}
		}
		else
		{
			$(this).removeClass("disable");
		}
		changePrice();
	})
	
	if($("#product_amount").val() > 1)
	{
		$(".p-reduce").removeClass("disable");
		changePrice();
	}
	

	$(".p-add").click(function(){
		var a = $("#product_amount").val();
		a++;
		$("#product_amount").val(a);
		if(a > 1)
		{
			$(".p-reduce").removeClass("disable");
		}
		changePrice();
	})
	
	$(".p-reduce").click(function(){
		
		var a = $("#product_amount").val();
		a--;
		if(a < 2)
		{
			$("#product_amount").val(1);
			$(this).addClass("disable");
		}
		else
		{
			$("#product_amount").val(a);
		}
		changePrice();
	})

	/*************二维码****************/
	$('.phone_client').click(function(event){
		event.stopPropagation();
		$(this).find('.phone_clientCode').show();
		$(this).removeClass('phone_border');
		$(".phone_clientCode").find(".p-logo").show();
		$(this).css('cursor','default');
		$(".chooseBtns").css('z-index',92);
	})
	$('.ac_phoneClose').click(function(event){
		event.stopPropagation();
		$(this).parent('.phone_clientCode').hide();	
		$('.phone_client').addClass('phone_border');
		$(".phone_clientCode").find(".p-logo").hide();
		$('.phone_client').css('cursor','pointer');
		$('.chooseBtns').css('z-index',1);
	})
	$('.phone_client').hover(function(){
		},function(){
			$(this).find('.phone_clientCode').hide();	
			$('.phone_client').addClass('phone_border');
			$('.phone_client').css('cursor','pointer');
			$(".chooseBtns").css('z-index',1);
	})
	$(document).click(function(){
		$('.phone_clientCode').hide();
		$('.phone_client').addClass('phone_border');
		$('.phone_client').css('cursor','pointer');
		$(".chooseBtns").css('z-index',1);
	})
	/*************二维码****************/
	
	//商品信息Tab切换
    $(".pTab li").click(function(){
		if($(".pDetail").hasClass("pFixed")){
			$(".pDetail").removeClass("pFixed");
			var pTabTop = $(".pTab").offset().top -50;
			$(document).scrollTop(pTabTop);
		}
        var $this = $(this);
        $this.addClass("curr").siblings().removeClass("curr");
        $(".pCont").hide();
        $('#' + $this.attr('pCont-target')).show();
        if ($this.attr('pCont-target') != 'div-shaidan' && $this.attr('pCont-target') != 'div-comment') {
            $("#div-comment").show();
            $("#div-shaidan").show();
        }
    });
	$('.p-buy-phone').mouseover(function(){
		$(this).addClass('hover')
	})
	$('.p-buy-phone').mouseleave(function(){
		$(this).removeClass('hover')
	})		

	if($(".pDetail").length > 0){
		var pDetailFixed=function(){
		    var pDetailTop = $("#flow-layer-sf").offset().top;
			var pDomTop = $(document).scrollTop();
			(pDomTop > pDetailTop) ? $(".pDetail").addClass("pFixed") : $(".pDetail").removeClass("pFixed");
			(pDomTop > pDetailTop) ? $(".pDetail").addClass("pFixed").find('.p-buy-phone').show() : $(".pDetail").removeClass("pFixed").find('.p-buy-phone').hide();
		};
		$(window).bind("scroll", pDetailFixed);
		pDetailFixed();
	} 
	
	
	//商品信息Tab切换
	
	
	$(".fittings_content").each(function(i){
		i++;
		$(".container"+i).hScrollPane({
			mover:"ul", //指定container对象下的哪个元素需要滚动位置 | 必传项;
			showArrow:true, //指定是否显示左右箭头，默认不显示 | 可选项;
			moverW:function(){return $(".container"+i+" li").length*258}(),
			//moverW:function(){return $(".press").width();}(), //传入水平滚动对象的长度值,不传入的话默认直接获取mover的宽度值 | 可选项;
			//handleMinWidth:50,//指定handle的最小宽度,要固定handle的宽度请在css中设定handle的width属性（如 width:28px!important;），不传入则不设定最小宽度 | 可选项;
			//dragable:true, //指定是否要支持拖动效果，默认可以拖动 | 可选项;
			//easing:true, //滚动是否需要滑动效果,默认有滑动效果 | 可选项;
			//handleCssAlter:"draghandlealter", //指定拖动鼠标时滚动条的样式，不传入该参数则没有变化效果 | 可选项;
			mousewheel:{bind:true,moveLength:300} //mousewheel: bind->'true',绑定mousewheel事件; ->'false',不绑定mousewheel事件；moveLength是指定鼠标滚动一次移动的距离,默认值：{bind:true,moveLength:300} | 可选项;
		});
	})
	
	$("#fitAndCombineDiv .pack_tab li").click(function(){
		var a = $("#fitAndCombineDiv .pack_tab li").index($(this));	
		a++;
		$("#fitAndCombineDiv .pack_tab li").removeClass("cur");
		$("#fitAndCombineDiv #J_packItem .pack_suit").hide();
		$("#optionCollectProdsContent"+a).show();
		$("#optionCollectProdsTitle"+a).addClass("cur");
	})	
})


function scrollToDivById(a) {
	var b = $(a).offset().top;
	scrollToTop(b - 2)
}
function scrollToTop(a) {
	$("body,html").animate({
		scrollTop: a
	},80)
}

function onTabTitleClickEvent(c) {

	var a = c.attr("tabIndex");
	$("#detail_desc_content .desitem").hide();
	if (a >= 0) {
		$("#detail_desc_fwcl").show();
		$("#detail_desc_findMistake").show();
		$("#detail_desc_content .desitem[tabIndex='" + a + "']").show()
	} else {
		var b = c.attr("id");
		
		if ("desc_sppj" == b || "desc_sppj_fixed" == b) {
			$("#detail_desc_fwcl").hide();
			$("#detail_desc_findMistake").hide();
			$("#buyer_experience").show();

		}
	}
}

