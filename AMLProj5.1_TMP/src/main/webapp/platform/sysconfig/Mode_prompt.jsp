<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></script>

	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;   
   document.forms[0].submit();
}


</SCRIPT>

</HEAD>

<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/platform/sysconfig/runningmode.do" method="post">
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%">
							<span class="awp_title_td2">系统配置 - 运行模式显示</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input" onclick="dosubmit('mode_config_modify.do')" />
						</td>
					</tr>
				</table>
			</div>

			<div class="awp_detail">
				<table>
					<tr>
						<td>
							系统当前运行模式为：
						</td>
						<td>
							<%--<html:text property="audit_monitor" styleClass="text_white" size="15"/>--%>
							<bean:write name="t00_system_param" property="audit_monitor"
								scope="request" />
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>

