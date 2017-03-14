<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.util.StringUtils"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@page import="java.io.File"%>
<%
	pageContext.setAttribute("ctx",request.getContextPath());
%>
<jsp:include page="download_info.jsp" />
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	//用于下载已经上传的附件！！！
	String url =(String) request.getParameter("url") ;
	System.out.println("url:"+url);    
	System.out.println(url);
	if (new File(url).exists()) {
		url=java.net.URLEncoder.encode(url);
	}else{
		url="";
	}
	pageContext.setAttribute("url",url);
%>

<script language="javascript">
	var url='<bean:write name="url"/>';

	if(url!=''){
    	window.location.href="<bean:write name="ctx"/>/import?tempname=<bean:write name="url"/>&downloadtype=organ&rad=<%=StringUtils.getRandomString(10)%>";
	}
</script>
