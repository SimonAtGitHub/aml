<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/load_window.js"></script>
		<script type="text/javascript" src="../../js/selectbox.js"></script>
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
		    }else if(document.forms[0].list2.length==0){
		    	errMsg+="角色不能为空！"
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
	</SCRIPT>
</HEAD>
<body class="mainbg">
	<html:form method="post" action="/group/group_func_do.do">
 	<html:hidden name="t00_group"  property="groupkey"/>
  	<html:hidden name="t00_group"  property="systemkey"/>
  	
	<div id="main">
	<!-- conditions --> 
	  <div class="conditions">
	    <!-- title -->
		<div class="cond_t">
		   <span>用户权限 - 新 建</span>
			  <span class="buttons">
			   	<a href="group_func_list.do?groupkey=<bean:write name="t00_group" property="groupkey"/>"><img src="../../images/blue/b_back.png" />返回</a>
			  </span>
		</div>
	<div class="cond_c2">
		  <table border="0" cellpadding="0" cellspacing="0">
		    <tr >
		      <td  >组名：</td>
		      <td ><bean:write name="t00_group" property="groupname"/></td>
		    </tr>
		    <tr >
		      <td  ><font color="#FF0000">*</font>用户：</td>
		      <td >
		          <html:hidden property="username"/>
		          <html:text property="realname" styleClass="text_white"  readonly="true"/>
		          <input type="button" name="locate" value="多 选" class="in_button1" onclick="locate_pop_window('<%= request.getContextPath() %>','t00_userLocation','checkbox','forms[0]','username,realname','flag=\'1\'');return false;"/>
		       </td>
		    </tr>
		    <tr >
		      <td ><font color="#FF0000">*</font>角色：</td>
		      <td width="160">
		          <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
		          <%=multiSeHTMLStr%>
		      </td>
		    </tr>
		    <tr >
		      <td >&nbsp;</td>
		      <td >
		                <html:button property="button" styleClass="in_button1" value="提 交" onclick="checkForm('group_func_do.do')"/>
		                <html:reset styleClass="in_button1" value="重 填"/>
		        </td>
		    </tr>
		  </table></div>
		</div>
</div>
</html:form>
</BODY>
</HTML>
