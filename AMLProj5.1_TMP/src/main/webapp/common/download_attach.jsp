<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils" %>
<%@ page import="com.ist.common.properties.InitSystem" %>
<jsp:include page="download_info.jsp"/>


<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    //用于下载已经上传的附件！！！
    String url = (String)request.getParameter("url");
    String flag = (String)request.getParameter("flag");
    
    InitSystem init = new InitSystem();
    String SysHomeDir_temp = "";
    SysHomeDir_temp = init.getSysHomeDirFromProperties();
    SysHomeDir_temp = SysHomeDir_temp.substring(0,SysHomeDir_temp.indexOf("/WEB-INF"));
    SysHomeDir_temp = java.net.URLEncoder.encode(SysHomeDir_temp);
    
    url = java.net.URLEncoder.encode(url);
    
    System.out.println("url:"+url);    
%>
<script language="javascript">
       location.href="<%=request.getContextPath()%>/import?tempname=<%=url%>&downloadtype=attach&rad=<%=StringUtils.getRandomString(10)%>&flag=<%=flag%>&SysHomeDir_temp=<%=SysHomeDir_temp%>";
</script>
