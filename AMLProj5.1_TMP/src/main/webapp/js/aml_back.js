//for the same name of function in other js
jQuery.noConflict();
(function($){ 
  $(function(){
//IE6 Scroll BUG
$(function scrollforie6(){ 
 if($.browser.msie&&$.browser.version=="6.0"&&$("html")[0].scrollHeight>$("html").height()){
    $("html").css("overflowY","scroll"); 
    if($("html").has("div#left_menu")){$("html").css("overflow","auto");}else{$("html").css("overflowX","hidden");}
 }else{$("html").removeAttr("style");}
}); 
//IE6\7 table div Scroll BUG
$(function scrollforie6_7(){ 
	var list=$("div[class*='list']");
	var list_tb=$("div[class*='list'] table");
	var cond=$("div[class*='cond']");
	var cond_tb=$("div[class*='cond'] table");
	if($.browser.msie&&$.browser.version=="6.0" || $.browser.msie&&$.browser.version=="7.0" ){
		if(list.width() < list_tb.width()){list_tb.css("marginBottom","8px");}
		else if(cond.width() < cond_tb.width()){cond_tb.css("marginBottom","8px");}	  
	}
}); 
$(function scrollHorizontal(){ 
	var list=$("div[class*='list']");
	
	if(list.size()>0){	
		if(list.get(0).scrollHeight>list.get(0).clientHeight)
		{
			list.height(list.height()+17);		
		}
	}
});

//Left Menu
$(document).ready(function aml_leftsubmenu(){
    $("#left_menu dd a").click(function(){
		$("#left_menu dd a").removeClass('menu_select3');
		$(this).addClass("menu_select3");
    }); 

    $("#left_menu dl dt").css("cursor","pointer");
	$("#left_menu dl dt").click(function(){$(this).nextAll("dd").slideToggle("slow");})
	.toggle(function(){
		 $(this).parent().addClass('selectbg');
		 $(this).attr('name','hidden');
	},function(){
		 $(this).parent().removeClass('selectbg');
		  $(this).attr('name','show');
    });
});
//Input Text Style
$(document).ready(function aml_input_style(){$("input:text").addClass("in_text");$("input:password").addClass("in_text");});
//Conditions
$(document).ready(function aml_col_style(){
    $(".cond_c table td:nth-child(odd)").addClass("alignment2");
	$(".cond_c table td:nth-child(even)").addClass("alignment");
	$(".cond_c2 table td:nth-child(odd)").addClass("deep");
	$(".cond_c2 table td:nth-child(even)").addClass("alignment");
	$(".cond_c table td > table,.cond_c table td * > table,.cond_c2 table td > table,.cond_c2 table td * > table").addClass("cond_tb");
	$(".cond_c table td:only-child").removeClass("alignment2");
	$(".cond_c2 table td:only-child").removeClass("deep");
	$(".cond_c table td > table td,.cond_c table td * > table td").removeClass("alignment alignment2").addClass("insidetd");
	$(".cond_c2 table td > table td,.cond_c2 table td * > table td").removeClass("deep alignment").addClass("insidetd");
});
//List hover
$(document).ready(function aml_list(){
   $(".list td a,.list3 td a").css("text-decoration","underline");				
   $(".list table tr,.list3 table tr").mouseover(function(){$(this).addClass("trhover");}).mouseout(function(){$(this).removeClass("trhover");})
   .click(function(){
		$(".list table tr,.list3 table tr").removeClass('trclick');
		$(this).addClass('trclick');
	}).each(function(){
		$('td:last',$(this)).css('border-right','0');	
	});
   $(".list table tr:even,.list3 table tr:even").addClass('listbg');
   $(".list th,.list3 th").addClass("listhspit");
   $(".list th:last-child,.list3 th:last-child").removeClass("listhspit");
});
$(document).ready(function aml_list2_hover(){
   $(".list2 td a,.list4 td a").css("text-decoration","underline");						
   $(".list2 table td,.list4 table td").mouseover(function(){$(this).addClass("tdhover"); }).mouseout(function(){$(this).removeClass("tdhover");});
});
//Tab
$(document).ready(function aml_bigTab(){
	
    var $title = $(".tabm dd");    
    var $content = $(".tabc dd");    
    $title.click(function(){
	   $(this).addClass("tabcur").siblings().removeClass("tabcur");
	   var index = $title.index($(this)[0]);    
	   $content.hide();  
	   $($content.get(index)).addClass("tabshow").siblings().removeClass("tabshow");
	  load0(index);
	  // if($.browser.msie&&$.browser.version=="6.0"){scrollforie6();}else{return false;}
	   return false;
     });
 }); 
/*subTab*/
$(document).ready(function aml_subTab() {	
  $('#sub_tabMenu > li').click(function(){
	$('#sub_tabMenu > li').removeClass('sub_selected');
    $(this).addClass('sub_selected');
    $('.sub_boxBody h1').fadeOut('1500');
    $('.sub_boxBody h1:eq(' + $('#sub_tabMenu > li').index(this) + ')').fadeIn('1500');
	load1($('#sub_tabMenu > li').index(this));
	//if($.browser.msie&&$.browser.version=="6.0"){scrollforie6();}else{return false;}
  }).mouseover(function(){ $(this).addClass('sub_mouseover').removeClass('sub_mouseout');}).mouseout(function(){$(this).addClass('sub_mouseout').removeClass('sub_mouseover');});
});
//Buttion:checkall or not
$("#checkall").toggle(
	  function(){$("input:checkbox").attr("checked",'checked');$("#checkall").html("<span class='b_checknot'>全清</span>");},
	  function(){$("input:checkbox").removeAttr("checked");$("#checkall").html("<span class='b_checkall'>全选</span>");
	  });
//hdd_display
$(document).ready(function aml_hdd_display(){
     $("#searchtable").show();
     $("#hdd_display").toggle(function(){$("#hdd_display").removeClass("bt_hidden").addClass("bt_display");$("#searchtable").slideUp(700);},function(){$("#hdd_display").removeClass("bt_display").addClass("bt_hidden");$("#searchtable").slideDown(500);});
	 $('.showit').toggle(function(){
			$('#showitcont iframe').attr('src',$('#showitcont iframe').attr('src'));
			$('#showitcont').show();
	},function(){ $('#showitcont').hide(); });
});
//iframe Height
$(document).ready(function aml_iframeh(){$("iframe#iframe_cus").height($("iframe#iframe_cus").contents().find("#iframecontent").height() + 10);});
$("iframe#iframe_cus").load(function aml_iframeh2(){$(this).height($(this).contents().find("#iframecontent").height() + 10);});
$("#iframecontent input.calimg").click(function(){
      var ctop = $(this).offset().top;
      var ifrh = $("iframe", parent.document);
      var conth = $("#iframecontent").height();
		  if (conth-ctop<260){
		   var newh = (conth + 260)+'px';
		   ifrh.removeAttr("style").css("height",newh);
		  }
    });
$("#iframemenu a").click(function(){$(this).css({"font-weight":"bold","color":"#ff6600"});$(this).siblings().removeAttr("style");});
//for the same name of function in other js

$(document).ready(function(){
	 
	   var fix = $('#scrollfixed');
	   var main = $('#main');
	   if(fix.length>0){  
			 if($.browser.msie&&$.browser.version=="6.0"){fix.next().css({'position':'relative','top':'30px'});}else{
	   $(window).scroll(function(){
	 		
					var y = $(document).scrollTop();
					if(y==0){
						fix.removeAttr('style');
						main.removeAttr('style');
						$('#fixedmask').remove();
					}else{
						main.css({'position':'relative'});
						
							
						//}else{
							fix.css({'position':'absolute','left':0,'top':0,'z-index':100000});
							if($('#fixedmask').length==0){
								fix.after('<iframe id="fixedmask" frameborder="0" src="#" />');
							}
							$('#fixedmask').css({'position':'absolute','left':0,'top':y,'z-index':10000,'height':fix.height()+2,'width':fix.width() });
							fix.css({'top':y});
						
					}
	   });
	    }
		}
	  
	  if($('.choose').length>0){
		   
			$('.choose').attr('onselectstart','return false').each(function(){
																	
				var option = $('div:first span',$(this));
				var mid = $('span.nochoose',$(this));
				var it = $("div:first span.selected",$(this));
				var pad = 12;
				var suma=0;
				var hasmid = false;
				it.css('color','#fff');
				//计算总宽度
				option.each(function(){ 
						suma+=parseInt($(this).width()+pad*2); 
				});
				
				//有中间值时
				if(mid.length>0 && it.length==0){ hasmid = true; mid.removeClass('nochoose2'); }else{ mid.addClass('nochoose2'); }
				if( mid.length>0 && $.trim(mid.text())==''){ 
					mid.html('&nbsp;').attr('title','请选择'); 
					var sum = suma-6;
				}else{
					var sum = suma;
				}
				
				$(this).css('width',sum+1);
				if($.browser.msie&&$.browser.version=="9.0"){ $('div:first',$(this)).css('top',1); } 
				
				//写入滑块
				$(this).append('<div class="areabg_r"></div><div class="slide"><span></span></div>');
				var s = $('.slide',$(this));
				$('.areabg_r',$(this)).css('width',sum-9);
				//滑块宽度和位置
				if(hasmid){
					var s_w = mid.width()+16;
					var s_l = mid.position().left;
				}else{
					var s_w = it.width()+pad*2;
					var s_l = it.position().left;
				}
				
				s.css({'width':s_w,'left':s_l});
				$('span',s).css('width',s_w-9);
				
				//选择
				option.click(function(){
					 it.removeAttr('style');
					 if($(this).attr('title')=='请选择'){	 
					 	var s_w = $(this).width()+16;
						$(this).removeClass('nochoose2'); 
					 }else{
						var s_w = $(this).width()+pad*2; 
						mid.addClass('nochoose2');
					 }
					
				     var s_l = $(this).position().left;
					 s.css('width',s_w).animate({'left':s_l},300);
					 $('span',s).css('width',s_w-9);
					 $(this).addClass('chooseon').siblings().removeClass('chooseon');			
					 
				});
			
			}); 
	   }
	   
	   
	   if($('#tab_menu').length>0){
			$('#tab_menu a:eq(0)').addClass('bglink');
			$('#tab_menu a').click(function(){
			$(this).addClass('bglink').siblings().removeClass();
			}); 	
			$('iframe#sysrule').css({'height':$(window).height()-36,'overflowX':'hidden','overflowY':'auto'});
			$(top.window).resize(function(){ $('iframe#sysrule').css({'height':$(window).height()-36}); });
	   }
	   if($('.tab_menu').length>0){
		   	$('.tab_menu span:eq(0)').addClass('bglink');
			$('.tab_menu span').click(function(){
				$('.tab_content').hide();   
				$('.tab_content:eq('+$(this).index()+')').show();//.siblings().hide();
				$('.tab_menu span').removeClass('bglink');
				$(this).addClass('bglink')
			});
	   }
});

  });
})(jQuery);
//Head Menu
function aml_headmenu(obj){
	    var myNav = document.getElementById("hd_menu").getElementsByTagName("a");
		for(var i=0;i<myNav.length;i++){
		  myNav[i].className="menu_active";
		 // myNav[i].style.color="#003C52";
		}
		  obj.className="menu_select";
		  //obj.style.color="#ffffff";
	}
/*Left Menu
function aml_leftmenu(obj){
		var myNav = document.getElementById("left_menu").getElementsByTagName("a");
		for(var i=0;i<myNav.length;i++){
		  myNav[i].className="";
		}
		  obj.className="menu_select2";
	}*/
//Change Skin
function getcookie(sname)
{ 
    var acookie = document.cookie.split("; ");
    for (var i=0; i < acookie.length; i++)
    {
        var acrumb = acookie[i].split("=");
        if (sname == acrumb[0])
        {
            return acrumb[1];
        }
    }
    return null;
}
function setcookie(name, value, time, domain)
{
    var expdate = new Date();
    var expires = time;
    if(expires!=null){
      expdate.setTime(expdate.getTime() + ( expires * 1000 ));
      expd = "expires="+expdate.toGMTString()+";";
    }else
      expd = "";
    if (domain)
    {
        domain = "domain="+ domain +"; path=/; ";
    }
    document.cookie = name + "=" + escape (value) + "; " + expd + domain;
}
var cookietag = "crystal_skin";
var vskin = getcookie(cookietag);
function setskincolor(vskinnum)
{
    setcookie( cookietag, vskinnum, 60*60*24*30,"");	
	document.getElementById("skincss").href = "css/aml_"+vskinnum+".css";
	changeImagePath();
	
}
function changeSkinStyle(){
	var cssid=document.getElementById("skincss");
	if(cssid!=null &&  vskin!=null && vskin!="aml" )
	{
	   var  stylePath=document.getElementById("skincss").href;
	   stylePath=(stylePath.replace(/css\/aml_[a-zA-Z]*.css/g,"css/aml_"+vskin+".css"));
	   document.getElementById("skincss").href=stylePath;
	 }
}
changeSkinStyle();
//Change Skin:Change Image's URL
function changeImagePath(){
	if(vskin!=null  && vskin!=''){
		var imgArray=document.getElementsByTagName("img");
		for(var i=0;i<imgArray.length;i++){
			var img=imgArray[i];
			var imgPath=img.src; 
			if(imgPath!=null && imgPath!=''){
				 imgPath=(imgPath.replace(/images\/[a-zA-Z]*\//g,'images/'+vskin+'/'));
				 img.src=imgPath;
			}
			
		}
	}
}
window.setTimeout('changeImagePath()',1000);//change skin and image

function FixWidth(selectObj)
{

if (navigator.userAgent.toLowerCase().indexOf("firefox") > 0) {
        return;
    }


    var newSelectObj = document.createElement("select");
    newSelectObj = selectObj.cloneNode(true);
    newSelectObj.selectedIndex = selectObj.selectedIndex;
    newSelectObj.id="newSelectObj";
 
    var e = selectObj;
    var absTop = e.offsetTop;
    var absLeft = e.offsetLeft;
    while(e = e.offsetParent)
    {
        absTop += e.offsetTop;
        absLeft += e.offsetLeft;
    }
    with (newSelectObj.style)
    {
        position = "absolute";
        top = absTop + "px";
        left = absLeft + "px";
        width = "auto";
    }
  
    var rollback = function(){ RollbackWidth(selectObj, newSelectObj); };
    if(window.addEventListener)
    {
        newSelectObj.addEventListener("blur", rollback, false);
        newSelectObj.addEventListener("change", rollback, false);
    }
    else
    {
        newSelectObj.attachEvent("onblur", rollback);
        newSelectObj.attachEvent("onchange", rollback);
    }
  
    selectObj.style.visibility = "hidden";
    document.body.appendChild(newSelectObj);
  
    var newDiv = document.createElement("div");
    with (newDiv.style)
    {
        position = "absolute";
        top = (absTop-10) + "px";
        left = (absLeft-10) + "px";
        width = newSelectObj.offsetWidth+20;
        height= newSelectObj.offsetHeight+20;;
        background = "transparent";
        //background = "green";
    }
    document.body.appendChild(newDiv);
    newSelectObj.focus();
    var enterSel="false";
    var enter = function(){enterSel=enterSelect();};
    newSelectObj.onmouseover = enter;
  
    var leavDiv="false";
    var leave = function(){leavDiv=leaveNewDiv(selectObj, newSelectObj,newDiv,enterSel);};
    newDiv.onmouseleave = leave;
}

function RollbackWidth(selectObj, newSelectObj)
{
    selectObj.selectedIndex = newSelectObj.selectedIndex;
    selectObj.style.visibility = "visible";
    if(document.getElementById("newSelectObj") != null){
       document.body.removeChild(newSelectObj);
    }
}

function removeNewDiv(newDiv)
{
    document.body.removeChild(newDiv);
}

function enterSelect(){
  return "true";
}

function leaveNewDiv(selectObj, newSelectObj,newDiv,enterSel){
 if(enterSel == "true" ){
  RollbackWidth(selectObj, newSelectObj);
  removeNewDiv(newDiv);
 }
}