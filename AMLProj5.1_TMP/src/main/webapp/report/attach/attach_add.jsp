<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post"
			action="/t07_alert_attach/t07_alert_attach_add.do"
			enctype="multipart/form-data">
			<html:hidden property="alertkey" />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>附件管理</span>
						<span class="buttons">						  
					        <a href="#"
							      onclick="dosubmit('t07_alert_attach_list.do','add');">
							     <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />返 回</a> 
					    </span>
					</div>
					<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									上传文件：
								</td>
								<td>
									<html:file property="filename" />
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="button" value="上  传" name="Button23222"
										class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/t07_alert_attach/t07_alert_attach_add_do.do');" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</html:form>
	</body>
</html>
