<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>模型维护-标准模型维护</title>
</head>
<frameset rows="*" cols="166,*" framespacing="0" frameborder="no" border="0">
  <frame src="tpla_bz_add_left.jsp?tplakey=<%=request.getAttribute("tplakey")%>&busstypecd=<%=request.getAttribute("busstypecd")%>" name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame" title="leftFrame" />
  <frame src="tpla_add_main.jsp" name="mainFrame1" id="mainFrame" scrolling="auto" title="mainFrame1" />
</frameset>
<noframes><body>
</body>
</noframes>
</html:html>