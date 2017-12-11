<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!-- 
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		 -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

</SCRIPT>
	</HEAD>
	<BODY class="mainbg">
		<html:form method="post" action="/listmanager/t07_obj_rule_disp.do">
			<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>详细信息</span>
	  <span class="buttons">
	  <a href="#" onClick="dosubmit('<bean:write name="url"/>');"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<html:errors />
			<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				客户号：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="party_id" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				客户名称：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="obj_name" />
			</td>
		</tr>
		
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				创建机构号：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="organkey" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				客户类型：
			</td>
	
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="party_class_cd" />
			</td>
			</tr>
	
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				建立原因：
			</td>
			<td bgcolor="F6F9FF" style='word-break:break-all'>
			  
				<bean:write name="t07_obj_rule" property="reason_create" filter="false"/>
			  
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				取消原因：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="reason_cancel"/>
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				创建用户：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="create_user" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				创建日期：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="create_dt_disp" />
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				最后修改用户：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="modify_user" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				最后修改时间：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="modify_dt_disp" />
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				免检测类型：
			</td>
			<td colspan="4" bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="rule_type_disp" />
			</td>
		</tr>
		</TABLE>
		</div>
		</div>
		</html:form>
		
	</BODY>
</HTML>