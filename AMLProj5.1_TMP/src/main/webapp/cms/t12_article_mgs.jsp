<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%@ include file="../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<SCRIPT LANGUAGE="JavaScript"
	src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>

<div class='awp_msgtab'>
	<table>
		<tr>
			<td>
				<p>
					<strong>系统提示：</strong>
				</p>
				<br>


				1、点击“保存”按钮,文章不发布,只做草稿存储,保存后可进行修改、删除、发布等操作。
				<br>

				2、点击“发布”按钮,文章发布并等待系统管理员的审核(如果需要审核的话),发布后的文章不能再进行修改、删除操作。
				<br>

				3、全文检索密级:全文搜索文章时,会与用户的密级进行比较,判断用户是否有权查看该文章。
			</td>
		</tr>
	</table>
</div>

