<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function changePostile(value){
	if(value="3")
	{
		document.getElementById("status").style.display = "block";
	}
	else
	{
		document.getElementById("status").style.display = "none";
	}
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<html:form  method="post" action="/amlpost/t07_amlpost_search.do">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td height="26" class="td1">
          <span class="css014">
          <strong><font color="0072BC">机构和岗位设立情况 - 查询</font></strong>
          </span>
      </td>
      <td width="22%" align="right" nowrap class="td2">
           <html:button property="backbutton" value="返  回" styleClass="input" onclick="history.go(-1)"/>
      </td>
    </tr>
  </table>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>
  <html:errors/>
<TABLE align=center border=1 borderColor=333333 cellPadding=0 cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
    <TBODY>
       <TR>
         <TD align="center" valign="top" style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
    
			<tr bgcolor="ECF3FF">
			     <td height="22" align="right" bgcolor="ECF3FF" nowrap> <font color="#FF0000">*</font>姓名：</td>
			     <td bgcolor="F6F9FF"> 
			    <html:text name="t07_amlpostActionForm" property="name" styleClass="text_white" size="20" /> 
			     </td>
		     </tr>
		     
		     <tr bgcolor="F6F9FF">
	             <td width="15%" align="right"  bgcolor="ECF3FF"><font color="#FF0000">*</font>机构：</td>
	             <td bgcolor="F6F9FF" align="left">	 
	             <html:hidden name="t07_amlpostActionForm" property="organkey"/> 	 
	             <html:text name="t07_amlpostActionForm" property="organkey_disp" styleClass="text_white" size="20"></html:text>
			     <input type="button" name="locate" value="定 位" class="text_white" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organkey_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
	             </td>
	         </tr>
	         
	         <tr bgcolor="ECF3FF">
			     <td height="22" align="right" bgcolor="ECF3FF" nowrap> <font color="#FF0000">*</font>职务名称：</td>
			     <td bgcolor="F6F9FF"> 
			    <html:text name="t07_amlpostActionForm" property="position" styleClass="text_white" size="20" /> 
			     </td>
		     </tr>
		     
		     <tr bgcolor="ECF3FF">
			     <td height="22" align="right" bgcolor="ECF3FF" nowrap> <font color="#FF0000">*</font>部门名称：</td>
			     <td bgcolor="F6F9FF"> 
			    <html:text name="t07_amlpostActionForm" property="department" styleClass="text_white" size="20" /> 
			     </td>
		     </tr>
		     
		     <tr bgcolor="ECF3FF">
			     <td height="22" align="right" bgcolor="ECF3FF" nowrap> <font color="#FF0000">*</font>联系电话：</td>
			     <td bgcolor="F6F9FF"> 
			    <html:text name="t07_amlpostActionForm" property="telephone" styleClass="text_white" size="20" /> 
			     </td>
		     </tr>
		     
		     <tr>
				<td height="22" align="right" bgcolor="ECF3FF" nowrap> <font color="#FF0000">*</font>
					职位：
				</td>
				 <td>
					<html:select property="postitle" onclick="changePostitle(this.value)">
        				<html:options collection="postitlemap" property="label" labelProperty="value"/>
           			</html:select>
				</td>
			</tr>
			
			<tr id="status" style="display:none">
			  <td height="22" align="right" bgcolor="ECF3FF" nowrap> <font color="#FF0000">*</font>
				职位状况：
				</td>
				<td>
      				<html:select property="us_status">
    				  <html:options collection="us_statusmap" property="label" labelProperty="value"/>
       			    </html:select>	
           	    </td>
			</tr>
						
    <tr bgcolor="ECF3FF">
      <td height="22" align="right" bgcolor="ECF3FF">&nbsp;</td>
      <td bgcolor="F6F9FF">
          <html:button value="查  询" property="sub" styleClass="input" onclick="dosubmit('getT07_amlpost_list.do')"/>
          <html:reset value="重  填" property="re" styleClass="input"/>
      </td>
    </tr>
  </table>
         </TD>
       </TR>
    </TBODY>
</TABLE>
</html:form>
</BODY>
</HTML>