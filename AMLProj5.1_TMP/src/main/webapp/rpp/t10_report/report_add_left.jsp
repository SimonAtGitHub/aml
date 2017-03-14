<%@ page contentType="text/html; charset=GBK"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>报表定义菜单</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp"%>
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css"
			rel="stylesheet" type="text/css">
		<script language="javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript">
		jQuery.noConflict();
		(function($){ 
		  $(function(){
			$(document).ready(function(){	
			    
				$('#report_menu a:eq(0)').addClass('bglink');
				
				$('#report_menu a').click(function(){
				      $(this).addClass('bglink').siblings().removeClass();
				});
			
			});
		// All End
		  });
		})(jQuery);
		</script>
		<script type="text/javascript">
		function refresh(){
		  window.location.reload();
		}
		 function dosubmit(theUrl){
  			 document.forms[0].action=theUrl;
        	 document.forms[0].submit();
         }
		</script>
		
	</head>
	
	<%
	      String reportkey = (String)request.getSession().getAttribute("reportkey");
		String ishava = (String)request.getSession().getAttribute("ishava");
	    %>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form id="xform" name="xform" method="post" action=""
			target="mainFrame1">
			<div id="report_menu">
			<%if(reportkey == null || "".equals(reportkey)){
			%>
				<a href="javascript:;" target="mainFrame1"  onclick="dosubmit('<%=request.getContextPath()%>/rpp/t10_report/t10_report_add_baseinfo.do');return false;">基本属性</a> 
			<%}else{%>
				<a href="javascript:;" target="mainFrame1"  onclick="dosubmit('<%=request.getContextPath()%>/rpp/t10_report/t10_report_modify_baseinfo.do?reportkey=<%=reportkey %>');return false;">基本属性</a> 
				<a href="javascript:;" target="mainFrame1"  onclick="dosubmit('<%=request.getContextPath()%>/rpp/t10_report/t10_reportparm_list.do?reportkey=<%=reportkey %>');return false;">输入参数</a> 
				<a href="javascript:;" target="mainFrame1"  onclick="dosubmit('<%=request.getContextPath()%>/rpp/t10_report/report_tpl_edit.jsp?reportkey=<%=reportkey %>&p_reportkey=<%=reportkey %>');return false;">报表模板</a> 
				<%if(ishava != null && ishava.equals("1")) {					
				%>
				 <a href="javascript:;" target="mainFrame1"  onclick="dosubmit('<%=request.getContextPath()%>/rpp/t10_report/t10_report_test.do?reportkey=<%=reportkey %>&p_reportkey=<%=reportkey %>');return false;">报表验证</a>
				<%}else{ %>
					<a href="javascript:;" target="mainFrame1"  onclick="dosubmit('<%=request.getContextPath()%>/rpp/showReport.do?new_qry_flag=1&jump_rslt_flag=1&fast_qry=1&reportkey=<%=reportkey %>&p_reportkey=<%=reportkey %>');return false;">报表验证</a>
				<%} %>
			
			<%}%>
			</div>
		</form>

		<%	
			String isbaseinfo = (String)request.getParameter("isbaseinfo");
			if(StringUtils.isNotEmpty(isbaseinfo)){
				if(reportkey == null || "".equals(reportkey)){
				%>
				<script type="text/javascript">
					dosubmit('<%=request.getContextPath()%>/rpp/t10_report/t10_report_add_baseinfo.do');
				</script>				
			<% }else{
				%>
					<script type="text/javascript">
					dosubmit('<%=request.getContextPath()%>/rpp/t10_report/t10_report_modify_baseinfo.do?reportkey=<%=reportkey %>');
				</script>
				<%}
			}
		%>
	
	</body>
</html>
