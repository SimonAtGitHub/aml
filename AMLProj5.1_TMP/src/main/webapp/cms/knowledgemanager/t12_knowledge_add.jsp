<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/upload_attachment.js"></SCRIPT>
</head>
<SCRIPT LANGUAGE="JavaScript">

function addAttach_n(dispPath,editPath,akey,fname,filesize,creator,attachtype){
	var s = document.getElementById("attachkeys").value;
	if (s.length == 0){
		s = akey;
	}else{
		s = s + "," + akey;
	}
	document.getElementById("attachkeys").value = s;

	var objTable = document.getElementById("attachListTable");
 	var objRow = objTable.insertRow(); 
 	
 	//设置行的样式
 	objRow.style.backgroundColor="#FFFFFF";
 	objRow.style.textAlign="center";
 	
 	myTD = objRow.insertCell();
	myTD.innerText = attachtype;
	
	myTD = objRow.insertCell();
	//myTD.innerText = fname;
	myTD.innerHTML = "<a href=\"#\" onclick=\"showAttach('"+dispPath+"')\">"+fname+"</a>";

	myTD = objRow.insertCell();
	myTD.innerText = filesize;

	myTD = objRow.insertCell();
	myTD.innerText = creator;

	myTD = objRow.insertCell();
	myTD.innerHTML = "<a href=\"#\" onclick=\"delAttach('"+akey+"')\">删除</a>";
}
</SCRIPT>
<body>
	<div id='content'>
		<html:form method="post" action="/knowledgemanager/t12_knowledge_add.do">
			<input type="hidden" name="categorykey" value="<bean:write name="categorykey"/>"/>
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章管理 - 发布文章</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input" onclick="awpDoSubmit('t12_knowledge_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>
			<jsp:include page="/cms/t12_article_add_include.jsp" />
			
			
				<table>
					<tr>
					
						<td>
							&nbsp;
						</td>
						<td align="right">
							<html:button property="button" value="保 存" styleClass="input"
								onclick="checkforms('t12_knowledge_add_do.do?type=save')" />
							
							<html:button property="button" value="发 布" styleClass="input"
								onclick="checkforms('t12_knowledge_add_do.do?type=release')" />
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
