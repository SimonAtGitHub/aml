<%@ page contentType="text/html; charset=GBK"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>

<html>
	<head>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>模板详细信息</title>
		 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
<%
	String tmpstr = StringUtils.trimToEmpty(request.getParameter("detail_data"));
	tmpstr = new String(tmpstr.getBytes("ISO8859_1"), "GBK");
 %>
	</head>

	<body>
	<div id='content'>
		<div class='awp_detail' >
			<%= tmpstr %>
		</div>
	</div>
	</body>
</html>
