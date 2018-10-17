<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@page  import="java.util.*"%>
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
		<html:form method="post" action="/listmanager/t07_obj_rule_dispCheck.do">
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
		<%ArrayList<com.ist.aml.report.dto.T07_OBJ_RULE> t07_obj_rule_list=(ArrayList<com.ist.aml.report.dto.T07_OBJ_RULE>)request.getAttribute("t07_obj_rule_list");
		if(t07_obj_rule_list!=null&&t07_obj_rule_list.size()>0){
		 %>
		 <logic:iterate id="t07_obj_rule" name="t07_obj_rule_list" type="com.ist.aml.report.dto.T07_OBJ_RULE">
			<div class="cond_c2" style='margin-bottom:15px;'>
	  <table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				核查机构名称：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="bank_name" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				核查机构网点代码：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="bank_code2" />
			</td>
		</tr>
		
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				联网核查日期：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="checkdate" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				联网核查时间：
			</td>
	
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="checktime" />
			</td>
			</tr>
	
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				公民姓名：
			</td>
			<td bgcolor="F6F9FF" style='word-break:break-all'>
			  
				<bean:write name="t07_obj_rule" property="name" filter="false"/>
			  
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				居民身份证件号码：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="id_no"/>
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				核查结果：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="result" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				柜员号：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="counter_no" />
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				业务条线：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="ope_line" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				核查方式：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="checkmode" />
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				摘要：
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="purpose" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				是否系统补录：
			</td>
			<td colspan="4" bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="is_inst" />
			</td>
		</tr>
		</TABLE>
		</div>
		</logic:iterate>
		<%} %>
		</div>
		</html:form>
		
	</BODY>
</HTML>