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
function dosubmit111(theUrl){
	var errMsg = "";
	var kytz=document.getElementsByName("list2")[0];
	
	selectAllOptions(document.forms[0].list2);
	if(kytz.length>3){
        errMsg ="可疑特征不能大于三个";             
	}
	else if(kytz.length==0){
		errMsg = "可疑特征不能为空！";
	}
	
	var actiondescrip=document.forms[0].action_descrip.value;
    if(!checkNullAndLen(actiondescrip,0,500)){
        errMsg = "可疑行为描述不能为空且长度不能多于500个字符,250个汉字！";
        document.forms[0].action_descrip.focus();
    }
    if(!checkNullAndLen(document.forms[0].take_action.value,0,500)){
        errMsg = "采取措施不能为空且长度不能多于128个字符,64个汉字！";
        document.forms[0].take_action.focus();
    }
    
    if (errMsg != "") {
        alert(errMsg);
        return false;
    	}
    else
			{
			   
			   document.forms[0].action=theUrl;
			   document.forms[0].submit();
			}
}
function dosubmit(theUrl,type){
	if(type == 'All')
	{
		var dealadvise=document.forms[0].dealadvise.value;
		if(getLength(dealadvise) == 0)
		{
     		alert("处理意见不能为空!");
     		return false;
     	}
     	if(getLength(dealadvise) > 800){
     	    alert("处理意见内容过多!");
     		return false;
     	}
	}
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmit1(theUrl){
	document.forms[0].action=theUrl;
	document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

</script>
	</head>
	<body>
		<html:form method="post" action="/t27_alert/t27_alert_mod.do">
		<!-- <input type="hidden" name="alertkey  value="<%=request.getAttribute("alertkey")%>" />  -->
		<input type="hidden" name="alertkey"  value="<bean:write property="alertkey" name="t27_alert" />" />
			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>预警编号： <bean:write property="alertkey" name="t27_alert" /></span>
					<span class="buttons">
					<a href="#" onclick='dosubmit1("t27_alert_submit_do.do?searchtype=1")'><img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />提交预警</a>
					<a href="#" onclick='dosubmit("alert_deleteAll.do","All")'>
					
					<logic:equal name="t27_alert" property="alert_status_cd" value="1">
					<img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />整体排除</a>
					<a href="#" onclick='dosubmit("alert_deleteAll.do","All")'>
					</logic:equal>
					<!-- <img src="../../images/<%=session.getAttribute("style") %>/b_recovery.png" />整体恢复</a>
					<a href="#" onclick='dosubmit("alert_recoverAll.do","All")'>
					 -->
					<a href="#" onclick='dosubmit1("t27_alert_list.do?searchtype=1")'><img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />返回</a> </span>
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
							预警规则：
						</td>
						<td>
							<bean:write name="t27_alert" property="pbc_des" />(系统规则:<bean:write name="t27_alert" property="rulekey" />)
						</td>
						<td>
							交易笔数： 
						</td>
						<td>
							<bean:write name="t27_alert" property="trans_num" />
						</td>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>处理意见：
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
											src="../../images/<%=session.getAttribute("style")%>/titleicon02.png" />客户信息:</strong>
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
									<bean:write name="t27_alert" property="objkey" ignore="true" />
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
										onclick="dosubmit1('party_status_modify.do?type=2&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&alert_party_status_cd=<bean:write property="alert_party_status_cd" name="t27_alert" />')">
										排除
									 </a>
								</logic:equal>
								
								<logic:equal name="t27_alert" property="alert_party_status_cd" value="4">
									 <a href="#"
										onclick="dosubmit1('party_status_modify.do?type=2&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&alert_party_status_cd=<bean:write property="alert_party_status_cd" name="t27_alert" />')">
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
											src="../../images/<%=session.getAttribute("style")%>/titleicon02.png" />账户信息列表:</strong>
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
										onclick="dosubmit1('acct_status_modify.do?type=2&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&alert_acct_status_cd=<bean:write property="alert_acct_status_cd" name="t27_alert" />')">
										排除
									 </a>
								</logic:equal>
								
								<logic:equal name="t27_alert" property="alert_acct_status_cd" value="4">
									 <a href="#"
										onclick="dosubmit1('acct_status_modify.do?type=2&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&alert_acct_status_cd=<bean:write property="alert_acct_status_cd" name="t27_alert" />')">
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
											src="../../images/<%=session.getAttribute("style")%>/titleicon02.png" />交易信息列表</strong>
								</b>
							</td>
						</tr>
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
								操作
							</th>
						</tr>
						<logic:iterate id="t27_alert" name="t27_transList"
							type="com.ist.aml.rule.dto.T27_alert">
							<tr>
								
								<td>
									<a href="#"
									onclick=" _Open('../../inves/trade/t47_transaction_disp.do?transactionkey=<%=t27_alert.getTransactionkey()%>');return false">
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
								<logic:equal name="t27_alert" property="alert_trans_status_cd" value="1">
									 <a href="#"
										onclick="dosubmit1('trans_status_modify.do?type=2&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&transactionkey=<bean:write property="transactionkey" name="t27_alert" />&alert_trans_status_cd=<bean:write property="alert_trans_status_cd" name="t27_alert" />')">
										排除
									 </a>
								</logic:equal>
								
								<logic:equal name="t27_alert" property="alert_trans_status_cd" value="4">
									 <a href="#"
										onclick="dosubmit1('trans_status_modify.do?type=2&alertkey=<bean:write property="alertkey" name="t27_alert"/>&objkey=<bean:write property="objkey" name="t27_alert" />&acct_num=<bean:write property="acct_num" name="t27_alert" />&transactionkey=<bean:write property="transactionkey" name="t27_alert" />&alert_trans_status_cd=<bean:write property="alert_trans_status_cd" name="t27_alert" />')">
										恢复
									 </a>
								</logic:equal>
								</td>

							</tr>
						</logic:iterate>
				</table>
				</div>	
					<!--
						<div class="conditions" style="overflow-x:auto;">			
			<div class="cond_t">
		  		<span>特征信息</span>
			</div>	
    
  		<div class="cond_c2">
      	<table>
         
			<tr>
			  <td nowrap="nowrap"><font color="red">*</font>可疑特征：</td>
              <td colspan='3'>
             <bean:write name="multiSeHTMLStr" filter="false"/>
			 </td>
            </tr>
			<tr>
			  <td nowrap="nowrap">可疑程度：</td>
              <td>
              <html:select property="alert_level">
              <html:options collection="ssdgMap" property="label" labelProperty="value"/>
              </html:select>
              <font color="#FF0000"> *</font>
              </td>
              
            </tr>
            <tr> 
              <td>采取措施：</td>
              <td><html:textarea property="take_action" rows="4" cols="40"></html:textarea><font color="#FF0000"> *</font>
			  </td>
			  <td nowrap="nowrap">可疑行为描述：</td>
              <td ><html:textarea property="action_descrip" rows="4" cols="30"></html:textarea><font color="#FF0000"> *</font>
			  </td>
			  </tr>
			  <tr><td colspan='4'></td></tr>
			  		
          </table>
          </div>
         
						<tr>
								<td>
								</td>
								<td align="right">
									<input type="button" class="in_button1" value="提 交"
										onclick="dosubmit('<%=request.getContextPath()%>/t27_rule/t27_alert/case_application_add_do.do')" />
								</td>
							</tr> -->
							
					</table>
				</div>
		</html:form>
	</body>
</html>
