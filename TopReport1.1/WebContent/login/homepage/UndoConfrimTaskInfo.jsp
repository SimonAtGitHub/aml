<%@page import="com.huateng.report.common.bean.UndoConfirmTaskBean"%>
<%@page import="com.huateng.report.common.service.ReportCommonService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=GBK" pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templets/easyui/themes/blue/easyui.css">
<title>����ȷ����Ϣ</title>
<%
List taskBeans = ReportCommonService.getInstance().getUndoConfirmTask(session);
%>
</head>
<body bgcolor="white" style="margin: 0px;">
<center>
<div style="padding: 3px;">
<table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
	<thead>
		<tr>
			<td class="labeltd" valign=center align="left">����ҵ������</td>
			<td class="labeltd" valign=center align="left">����</td>
			<td class="labeltd" valign=center align="left">����</td>
		</tr>
	</thead>
	<%
		if(taskBeans!=null && taskBeans.size()>0){
		String bgcolor = "#ffffff";
		for(int i = 0; i < taskBeans.size(); i++){
			UndoConfirmTaskBean bean = (UndoConfirmTaskBean)taskBeans.get(i);
			if(i%2==0){
				bgcolor = "#ffffff";
			}else{
				bgcolor = "#f7f7fe";
			}
	%>
		<tr style="line-height: 22px;">
		<td class="datatd" valign=center align="left" nowrap bgcolor="<%=bgcolor %>">
		 			<%=bean.getIntInsIdName() %>
		</td>
		<td class="datatd" valign=center align="left" nowrap bgcolor="<%=bgcolor %>">
		 			<%=bean.getCount()%>
		</td>
		<td class="datatd" valign=center align="left" nowrap bgcolor="<%=bgcolor %>">
		 			<a href="javascript:doIndexWork('/fpages/system/ftl/DirectorConfirm.ftl?intInsId=<%=bean.getIntInsId() %>')">����</a>
		</td>
		</tr>
	<%}}else{ %>
		<tr bgcolor="#ffffff"><td colspan="3" align="center" class="datatd">û����Ҫȷ����Ϣ</td></tr>
	<%} %>
</table></center>
</div>
</body>

<script type="text/javascript">
	function doIndexWork(url){
		window.parent.parent.doWork('1008',"����ȷ��",url);
	}
</script>
</html>