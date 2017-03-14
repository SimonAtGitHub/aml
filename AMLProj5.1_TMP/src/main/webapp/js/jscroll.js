/**
 *
 * Copyright (c) 2009 Jun(qq100015091)
 * http://www.xlabi.com
 * http://www.xlabi.com/tp/jscroll.html
 * jun5091@gmail.com
 */
/*--------------------------------------------------------------------------------------------------*/
jQuery.noConflict();
(function($){ 
  $(function(){
$.fn.extend({//添加滚轮事件//by jun
	mousewheel:function(Func){
		return this.each(function(){
			var _self = this;
		    _self.D = 0;//滚动方向
			if($.browser.msie||$.browser.safari){
			   _self.onmousewheel=function(){_self.D = event.wheelDelta;event.returnValue = false;Func && Func.call(_self);};
			}else{
			   _self.addEventListener("DOMMouseScroll",function(e){
					_self.D = e.detail>0?-1:1;
					e.preventDefault();
					Func && Func.call(_self);
			   },false); 
			}
		});
	}
});
$.fn.extend({
	jscroll:function(j){
		return this.each(function(){
			j = j || {}
			j.Bar = j.Bar||{};//2级对象
			j.Btn = j.Btn||{};//2级对象
			j.Bar.Bg = j.Bar.Bg||{};//3级对象
			j.Bar.Bd = j.Bar.Bd||{};//3级对象
			j.Btn.uBg = j.Btn.uBg||{};//3级对象
			j.Btn.dBg = j.Btn.dBg||{};//3级对象
			var jun = { W:"15px"
						,BgUrl:""
						,Bg:"#efefef"
						,Bar:{  Pos:"up"
								,Bd:{Out:"#b5b5b5",Hover:"#ccc"}
								,Bg:{Out:"#fff",Hover:"#fff",Focus:"orange"}}
						,Btn:{  btn:true
								,uBg:{Out:"#ccc",Hover:"#fff",Focus:"orange"}
								,dBg:{Out:"#ccc",Hover:"#fff",Focus:"orange"}}
						,Fn:function(){}}
			j.W = j.W||jun.W;
			j.BgUrl = j.BgUrl||jun.BgUrl;
			j.Bg = j.Bg||jun.Bg;
				j.Bar.Pos = j.Bar.Pos||jun.Bar.Pos;
					j.Bar.Bd.Out = j.Bar.Bd.Out||jun.Bar.Bd.Out;
					j.Bar.Bd.Hover = j.Bar.Bd.Hover||jun.Bar.Bd.Hover;
					j.Bar.Bg.Out = j.Bar.Bg.Out||jun.Bar.Bg.Out;
					j.Bar.Bg.Hover = j.Bar.Bg.Hover||jun.Bar.Bg.Hover;
					j.Bar.Bg.Focus = j.Bar.Bg.Focus||jun.Bar.Bg.Focus;
				j.Btn.btn = j.Btn.btn!=undefined?j.Btn.btn:jun.Btn.btn;
					j.Btn.uBg.Out = j.Btn.uBg.Out||jun.Btn.uBg.Out;
					j.Btn.uBg.Hover = j.Btn.uBg.Hover||jun.Btn.uBg.Hover;
					j.Btn.uBg.Focus = j.Btn.uBg.Focus||jun.Btn.uBg.Focus;
					j.Btn.dBg.Out = j.Btn.dBg.Out||jun.Btn.dBg.Out;
					j.Btn.dBg.Hover = j.Btn.dBg.Hover||jun.Btn.dBg.Hover;
					j.Btn.dBg.Focus = j.Btn.dBg.Focus||jun.Btn.dBg.Focus;
			j.Fn = j.Fn||jun.Fn;
			var _self = this;
			var Stime,Sp=0,Isup=0;
			var allharr=[],hiddenarr=[];
			var dw = $(_self).width(), dh = getTotalHeight()-64;
			function getTotalHeight(){
					 if($.browser.msie){
						return document.compatMode == "CSS1Compat"? document.documentElement.clientHeight :
								 document.body.clientHeight;
					}else{
						return self.innerHeight;
					}
				}
				
			function reh(){
				var newh0 = (getTotalHeight()-64);
				//$(".forscrollbg").css("height",newh0);
				//var newh = (getTotalHeight()-52);
				//allharr.push($(".pub_lscroll").height());
			//	alert(allharr);
				//if(allharr==''){
				//	allharr.push($(".pub_lscroll").height());//alert(allharr[0]);
					//$('.pub_lscroll a').each(function(){ allsum+=parseInt($(this).height()) });
				//}
				$(".pub_lscroll").css({"height":newh0});
				$(".jscroll-c").height(newh0+7);
				dh = $(window).height()-64;
			}
			
			$(_self).css({overflow:"hidden",position:"relative",padding:"0px"});
			//var showheight = dh;
			var sw = j.W ? parseInt(j.W) : 21;
			var sl = dw - sw
			var bw = j.Btn.btn==true ? sw : 0;		
			if($(_self).children(".jscroll-c").height()==null){//存在性检测
		    $(_self).wrapInner("<div class='jscroll-c' style='top:0px;z-index:9999;zoom:1;position:relative' name='scrolltop'></div>");
			$(_self).append("<div class='jscroll-e' unselectable='on' style=' height:100%;top:0px;right:0;-moz-user-select:none;position:absolute;overflow:hidden;z-index:10000;'><div class='jscroll-u' style='position:absolute;top:0px;width:100%;left:0;background:blue;overflow:hidden'></div><div class='jscroll-h'  unselectable='on' style='background:green;position:absolute;left:0;-moz-user-select:none;'></div><div class='jscroll-d' style='position:absolute;bottom:0px;width:100%;left:0;overflow:hidden;'></div></div>");
			}
			var jscrollc = $(_self).children(".jscroll-c");
			var jscrolle = $(_self).children(".jscroll-e");
			var jscrollh = jscrolle.children(".jscroll-h");
			var jscrollu = jscrolle.children(".jscroll-u");
			var jscrolld = jscrolle.children(".jscroll-d");
			function menuclickscroll(){
				$('.pub_lscroll').removeClass('hascroll');
				jscrollc.css({padding:0});jscrolle.css({display:"none"});
				allowS=false;
			}
			
			function menuclickscroll2(){
				$('.pub_lscroll').addClass('hascroll');
				allowS=true;jscrollc.css({"padding-right":sw});jscrolle.css({display:""});
			}
			var submarr=[],sum_arr=[$(".pub_lscroll").height()];
			$('dt').click(function(){
					var sum=0,subm = $(this).next('dd'),tp=$(this).parent(),n=tp.index(),mp=tp.parent(),click_h,scroll_h = $(".pub_lscroll").height(),dth=$(this).height();
					mp.find('dl').each(function(){ var dlh=$(this).height(),arrn=submarr.length,dln=mp.find('dl').length;sum+=parseInt(dlh);if(arrn<dln){ var h=dlh-dth;submarr.push(h);} });//减法获得准确高度,因dd设置有padding
					var subm_h = parseInt(submarr[n]);
					
					if(tp.hasClass('selectbg')){
						 click_h = sum - subm_h;
					}else{
						 click_h = sum + subm_h;	
					}
					//sum_arr.length=0;太麻烦了不这么写了
					//sum_arr.push(click_h);
					//alert(sum_arr);
					//alert(click_h+'<='+scroll_h+','+jscrollc.attr("name"));
					if( click_h <= scroll_h && jscrollc.attr("name")=="scrolltop"){
						menuclickscroll();
					}else if( click_h > scroll_h ){
						menuclickscroll2();
					}
			});
			window.onresize = reh;
			window.onload = reh;
			//end
			if($.browser.msie){document.execCommand("BackgroundImageCache", false, true);}
			jscrollc.css({"padding-right":sw});
			jscrolle.css({width:sw,background:j.Bg,"background-image":j.BgUrl});
			jscrollh.css({background:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out,width:sw-2,top:bw});
			jscrollu.css({height:bw,background:j.Btn.uBg.Out,"background-image":j.BgUrl});
			jscrolld.css({height:bw,background:j.Btn.dBg.Out,"background-image":j.BgUrl});
			jscrollh.hover(function(){if(Isup==0)$(this).css({background:j.Bar.Bg.Hover,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Hover})},function(){if(Isup==0)$(this).css({background:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out})})
			jscrollu.hover(function(){if(Isup==0)$(this).css({background:j.Btn.uBg.Hover,"background-image":j.BgUrl})},function(){if(Isup==0)$(this).css({background:j.Btn.uBg.Out,"background-image":j.BgUrl})})
			jscrolld.hover(function(){if(Isup==0)$(this).css({background:j.Btn.dBg.Hover,"background-image":j.BgUrl})},function(){if(Isup==0)$(this).css({background:j.Btn.dBg.Out,"background-image":j.BgUrl})})
			jscrollc.css('height',$(".pub_lscroll").height());
			var sch = jscrollc.height();//alert('dh:'+dh+'+e:'+$('.jscroll-e').height()+'+c:'+$('.jscroll-c').height());
			//var sh = Math.pow(dh,2) / sch ;//Math.pow(x,y)x的y次方
			//var sh = (dh-2*bw)*dh / sch
			var sh = 30;
			if(sh<10){sh=10}//alert(sh);
			var wh = sh/2//滚动时候跳动幅度
		//	sh = parseInt(sh);
			var curT = 0,curT2=0,allowS=false;
			jscrollh.height(sh);
			
			if(sch<=dh){jscrollc.css({padding:0});menuclickscroll();
			}else{ menuclickscroll2(); }
			if(j.Bar.Pos!="up"){
			curT=dh-sh-bw;curT2=curT;
			setT();
			}
			jscrollh.bind("mousedown",function(e){
				j['Fn'] && j['Fn'].call(_self);
				Isup=1;
				jscrollh.css({background:j.Bar.Bg.Focus,"background-image":j.BgUrl})
				var pageY = e.pageY ,t = parseInt($(this).css("top"));
				$(document).mousemove(function(e2){
					 curT =t+ e2.pageY - pageY;//pageY浏览器可视区域鼠标位置，screenY屏幕可视区域鼠标位置
					 curT2 =curT;
						setT();
				});
				$(document).mouseup(function(){
					Isup=0;
					jscrollh.css({background:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out})
					$(document).unbind();
				});
				return false;
			});
			jscrollu.bind("mousedown",function(e){
			j['Fn'] && j['Fn'].call(_self);
				Isup=1;
				jscrollu.css({background:j.Btn.uBg.Focus,"background-image":j.BgUrl})
				_self.timeSetT("u");
				$(document).mouseup(function(){
					Isup=0;
					jscrollu.css({background:j.Btn.uBg.Out,"background-image":j.BgUrl})
					$(document).unbind();
					clearTimeout(Stime);
					Sp=0;
				});
				return false;
			});
			jscrolld.bind("mousedown",function(e){
			j['Fn'] && j['Fn'].call(_self);
				Isup=1;
				jscrolld.css({background:j.Btn.dBg.Focus,"background-image":j.BgUrl})
				_self.timeSetT("d");
				$(document).mouseup(function(){
					Isup=0;
					jscrolld.css({background:j.Btn.dBg.Out,"background-image":j.BgUrl})
					$(document).unbind();
					clearTimeout(Stime);
					Sp=0;
				});
				return false;
			});
			_self.timeSetT = function(d){
				var self=this;
				//if(d=="u"){curT-=wh;}else{curT+=wh;}
				var sum_h=sum_arr[0], s_n=(sum_h-dh-bw)/(2*bw),wh2=(dh/s_n)*3;
				if(d=="u"){curT-=sh*2;curT2-=wh2}else{curT+=sh*2;curT2+=wh2};
				setT();
				Sp+=2;
				var t =500 - Sp*50;
				if(t<=0){t=0};
				Stime = setTimeout(function(){self.timeSetT(d);},t);
			}
			jscrolle.bind("mousedown",function(e){
					j['Fn'] && j['Fn'].call(_self);
							curT = curT + e.pageY - jscrollh.offset().top - sh/2;
							curT2 = curT2 + e.pageY - jscrollh.offset().top - sh/2;
							asetT();
							return false;
			});
			function asetT(){		
						/*if(curT<bw){curT=bw;}
						if(curT>dh-sh-bw){curT=dh-sh-bw;}
						jscrollh.stop().animate({top:curT},100);
						var scT = -((curT-bw)*sch/(dh-2*bw));
						jscrollc.stop().animate({top:scT},1000);*/
						var cz=dh-sh-bw,sum_h=sum_arr[0];
						if(curT<bw){curT=0; }
						if(curT2<bw){curT2=bw;curT=0;}
						if(curT2>cz){ curT2=cz; }
						if(curT2==cz||curT>sum_h-dh){ curT=sum_h-dh; }
						jscrollh.stop().animate({top:curT2},100);
						var scT = -(curT);
						jscrollc.stop().animate({top:scT},1000);
						if(scT==0){jscrollc.attr('name','scrolltop');}else{jscrollc.removeAttr('name');}
			};
			function setT(){		
						var sum_h=sum_arr[0], zc1=sum_h-dh,zc2=dh-sh-bw;
						if(curT<bw){ curT=0; }
						if(curT2<bw){ curT2=bw;curT=0; }
						
						if(curT2>zc2){curT2=zc2; }//总高与次数 改变滚动条块的速度
						if(curT>zc1||curT2 == zc2){ curT=zc1; }
						jscrollh.css({top:curT2});
						var scT = -(curT);//-((curT-bw)*sch/(dh-2*bw));
						jscrollc.css({top:scT});
						//alert(scT);
						if(scT==0){jscrollc.attr('name','scrolltop');}else{jscrollc.removeAttr('name');}
			};
			$(_self).mousewheel(function(){
					if(allowS!=true) return;
					j['Fn'] && j['Fn'].call(_self);			
						var sum_h=sum_arr[0], s_n=(sum_h-dh-bw)/(2*bw),wh2=(dh/s_n)*3;
						//if(this.D>0){curT-=wh;}else{curT+=wh;};
						if(this.D>0){curT-=sh*2;curT2-=wh2}else{curT+=sh*2;curT2+=wh2};
						setT();
			})
		});
	}
});



  });
})(jQuery);
//-->