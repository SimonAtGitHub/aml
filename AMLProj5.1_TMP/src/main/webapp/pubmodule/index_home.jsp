<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>
<%
String url = request.getContextPath();
String headurl=url+"/pubmodule/head.jsp";
String navurl=url+"/pubmodule/nav.jsp";
String lefturl=url+"/pubmodule/left.jsp?systemkey="+(String)request.getParameter("systemkey");
String sliderurl=url+"/pubmodule/slider.jsp";
String mainurl=url+"/pubmodule/main.do";
String  bottomurl=url+"/pubmodule/bottom.jsp";

 %>
 <html:form  action="/index.do" method="post">
 <frameset rows="67,6,*" cols="*" framespacing="0" frameborder="no" border="0" name="full">
  <frame src=<%=headurl%> name="topFrame" scrolling="no" noresize>
  <frame src=<%=navurl%> name="navFrame" scrolling="no" noresize>
  <frameset cols="209,18,*" frameborder="no" id=setyou>
    <frame src="<%=lefturl%>" name="leftFrame" scrolling="no" noresize id="leftFrame">
    <frame src=<%=sliderurl%> name="slider" scrolling="no" noresize id="slider">
    <frameset rows="*,21" frameborder="no">
      <frame src=<%=mainurl%> name="mainFrame" noresize id="mainFrame">
      <frame src=<%=bottomurl%> name="mainFrame" scrolling="no" noresize>
    </frameset>
  </frameset>
</frameset>
<noframes>
<body>
</body></noframes>

</html:form>
</html>
