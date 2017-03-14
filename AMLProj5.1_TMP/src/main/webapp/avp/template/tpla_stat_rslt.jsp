<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>

		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_统计结果</title>
		
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/ToolsWindow.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/toolswindow.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		
		<script language="JavaScript">
		function exportMyExecl(){
			try{
				var loading = document.getElementById('loading'); 
				loading.style.visibility = "visible";
				event.srcElement.disabled = true;
				exportExecl_avp('data_table','<c:out value="${labelStr}" escapeXml="false"></c:out>');
				loading.style.visibility = "hidden";
				event.srcElement.disabled = false;
				}catch(err){
			}
		}

		</script>
		
	</HEAD>

<body class="tools-bg">

<!-- 系统总体框架，占页面宽度的98％ -->
		<div class="tools-cot">
			<html:form method="post" action="/template/tpla_chk_main.do">
				<!-- 标题区域 -->
				<!-- 标题区域 -->
			<div class="cond">
			 <div class="cond-t">
			  <strong><c:out value="${labelStr}"></c:out>_统计结果</strong>
			  <span style="top:0px;">
			  <c:out value="${cmdExport}" escapeXml="false"></c:out>
			  <input type='button' value='返 回' onClick="avpJumpSubmit('tpla_stat_cond.do')">
								<input type='button' value='关 闭' onClick="window.close();">
			  </span>
	  			
			</div>
		   </div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<c:out value="${rsltHtmlStr}" escapeXml="false"></c:out>

				<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>

				<div id='loading' class='css012'>
					<font color='#FF0000'>正在加载数据，请稍候...</font>
				</div>

				<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>

			</html:form>
		</div>
	</BODY>
</HTML>
