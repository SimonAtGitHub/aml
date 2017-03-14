<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%--
本菜单为公用的菜单显示界面
需要从后台得到如下参数
menuList ArrayList对象，封装 com.ist.common.menu.Menu数据，为显示的菜单数据
--%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>数据项菜单</title>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<link  href="../../css/dtreeStyle.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/js/MzTreeView.js"></script>

<SCRIPT LANGUAGE="JavaScript">
		function reload()
		{
		  document.getElementById('Submit3').click();
		}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="main" align="right">
	<form id="xform" name="xform" method="post" action="" target="<bean:write name="target" scope="request" filter="false" />">
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle"/>
		</html:messages>
	    
		<table width="100%" border="0">
		  <tr align="center">
		    <td width="47%" align="center">
		      <input type="button" name="Submit3" id="Submit3" value=".....刷   新....." class="text_white" onClick="javascript:window.location.reload();">
		    </td>
		    <td width="53%">&nbsp; </td>
		  </tr>
		</table>
	
	<script language="javascript">
	var tree = new MzTreeView("tree");
	tree.setIconPath("<%=request.getContextPath()%>/images/mztree/");
	tree.setTarget("<c:out value="${target}"/>");
	<c:forEach var="menu" items="${menuList}">
	<c:if test="${menu.url=='#'}">
     tree.nodes["<c:out value="${menu.parent_id}"/>_<c:out value="${menu.id}"/>"]="text:<c:out value="${menu.name}"/>;url:<c:out value="${menu.url}" escapeXml="false"></c:out>;";
     </c:if>

		<c:if test="${menu.url!='#'}">
	tree.nodes["<c:out value="${menu.parent_id}"/>_<c:out value="${menu.id}"/>"]="text:<c:out value="${menu.name}"/>;url:<%=request.getContextPath()%><c:out value="${menu.url}" escapeXml="false"></c:out>;";
	  </c:if>
	
	</c:forEach>

	document.write(tree.toString()); 

	tree.expandAll();
	</script>
</form>
</div>
</body>

</html:html>
