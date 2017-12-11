<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=GBK" />
<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
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
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

</script>
</head>
<body >
<html:form method="post" action="/alert_search/t07_alert_disp.do">

<html:errors/>
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
		<span>预警编号: <bean:write property="alertkey" name="t07_alert" /></span>
		<span class="buttons">
		<a href="#" onclick='history.go(-1)'><img src="../../images/blue/b_back.png" />返 回</a></span>
	</div>
     
 <!-- table content -->
	<div class="cond_c" >
		<table  border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td colspan="4" align="left">
              <b>预警信息:</b></td>
            </tr>
             <tr>
              <td>客户号：</td>
              <td><bean:write property="objkey" name="t07_alert" /></td>
              <td>客户名称：</td>
              <td><bean:write property="objname" name="t07_alert" /></td>
            </tr>
          <tr>
              <td>机构号：</td>
              <td> <bean:write property="organkey" name="t07_alert" /></td>
            <td>机构名称：</td>
              <td><bean:write property="organname" name="t07_alert"/></td>
            </tr>  
            <tr>
              <td>预警日期：</td>
              <td><bean:write property="alert_dt_disp" name="t07_alert" /></td>
              <td>产生日期：</td>
              <td><bean:write property="create_dt_disp" name="t07_alert" />
              </td>
            </tr><%--
            <tr>
              <td><%=com.ist.util.Constans.ALERT_NAME %>金额：</td>
              <td> <bean:write property="amount_string"  name="t07_alert" /></td>
              <td></td>
              <td></td>
            </tr>
             
            --%><tr>
              <td>人行规则描述：</td>
              <td colspan="3"><bean:write property="pbcname"  name="t07_alert" /></td>
	        </tr>
	        <tr>
              <td>系统规则描述：</td>
              <td colspan="3"><bean:write property="sysname"  name="t07_alert" /></td>
	        </tr>
                    
          </table>
          </div>
          </div>
          <!-- list --> 
  <div class="list">
	<table width="98%" border=0  cellpadding="2" cellspacing="1">
    <tr> 
       <td colspan="10" align="left">
       <b>指标信息:</b></td>
     </tr>
    <tr>
      <th>指标名称</th>
      <th>指标单位</th>
      <th>指标上限</th>
      <th>指标下限</th>
      <th>指标值</th>
      <!-- <td width="11%"  nowrap>指标得分</td> -->
    </tr>
    <logic:iterate id="alert" name="getT07_alert_indicList" type="com.ist.aml.report.dto.T07_alert">
<tr>  
      <td><bean:write name="alert" property="indicname" scope="page"/></td>
      <td><bean:write name="alert" property="unit" scope="page"/></td>
      <td><bean:write name="alert" property="upper_limit" scope="page"/></td>
	  <td><bean:write name="alert" property="low_limit" scope="page"/></td>
	  <td><bean:write name="alert" property="indic_val" scope="page"/></td>	  
	   <!-- <td><bean:write name="alert" property="indic_score" scope="page"/></td> -->
    </tr>  
</logic:iterate>
   </table>
   </div>  
          
          
          <div class="list"><div> 
		</div><table border="0" cellpadding="0" cellspacing="0">
    <tr> 
       <td colspan="9"  align="left"> 
       <b>交易信息:</b>
       </td>
         <td><%--
         <input type="button" value="更 多" class="in_button1" 
         onclick="window.open('t07_alert_trans.do?newsearchflag=1&alertkey=<bean:write property="alertkey" name="t07_alert" />','enter2','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=yes');")/> 
       --%></td>
     </tr>
    <tr>
      <th>流水号</th>
      <th>客户号</th>
      <th>客户名称</th>
      <th>交易时间</th>
       <th>机构号</th>
      <th>机构名称</th>
      <th>账户</th>
      <th>币种</th>      
      <th>交易金额</th>
      <th>借/贷</th>
	  <th>交易类型</th>
    </tr>
  
    <logic:iterate id="trans" name="getT07_alert_transList" type="com.ist.aml.report.dto.T47_transaction">
   <tr align="center" bgcolor="#FFFFFF">  
   
      <td height="22">
     <a href="#"
            onclick="_Open('../../inves/trade/t47_transaction_disp.do?casesearchtime=<bean:write name="alertsearchtime"/>&transactionkey=<%=trans.getTransactionkey()%>')">
									<bean:write name="trans" property="tx_no" scope="page" />
			</a></td>
      <td height="22"><bean:write name="trans" property="party_id" scope="page"/></td>
      <td><bean:write name="trans" property="party_chn_name" scope="page"/></td>
      <td><bean:write name="trans" property="tx_dt_disp" scope="page"/></td>
      <td><bean:write name="trans" property="organkey" scope="page"/></td>
      <td><bean:write name="trans" property="organName" scope="page"/></td>
	  <td><bean:write name="trans" property="acct_num" scope="page"/></td>
      <td><bean:write name="trans" property="currency_cd_disp" scope="page"/></td>
	  <td><bean:write name="trans" property="amt_disp" scope="page"/></td>
	  <td><bean:write name="trans" property="debit_credit_disp" scope="page"/></td>
      <td><bean:write name="trans" property="tx_type_cd_disp" scope="page"/></td>
    </tr> 
    
</logic:iterate>
</table> 
</div>
<div class="list_page">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
    </div>
 

</html:form>
</body>
</html>