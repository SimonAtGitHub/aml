<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<!--
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="javascript"> 
function doSubmit(theUrl){
	document.forms[0].action=theUrl;
	document.forms[0].submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/check/t37_help_check_list.do" method="post">
<!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th>序号</th>
			<th>客户号</th>
			<th>客户名称</th>
			<th>发起协查机构</th>
			<th>发起协查日期</th>
			<th>协查原因</th>
			<th>状态</th>
		</tr>
	<logic:present name="t37_help_checkList">
		<%int i = 1; %>
		<logic:iterate id="result" name="t37_help_checkList" type="com.ist.aml.risk_rate.dto.T37_help_check">
		<tr align="center" bgcolor="#FFFFFF">
			<td><%=i++ %> </td>
			<td>
				<a href="#" 
					onclick="doSubmit('<%=request.getContextPath()%>/risk_rate/result/t37_help_case.do?pageType=1&check_no=<bean:write name="result" property="check_no"/>&party_id=<bean:write name="result" property="party_id" />&party_class_cd=<bean:write name="result" property="party_class_cd" />');">
					<bean:write name="result" property="party_id" />
				</a>
			</td>
			<td>
				<bean:write name="result" property="party_chn_name" />
			</td>
			<td>
				<bean:write name="result" property="send_org" />
			</td>
			<td>
				<bean:write name="result" property="send_date_disp" />
			</td>
			<td>
				<bean:write name="result" property="check_reason" />
			</td>
			<td>
				<bean:write name="result" property="status_cd_disp" />
			</td>
		</tr>
		</logic:iterate>
	</logic:present>
	</table>
  </div>
<!-- list_page --> 
	<div class="list_page">
		<logic:present name="pageInfo">
			<table width="98%" align="center" border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
		</logic:present>
	</div>
  </html:form>
<!-- all end -->   
</div>
</body>
</html>
