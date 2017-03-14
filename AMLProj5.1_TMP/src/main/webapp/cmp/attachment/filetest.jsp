<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
	<head>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

</SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title></title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css_all.css" type="text/css">
	</head>

	<body bgcolor="F6F6F6" leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
		<html:form action="/platform/t01_attachment/t01_attachment_list.do"
			method="post">
			<table width="98%">
				<tr align="center">
					<td>
						<input type="button" name="submit5" value="保 存" onclick="dosubmit('t01_attachment_list.do?goTest=save')" />
						&nbsp;
						<input type="button" name="submit5" value="复 制" onclick="dosubmit('t01_attachment_list.do?goTest=copy')" />
					</td>
				</tr>
			</table>
			<jsp:include page="attach_include.jsp" />
		</html:form>
	</body>
</html>
