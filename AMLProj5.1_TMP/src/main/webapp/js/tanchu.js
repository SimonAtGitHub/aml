//弹出div

function opendiv(id,w,h,s){
 
	jQuery.noConflict();
	(function($){ 
	  $(function(){
		
			var self = $(".opendivbtn[btn='"+id+"']");
			var x,y,content,direction,arrow_w,arrow_h,arrow_px,arrow_py,mar,d,doc;
			var showp = true;
			//var topframe = $(top.window.frames["mainFrame"].document);
			//if(topframe.length>0){
			//	var showbody = topframe.find('body');
			//}else{
				var showbody = $('body');
			//}
			//按钮位置
			var btn_x = self.offset().left;
			var btn_y = self.offset().top;
			//可见窗口大小
			var w_w = $(window).width();
			var w_h = $(window).height();
			//滚动位置
			var s_w = $(window).scrollLeft();
			var s_h = $(window).scrollTop();
			//判断坐标
			
				function ifup(){
							direction = 'open_up';
							arrow_w = 0;
							arrow_h = 8;
							arrow_py = h - 11;
							mar = 'padding-bottom';
							d = arrow_h;
							y = btn_y - h + 'px';
							makser_y = parseInt(y);
				}
				function ifdown(){
							direction = 'open_down';
							arrow_w = 0;
							arrow_h = 8;
							arrow_py = 0;
							mar = 'padding-top';
							d = arrow_h;
							y = btn_y + self.height() + 'px';
							makser_y = parseInt(y)+arrow_h;
				}
				if( w_h - (btn_y - s_h) >= h*0.65 ){//未到底
				
					if( btn_y >= h*0.35 && btn_y - (h*0.35) >=s_h ){ //上距离足够显示
						y = btn_y - (h*0.35) + 'px';makser_y = parseInt(y);
					}else{//滚动或上距离不足高度
						if( s_h - btn_y < self.height() && s_h > btn_y - 20 ){//页面滚动按钮显示不完全时
							showp = false;
							ifdown();
						}else{
							y = s_h + 'px';makser_y = parseInt(y);
						}
					}
					
				}else{//到底
						if(btn_y-s_h+self.height()<=w_h){
							
							if( btn_y - s_h + self.height() >= w_h - 5 ){
								showp = false;
								ifup();
							}else{
								y = w_h - h + s_h + 'px';makser_y = parseInt(y);
							}
						}else{
							showp = false;
							if(btn_y-s_h>=h){
								ifup();
							}else{
								ifdown();
							}
						}
						
				}
				
				//if( btn_x <= w_w - btn_x && btn_x <= w && w_w - btn_x >= w ){//右边
				//if( btn_x*3 <= w_w && btn_x <= w && (w_w - btn_x)*3 >= w ){//右边	
				/*if( w <= w_w - btn_x ){//右边
					if(showp){
						x = btn_x + self.width() + 'px';//alert(x);
						direction = 'open_r';
						arrow_w = 7;
						arrow_h = 0;
						arrow_px = 0;
						arrow_py = parseInt(btn_y)-parseInt(y);
						mar = 'padding-left';
						d = arrow_w;
						makser_x = parseInt(x)+arrow_w;
					}else{//右上，右下
						x = btn_x + 'px';
						arrow_px = self.width()/2 + 'px';//alert(x);
						makser_x = parseInt(x);
					}
					
				}else*/ if( btn_x > w_w - btn_x && btn_x > w && w_w - btn_x < w ){//左边
					
					if(showp){
						x = btn_x - w + 'px';
						direction = 'open_l';
						arrow_w = 7;
						arrow_h = 0;
						arrow_px = w-arrow_w-4;
						arrow_py = parseInt(btn_y)-parseInt(y);
						mar = 'padding-right';
						d = arrow_w;
						makser_x = parseInt(x);
					}else{//左上，左下
						x = btn_x + self.width() - w + 'px';
						arrow_px = w - self.width()/2 - 14 + 'px';
						makser_x = parseInt(x);				
					}
					
				}else if( w>btn_x && w>w_w-btn_x ) {//非左右
					  x = (w_w - w)/2 + 'px';
					  arrow_px = parseInt(btn_x)-parseInt(x) + self.width()/2 +'px';
					  makser_x = parseInt(x);
					  if(showp){
						 
						 if( (btn_y - s_h)*2 > w_h && btn_y - s_h >= h ){
							  ifup();
						 }else { 
							  ifdown();
						 }
					  }
				}else{
						if(showp){
							x = btn_x + self.width() + 'px';
							direction = 'open_r';
							arrow_w = 7;
							arrow_h = 0;
							arrow_px = 0;
							arrow_py = parseInt(btn_y)-parseInt(y);
							mar = 'padding-left';
							d = arrow_w;
							makser_x = parseInt(x)+arrow_w;
						}else{//右上，右下
							x = btn_x + 'px';
							arrow_px = self.width()/2 + 'px';
							makser_x = parseInt(x);
						}	
				}
				
			if($(".opendivcontent").length==0 ){//条件一只能打开一个//$(".opendivcontent[id='"+id+"']").length==0 ){//条件二可以打开多个
				content = "<div id='"+ id +"' style='position:absolute;z-index:10000;' class='opendivcontent'><div class='"+direction+"' /><table><tr><td class='o_01'></td><td class='o_t'></td><td class='o_02'></td></tr><tr><td class='o_l'></td><td class='opencontentbg'><div class='closebtn' /></td><td class='o_r'></td></tr><tr><td class='o_l'></td><td bgcolor='#ffffff'><iframe frameborder='0' width='"+(w-16-arrow_w)+"' height='"+(h-14-14-arrow_h)+"' src='"+s+"' scrolling='auto' /></td><td class='o_r'></td></tr><tr><td class='o_03'></td><td class='o_b'></td><td class='o_04'></td></tr></table></div><iframe src='#' frameborder='0' id='masker' name='masker' style='position:absolute;z-index:999;' />";
				//alert(content);
	   			showbody.prepend(content);
	         }
				var creatdiv = $(".opendivcontent[id='"+id+"']");
				creatdiv.css({'top':y,'left':x,'width':w,'height':h});
				$('iframe#masker').css({'top':makser_y,'left':makser_x,'width':w-arrow_w-4,'height':h-arrow_h-4});
				
				$('div:eq(0)',creatdiv).removeClass().addClass(direction).css({'top':arrow_py,'left':arrow_px});
				$('iframe',creatdiv).css({'width':w-16-arrow_w,'height':h-14-14-arrow_h});//滚动响应
				creatdiv.css(mar,d);
				//alert(creatdiv.attr('style'));
				$('.closebtn',creatdiv).click(function(){
					 creatdiv.remove();	$('iframe#masker').remove();						   
				});
		  	// }
	   });
	})(jQuery);
  
}
/*
jQuery.noConflict();
(function($){ 
	$(function(){
		 $(window).scroll(function(){
				  var obj = $(".opendivcontent");
				  var id = obj.attr('id');
				  var w = obj.width();
				  var h = obj.height();
				  var s = $('iframe',obj).attr('src');
				  opendiv(id,w,h,s); 
		 });
	});
})(jQuery);
*/
var cao_x,cao_y;

function opendivmove(obj,id,w,h,s){
     
   var objDiv = document.getElementById(id);
   var hasopen=true;
   var opendiv = document.getElementsByTagName('div');
	for(i=0;i<opendiv.length;i++){
		 if(opendiv[i].getAttribute('name')=='opendiv'){ var hasopen=false; }
   }
   if(hasopen){
   if(objDiv==null){
		 document.body.insertAdjacentHTML("afterBegin","<div id='"+id+"' name='opendiv' style='position:absolute;z-index:100000;overflow:visible'></div>");
		 var objDiv = document.getElementById(id);
		// alert(obj.getBoundingClientRect().left);
		 var _x = obj.getBoundingClientRect().left+'px';
		 if(obj.clientHeight==0){ var oh = 18 }else{ var oh =obj.clientHeight;}
		 var _y = obj.getBoundingClientRect().top+ oh +'px';
		 objDiv.style.top=_y;
		 objDiv.style.left=_x;
		 objDiv.innerHTML = "<div style='position:absolute;z-index:100000;top:0;left:0;' class='opendivcontentmove'><table  onmousedown='cao_x=event.x-parentNode.style.pixelLeft;cao_y=event.y-parentNode.style.pixelTop;setCapture();' onmouseup='releaseCapture();' onmousemove='caoMove(this.parentNode)' style='cursor:move;'><tr align=center><td><div class='closebtn' onclick=document.getElementById('"+id+"').style.display='none';document.getElementById('"+id+"').setAttribute('name','closediv');></div><br/><iframe frameborder='0' width='"+w+"' height='"+h+"' src='"+s+"' scrolling='auto' /></td></tr></talbe></div>";
		 objDiv.style.display='block';
    }else{ objDiv.style.display='block'; objDiv.setAttribute('name','opendiv'); }
	}
	
}

function caoMove(obj)  //实现层的拖移
{
  if(event.button==1)
  {
    var caoX=obj.clientLeft;
    var caoY=obj.clientTop;
    obj.style.pixelLeft=caoX+(event.x-cao_x);
    obj.style.pixelTop=caoY+(event.y-cao_y);
  }
}