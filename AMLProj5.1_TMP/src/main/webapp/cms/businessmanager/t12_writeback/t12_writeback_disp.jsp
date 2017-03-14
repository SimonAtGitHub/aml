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
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>

</head>

<body>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_writeback/t12_writeback_disp.do">
			<html:hidden property="articlekey" />
			<html:hidden property="programakey" />
			<html:hidden property="replykey" />
			<html:hidden property="auditstat" />

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章回复 - 详 情 </span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input" onclick="awpDoSubmit('t12_writeback_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

			<div class='awp_detail'>
				<TABLE>

					<tr>
						<td align="right">
							文章标题：
						</td>
						<td>
							<bean:write property="articlename" name="t12_article" />
						</td>
					</tr>

					<tr>
						<td align="right">
							回复内容：
						</td>
						<td>

							<html:textarea property="replycontent" cols="60" rows="18"
								readonly="true" />
						</td>
					</tr>

					<tr>
						<td align="right">
							回复时间：
						</td>
						<td>
							<bean:write property="createdate" name="t12_writebackActionForm" />
						</td>
					</tr>
				</TABLE>
			</div>
		</html:form>
	</div>
</body>

</html:html>
