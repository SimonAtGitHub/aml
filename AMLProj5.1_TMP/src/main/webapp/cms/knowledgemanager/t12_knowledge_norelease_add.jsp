<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
</head>
<title></title>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
     <SCRIPT src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
     
<script language="JavaScript">
</script>
<body>
	<div id='content'>
		<html:form method="POST"
			action="/knowledgemanager/t12_knowledge_norelease_add.do">
			<input type="hidden" name="categorykey" value="<bean:write property="artcategorykey" name="t12_article"/>"/>
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">知识管理 - 发布文章</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input"
								onclick="awpDoSubmit('t12_knowledge_norelease_list.do')" />
						</td>
					</tr>
				</table>
			</div>
			
			<jsp:include page="/cms/t12_article_add_include.jsp" />
		
				<table>

					<tr align="right">
						<td>
							&nbsp;
						</td>
						<td>
							<html:button property="button" value="保 存" styleClass="input"
								onclick="avpCondSubmit('t12_knowledge_norelease_add_do.do?type=save')" />
							&nbsp;&nbsp;&nbsp;
							<html:button property="button" value="发 布" styleClass="input"
								onclick="avpCondSubmit('t12_knowledge_norelease_add_do.do?type=release')" />
							<!-- 
					<html:reset styleClass="input" value="重  填" />
					 -->
						</td>
					</tr>
				</table>
			

			<jsp:include page="/cms/t12_article_mgs.jsp" />

			

		</html:form>
	</div>
</body>
</html:html>
