<%@ page language="java"  pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<div id='content'>
	<html:form method="POST" action="/businessmanager/t12_article/t12_article_norelease_list.do">
        <html:hidden property="programakey"/>
        <div class='awp_title'>
				<table  id="module_title">
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2">发布文章 - 我的未发布文章列表</span></td>
						<td align="right">
							 <logic:equal value="2" name="t12_programa" property="releasetype">				       
					   <html:button property="add" styleClass="input" value="返回已发布的文章"
						onclick="awpDoSubmit('t12_article_list.do','add')" />
						<!-- 
						<html:button property="add" styleClass="input" value="删 除"
						onclick="dosubmit('t12_knowledge_delete_do.do','add')" />
						
						
						<html:button property="modify" styleClass="input" value="修  改"
						onclick="permitSingleSelect('t12_knowledge_modify.do','modi')" />
					<html:button property="delete" styleClass="input" value="删  除"
						onclick="permitMutiSelect('t12_knowledge_delete_do.do','del')" />
						<html:button property="delete" styleClass="input" value="申请发布"
						onclick="dosubmit('t12_knowledge_depoly_do.do','add')" />
						 -->
				   </logic:equal>					                  </td>
					</tr>
				</table>
			</div>   
        
		
		
		<%
		request.setAttribute("path", "/businessmanager/t12_article/t12_article_norelease_add");
		request.setAttribute("deletePath", "/businessmanager/t12_article/t12_article_norelease_delete_do");
		request.setAttribute("searchPath", "/businessmanager/t12_article/t12_article_norelease_list");
		 %>

		<jsp:include page="/cms/t12_article_norelease_list_include.jsp" />

	</html:form>
</div>
</BODY>
</html:html>

