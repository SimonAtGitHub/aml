<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<script src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >	
				  <table>
				 	
				 	<c:out value="${rsltMap.chart}" escapeXml="false" />
				   
				  </table>			
	</BODY>
	
</HTML>
