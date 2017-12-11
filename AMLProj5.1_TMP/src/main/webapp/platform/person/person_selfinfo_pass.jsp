<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
 
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

<script LANGUAGE="JavaScript">


function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //用户密码
    if(getLength(document.forms[0].passwordold.value)==0){
        errMsg+="原密码不能为空！";
        document.forms[0].passwordold.focus();
    }else if(getLength(document.forms[0].passwordold.value)>16){
        errMsg+="原密码不能大于16个字符！";
        document.forms[0].passwordold.focus();
    }else if(getLength(document.forms[0].passwordold.value)<6){
        errMsg+="原密码不能小于6个字符！";
        document.forms[0].passwordold.focus();
    }
    else if(getLength(document.forms[0].password.value)==0){
        errMsg+="用户密码不能为空！";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)!="" && getLength(document.forms[0].password.value.replace(/[\s\u1228\u3000]*/g,''))==0){
        errMsg+="用户密码不能全为空格！"
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
    else if(document.forms[0].password.value == document.forms[0].passwordold.value){
        errMsg+="新密码与原密码不能相同！";
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

<body leftmargin="0" topmargin="0">

    <html:form action="/person/person_modify_passwd_do.do" method="post">
   <html:errors />
  <!-- table content -->
	<div class="cond_c2">
	  <table cellpadding="0" cellspacing="0">
     <tr>
      <td >用户名：</td>
      <td><p><bean:write name="t00_userActionForm" property="username"/></p></td>
    </tr>
    <tr>
      <td >真实姓名：</td>
      <td><bean:write name="t00_userActionForm" property="realname"/></td>
    </tr>
    <tr>
      <td ><font color="#FF0000">*</font>原密码：</td>
      <td><html:password property="passwordold" styleClass="text_white" size="15"></html:password>
      </td>
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
          <input name="ss"  type="button"  value="提 交" onclick="checkForm('person_modify_passwd_do.do')"/>
          <html:reset value="重 置" />
        </td>
    </tr>
        </table>
	</div>
</html:form>
</body>
</html>
