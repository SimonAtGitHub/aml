<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.ist.common.AuthBean" %>
<%@ page import="com.ist.common.Authorization" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ist.platform.dto.T00_module" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]--> 
<script language="javascript" src="../js/jscroll.js"></script>
<script type=text/javascript> 
<!--
jQuery.noConflict();
(function($){ 
  $(function(){
$(document).ready(function(){
	$(".pub_lscroll").jscroll({ W:"12px"
					,BgUrl:"url(../images/blue/s_bg4.gif)"
					,Bg:"right 0 repeat-y"
					,Bar:{Bd:{Out:"#bcbcbc",Hover:"#ccc"}
						 ,Bg:{Out:"-54px 0 repeat-y",Hover:"-54px 1px repeat-y",Focus:"-54px 1px repeat-y"}}
					,Btn:{btn:true
						 ,uBg:{Out:"-3px -1px",Hover:"-3px -2px",Focus:"-3px -2px"}
						 ,dBg:{Out:"-3px -14px",Hover:"-3px -13px",Focus:"-3px -13px"}}
					,Fn:function(){}
					});	
});
// All End
  });
})(jQuery);
//-->

//将链接方式改为提交方式
    function changeFunction(urlStr){
    alert(urlStr);
    if(urlStr=='' || urlStr =='#'){
    }else{
       // document.form2.action=urlStr;
        //document.form2.submit();
       window.location.href=urlStr; 
    }
    }
</script>


</head>

<body leftmargin="0" topmargin="0" class="left_bg">
<div id="left_menu">

  <div style="display:block" id="a1"><div class="pub_lscroll">
 <%
  String systemkey=(String)request.getParameter("systemkey"); 
	  AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");
	  Authorization auth = authBean.getAuthToken();
	  ArrayList  newList=(ArrayList)auth.getModuleList();
	 
	  ArrayList moduleList=new ArrayList();
	
	  	for(int j=0;j<newList.size();j++){
				LinkedHashMap map=(LinkedHashMap)newList.get(j);
				if(map.containsKey(systemkey)){
					 moduleList=(ArrayList)map.get(systemkey);
		            break;
				}
		}
		  //System.out.println(moduleList.size());
		for(int k=0;k<moduleList.size();k++){
		  T00_module t00_module = (T00_module)moduleList.get(k);
		  String upmodulekey=t00_module.getUpmodulekey();
		  String modulename=t00_module.getModulename();
		  String imgurl=t00_module.getImgurl();
		   String modulekey=t00_module.getModulekey();
		   //System.out.println("modulekey:::"+modulekey+"upmodulekey:::"+upmodulekey);
		  if(upmodulekey.equals("-1")){
             //System.out.println("modulekey11:::"+modulekey);
	  %>
 <dl>
	<dt><a href="#" ><img src="../images/lefticon/<%=imgurl %>" /><%=modulename%></a></dt>
	<dd>
	<%
	 	for(int i=0;i<moduleList.size();i++){
    			T00_module t00_module1=(T00_module)moduleList.get(i);
    			String murl=request.getContextPath()+t00_module1.getUrl();
    			String mname=t00_module1.getModulename();
    			String mmodulekey=t00_module1.getModulekey();
    			//System.out.println("modulekey22:::"+mmodulekey);
    			if(modulekey.equals(t00_module1.getUpmodulekey())&& !mmodulekey.equals(modulekey)){
    		    //System.out.println("modulekey33:::"+mmodulekey);
	 %>
	  <a href=<%=murl%> target='mainFrame'><%=mname%></a>
	  <%	
    			}
    		}
    		 %>
	</dd>
  </dl>
  <%}
  } %>
</div>
</div>
</div>
<script language="javascript">
var key=<%=systemkey%>;
function gTag(name){
return document.getElementsByTagName?document.getElementsByTagName(name):new Array()
}
var h1Tag = gTag("div");
for(i=0;i<h1Tag.length;i++){   //要用FOR来访问。
  if(i==1)
   h1Tag[i].id = "a"+key;
}
</script>
</body>
</html>
