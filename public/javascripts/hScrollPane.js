/*
	http://www.rjboy.cn
	By sean at 2010.06 - 2011.03
	
	Demo:
	$(".container").hScrollPane({
		mover:".press", //指定container对象下的哪个元素需要滚动位置 | 必传项;
		moverW:function(){return $(".press").width();}(), //传入水平滚动对象的长度值,不传入的话默认直接获取mover的宽度值 | 可选项;
		handleMinWidth:300, //指定handle的最小宽度,要固定handle的宽度请在css中设定handle的width属性（如 width:28px!important;），不传入则不设定最小宽度 | 可选项;
		showArrow:true, //指定是否显示左右箭头，默认不显示 | 可选项;
		dragable:false, //指定是否要支持拖动效果，默认可以拖动 | 可选项;
		handleCssAlter:"draghandlealter", //指定拖动鼠标时滚动条的样式，不传入该参数则没有变化效果 | 可选项;
		easing:true, //滚动是否需要滑动效果,默认有滑动效果 | 可选项;
		mousewheel:{bind:true,moveLength:500} //mousewheel: bind->'true',绑定mousewheel事件; ->'false',不绑定mousewheel事件；moveLength是指定鼠标滚动一次移动的距离,默认值：{bind:true,moveLength:300} | 可选项;
	});
*/

(function($){
	$.extend(jQuery.easing,{
		easeOutQuint: function (x, t, b, c, d) {
			return c*((t=t/d-1)*t*t*t*t + 1) + b;
		}
	});

	$.fn.hScrollPane=function(settings){
		settings=$.extend(true,{},$.fn.hScrollPane.defaults,settings);
		this.each(function(){
			var container=$(this),
				mover=container.find(settings.mover),
				w=container.width(),
				c=settings.moverW || mover.width(),
				dragbar=(container.find(".hScrollPane_dragbar").length==0 && c>w ) ? container.append('<div class="hScrollPane_dragbar"><div class="hScrollPane_draghandle"></div></div>').find(".hScrollPane_dragbar") : container.find(".hScrollPane_dragbar"),//避免多次初始化时的重复append;
				handle=dragbar.find(".hScrollPane_draghandle");
			
			if(settings.showArrow){
				container.append('<a href="javascript:void(0);" class="hScrollPane_leftarrow"></a><a href="javascript:void(0);" class="hScrollPane_rightarrow"></a>');
				leftArrow=container.find(".hScrollPane_leftarrow");
				rightArrow=container.find(".hScrollPane_rightarrow");
				dragbar.css({
					width:container.width()-leftArrow.outerWidth()*2,
					left:leftArrow.outerWidth()
				});
				leftArrow.off();
				rightArrow.off();
			}else{
				dragbar.css("width",container.width());	
			}
			
			mover.stop().css("left","0px");
			container.off();//避免多次初始化时的事件重复绑定;
			handle.off();
			dragbar.off();
			
			handle.stop().css({
				width:(w/c)*w >settings.handleMinWidth ? (w/c)*w : settings.handleMinWidth,
				left:0
			});
			
			if(c<w){
				dragbar.hide();
				return false;
			}else{
				dragbar.show();	
			}
			
			var maxlen=parseInt(dragbar.width())-parseInt(handle.outerWidth());
			
			dragbar.on("click",function(e){
				var flag=e.pageX>handle.offset().left+handle.outerWidth() ? -1 : 1;
				$.fn.hScrollPane.move(settings,mover,handle,w,c,maxlen,flag);
			});
			
			handle.on("mousedown",function(e){
				var x=e.pageX;
				var hx=parseInt(handle.css("left"));
				if(settings.handleCssAlter){$(this).addClass(settings.handleCssAlter);}
				
				$(document).on("mousemove",function(e){
					var left=e.pageX-x+hx<0?0:(e.pageX-x+hx>=maxlen?maxlen:e.pageX-x+hx);
					handle.stop().css({left:left});
					if(settings.easing){
						mover.stop().animate({
							left:-left/maxlen*(c-w)			
						},{duration:1500,easing:'easeOutQuint',queue:false});
					}else{
						mover.css({left:-left/maxlen*(c-w)});
					}
					
					return false;
				});
				$(document).on("mouseup",function(){
					if(settings.handleCssAlter){handle.removeClass(settings.handleCssAlter);}
					$(this).off("mousemove");
				})
				return false;
			}).click(function(){
				return false;	
			})
			
			if(settings.dragable){
				mover.on("mousedown",function(e){
					var x=e.pageX;
					$(this).on("mousemove",function(e){
						$.fn.hScrollPane.move(settings,mover,handle,w,c,maxlen,x,e.pageX);
						return false;
					})
					$(document).on("mouseup",function(){
						mover.off("mousemove");
					})
				})
			}
			
			if(settings.mousewheel.on){
				container.on("mousewheel",function(event, delta){
					$.fn.hScrollPane.move(settings,mover,handle,w,c,maxlen,delta);
					return false;
				});
			}
			
			if(settings.showArrow){
				leftArrow.click(function(){
					$.fn.hScrollPane.move(settings,mover,handle,w,c,maxlen,1);
					return false;
				}).focus(function(){this.blur();});
				
				rightArrow.click(function(){
					$.fn.hScrollPane.move(settings,mover,handle,w,c,maxlen,-1);
					return false;
				}).focus(function(){this.blur();});
			}
			
			this.ondragstart=function(){return false;}
			this.onselectstart=function(){return false;}
		
		})
	}
	
	$.fn.hScrollPane.defaults = {
		showArrow:false,
		handleMinWidth:0,
		dragable:true,
		easing:true,
		mousewheel:{bind:true,moveLength:300}
	};
	
	$.fn.hScrollPane.move=function(settings,mover,handle,w,c,maxlen,x,nx){
		if(arguments.length==7){
			var left=parseInt(mover.css("left"))+x*settings.mousewheel.moveLength;
		}else{
			var left=parseInt(mover.css("left"))+((nx-x)/w)*(c-w);
		}
		left=left.toFixed(0);
		left=left>0?0:left<w-c?w-c:left;
		var handle_left=(left/(w-c))*maxlen;
		
		if(settings.easing){
			mover.stop().animate({
				left:left			
			},{duration:1500,easing:'easeOutQuint',queue:false});
			
			handle.stop().animate({
				left:handle_left			
			},{duration:1500,easing:'easeOutQuint',queue:false});
		}else{
			mover.stop().animate({
				left:left			
			},{duration:5,queue:false});
			
			handle.css({left:handle_left});
		}
	}
})(jQuery);