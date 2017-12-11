<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ist.com/avp/report/tag" prefix="r"%>

<%
String contextPath = request.getContextPath();
%>

<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
        <title></title>
		<link rel="stylesheet" href="<%=contextPath%>/css/awp_base.css" type="text/css">

		<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
		<script language="JavaScript" src="<%=contextPath%>/js/title.js"> </script>
	</head>

	<body>
		<!-- 系统总体框架，占页面宽度的98％ -->
		<form method="post" action="">

			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
		</form>
	</body>
</html>

<script language="JavaScript">
	dispLoadInfo();
</script>
