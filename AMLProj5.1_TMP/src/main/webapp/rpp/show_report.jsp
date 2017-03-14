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
			
			
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >
		<div id='content'>
			<html:form method="post" action="/showReport.do">
				<html:hidden property="paramStr" />
                <input type="hidden" name="defaultChartType" value="<bean:write name="defaultChartType" ignore="true"/>" />  
				<div class='awp_title'>

					<table>
						<tr>
							<td width="23%">
								<span class="awp_title_td2"></span>
							</td>
							<td align="right">
								<logic:equal value="1" property="isexport"
									name="t10_reportActionForm">
									<input type="button" name="backbutton" value="导  出"
										onClick="dosubmit('downloadReport.do','')" class="input">
								</logic:equal>
								<logic:equal value="1" name="isout">
								<input type="button" value="关  闭" onclick="window.close();" class="input">
								</logic:equal>
								<logic:notEqual value="1" name="isout">
								<input type="button" value="返  回" onclick="history.back();"
									class="input">
								</logic:notEqual>
							</td>
						</tr>					
					</table>
				</div>				
				
				<%
					String HtmlString = (String) request.getAttribute("htmlStr");
					out.println(HtmlString);
										
				%>
				
				<div >
				   <table >
				       <tr align="center">
				       <td>
				          <logic:iterate id="chartType" name="chartTypeMap">
				              <bean:write name="chartType" property="value" />
				              <input type="radio" name="chart" onclick="showAndHiddenChart(this)"  value="chart_<bean:write name="chartType" property="key" />" />
				          </logic:iterate>
				       <td>
				    </tr>
				   </table>
				</div>
				
				<div >
				  <table>
				    <logic:iterate id="map" name="chartMap">
				        <bean:define id="chart" name="map" property="value"></bean:define>
				        <tr>
				            <td>
				                <div align="center" id="chart_<bean:write name="map" property="key" />" style="display:none;border: 0px solid">
				                </div>
				                <script>
				                    var template = '<bean:write name="chart" property="chartTemplate"/>';
				                    var data = '<bean:write name="chart" property="chartData" filter="false"/>';
				                    var id = '<bean:write name="map" property="key"/>';
				                    //alert("template:"+ template);
				                    //alert("data:"+ data);
				                    //alert("id:"+ id);
				                    
				                    var chart1 = new FusionCharts('../charts/'+template, 'Chart1Id', '600', '500', '0', '0');
				                    chart1.setDataXML("'" + data + "'");
				                    chart1.render("chart_"+id);
				                </script>
				            </td>
				        </tr>
				    </logic:iterate>
				  </table>
				</div>
				
				<div >
				   <table >
				       <tr align="center">
				       <td>
				          <logic:notEmpty name="chartTypeMap">
				             <logic:empty name="chartMap">
				               <font color="#FF0000">报表对应的配置文件中没有配置图表相关信息，请查看！</font>
				             </logic:empty>
				          </logic:notEmpty>
				       <td>
				    </tr>
				   </table>
				</div>
			</html:form>
			
		</div>
		<SCRIPT LANGUAGE="JavaScript"> 
		init();
		</SCRIPT>
	</BODY>
	
</HTML>
