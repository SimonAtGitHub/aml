<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils" %>
<%
  /****  */
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    //用于下载已经上传的附件！！！
    String url = (String)request.getParameter("url");
    url = java.net.URLEncoder.encode(url);
    String tablename = (String)request.getParameter("tablename");
    String tablekey = (String)request.getParameter("tablekey");  
%>
<script language="javascript">
    window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=url%>&downloadtype=attach&rad=<%=StringUtils.getRandomString(10)%>','','height=160, width=300,left=100,top=100');
    location.href="<%=request.getContextPath()%>/metadata/function/mt_table_disp.do?tablekey=<%=tablekey%>&tableename=<%=tablename%>";
</script>
