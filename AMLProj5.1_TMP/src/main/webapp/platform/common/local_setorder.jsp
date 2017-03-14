<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
				
	<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].realname.value)==0){
        errMsg+="用户名不能为空！";
        document.forms[0].realname.focus();
        }
    if(errMsg==""){
        selectAllOptions(document.forms[0].list2);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

function upValue(s,sName){

 	var oF = document.getElementById(sName);
 	var len = oF.selectedIndex ;

 
 	if(len <=0 ){
 		return ;
 	}
 
 	var preOpt =  new Option(oF.options[len-1].text,oF.options[len-1].value);
 	var curOpt =  new Option(oF.options[len].text,oF.options[len].value);
 
 	oF.options[len-1] = curOpt;
 	oF.options[len] =  preOpt;
 
 	oF.options[len-1].selected = true;
}

function downValue(s,sName){
 	var oF = document.getElementById(sName);
 	var len = oF.selectedIndex ;
 	var maxLen = oF.length - 1; 	
 	
 	if(len <0 || len >= maxLen){
 		return ;
 	}
 
 	var NextOpt =  new Option(oF.options[len+1].text,oF.options[len+1].value);
 	var curOpt =  new Option(oF.options[len].text,oF.options[len].value);
 
 	oF.options[len+1] = curOpt;
 	oF.options[len] =  NextOpt;
 
 	oF.options[len+1].selected = true;
}

function sure(path){
	var url = path+'/common/location_orderwindowdo.do';
    var len=document.getElementById("selectCheckboxes").length;
  	var obj = document.getElementById("selectCheckboxes");
  	selectAllOptions(obj);
    
    if(len!=0){
         document.forms[0].action=url;
         document.forms[0].submit();
     }else{
        errMsg='没有要调整的数据！';
        alert(errMsg);
     }


}

	 function topWin(){
			window.focus();
	}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" >
<div id='content'>
<html:form method="post" action="/common/location_orderwindow.do">
  <div class="conditions">
	<div class="cond_t">
	   <span>调 序</span>
	   <span class="buttons">
          <a href="#" onclick="sure('<%=request.getContextPath()%>');"><img src="<%=request.getContextPath()%>/images/<%=session.getAttribute("style") %>/b_choose.png" />确定</a>
          <a href="#" onclick="window.close();"><img src="<%=request.getContextPath()%>/images/<%=session.getAttribute("style") %>/b_shut.png" />取消</a>
	   </span>
	</div>

  <div class="cond_c2">
				<table>
					<tr>

      <td ><font color="#FF0000">*</font>排序：</td>
      <td >
          <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
          <%=multiSeHTMLStr%>
      </td>
    </tr>
   
  </table>
  <input type="hidden" name = "tablename" value="<%=request.getAttribute("tablename") %>">
  <input type="hidden" name = "keyname" value="<%=request.getAttribute("keyname") %>">
  <input type="hidden" name = "seqname" value="<%=request.getAttribute("seqname") %>">
  <input type="hidden" name = "type" value="<%=request.getAttribute("type") %>">
               
  
        </div>
</html:form>
</div>
</BODY>
</HTML>
