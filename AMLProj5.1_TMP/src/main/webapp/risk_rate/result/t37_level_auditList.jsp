<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	<script language="JavaScript">
function dosubmit(theUrl){ 
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</script>
</HEAD>

<BODY leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
	<html:form method="post" action="/result/getT37_level_auditList.do">
	<div class="list">
	<TABLE border="0" cellspacing="0" cellpadding="0">
		
			<tr>
				<th align="center" height="22">
					编号
				</th>
				<th align="center" >
					调整时间
				</th>
				<th align="center" >
					处理意见
				</th>
				<th align="center" >
					调整前风险等级
				</th>
				<th align="center" >
					调整后风险等级
				</th>
				<th align="center" >
					提交岗位
				</th>
				<th align="center" >
					接收岗位
				</th>
				<th align="center" >
					调整人
				</th>
				<th align="center">
					<a href="#" onclick="dosubmit('getT37_level_auditList_export.do?party_id=<%=session.getAttribute("party_id")%>')" >
					<img src="../../images/blue/b_export.png" />导出评级台账</a>
				</th>
			</tr>
			<logic:present name="t37_level_auditList">
			
				<logic:iterate id="result" name="t37_level_auditList"
					type="com.ist.aml.risk_rate.dto.T37_level_audit">
					<tr>
						<td align="center"  height="22">
							<bean:write name="result" property="audit_no" />
						</td>
						<td align="center" >
							<bean:write name="result" property="last_upd_dt_disp" />
						</td>
						<td align="center" >
							<bean:write name="result" property="adjust_reason" />
						</td>
						<td align="center" >
							<bean:write name="result" property="level_before_adjust" />
						</td>
						<td align="center" >
							<bean:write name="result" property="level_after_adjust" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="post_id" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="res_post_id" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="last_upd_user" />
						</td>			
					</tr>
				</logic:iterate>
			</logic:present>
		</TABLE>
		
</div>
<!-- list_page --> 
	<div class="list_page">
		<logic:present name="pageInfo">
			<table width="98%" align="center" border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
		</logic:present>
	</div>
	</html:form>
	</div>
</BODY>
</html:html>

