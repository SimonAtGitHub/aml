<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils" %>
<jsp:include page="download_info.jsp"/>


<%
  /****  */
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    //用于下载已经上传的附件！！！
    String url = (String)request.getParameter("url");
    String flag = (String)request.getParameter("flag");
    url = java.net.URLEncoder.encode(url);
    System.out.println("url:"+url);    
%>
<script language="javascript">
       location.href="<%=request.getContextPath()%>/import?tempname=/para/workdate/CMBC_AML_PJZBYLB.xls&rad=<%=StringUtils.getRandomString(10)%>&flag=1";
</script>
