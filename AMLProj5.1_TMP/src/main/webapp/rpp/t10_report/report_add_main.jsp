<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
	</head>
	<body leftmargin="0" topmargin="0">
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" valign="top">
					<table width="100" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="50"></td>
						</tr>
					</table>
				
					<table width="100" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="60"></td>
						</tr>
					</table>
					<table width="98%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center" valign="middle"><img src="../../images/stgl.gif"></td>
						</tr>
						<tr>
							<td width="100%" align="center"><span class="awp_main">欢迎使用报表定义!</span></td>
						</tr>
					</table>
					
				</td>
			</tr>
		</table>
		<br>
	</body>
</html>
