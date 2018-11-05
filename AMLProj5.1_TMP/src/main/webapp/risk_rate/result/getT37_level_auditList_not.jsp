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
	<html:form method="post" action="/result/getT37_level_auditList_not.do">
	<div class="list">
	<TABLE border="0" cellspacing="0" cellpadding="0">
		
			<tr>
				<th align="center" height="22">
					员工号
				</th>
				<th align="center" >
					风险等级
				</th>
				<th align="center" >
					提交人员
				</th>
				<th align="center" >
					提交日期
				</th>
				<th align="center" >
					审核人员
				</th>
				<th align="center" >
					审核日期
				</th>
				<th align="center" >
					审批人员
				</th>
				<th align="center" >
					审批日期
				</th>
			</tr>
			<logic:present name="t37_level_auditLists">
			
				<logic:iterate id="result" name="t37_level_auditLists"
					type="com.ist.aml.risk_rate.dto.T37_party_result">
					<tr>
						<td align="center"  height="22">
							<bean:write name="result" property="party_id" />
						</td>
						<td align="center" >
							<bean:write name="result" property="levelkey" />
						</td>
						<td align="center" >
							<bean:write name="result" property="audit_user" />
						</td>
						<td align="center" >
							<bean:write name="result" property="audit_dt" format="yyyy-MM-dd"/>
						</td>
						<td align="center" >
							<bean:write name="result" property="check_user" />
						</td>
						<td align="center" >
							<bean:write name="result" property="check_dt" format="yyyy-MM-dd"/>
						</td>
						<td align="center"  >
							<bean:write name="result" property="rcheck_user" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="check_dt" format="yyyy-MM-dd"/>
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

