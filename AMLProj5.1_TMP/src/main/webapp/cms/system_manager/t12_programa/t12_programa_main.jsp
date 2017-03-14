<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
  <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	
  </head>
  
  <body>
	<div id='content'>
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
							<td height="20" align="center">
								<strong><font size="5"></font>
								</strong>
							</td>
						</tr>
					</table>
					<table width="98%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center" valign="middle"><img src="<%=request.getContextPath()%>/images/stgl.gif"></td>
						</tr>
						<tr>
							<td width="100%" align="center"><span class="awp_main">欢迎使用栏目管理!</span></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>
