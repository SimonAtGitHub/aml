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
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function back(){
   document.forms[0].action= '<bean:write name="backUrl"/>';
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/calinfo/dm_task_log_info.do" method="post">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> DM计算管理 - 维护日记 </span>
						<span class="buttons"> <a href="#" onclick="back();"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> </span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<logic:iterate id="log" name="t18_task_logList"
							type="com.ist.platform.dto.T18_task_log">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										数据时间：
									</td>
									<td>
										<bean:write name="log" property="statisticdate_disp"
											scope="page" />
									</td>
									<td>
										机构：
									</td>
									<td>
										<bean:write name="log" property="organkey_disp" scope="page" />
									</td>
								</tr>
								<tr>
									<td>
										任务名称：
									</td>
									<td>
										<bean:write name="log" property="taskkey_disp" scope="page" />
									</td>
									<td>
										粒度：
									</td>
									<td>
										<bean:write name="log" property="granularity_disp"
											scope="page" />
									</td>
								</tr>
								<tr>
									<td>
										出错时间：
									</td>
									<td>
										<bean:write name="log" property="errdate_disp" scope="page" />
									</td>
									<td>
										处理时间：
									</td>
									<td>
										<bean:write name="log" property="notedate_disp" scope="page" />
									</td>
								</tr>
								<tr>
									<td>
										错误日志：
									</td>
									<td colspan="3">
										<bean:write name="log" property="errinfo" scope="page" />
									</td>
								</tr>
								<tr>
									<td>
										处理过程：
									</td>
									<td>
										<bean:write name="log" property="note" scope="page" />
									</td>
								</tr>
								<tr>
									<td>
										处理：
									</td>
									<td>
										<input type="button" value="编 辑" class="in_button1"
											onclick="dosubmit('dm_task_log_edit.do?logkey=<bean:write name="log" property="logkey"/>','back')" />
									</td>
								</tr>
							</table>
						</logic:iterate>
					</div>
				</div>
			</html:form>
		</div>
	</body>
</html>