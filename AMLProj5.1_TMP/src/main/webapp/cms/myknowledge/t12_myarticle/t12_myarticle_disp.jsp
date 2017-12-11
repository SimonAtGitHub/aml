<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
</head>
<div id='content'>
<body>
	<html:form method="POST" action="/myknowledge/t12_myarticle/t12_myarticle_disp.do">	    
		
		<logic:notEqual value="2" property="showtype" name="t12_programa">
			<jsp:include page="/cms/t12_article_disp_noreply_include.jsp" />
			</logic:notEqual>
			<logic:equal value="2" property="showtype" name="t12_programa">
			<jsp:include page="/cms/t12_article_list_include.jsp" />
			</logic:equal>
		
		
	</html:form>
	<br><br>
</body>
</div>
</html:html>
