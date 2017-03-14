<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../bmp/platform/common/style_include.jsp" %>
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" type="text/css">
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<script src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<SCRIPT LANGUAGE="JavaScript"> 
			function dosubmit(theUrl,type){
	        	document.forms[0].action=theUrl;
	        	document.forms[0].submit();
			}
			
			function showAndHiddenChart(chartType) {
			    //alert(chartType.value);
			    chartType.checked = true;
			    var chartTypeValue = chartType.value;
			    showAndHiddenDiv(chartTypeValue);
			}
			
			function showAndHiddenDiv(chartType) {
			    var divs = document.getElementsByTagName("div");
			    var id = "";
			    for ( var i = 0; i < divs.length; i++) {
			        id = divs[i].id;
			        if(id.indexOf('chart_') == -1) continue;
			        if(id == chartType) {
			           divs[i].style.display = "block";
			        }
			        else {
			           divs[i].style.display = "none";
			        }
				}
			}			
			
			function init() {
			    var defaultChartType = document.getElementById("defaultChartType").value;
			    defaultChartType = "chart_" + defaultChartType;
			    var chartRadio = document.getElementsByName("chart");
			    for ( var i = 0; i < chartRadio.length; i++) {//设置默认选中的radio
					if(chartRadio[i].value == defaultChartType) {
					    chartRadio[i].checked = true;
					}
				}
				//显示默认的div
				showAndHiddenDiv(defaultChartType);
			}
			
			<!-- 自定义脚本 -->
		    <c:out value="${t10_report.scriptcd}" escapeXml="false"></c:out>
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >
		<div id='content'>
			<html:form method="post" action="/showReport.do">
				<jsp:include page="../rpp/report_title.jsp" />
				
				<jsp:include page="../rpp/report_cond.jsp" />
				
				  <TABLE>
                        <tr>
                           
                             <td valign="top">
                               <c:out value="${htmlStr}" escapeXml="false"></c:out>
                             </td>
                              <td valign="top"><jsp:include page="../rpp/show_graph.jsp" /></td>
						</tr>
					</TABLE>
				
			</html:form>
			
		</div>
		
	</BODY>
	
</HTML>
