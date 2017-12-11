<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报表定义-报表定义维护</title>
</head>
<frameset rows="30,*" cols="*"  framespacing="0" frameborder="no" border="0">
  <frame src="report_add_left.jsp?reportkey=<%=request.getAttribute("reportkey")%>&isbaseinfo=1" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
  <frame src="report_add_main.jsp" name="mainFrame1" id="mainFrame" scrolling="auto" title="mainFrame1" />
</frameset>
<noframes><body>
</body>
</noframes>
</html:html>