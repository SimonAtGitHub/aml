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
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>
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
		<html:form method="post" action="/template/tpla_backexec_resultView_do.do">
			<!-- 标题区域 -->
			<div class='awp_title'>
				<table>
					<tr>

						<td>
							<span class="awp_title_td2"><c:out value="${title}"/>_结果</span>
						</td>
						<td nowrap align="right">
<%--							<input type="button" name="btsearch2" value="查 找"--%>
<%--								onclick="btnDisplayHidden(this, 'searchtable')" />--%>
<%--							<input type="button" name="add" value="新 建" onclick="dosubmit('/awp/fdp/t03_program/t03_program_add.do','add')">--%>
<%--							<input type="button" name="modify" value="修 改" onclick="dosubmit('/awp/fdp/t03_program/t03_program_modify.do','modify')">--%>
<%--							<input type="button" name="delete" value="删 除" onclick="dosubmit('/awp/fdp/t03_program/t03_program_delete_do.do','del')">--%>
								<input type="button" name="btsearch2" value="导  出"
								onClick="awpDoSubmit('<%=request.getContextPath() %>/avp/template/tpla_export_cond.do?tpla_sessionId=<c:out value="${id}"/>&export_audit_flag=0')" />
								<input type="button" name="btsearch2" value="关 闭"
								onClick="window.close();" />
						</td>
					</tr>
				</table>
			</div>
			<!-- 数据区 -->
			<c:out value="${rsltHtmlStr}" escapeXml="false"></c:out>
			
			<!-- 隐藏数据区 -->
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			
			<div id='loading' class='css012'>
				<font color='#FF0000'>正在加载数据，请稍候...</font>
			</div>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>	
		</html:form>
	</div>
	</body>
	<script language="JavaScript" >onLoadPage();</script>
</html>
		
			
