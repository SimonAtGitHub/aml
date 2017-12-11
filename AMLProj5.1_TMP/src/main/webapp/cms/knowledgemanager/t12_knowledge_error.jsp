<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>错误信息提示</title>
</head>
<body>
<table class="split" width="100%">
			<tr>
				<td height="8">
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
				</td>
			</tr>
		</table>
</body>
</html>