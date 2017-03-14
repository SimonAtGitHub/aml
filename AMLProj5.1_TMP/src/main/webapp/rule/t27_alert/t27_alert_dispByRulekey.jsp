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
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _submit(type,id){
   document.forms[0].action="t47_risk_client_modify.do?party_id="+id+"&party_class_cd="+type;
   document.forms[0].submit();
}

function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}

</script>
	</head>
	<body>
	<div id="main">
		<html:form method="post" action="/t27_alert/t27_alert_disp.do">
			<input type="hidden" name="alertkey" value="<bean:write name="alertkey"/>" />
			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
						<span> 预警详情 </span>
						<span class="buttons"> 
							<a href="#" onClick="dosubmit('t27_alert_listByRulekey.do')"><img src="../../images/blue/b_back.png" />返 回</a>
						</span>
			    </div>
				<div class="cond_c3">
				  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
				    <tr>
			        <td>
					<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />基本信息</strong></span>
					</td>
					</tr>
				  </table>
				 </div>  

				<!-- table content -->
				<div class="cond_c2">
					<table border="0" cellspacing="0" cellpadding="0" >
					
					<tr>
						<td>
							预警编号：
						</td>
						<td>
							<bean:write name="t27_alert" property="alertkey" />
						</td>
						<td>
							预警对象：
						</td>
						<td>
							<bean:write name="t27_alert" property="objname" />
						</td>
					</tr>
					<tr>
						<td>
							币种：
						</td>
						<td>
							<bean:write name="t27_alert" property="curr_cd_disp" />
						</td>
						<td>
							预警日期： 
						</td>
						<td>
							<bean:write name="t27_alert" property="alert_dt_disp" />
						</td>
					</tr>
					</table>
				</div>
				
				
				<div class="cond_c3">
				  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
				    <tr>
			        <td>
					<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />客户信息</strong></span>
					</td>
					</tr>
				  </table>
				 </div>  
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						
						<tr>
							<th>
								客户号
							</th>
							<th>
								客户名称
							</th>
							<th>
								客户类型
							</th>
						</tr>
						<logic:iterate id="t27_alert" name="t27_partyList"
							type="com.ist.aml.rule.dto.T27_alert">
							<tr>
								<td>
								 <a href="#"
									onclick="_open('../../report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="t27_alert" property="objkey"/>&party_class_cd=<bean:write name="t27_alert" property="obj_class_cd"/>');return false">
									<bean:write name="t27_alert" property="objkey" ignore="true" />
								 </a>
								</td>

								<td>
									<bean:write name="t27_alert" property="objname" scope="page" />
								</td>

								<td>
									<bean:write name="t27_alert" property="obj_class_cd_disp" scope="page" />
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>

                <div class="cond_c3">
				  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
				    <tr>
			        <td>
					<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />账户信息</strong></span>
					</td>
					</tr>
				  </table>
				 </div>  
				<div class="list">
					<table width="98%" border=0 cellpadding="2" cellspacing="1">
						
						<tr>
							<th>
								账户号
							</th>
							<th>
								账户名称
							</th>
							<th>
								开户机构
							</th>
							<th>
								账户类型
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
									<bean:write name="t27_alert" property="acct_type_cd_disp" scope="page" />
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>

                 <div class="cond_c3">
				  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
				    <tr>
			        <td>
					<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />交易信息</strong></span>
					</td>
					</tr>
				  </table>
				 </div>  
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						
						<tr>
							<th>
								业务标示
							</th>
							<th>
								客户号
							</th>
							<th>
								客户名称
							</th>
							<th>
								交易日期
							</th>
							<th>
								交易机构
							</th>
							<th>
								账户
							</th>
							<th>
								币种
							</th>
							<th>
								交易金额
							</th>
							<th>
								借/贷
							</th>
							<th>
								现/转
							</th>
							<th>
								状态
							</th>
						</tr>
						<logic:iterate id="t27_alert" name="t27_transList"
							type="com.ist.aml.rule.dto.T27_alert">
							<tr>
								<td>
									<a href="#"
									
									onclick=" _open('../../inves/trade/t47_transaction_disp.do?transactionkey=<%=t27_alert.getTransactionkey()%>');return false">
									<bean:write name="t27_alert" property="transactionkey" />
									
								</td>
								
								<td>
									<bean:write name="t27_alert" property="objkey" scope="page" />
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
									<bean:write name="t27_alert" property="currency_cd_disp" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="amount_trans_string" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="debit_credit_disp" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="cash_trans_flag_disp" scope="page" />
								</td>
								
								<td>
									<bean:write name="t27_alert" property="alert_trans_status_cd_disp" scope="page" />
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>
				</div>
		</html:form>
		</div>
	</body>
</html>
