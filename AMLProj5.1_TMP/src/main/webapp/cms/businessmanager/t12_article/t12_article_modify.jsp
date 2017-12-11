<%@ page language="java"  pageEncoding="GBK"%>

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

<body>
<div id='content'>
	<html:form method="POST" action="/businessmanager/t12_article/t12_article_modify.do">
	    <html:hidden property="categorykey"/>
	   
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章管理
								- 修 改</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回" styleClass="input"
							onclick="awpDoSubmit('t12_article_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>
		
		<jsp:include page="/cms/t12_article_modify_include.jsp" />
						
		<table width="98%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td align="right">
				  
				&nbsp;				
				</td>				
				<td align="left" width="50%">
					 <html:button property="button" value="提  交" styleClass="input"
										onclick="checkforms('t12_article_modify_do.do','add')" />
					<!-- 
					<html:reset styleClass="input" value="重  填" />
					 -->
				</td>
				
			</tr>
		</table>
		
	</html:form></div>
</body>
</html:html>
