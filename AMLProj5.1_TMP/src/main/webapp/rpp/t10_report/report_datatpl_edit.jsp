<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=GBK">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
    function dosubmit(theUrl){
	    document.forms[0].action='editreportdatatpl.do';
	    document.forms[0].submit();
    }
    </SCRIPT>	
</head>

<body class="report_body_bg">
<div id="report_wrap">
		<html:form method="POST" action="/t10_report/editreportdatatpl.do">
			<html:hidden property="p_reportkey" />
			<div class="report_title">
			  <strong>报表数据模板定义</strong>
			  <span>
			  	<a href="#" onClick="openFullWin('<%=request.getContextPath()%>/rpp/t10_report/editReportDataTpl_xls.do?reportkey=<%=request.getParameter("reportkey")%>&p_reportkey=<%=request.getParameter("p_reportkey")%>&actiontype=','');return false;" />
			  		<img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />编辑报表模板</a>
			     <a href="#" onClick="dosubmit(); return false;"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />刷 新</a>
			  </span>
			</div>
			

			<div class='awp_detail' style='overflow:visible;height:100%;width:100%;'>
				<table style="width:100%;">
					<tr>
						<td align="right" valign="top" width="3" nowrap>
							<%
							int lineNum = ((Integer)request.getAttribute("length_xmlStr") ).intValue();
							for(int i=1;i<=lineNum;i++){
								out.print(i+"<br>");
							}
							%>
						</td>
						<td noWrap="noWrap" valign="top" width="100%">
							<%
							String dataTpl_xmlStr = (String)request.getAttribute("dataTpl_xmlStr");
							out.print(dataTpl_xmlStr);
							 %>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
</body>

</html:html>
