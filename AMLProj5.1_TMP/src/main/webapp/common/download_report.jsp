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
    System.out.println("url:"+url);    
%>
<script language="javascript">
    window.open('<%=request.getContextPath()%>/import?tempname=<%=url%>&downloadtype=attach&rad=<%=StringUtils.getRandomString(10)%>','','height=0, width=0,left=0,top=0,scrollbars=no,resizable=no');
   // location.href="<%=request.getContextPath()%>/inves/reportsearch_ms/t07_reportsearch.do";
</script>
