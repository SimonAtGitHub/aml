<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报表定义-报表定义维护</title>
</head>
  <frameset rows="*" cols="40%,60%"  framespacing="0" frameborder="no" border="1" >
  	<frame src="<%=request.getContextPath()%>/rpp/t10_report/editreportdatatpl.do?reportkey=<%=request.getParameter("reportkey")%>&p_reportkey=<%=request.getParameter("p_reportkey")%>&actiontype=" name="xmlFrame" scrolling="yes" id="xmlFrame" title="xmlFrame" resize="yes" frameborder="1"/>
  	<frame src="<%=request.getContextPath()%>/rpp/t10_report/editreportdatatpl_des.do?reportkey=<%=request.getParameter("reportkey")%>&p_reportkey=<%=request.getParameter("p_reportkey")%>&actiontype=" name="propFrame" id="propFrame" scrolling="yes" title="propFrame" frameborder="1"/>
  </frameset>
<noframes><body>
</body>
</noframes>
</html:html>