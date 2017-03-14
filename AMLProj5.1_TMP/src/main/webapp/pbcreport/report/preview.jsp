<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">

</script>
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

.STYLE2 {
	color: #000000
}
-->
</style>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/report/preview.do" method="post">

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><%=com.ist.util.Constans.REPORT_NAME%>管理 - 报文预览</span>
						<span class="buttons"> <a href="#"
							onclick="javascript:window.close();return false;"><img
									src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>&nbsp;&nbsp; <!-- <html:button property="b2" value="关 闭" styleClass="input" onclick="window.close()"/> -->
						</span>
					</div>
				</div>
				<logic:notEqual name="resultdisp" value="">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<bean:write name="resultdisp" scope="request" filter="false" />
							</td>
						</tr>
					</table>
				</logic:notEqual>
				<logic:equal name="resultdisp" value="">
					<textarea cols=110 rows=100 name=a2
						style="background-color: ECF3FF; overflow: auto; font-size: 9pt; line-height: 130%">
 <bean:write name="out" filter="false" />
</textarea>
				</logic:equal>
			</html:form>
		</div>
	</body>
</html>
