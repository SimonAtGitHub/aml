<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://www.ist.com/avp/report/tag" prefix="r"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>

		<meta http-equiv=Content-Type content="text/html; charset=GBK"/>
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<title><c:out value="${t02_tp_bas_inf.tplaname}" escapeXml="false">_测试</c:out></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>	
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/ToolsWindow.css" rel="stylesheet" type="text/css"/>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/skin/<%=style %>/css/jquery-ui.css" type="text/css"/>
		
		<script src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/toolswindow.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<style type="text/css">
.layout_chart_right{margin-top:6px;float:right;}
.layout_chart_left{margin-top:6px;float:left;}
.awp_list_left{float:left;height:480px;}
.awp_list_right{float:right;height:480px;}
</style>
		<script language="JavaScript">
		function onLoadPage() {
            var tableId = document.getElementById("tbl");
			var i = 0;
			 
			if(tableId == null) {
                return;
            }
		    for (var row in tableId.rows) {
			    if(tableId.rows[row].className == "hiddenRow") {
				    i = i + 1;
				   
			    }
		    }
		    if(i == 0){
		    	var oButton = document.getElementById("viewCondId");
		    	if (oButton) {
		    		oButton.style.display = "none";;
		    	}
		    }
		}
		
			<!-- 模型自定义脚本 -->
			<c:out value="${t02_tp_bas_inf.scriptcd}" escapeXml="false"></c:out>
			
			<!-- 自定义动作脚本和主调方法 -->
			<c:out value="${script}" escapeXml="false"></c:out>
        </script>
	</head>

	<body class="tools-bg">
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div class="tools-cot">
		<html:form method="post" action="/template/tpla_chk_main_test.do">
			<!-- 标题区域 -->
			<div class="cond">
			 <div class="cond-t">
			  <strong><c:out value="${labelStr}"></c:out></strong>
			  
				<br/>
				<br/>
				<br/>
				<!-- 后台执行提示信息 -->
			
			
			  <span style="top:0px;">
			  	<c:out value="${cmdHtmlStr}" escapeXml="false"></c:out>
			    			<!-- 自定义动作在上的HTML -->
			    			<c:out value="${up}" escapeXml="false"></c:out>
			  </span>
	  			
			</div>
			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			
			<!-- 查询条件区 -->
			<c:out value="${condHtmlStr}" escapeXml="false"></c:out>		
			
			<!-- 自定义动作在下的HTML -->
			<c:out value="${down}" escapeXml="false"></c:out>
			
		 </div>
		 	
		 	<font color="red"><c:out value="${show_message}" ></c:out></font>
			<!-- 数据区 -->
			
			<div class="awp_tabpanel" >
					 <table>
					  <tr>
					   <c:if test="${showList != null}">
					  <logic:iterate id="show" name="showList" type="com.ist.avp.template.dto.T02_tp_show">
					  	  <c:if test="${show.showkey eq currshowkey}">
					  		<td width="80"><c:out value="${show.showname}" /></td>
					  	</c:if>
					  	<c:if test="${show.showkey ne currshowkey}">
					  		<td width="80"><a href="javascript:void(0);" onclick="javascript:avpCondSubmit('tpla_chk_main_test.do?new_qry_flag=1&jump_rslt_flag=1&showkey=<c:out value="${show.showkey}"/>');return false;"><c:out value="${show.showname}" /></a></td>
					 	</c:if>
					  </logic:iterate>
					  </c:if>
					  </tr>
					 </table>    
					 <input type="hidden" value="<c:out value="${currshowkey}" />" name="currshowkey" />
				 </div>
			<c:if test="${t02_tp_show.arrangemode == null || t02_tp_show.arrangemode eq ''}">
				<c:out value="${rsltHtmlStr}" escapeXml="false"></c:out>
			</c:if>
			<div class="awp_layout">
				<c:if test="${t02_tp_show.arrangemode eq '1'}">
					<c:if test="${P_report eq true}">
						<r:report report="report" data="reportData"></r:report>
					</c:if>
					<c:if test="${P_report ne true}">
						<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
					</c:if>
					
					<c:if test="${P_stat eq true}">
						<c:out value="${statHtmlStr}" escapeXml="false"></c:out>
					</c:if>
					<c:if test="${P_stat eq true}">
						<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
					</c:if>	
					
					<c:if test="${rsltMap.chart ne ''}">
					<div class="layout_chart">
						<c:out value="${rsltMap.chart}" escapeXml="false" />
					</div>
					</c:if>
				</c:if>
				<c:if test="${t02_tp_show.arrangemode eq '2'}">
					<c:if test="${rsltMap.chart ne ''}">
					<div class="layout_chart">
						<c:out value="${rsltMap.chart}" escapeXml="false" />
					</div>
					</c:if>
					<c:if test="${P_report eq true}">
						<r:report report="report" data="reportData"></r:report>
					</c:if>
					<c:if test="${P_report ne true}">
						<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
					</c:if>
					<c:if test="${P_stat eq true}">
						<c:out value="${statHtmlStr}" escapeXml="false"></c:out>
					</c:if>
					<c:if test="${P_stat eq true}">
						<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
					</c:if>
				</c:if>
				<c:if test="${t02_tp_show.arrangemode eq '3'}">
					<c:if test="${rsltMap.list ne ''}">
					<div style="width:<c:out value="${t02_tp_show.leftsize }" />;" class="awp_list_left">
						<c:if test="${P_report eq true}">
						<r:report report="report" data="reportData"></r:report>
						</c:if>
						<c:if test="${P_report ne true}">
							<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
						</c:if>
						<c:if test="${P_stat eq true}">
						<c:out value="${statHtmlStr}" escapeXml="false"></c:out>
						</c:if>
						<c:if test="${P_stat eq true}">
							<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
						</c:if>	
					</div>
					</c:if>
					<c:if test="${rsltMap.chart ne ''}">
					<div class="layout_chart_right" style="width:<c:out value="${t02_tp_show.rightsize }" />;">
						<c:out value="${rsltMap.chart}" escapeXml="false" />
					</div>
					</c:if>
				</c:if>
				<c:if test="${t02_tp_show.arrangemode eq '4'}">
					<c:if test="${rsltMap.chart ne ''}">
						<div class="layout_chart_left" style="width:<c:out value="${t02_tp_show.leftsize }" />;">
							<c:out value="${rsltMap.chart}" escapeXml="false"></c:out>
						</div>
					</c:if>
					<c:if test="${rsltMap.list ne ''}">
					<div style="width:<c:out value="${t02_tp_show.rightsize }" />;" class="awp_list_right">
						<c:if test="${P_report eq true}">
							<r:report report="report" data="reportData"></r:report>
						</c:if>
						<c:if test="${P_report ne true}">
							<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
						</c:if>
												<c:if test="${P_stat eq true}">
						<c:out value="${statHtmlStr}" escapeXml="false"></c:out>
						</c:if>
						<c:if test="${P_stat eq true}">
							<c:out value="${rsltMap.list}" escapeXml="false"></c:out>
						</c:if>	
					</div>
					</c:if>
				</c:if>
			</div>
			<!-- 隐藏数据区 -->
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			
			<div id='loading' class='css012'>
				<font color='#FF0000'>正在加载数据，请稍候...</font>
			</div>
				
			<!--数据提示区-->
			 <c:if test="${t02_tp_bas_inf.fundes != '' && ishelp == '0'}">
			    <div class='awp_msgtab'>
				  	<table>
				   		<tr>
				    		<td><p><strong>系统提示：</strong></p><br/>
				    		<c:out value="${t02_tp_bas_inf.fundes}" escapeXml="false"></c:out>&nbsp;</td>
				   		</tr>
				  	</table>		
			    </div>
			</c:if>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>
		</html:form>
	</div>
	</body>
	<script language="JavaScript" >onLoadPage();</script>
</html>
		
			
