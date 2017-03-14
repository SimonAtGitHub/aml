<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="java.sql.Timestamp"/>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/css_all.css" type="text/css">
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/title.js"></script>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">
		function showContentOrFile(value) {
		    //alert("dddddddddd:"+value);
		    if(value == "1") {//显示文章内容
		        //alert("dhhhhhhhh:");
		        document.getElementById("content").style.display = "block";
		        document.getElementById("file").style.display = "none";
		    }else {//显示附件上传
		        document.getElementById("content").style.display = "none";
		        document.getElementById("file").style.display = "block";
		    }
		}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
<div id='content'>
	<html:form method="POST" action="/businessmanager/t12_article/t12_article_add.do">
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章管理
								- 新建文章</span>
						</td>
						<td align="right">
							 <html:button property="backbutton" value="返  回" styleClass="input"
						onclick="awpDoSubmit('t12_article_list.do','add')" />

						</td>
					</tr>
				</table>
			</div>
		
		<jsp:include page="/cms/t12_article_add_include.jsp" />
						
		<table width="98%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right" width="20%">
					&nbsp;
				</td>
				<td align="left">
				   <html:button property="button" value="保 存" styleClass="input"
						onclick="checkforms('t12_article_add_do.do?type=save')" />
						&nbsp;&nbsp;&nbsp;
					<html:button property="button" value="发 布" styleClass="input"
						onclick="checkforms('t12_article_add_do.do?type=release')" />
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
