<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<html:base />
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/css_all.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/title.js"></script>
<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>

<script language="JavaScript">

/**
* 表单验证
*/
function checkForm(theUrl){
    var errMsg ="";
    if(getLength(document.forms[0].programaname.value)==0){
        errMsg+="栏目名称不能为空！";
        document.forms[0].programaname.focus();
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
</HEAD>
<BODY leftmargin=0 topmargin=0>
<html:form method="post" action="/businessmanager/t12_programa/t12_programa_busi_modify.do">
	<html:hidden property = "categorykey"/>
	<html:hidden property = "programakey"/>
	
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="td1">
          <span class="css014">
          <strong><font color="0072BC">栏目管理 - <bean:write name="t12_programaActionForm" property = "categorykey_disp"/> - 修改栏目</font></strong>
          </span>
      </td>
      <td width="22%" align="right" nowrap class="td2">
          <logic:equal value="true" name="actionByRight">
             <html:button property="backbutton" value="返  回" styleClass="input" onclick="awpDoSubmit('t12_programa_busi_list.do','add')"/>
          </logic:equal>
          &nbsp;
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
              <td bgcolor="F6F9FF"><html:text name="t12_programaActionForm" property="programaname" styleClass="text_white" size="15"/>
              </td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>栏目类型：</td>
              <td bgcolor="F6F9FF">
              	<bean:write name="t12_programaActionForm"  property="categorykey_disp" scope="request"/>
              </td>
            </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>栏目状态：</td>
              <td bgcolor="F6F9FF">
              	 <bean:write name="t12_programaActionForm"  property="flag_disp" scope="request"/>
              </td>
            </tr>
             <tr bgcolor="F6F9FF">
              <td width="160" height="22" align="right" bgcolor="ECF3FF"> 发布类型：</td>
              <td bgcolor="F6F9FF">
                 <bean:write name="t12_programaActionForm"  property="releasetype_disp" scope="request"/>
              </td>
            </tr>
			
            <tr bgcolor="F6F9FF">
              <td height="22" align="center" bgcolor="ECF3FF">&nbsp;</td>
              <td bgcolor="F6F9FF">
                <html:button property="button" styleClass="input" value="提 交" onclick="checkForm('t12_programa_busi_modify_do.do')"/>
                <html:reset styleClass="input" value="重 填"/>
              </td>
            </tr>
          </table>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
  
  <br>
  
  <TABLE width="98%" border=0 align="center" cellpadding="2"
			cellspacing="1" bgcolor="#000000">
			<TR align=center bgcolor="A3C0EE">
				<TD >
				    列显示名称
				</TD>
				<TD > 
					列代码
				</TD>
				<TD > 
					列类型
				</TD>
				<TD >
					字段长度
				</TD>
				<TD > 
					是否查询条件
				</TD>
				<TD >
					是否列表显示
				</TD>
				<TD >
					是否用于排序
				</TD>
				
			</TR>
			<logic:iterate id="t12_programa_cols" name="t12_programa_colsList"
				type="com.ist.cms.dto.T12_programa_cols">
				<TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="t12_programa_cols" property="tablecode" /><bean:write name="t12_programa_cols" property="colkey" />' 
					onMouseOver=TableMouseOver(this,'id_<bean:write name="t12_programa_cols" property="tablecode" /><bean:write name="t12_programa_cols" property="colkey" />') 
					onmouseout=TableMouseOut(this,'id_<bean:write name="t12_programa_cols" property="tablecode" /><bean:write name="t12_programa_cols" property="colkey" />')>
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="colname" scope="page" />
					</TD>
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="colkey" scope="page" />
					</TD>						
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="fieldtype" scope="page" />
					</TD>
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="collength" scope="page" />
					</TD>						
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="iscond" scope="page" />
					</TD>
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="isshow" scope="page" />
					</TD>
					<TD height=22 noWrap>
						<bean:write name="t12_programa_cols" property="issort" scope="page" />
					</TD>
				</TR>
			</logic:iterate>
		</TABLE>
</html:form>
</BODY>
</html:html>
