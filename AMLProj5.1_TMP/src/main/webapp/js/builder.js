//==========================================================================
//= NOTIC:EveryBody use themselves own MenuItem those they get in INDEX.htm
//==========================================================================
var ROOT_LEVEL = 1 ;        // <- root level
var LEVEL_CODE_LENGTH = 2 ; // <- ervery level code's length 
var MENU_ITEM_LENGTH = 135 ;
var ROW_OFFSET = 22 ;
var PREFIX = "MI_" ;        // <- prefix of object's name
var _sub_menu_sum = 0 ;     // <- sum current menu's children. the value will change after invoke the method buildSubMenu

var items = parent.document.all("menuitems").children ;
var menus = new Array() ;
//init menus
{ 
  for(var i=0; i<items.length; i++){
	menus[i] = new MenuItem(items[i].NO,items[i].MID,items[i].PID,items[i].MNAME,items[i].URL);
  }
  //alert(menus[0].mid+":"+menus[0].pid+":"+menus[0].level);
}

//= MenuItem Object
//= code like '00 00 00 00 00'
//==========================================================================
function MenuItem(no,mid,pid,name,url){
  this.no = no ;
  this.mid  = mid ;
  this.pid = pid;
  this.name  = name ;
  this.url   = url ;
  this.level = MenuItemLevel(this.pid) ;
  this.toString = MenuItemToString ;
}

function MenuItemToString(){
  var re = "MenuItem[" ;
  re += "no="+this.no ;
  re += ",mid="+this.mid ;
  re += ",pid="+this.pid ;
  re += ",name="+this.name ;
  re += ",url="+this.url ;
  re += ",level="+this.level ;
  return re + "]"  ;
}


function MenuItemLevel(pid){
  if(pid=='-1'){
  	return 1;
  }else{
  	for(var i=0; i<items.length; i++){
		if(pid==items[i].MID){
			return 1+MenuItemLevel(items[i].PID);
		}
	}
	return 1;
  }
  
	
  /*var m=10;
  if("00000000" == this.code.substring(2,m)) return 1 ;
  if("000000" == this.code.substring(4,m)) return 2 ;
  if("0000" == this.code.substring(6,m)) return 3 ;
  if("00" == this.code.substring(8,m)) return 4 ;
  return 5 ;*/
}

function hasChildren(item){
  for(var i=0; i<menus.length; i++){
	if(item.mid==menus[i].pid){
	  return true ;
	}
  }
  return false;
  /*
  var tmp = item.level * LEVEL_CODE_LENGTH ;
  for(var i=0; i<menus.length; i++){
	if(menus[i].code != item.code && menus[i].code.substr(0,tmp) == item.code.substr(0,tmp)){
	  return true ;
	}
  }
  return false ;
  */
}


//= Public methods ....
//==========================================================================
function createMenu1(){
  document.write("<table width=\"139\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"tableBK\">");
  var order = 0 ;
  for(var i=0; i<menus.length; i++){
	if(menus[i].level == ROOT_LEVEL){
	
	  createMenu1Item(order,menus[i]);
	  
	  order ++ ;
	}
  }
 
  document.write("</table>");
}

function createMenu1Item(order,item){
  document.write("  <tr onClick=\"hidLevel2Menu("+order+")\">" );
  document.write("    <td class=\"tdHead\" onMouseOver=\"this.className=\'tdHead_over\';hidMenu(3)\" onMouseOut=\"this.className=\'tdHead\'\">" );
  document.write("   "+ item.name  );
  document.write("	  </td>" );
  document.write("  </tr>" );
  document.write("  <tr id=\"_MenuItem\" style=\"display:none\">" );
  document.write("    <td class=\"tdCon\"><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">" );

  createMenu2(item);

  document.write("        <tr>" );
  document.write("          <td class=\"tbsonB_bak\"></td>" );
  document.write("        </tr>" );
  document.write("    </table></td>" );
  document.write("  </tr>" );
}

function createMenu2(p_item){
  for(var i=0; i<menus.length; i++){
	if(menus[i].level == p_item.level+1 && p_item.mid == menus[i].pid  ){
	  createMenu2Item(menus[i]);
	}
  }
  /*
  var tmp = p_item.level * LEVEL_CODE_LENGTH ;
  for(var i=0; i<menus.length; i++){
	if(menus[i].level == p_item.level+1 && menus[i].code.substr(0,tmp) == p_item.code.substr(0,tmp)){
	  createMenu2Item(menus[i]);
	}
  }
  */
}

function createMenu2Item(item){
  var mouseover = "this.className=\'tbson_over\';hidMenu("+(item.level+1)+");" ;
  var onclick = "toUrl(\'"+item.url+"\');setLocation(\'"+item.no+"\');onMouseDown(this);";
  if(hasChildren(item)){
	mouseover += "showSubMenu("+item.no+",this);" ;
	onclick = "";
  }
  document.write("        <tr>" );
  document.write("          <td class=\"tbson\" id=\""+item.no+"\" " );
  document.write("              onMouseOut=\"onMouseOut(this)\" " );
  document.write("              onMouseOver=\""+mouseover+"\" " );
  document.write("              onclick=\""+onclick+"\">" );
  document.write("           "+ item.name  );
  if(hasChildren(item)){
    document.write("            <img class=\"imgHasChild\" src=\""+parent.document.all("contextPath").value+"\\images\\menu\\arr.gif\" width=\"4\" height=\"6\">" );
  }
  document.write("           </td>" );
  document.write("        </tr>" );
}

var _mw ;
var _mh ;
function buildSubMenu(p_item){
  _mw = MENU_ITEM_LENGTH ; _mh = 3 ;
  _sub_menu_sum = 0 ;

  var shtm = "" ;
  var tmp = p_item.level * LEVEL_CODE_LENGTH ;
  for(var i=0; i<menus.length; i++){
	if(menus[i].level == p_item.level+1 && p_item.mid == menus[i].pid){
	  shtm += buildSubMenuItem(menus[i]);
	}
  }
  var htm = "" ;
  htm +="<table id=\"tblSubMenu\" width=\""+_mw+"px\" height=\""+_mh+"px\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#666666\">" ;
  htm += "  <tr>" ;
  htm += "    <td><table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\">" ;
	
  htm += shtm ;

  htm += "      <tr>" ;
  htm += "        <td class=\"tbsonB_bak\"></td>" ;
  htm += "      </tr>" ;
  htm += "    </table></td>" ;
  htm += "  </tr>" ;
  htm += "</table>" ;
  return htm ;
}

function buildSubMenuItem(item){
  _mh = _mh + ROW_OFFSET ; max_w(item.name);
  _sub_menu_sum ++ ;

  var htm = "" ;
  var mouseover = "this.className=\'tbson_over\';hidMenu("+(item.level+1)+");" ;
  var onclick = "toUrl(\'"+item.url+"\');setLocation(\'"+item.no+"\');onMouseDown(this);";
  if(hasChildren(item)){
	mouseover += "showSubMenu("+item.no+");" ;
	onclick = "";
  }
  htm += "        <tr>" ;
  htm += "          <td class=\"tbson\" id=\""+item.no+"\"";
  htm += "              onMouseOut=\"onMouseOut(this)\" " ;
  htm += "              onMouseOver=\""+mouseover+"\" " ;
  htm += "              onclick=\""+onclick+"\">" ;
  htm += "           "+ item.name  ;
  if(hasChildren(item)){
    _mw += 6 ;
    htm += "            <img  class=\"imgHasChild\" src=\""+parent.document.all("contextPath").value+"\\images\\menu\\arr.gif\" width=\"4\" height=\"6\">" ;
  }
  htm += "           </td>" ;
  htm += "        </tr>" ;
  return htm ;
}

function max_w(name){
  var _w = name.length * 12 + (name.length-1)*2 + 45 ;
  if(_w > _mw) _mw = _w ;
}

function buildNavText(no){
  try{
  var item = menus[no] ;
  var re_text = item.name;
  var tmp = (item.level-1) * LEVEL_CODE_LENGTH ;//parent's length
  //alert("item:"+item);
  //loop back from the item.no....
  for(var i=item.no; i>=0; i--){
    //alert("is equals:\n\n"+menus[no]+'\n'+menus[i]);
	if(menus[i].level == (item.level-1) && item.pid == menus[i].mid){
      re_text = buildNavText(menus[i].no) + " > " + re_text;
	  continue ;
	}
  }
  return re_text ;
  }catch(e){alert(e);}
}
