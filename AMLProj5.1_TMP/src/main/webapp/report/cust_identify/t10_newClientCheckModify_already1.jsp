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
	<html:form method="post" action="/cust_identify/new_client_investigation_view_t.do">
	<div class="list">
	<TABLE border="0" cellspacing="0" cellpadding="0">
		
			<tr>
				<th align="center" height="22">
					客户号
				</th>
				<th align="center" >
					客户名称
				</th>
				<th align="center" >
					客户类型
				</th>
				<th align="center" >
					识别具体时间
				</th>
				<th align="center" >
					操作员
				</th>
			</tr>
			<logic:present name="relist">
			
				<logic:iterate id="t10_newClientCheck" name="relist"
					type="com.ist.aml.cust_identify.dto.T10_newClientCheck">
					
					<tr>
						<td align="center"  height="22">
							<bean:write name="t10_newClientCheck" property="party_id" />
						</td>
						<td align="center" >
							<bean:write name="t10_newClientCheck" property="party_chn_name" />
						</td>
						<td align="center" >
							<bean:write name="t10_newClientCheck" property="party_class_cd" />
						</td>
						<td align="center" >
							<bean:write name="t10_newClientCheck" property="check_dt" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td align="center" >
							<bean:write name="t10_newClientCheck" property="checker" />
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</TABLE>
		
</div>
<!-- list_page  
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
	</div> --> 
	</html:form>
	</div>
</BODY>
</html:html>

