<%@ page language="java"  pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">	
</head>

<body leftmargin="0" topmargin="0">
	<html:form method="POST" action="/businessmanager/t12_article/t12_article_norelease_add.do">	    
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="0" id="title_table">
			<tr>
				<td>
					<span class="css014"> <strong><font color="0072BC">文章发布
								- 发布文章 </font> </strong> </span>
				</td>
				<td align="right">
					<html:button property="backbutton" value="返  回" styleClass="input"
						onclick="awpDoSubmit('t12_article_norelease_list.do','add')" />
				</td>
			</tr>
		</table>

		<jsp:include page="/cms/t12_article_add_include.jsp" />
						
		<table width="98%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right" width="20%">
					&nbsp;
				</td>
				<td align="left">
				   <html:button property="button" value="保 存" styleClass="input"
						onclick="awpDoSubmit('t12_article_norelease_add_do.do?type=save','add')" />
						&nbsp;&nbsp;&nbsp;
					<html:button property="button" value="发 布" styleClass="input"
						onclick="awpDoSubmit('t12_article_norelease_add_do.do?type=release','add')" />
					<!-- 
					<html:reset styleClass="input" value="重  填" />
					 -->					
				</td>
			</tr>
		</table>	
		
		<jsp:include page="/cms/t12_article_mgs.jsp" />
		
	</html:form>
</body>
</html:html>
