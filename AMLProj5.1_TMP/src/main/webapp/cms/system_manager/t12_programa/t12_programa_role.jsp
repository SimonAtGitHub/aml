<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String path = request.getContextPath();
%>
<html:html>
<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<link rel="stylesheet" href="<%= path %>/css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="<%= path %>/js/title.js"></script>
		<script src="<%= path %>/js/load_window.js"></script>

		<SCRIPT LANGUAGE="JavaScript" src="<%= path %>/js/basefunc.js"></script>
<script language="JavaScript">
/**
* 表单验证
*/
function checkForm(theUrl){
    var errMsg ="";
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

function locationrole(){
		locate_pop_window('<%=request.getContextPath()%>','t00_roleLocation','checkbox','forms[0]','rolekeys,rolenames','');
}

</script>
</HEAD>
<BODY leftmargin=0 topmargin=0>
<html:form method="post" action="/system_manager/t12_programa/t12_programa_role.do">
	<html:hidden property = "categorykey"/>
	<html:hidden property = "programakey"/>
	<html:hidden property = "programaname"/>
	<input type=hidden value="1200101" name="upmodulekey" /> 
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="td1">
          <span class="css014">
          <strong><font color="0072BC">系统管理 - <bean:write name="t12_programaActionForm" property = "categorykey_disp"/> - 分配栏目角色</font></strong>
          </span>
      </td>
      <td width="22%" align="right" nowrap class="td2">
          <html:button property="backbutton" value="返  回" styleClass="input" onclick="awpDoSubmit('t12_programa_list.do','add')"/>
      </td>
    </tr>
  </table>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle"/>
  </html:messages>
  <TABLE align=center border=1  cellPadding=0 borderColor=333333 cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
    <TBODY>
      <TR>
        <TD align="center" valign="top" style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
          <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr bgcolor="ECF3FF">
              <td width="160" height="22" align="right" bgcolor="ECF3FF"> <font color="#FF0000">*</font>栏目名称：</td>
              <td bgcolor="F6F9FF">
                  <bean:write property="programaname" name="t12_programaActionForm"/>
              </td>
            </tr>
            
            <TR> 
	               <td width="160" height="22" align="right" bgcolor="ECF3FF"> <font color="#FF0000">*</font>序号：</td>
	              <td><html:text property="dispseq" styleClass="text_white" size="6" maxlength="6" /></td>
	        </TR>
            <tr>
              <td width="160" height="22" align="right" bgcolor="ECF3FF"> <font color="#FF0000">*</font>所属角色：</td>
              <td> 
                   <html:hidden property="rolekeys"/> 
                   <html:text property="rolenames" styleClass="text_white" size="32" disabled="true" /> 
                   <html:button property="Button52" styleClass="text_white" onclick="locationrole()" >多 选</html:button>
              </td>
            </tr>
            
            <tr bgcolor="F6F9FF">
              <td height="22" align="center" bgcolor="ECF3FF">&nbsp;</td>
              <td bgcolor="F6F9FF">
                <html:button property="button" styleClass="input" value="提 交" onclick="checkForm('t12_programa_role_do.do')"/>
                <html:reset styleClass="input" value="重 填"/>
              </td>
            </tr>
          </table>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
</html:form>
</BODY>
</html:html>
