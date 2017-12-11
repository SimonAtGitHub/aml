<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ include file="../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<SCRIPT LANGUAGE="JavaScript"
	src="/awp/js/awp_base.js"></SCRIPT>
<script src="/awp/js/basefunc.js"></script>
<Script LANGUAGE="JavaScript">
    function openPage(url){	
		var winProperty = 'height=450, width=600,right=1,top=1,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no';
		window.open(url,'',winProperty);
    }
</Script>
<html:messages id="errors" message="true">
	<bean:write name="errors" filter="fasle" />
</html:messages>
<div class="Ar_other">
		<c:forEach items="${rellist}" var="dto">
				<h1><img src="/awp/skin/<%=style %>/images/pop_book.gif" /><c:out value="${dto.programaname}" /></h1>
  					<c:if test="${not empty dto.rel_article_list}">
	  					<ul>
		  					<c:forEach items="${dto.rel_article_list}" var="relation" varStatus="statusIndex">
		  						<li><a href="javascript:openPage('/awp/cms/knowledgemanager/t12_knowledge_disp.do?articlekey=<c:out value="${relation.articlekey}"/>&programakey=<c:out value="${relation.programakey}"/>');"><c:out value="${relation.articlename}"/></a></li>
		  					</c:forEach>
		  				</ul>	
  					</c:if>
  		</c:forEach>
</div>

