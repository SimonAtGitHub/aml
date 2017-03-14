<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils" %>
<jsp:include page="download_info.jsp"/>


<%

    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    //用于下载已经上传的附件！！！
    String url = (String)request.getParameter("url");
    String flag = (String)request.getParameter("flag");
    String reporttype= (String)request.getParameter("reporttype");
    if(reporttype==null) reporttype="";
    url = java.net.URLEncoder.encode(url);
   // System.out.println("url:"+url); 
   String backurl=request.getContextPath()+(String)request.getParameter("backurl")+"&reporttype="+reporttype;   
   System.out.println("backurl::::"+backurl);
%>
<script language="javascript">
    window.open('<%=request.getContextPath()%>/import?tempname=<%=url%>&downloadtype=attach&rad=<%=StringUtils.getRandomString(10)%>&flag=<%=flag%>','','height=0, width=0,left=0,top=0,scrollbars=no,resizable=no');
    location.href="<%=backurl%>";
</script>
