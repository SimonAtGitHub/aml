var l_hid = -1978 ; //for Hidden Menu Frame
var t_hid = -1824 ; //for Hidden Menu Frame
var MAX_ITEM_4_OFFSET = 12 ;  //When item more than this value, offset esp.




//in menu.htm , hidden menu level2
function hidLevel2Menu(idx){
  var items = document.all("_MenuItem") ;
  if(items[0]==null){//只有一个菜单时的情况
      items.style.display = "";
	  return ;
  }
  var flag = items[idx].style.display ;
  for(var i=0; i<items.length; i++){
    items[i].style.display = "none";
  }
  if(flag=='') {
    items[idx].style.display = "none";
  }else{
    items[idx].style.display = "";
  }
}

function toUrl(url){
  if(url=='' || url == 'null' || url == 'NULL'){
	url = "/pubmodule/main.jsp" ;
  }
  try{
	parent.frmMain.document.body.innerHTML = '&nbsp;<p>&nbsp;&nbsp;&nbsp;&nbsp;页面装载中 ...</p>' ;
  }catch(e){}
  parent.frmMain.location.href = parent.document.all("contextPath").value + url ;
}


function setLocation(item){
  parent.document.all("_spanNavigation").innerText = buildNavText(item) ;
}
function onMouseDown(obj){
  obj.className="tbson_over";
  before = obj;
  if(parent.document.all("beforeValue").value != obj.id && parent.document.all("beforeValue").value != '-1') {
  	try{
  		document.getElementById(parent.document.all("beforeValue").value).className="tbson";
  	}catch(e) {
  		try{
  			parent.frmMenu2.document.getElementById(parent.document.all("beforeValue").value).className="tbson";
  		}catch(e){
  			try{
  				parent.frmMenu3.document.getElementById(parent.document.all("beforeValue").value).className="tbson";
  			}catch(e){
  				try{
	  				parent.frmMenu4.document.getElementById(parent.document.all("beforeValue").value).className="tbson";
	  			}catch(e){}
  			}
  		}
  	}
  }
  parent.document.all("beforeValue").value = obj.id;
  //beforeFrm = parent.getElementById("frmMenu"+ (menus[pno].level+1)).document.body.innerHTML;
  parent.document.all("beforeFrm").value = document.body.innerHTML;
  //alert(beforeFrm);
  
  var pid = "";
  var pno = "";
  for(var i=0; i<menus.length; i++){
	if(menus[i].no==obj.id){
		pid = menus[i].pid;
	}
  }
  for(var i=0; i<menus.length; i++){
	if(menus[i].mid==pid){
		pno = menus[i].no;
	}
  }
  //alert(pno);
  parent.document.all("beforeFrmValue").value = pno;
  
}
function onMouseOut(obj){
  if( obj.id!=parent.document.all("beforeValue").value || parent.document.all("beforeValue").value=='-1'){
  	obj.className="tbson";
  }
}

function showSubMenu(no){
  
  var item = menus[no] ;

  hidMenu(item.level+1);

  //Show menu frame
  var frmMenuName = "frmMenu"+ (item.level+1) ;
  var menuValue = buildSubMenu(item) ;
  if(parent.document.all("beforeFrmValue").value!='-1' && parent.document.all("beforeFrmValue").value==no){
  	parent.document.all("_tmp4menu").value = parent.document.all("beforeFrm").value;
  	//alert(parent.document.all("beforeFrm").value);
  }else{
  	parent.document.all("_tmp4menu").value = menuValue;
  }
  

  eval('parent.'+frmMenuName+'.document.body.innerHTML = parent.document.all("_tmp4menu").value ;') ;

  var tow = eval('parent.'+frmMenuName+'.document.all(\'tblSubMenu\').offsetWidth;') ;
  var toh = eval('parent.'+frmMenuName+'.document.all(\'tblSubMenu\').offsetHeight;') ;
  eval('parent.'+frmMenuName+'.window.resizeTo('+tow+','+toh+')') ;

  //current menu's offset
  var offset = 138 ;
  if(item.level != 2){
	offset = eval('parent.frmMenu'+item.level+'.document.all(\'tblSubMenu\').offsetWidth;') -2 ;  
  }

  var offset = getOffset(item,offset);
  
  if(_sub_menu_sum>MAX_ITEM_4_OFFSET) offset[1] = offset[1] - toh/2 + ROW_OFFSET/2 ;
  parent.document.all(frmMenuName).style.left = offset[0] - document.body.scrollLeft ;
  parent.document.all(frmMenuName).style.top = offset[1] - document.body.scrollTop  ;

}

//For Menus
function hidMenu(level){
  //TODO:add gradual change effect
  for(var i=level; i<6; i++){
    frmMenuName = "frmMenu" + i ;
    parent.document.all(frmMenuName).style.left = -3000  ;
	parent.document.all(frmMenuName).style.top  = -3000  ;
  }
}

//the menu item's offset
function getOffset(item,defaultOffset){

  var re = new Array();

  //the just level menu frame in parent 
  var vSrcName = "frmMenu"+(item.level) ;
  var vSrc = parent.document.all(vSrcName);

  var  l = vSrc.offsetLeft + defaultOffset;  // left
  var  t = vSrc.offsetTop -1;         // top
  var  vParent = vSrc.offsetParent;
  while (vParent.tagName.toUpperCase() != "BODY"){  //loop to repair this menu's offset in parent page
    l += vParent.offsetLeft;
    t += vParent.offsetTop;
    vParent = vParent.offsetParent;
  }

  //and the event element ;
  vParent = event.srcElement ; //filter the element in TD
  while (vParent.className == 'imgHasChild'){  // careful
    vParent = vParent.offsetParent;
  }
  while (vParent.tagName.toUpperCase() != "BODY"){  //loop to repair the offset of the event's Element
    l += vParent.offsetLeft;
    t += vParent.offsetTop;
    vParent = vParent.offsetParent;
  }

  re[0] = l ;
  re[1] = t ;

  return re ;
}