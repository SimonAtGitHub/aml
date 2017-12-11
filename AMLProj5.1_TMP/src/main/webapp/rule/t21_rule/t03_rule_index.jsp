<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>指标管理 - 修改</title>
</head>
   <%
	  String tplakey = (String)request.getSession().getAttribute("tplakey");
	%>	
<frameset rows="*" cols="166,*"  framespacing="0" frameborder="no" border="0">
  <frame src="<%=request.getContextPath()%>/rule/t21_rule/t03_rule_left.jsp" name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame" title="leftFrame" />
  <frame src="<%=request.getContextPath()%>/rule/t21_rule/t03_page_in_parm_list.do?tplakey=<%=tplakey %>" name="mainFrame1" id="mainFrame" scrolling="auto" title="mainFrame1" />
</frameset>
<noframes><body>
</body>
</noframes>
</html:html>