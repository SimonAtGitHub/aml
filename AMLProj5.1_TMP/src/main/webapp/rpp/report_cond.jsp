<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title><c:out value="${labelStr}" escapeXml="false"></c:out></title>
		<%@ include file="../bmp/platform/common/style_include.jsp" %>		
	    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		<script language="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
		
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
		
        </script>
	</head>

	<body class="tools-bg">
	<!-- 系统总体框架，占页面宽度的98％ -->
<%--	 <html:form method="post" action="/showReport.do">--%>
	            <logic:notEmpty name="t10_reportActionForm" property="reportkey">
	                <input type="hidden" name="reportkey" value="<bean:write name="t10_reportActionForm" property="reportkey"/>" />
		            <input type="hidden" name="p_reportkey" value="<bean:write name="t10_reportActionForm" property="reportkey"/>" />
	            </logic:notEmpty>
	            <logic:empty name="t10_reportActionForm" property="reportkey">
		            <input type="hidden" name="reportkey" value="<bean:write name="t10_report" property="reportkey" ignore="true"/>" />
		            <input type="hidden" name="p_reportkey" value="<bean:write name="t10_report" property="reportkey" ignore="true"/>" />
	            </logic:empty>
				<html:hidden property="paramStr" />
	<div class="tools-cot">		
	        <logic:notEmpty name="labelStr">	
			<!-- <div class='awp_title'>
	  			<table >
			  		<tr>
			    		<td align='left' nowrap><span class="awp_title_td2"><c:out value="${labelStr}"> </c:out> </td>
			    		<td width="*" align="right">			    		   
			    		       <logic:equal value="1" property="isexport" name="t10_reportActionForm">
									<input type="button" name="backbutton" value="导  出" onClick="dosubmit('downloadReport.do','')" class="input">
								</logic:equal>
								<input type="button" name="backbutton" value="关 闭" onClick="window.close();" class="input">			    		   
			    		</td>
					</tr>				
			  	</table>
			</div>-->
			</logic:notEmpty>
			
			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			
			<!-- 查询条件区 -->
			<logic:notEmpty name="condHtmlStr">
			<div class="awp_cond">
			<c:out value="${condHtmlStr}" escapeXml="false"></c:out>	
			</div>
			</logic:notEmpty>
			
			<div id='loading' class='css012'>
				<font color='#FF0000'>正在加载数据，请稍候...</font>
			</div>
	</div>
<%--	</html:form>--%>
	</body>
	<script language="JavaScript">onLoadPage();</script>
</html>
		
			
