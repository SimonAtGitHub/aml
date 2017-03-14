<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
    	

	<title>引擎应用主页面</title>
</head>
<frameset id="searchFrameSet" rows="28%,*,0" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="performEng_chk_main.do?srchengkey=<%=request.getAttribute("srchengkey")%>&istool=<%=request.getAttribute("istool")%>" name="searchEngineTop"  />
  <frame name="searchEngineMiddle" />
  <frame name="searchEngineBottom" scrolling="no" />
</frameset>
<noframes>
<body>
</body>
</noframes>
</html:html>
