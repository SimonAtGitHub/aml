<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

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
		<html:form method="POST"
			action="/businessmanager/t12_article/t12_article_audit_modify.do">
			<html:hidden property="auditstat" />
			<html:hidden property="categorykey" />
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">审核文章 - 修 改</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input"
								onclick="awpDoSubmit('t12_article_audit_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>


			<jsp:include page="/cms/t12_article_modify_include.jsp" />

			<table width="98%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" width="20%">
						&nbsp;
					</td>
					<td align="right">
						<html:button property="button" value="提  交" styleClass="input"
							onclick="avpCondSubmit('t12_article_audit_modify_do.do')" />
						<!-- 
					<html:reset styleClass="input" value="重  填" />
					 -->
					</td>
				</tr>
			</table>
		</html:form>
</body>
<script language="javaScript">
onLoadDo();
</script>
</html:html>
