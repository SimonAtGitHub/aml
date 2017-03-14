<%@ page contentType="text/html; charset=GBK" %>
<%
String url = request.getContextPath();
String homepage = url+"/login.do";
if(request.getAttribute("homepage")!=null){
	homepage = (String)request.getAttribute("homepage");
}
System.out.println(homepage);
%>
<script language="javascript">
	location.href="<%=homepage%>";
</script>
