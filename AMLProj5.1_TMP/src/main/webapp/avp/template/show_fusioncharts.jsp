<%@ page contentType="text/html; charset=GBK"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<%@ include file="../../bmp/platform/common/style_include.jsp"%>
	
		<script src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<table>
			<tr>
				<td>
					<div align="center" id="chart_container" style="border: 0px solid">
					</div>
					<script>
						var template = '<bean:write name="chart" property="chartTemplate"/>';
						var data = '<bean:write name="chart" property="chartData" filter="false"/>';
						var height = '<bean:write name="chart" property="heigth"/>';
						var width = '<bean:write name="chart" property="width"/>';
						var chart = new FusionCharts('../../charts/' + template, "avpFusionCharts", width,height, '0', '0');
						chart.setDataXML("'" + data + "'");
						chart.render("chart_container");
					</script>
				</td>
			</tr>
		</table>
	</BODY>

</HTML>
