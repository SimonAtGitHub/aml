<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ist.com/avp/report/tag" prefix="r"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	</HEAD>
	<BODY>	
		<r:report report="report" data="reportData"></r:report>
	</BODY>
	<script>
	setListStyle();
	</script>
</HTML>
