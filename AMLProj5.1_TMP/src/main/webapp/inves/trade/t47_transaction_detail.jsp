<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/title.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        for (i=0;i<document.all.length ;i++ )
           {
             e=document.all[i];
             if(e.type=="text"){
                 var textname=e.name;
                 var obj=eval('document.forms[0].'+textname);
                
                // alert(textname+obj.disabled);
                 if(obj.disabled=="true"){
                    obj.disabled=false;
                 }
             }
           
            }

        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form method="post" action="/trade/t47_transaction_disp.do">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>交易 - 交易明细</span>
						<span class="buttons"> <a href="#"
							onclick="window.close();"><img
									src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a> <!-- <html:button property="backbutton" value="关 闭" styleClass="input" onclick="javascript:window.close()"/> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									流水号：
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_no" />
								</td>
								<td>
									对方是否我行客户：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_isparty_flag" />
								</td>
							</tr>
							<tr>
								<td>
									交易机构：
								</td>
								<td>
									<bean:write name="t47_transaction" property="organName" />
								</td>
								<td>
									对方银行名称：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_organname" />
								</td>
							</tr>
							<tr>
								<td>
									交易日期：
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_dt_disp" />
								</td>
								<td>
									对方交易日期：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_tx_dt_disp" />
								</td>
							</tr>

							<tr>
								<td>
									我行账号：
								</td>
								<td>
									<bean:write name="t47_transaction" property="acct_num" />
								</td>
								<td>
									对方账号：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_acct_num" />
								</td>
							</tr>
							<tr>
								<td>
									我行账户类型：
								</td>
								<td>
									<bean:write name="t47_transaction" property="acct_type_string" />
								</td>
								<td>
									对方账户类型：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="opp_acct_type_cd_string" />
								</td>
							</tr>
							<tr>
								<td>
									我行客户号：
								</td>
								<td>
									<bean:write name="t47_transaction" property="party_id" />
								</td>
								<td>
									对方客户号：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_party_id" />
								</td>
							</tr>

							<tr>
								<td>
									客户名称：
								</td>
								<td>
									<bean:write name="t47_transaction" property="party_chn_name" />
								</td>
								<td>
									对方名称：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_name" />
								</td>
							</tr>
							<tr>
								<td>
									客户类型：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="party_class_cd_flag" />
								</td>
								<td>
									对方客户类型：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="opp_party_class_cd_falg" />
								</td>
							</tr>

							<tr>
								<td>
									科目：
								</td>
								<td>
									<bean:write name="t47_transaction" property="subjectno" />
									--
									<bean:write name="t47_transaction" property="subjectname" />
								</td>
								<td>
									对方证件号码：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_card_no" />
								</td>
							</tr>
							<tr>
								<td>
									收付标志：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="receive_pay_cd_flag" />
								</td>
								<td>
									对方证件类型：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="opp_Card_type_flag" />
								</td>
							</tr>
							<tr>
								<td>
									汇款标志：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="remit_type_cd_flag" />
								</td>
								<td>
									批量标志：
								</td>
								<td>
									<bean:write name="t47_transaction" property="batch_ind_flag" />
								</td>
							</tr>
							<tr>
								<td>
									现/转标志：
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="cash_trans_flag_disp" />
								</td>
								<td>
									抹账标志：
								</td>
								<td>
									<bean:write name="t47_transaction" property="cancel_ind_disp" />
								</td>
							</tr>
							<tr>
								<td>
									交易代码：
								</td>
								<td>
									<bean:write name="t47_transaction" property="cb_tx_cd" />
									--
									<bean:write name="t47_transaction" property="cb_tx_cd_name" />
								</td>
								<td>
									是否跨境交易：
								</td>
								<td>
									<bean:write name="t47_transaction" property="overarea_ind_flag" />
								</td>
							</tr>
							<tr>
								<td>
									借贷标志：
								</td>
								<td>
									<bean:write name="t47_transaction" property="debit_credit_disp" />
								</td>
								<td>
									结算方式：
								</td>
								<td>
									<bean:write name="t47_transaction" property="settle_type_cd" />
								</td>
							</tr>
							<tr>
								<td>
									币种：
								</td>
								<td>
									<bean:write name="t47_transaction" property="currency_cd_disp" />
								</td>
								<td>
									用途：
								</td>
								<td>
									<bean:write name="t47_transaction" property="use_des" />
								</td>
							</tr>
							<tr>
								<td>
									原币交易金额：
								</td>
								<td>
									<bean:write name="t47_transaction" property="amt_string" />
								</td>
							
								<td>
									摘要：
								</td>
								<td>
									<bean:write name="t47_transaction" property="des" />
								</td>
							</tr>
							<tr>
								<td>
									交易发生地：
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_occur_disp" />
								</td>
								<td>
									交易方向：
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_go_disp" />
								</td>
							</tr>
							<tr>
								<td>
									人民币：
								</td>
								<td>
									<bean:write name="t47_transaction" property="cny_amt_string" />
								</td>
								<td>
									柜员：
								</td>
								<td>
									<bean:write name="t47_transaction" property="teller" />
									<!----<bean:write name="t47_transaction" property="teller_disp" />-->
								</td>
							</tr>
							<tr>
								<td>
									折美元：
								</td>
								<td>
									<bean:write name="t47_transaction" property="usd_amt_string" />
								</td>
								<td>
									传票号：
								</td>
								<td>
									<bean:write name="t47_transaction" property="voucher_no" />
								</td>
							</tr>
								<tr>
								<td>
									对方网点代码：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_organkey" />
								</td>
								<td>
									对方网点行政区划：
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_area" />
								</td>
							</tr>
								<tr>
								<td>
									代办人姓名：
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_name" />
								</td>
								<td>
									代办人证件类型：
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_card_type" />
								</td>
							</tr>
								<tr>
								<td>
									代办人国籍：
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_country" />
								</td>
								<td>
									代办人证件号码：
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_card_no" />
								</td>
							</tr>
							<tr>
								<td>
									是否计算：
								</td>
								<td>
									<bean:write name="t47_transaction" property="cal_ind_disp" />
								</td>
								<td>
									交易时间：
								</td>
								<td>
									<bean:write name="t47_transaction" property="dt_time_disp" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</body>
</html>