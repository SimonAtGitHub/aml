<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
</HEAD>
<BODY><div id='content'>
	<html:form method="POST" action="/knowledgemanager/t12_knowledge_norelease_list.do">
        <html:hidden property="programakey"/>
     	
		<div class='awp_title'>
	
		<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">知识管理 - 我的未发布文章列表</span>
						</td>
						<td align="right">
						<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							 <logic:equal value="1" name="t12_programa" property="releasetype">				       
					   <html:button property="add" styleClass="input" value="返回已发布的文章"
						onclick="awpDoSubmit('t12_knowledge_list.do','add')" />
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
				   </logic:equal>	
						</td>
					</tr>
				</table>
    </div>
		
		<%
		request.setAttribute("path", "/knowledgemanager/t12_knowledge_norelease_add");
		request.setAttribute("deletePath", "/knowledgemanager/t12_knowledge_delete_do");
		request.setAttribute("searchPath", "/knowledgemanager/t12_knowledge_norelease_list");
		 %>

		<jsp:include page="/cms/t12_article_norelease_list_include.jsp" />

	</html:form>
</div>
</BODY>
</html:html>

