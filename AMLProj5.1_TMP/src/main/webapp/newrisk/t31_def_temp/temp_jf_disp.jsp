<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script src="../js/title.js"></script>
	</head>

	<%

String  str=request.getContextPath();
String templatekey= request.getParameter("templatekey");
String templatename=new String(request.getParameter("templatename").getBytes("ISO-8859-1"),"GB2312");

String left=str+"/platform/pub/menu_left_tree.do?menu_id=newrisk_jf_tree&templatekey="+templatekey;

String right=str+"/newrisk/t31_def_element/t31_def_element_list.do?newsearchflag=1&treelaye=1&upelementkey=-1&templatekey="+templatekey;
%>


	<frameset rows="37,*" cols="*" framespacing="0" frameborder="NO" border="0" name="full">
		<frame src="temp_jf_disp_top.jsp" name="topFrame" scrolling="NO" noresize>
		<frameset  cols="15%,*"  frameborder="no">
			<frame  src=<%=left%> name="leftFrame" scrolling="auto"
				noresize="noresize" >
			<frame src=<%=right%> name="newrisk_jf" scrolling="auto"
				noresize="noresize" >
		</frameset>
	</frameset>
	<noframes>

		<body>
		
		</body>
	</noframes>
</html>
