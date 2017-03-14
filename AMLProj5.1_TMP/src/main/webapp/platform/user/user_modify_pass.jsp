<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //用户密码
    if(getLength(document.forms[0].password.value)==0){
        errMsg+="用户密码不能为空！";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)!="" && getLength(document.forms[0].password.value.replace(/[\s\u12288\u3000]*/g,''))==0){
        errMsg+="用户密码不能全为空格！";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)>16){
        errMsg+="用户密码不能大于16个字符！";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)<6){
        errMsg+="用户密码不能小于6个字符！";
        document.forms[0].password.focus();
    }
    //用户确认密码
    else if(getLength(document.forms[0].password1.value)==0){
        errMsg+="用户确认密码不能为空！";
        document.forms[0].password1.focus();
    }else if(getLength(document.forms[0].password1.value)>16){
        errMsg+="用户确认密码不能大于16个字符！";
        document.forms[0].password1.focus();
    }else if(getLength(document.forms[0].password1.value)<6){
        errMsg+="用户确认密码不能小于6个字符！";
        document.forms[0].password1.focus();
    }else if(document.forms[0].password.value!=document.forms[0].password1.value){
        errMsg+="用户两次输入的密码不一致！";
        document.forms[0].password.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</script>
</head>

<body class="mainbg">
<html:form action="/user/user_modify_passwd_do.do" method="post">
  
  <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>重置密码</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('user_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>
	</div>
  <html:errors/>
  <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
     <tr>
      <td >用户名：</td>
      <td><p><bean:write name="t00_userActionForm" property="username"/></p></td>
    </tr>
    <tr>
      <td >真实姓名：</td>
      <td><bean:write name="t00_userActionForm" property="realname"/></td>
    </tr>
    <tr>
      <td ><font color="#FF0000">*</font>新密码：</td>
      <td><html:password property="password" styleClass="text_white" size="15"></html:password>
      </td>
    </tr>
    <tr>
      <td><font color="#FF0000">*</font>新密码确认：</td>
      <td><html:password property="password1" styleClass="text_white" size="15"></html:password>
      </td>
    </tr>
    <tr>
      <td >&nbsp;</td>
      <td class="in_button">
          <html:hidden property="username"/>
          <html:button value="提 交" property="sub" onclick="checkForm('user_modify_passwd_do.do')"/>
          <html:reset value="重 置" />
        </td>
    </tr>
        </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>
