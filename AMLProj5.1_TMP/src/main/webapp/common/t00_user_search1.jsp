<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
  /**
   * 客户选择公共页面：
   * 权限：公共页面没有权限控制
   * 接口参数：
   * form_name form框的名字
   * input_name 客户号的文本框的名字
   * input_name1 客户名称的文本框的名字
   * 例如：<input type=button value="查 询" name=Button52 class="text_white" onClick="window.open('/pub/cp_host_cust_id_search.jsp?form_name=form1&input_name=s_host_cust_id','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
*         <html:button property="b2" value="查 询" styleClass="input" onclick="window.open('/common/t00_user_search.do?input_name=username&input_name_disp=realname','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"/>
   */
%>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<link rel="stylesheet" href="../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR><title>用户查询</title>
<SCRIPT LANGUAGE="JavaScript" src="../js/basefunc.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].username)<0){
        errMsg+="请选择您要加入用户名称！";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<html:form action="/common/t00_user_search.do" method="post">
<html:hidden property="input_name"/>
<html:hidden property="input_name_disp"/>
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="td1"> <span class="css014"> <strong><font color="0072BC">用户信息查询</font></strong></span></td>
      <td width="22%" align="right" nowrap class="td2">
         <html:button property="b1" value="选 定" styleClass="input" onclick="checkForm('t00_user_search_result1.do')"/>
         <html:button property="b2" value="关 闭" styleClass="input" onclick="window.close()"/>
      </td>
    </tr>
  </table>
   <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="td1">
        用户名：
        <html:text property="uname" styleClass="text_white" size="10"/>
        真实姓名：
        <html:text property="rname" styleClass="text_white" size="15"/>
	<html:button property="s1" value="查  询" styleClass="text_white" onclick="dosubmit('t00_user_search.do?newsearchflag=1')"/>
        <html:button property="s2" value="清  空" styleClass="text_white" onclick="document.forms[0].uname.value='';document.forms[0].rname.value=''"/>
       </td>
    </tr>
  </table>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"></td>
    </tr>
  </table>
  <html:errors/>
  <TABLE width="98%" border=0 align="center" cellpadding="2" cellspacing="1" bgcolor="#000000">
  
  <input type="hidden" name="reportkey" value="<bean:write name="reportkey"/>">
    <TR align=center class="tdhead">
      <TD width="5%" height=22 noWrap>选择</TD>
      <TD width="20%">用户名</TD>
      <TD width="20%">用户真实名</TD>
      <TD width="60" noWrap>状 态</TD>
      <TD width="80" noWrap>创建时间</TD>
    </TR>
<logic:iterate id="user" name="t00_userList" type="com.ist.platform.dto.T00_user">
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22>
          <html:radio property="username" idName="user" value="username"></html:radio>
      </TD>
      <TD height=22><bean:write name="user" property="username" scope="page"/></TD>
      <TD><bean:write name="user" property="realname" scope="page"/></TD>
      <TD><bean:write name="user" property="flag_disp" scope="page"/></TD>
      <TD><bean:write name="user" property="createdate_disp" scope="page"/></TD>
    </TR>
</logic:iterate>
  </TABLE>
  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
    <tr>
      <td align="center"><bean:write name="pageInfo" scope="request" filter="false"/></td>
    </tr>
  </table>
</html:form>
</BODY>
</HTML>


