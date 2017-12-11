<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl,type){
	if(type == 'All')
	{
		alert("Are you sure to delete all this alert?");
		if(getLength(document.forms[0].dealadvise.value) == 0)
		{
     		alert("预警处理意见不能为空");
     		return false;
     	}
	}
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _submit(type,id){
   document.forms[0].action="t47_risk_client_modify.do?party_id="+id+"&party_class_cd="+type;
   document.forms[0].submit();
}

function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

</script>
	</head>
	<body>
		<html:form method="post" action="/t27_alert/alert_delete.do">
			<input type="hidden" name="alertkey"
				value="<bean:write name="alertkey"/>" />
			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>预警编号: <bean:write property="alertkey"
							name="t27_alert" />
					</span>
					<span class="buttons"> 
					<a href="#" onclick='dosubmit("alert_deleteAll.do","All")'><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />整体排除</a>
					<a href="#" onclick='dosubmit("t27_alert_list.do","back")'><img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />返 回</a>
					</span>
				</div>

				<!-- table content -->
				<div class="cond_c">
					<table border="0" cellspacing="0" cellpadding="0" >
					
					<tr>
						<td>
							预警状态：
						</td>
						<td>
							<bean:write name="t27_alert" property="alert_status_cd_disp" />
						</td>
						<td>
							预警日期：
						</td>
						<td>
							<bean:write name="t27_alert" property="alert_dt_disp" />
						</td>
					</tr>
					<tr>
						<td>
							预警金额：
						</td>
						<td>
							<bean:write name="t27_alert" property="trans_amt_string" />
						</td>
						<td>
							交易笔数： 
						</td>
						<td>
							<bean:write name="t27_alert" property="trans_num" />
						</td>
					</tr>
					<tr>
						<td>
							预警规则:
						</td>
						<td>
							<bean:write name="t27_alert" property="pbc_des" />
						</td>
					</tr>
					
					<tr>
						<td>
							处理意见：
						</td>
						<td>
							<html:textarea property="dealadvise" cols="49" rows="3">
										<bean:write name="t27_alert" property="dealadvise" />
							</html:textarea>
						</td>
					</tr>
					</table>
				</div>
				
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="4" align="left">
								<b><strong><img
											src="../../images/<%=session.getAttribute("style")%>/titleicon02.gif" />客户信息:</strong>
								</b>
							</td>
						</tr>
						<tr>
							<th>
								客户号
							</th>
							<th>
								客户姓名
							</th>
							<th>
								客户类型(对公对私)
							</th>
							<th>
								操作
							</th>
						</tr>
						<logic:iterate id="t27_alert" name="t27_partyList"
							type="com.ist.aml.rule.dto.T27_alert">
							<tr>
								<td>
									<a href="#"
										onclick="_submit('<bean:write name="t27_alert" property="obj_class_cd" ignore="true"/>','<bean:write name="t27_alert" property="objkey" ignore="true"/>')">
										<bean:write name="t27_alert" property="objkey" ignore="true" />
									</a>
								</td>

								<td>
									<bean:write name="t27_alert" property="objname" scope="page" />
								</td>

								<td>
									<bean:write name="t27_alert" property="obj_class_cd_disp" scope="page" />
								</td>
								
								<td>
								<logic:equal name="t27_alert" property="alert_party_status_cd" value="1">
									 <a href="#"
										onclick="dosubmit('party_status_modify.do?type=1&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&alert_party_status_cd=<bean:write property="alert_party_status_cd" name="t27_alert" />')">
										排除
									 </a>
								</logic:equal>
								
								<logic:equal name="t27_alert" property="alert_party_status_cd" value="3">
									 <a href="#"
										onclick="dosubmit('party_status_modify.do?type=1&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&alert_party_status_cd=<bean:write property="alert_party_status_cd" name="t27_alert" />')">
										恢复
									 </a>
								</logic:equal>
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>


				<div class="list">
					<table width="98%" border=0 cellpadding="2" cellspacing="1">
						<tr>
							<td colspan="10" align="left">
								<b><strong><img
											src="../../images/<%=session.getAttribute("style")%>/titleicon02.gif" />账户信息列表:</strong>
								</b>
							</td>
						</tr>
						<tr>
							<th>
								账户号
							</th>
							<th>
								客户姓名
							</th>
							<th>
								开户机构
							</th>
							<th>
								操作
							</th>
						</tr>
						<logic:iterate id="t27_alert" name="t27_acctList"
							type="com.ist.aml.rule.dto.T27_alert">
							<tr>
								<td>
									<bean:write name="t27_alert" property="acct_num" scope="page" />
								</td>
								<td>
									<bean:write name="t27_alert" property="objname" scope="page" />
								</td>
								<td>
									<bean:write name="t27_alert" property="organname_acct" scope="page" />
								</td>
								<td>
								<logic:equal name="t27_alert" property="alert_acct_status_cd" value="1">
									 <a href="#"
										onclick="dosubmit('acct_status_modify.do?type=1&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&alert_acct_status_cd=<bean:write property="alert_acct_status_cd" name="t27_alert" />')">
										排除
									 </a>
								</logic:equal>
								
								<logic:equal name="t27_alert" property="alert_acct_status_cd" value="3">
									 <a href="#"
										onclick="dosubmit('acct_status_modify.do?type=1&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&alert_acct_status_cd=<bean:write property="alert_acct_status_cd" name="t27_alert" />')">
										恢复
									 </a>
								</logic:equal>
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>


				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="9" align="left">
								<b><strong><img
											src="../../images/<%=session.getAttribute("style")%>/titleicon02.gif" />交易信息列表</strong>
								</b>
							</td>
						</tr>
						<tr>
							<th>
								业务标示
							</th>
							<th>
								客户名称
							</th>
							<th>
								交易时间
							</th>
							<th>
								交易机构
							</th>
							<th>
								账户
							</th>
							<th>
								交易金额
							</th>
							<th>
								操作
							</th>
						</tr>
						<logic:iterate id="t27_alert" name="t27_transList"
							type="com.ist.aml.rule.dto.T27_alert">
							<tr>
								<td>
									<bean:write name="t27_alert" property="transactionkey" />
								</td>

								<td>
									<bean:write name="t27_alert" property="objname" scope="page" />
								</td>

								<td>
									<bean:write name="t27_alert" property="tx_dt_disp" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="organname_trans" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="acct_num" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="amount_trans_string" scope="page" />
								</td>
								
								<td>
								<logic:equal name="t27_alert" property="alert_trans_status_cd" value="1">
									 <a href="#"
										onclick="dosubmit('trans_status_modify.do?type=1&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&transactionkey=<bean:write property="transactionkey" name="t27_alert" />&alert_trans_status_cd=<bean:write property="alert_trans_status_cd" name="t27_alert" />')">
										排除
									 </a>
								</logic:equal>
								
								<logic:equal name="t27_alert" property="alert_trans_status_cd" value="3">
									 <a href="#"
										onclick="dosubmit('trans_status_modify.do?type=1&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&transactionkey=<bean:write property="transactionkey" name="t27_alert" />&alert_trans_status_cd=<bean:write property="alert_trans_status_cd" name="t27_alert" />')">
										恢复
									 </a>
								</logic:equal>
								</td>

							</tr>
						</logic:iterate>
						
						<tr>
								<td>
								</td>
							</tr>
							
					</table>
				</div>
		</html:form>
	</body>
</html>
