<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">

		
function dosubmit(theUrl,type){
 var errMsg ="";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要排除选择的交易？')){
                isSub = true;
            }
        }
    }
    if(type=='search'){
     isSub = true;
    }

  if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Open(url){
 
  window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}


</script>

</head>
<body  class="mainbg">
<html:form action="/checkcase/case_transList1.do" method="post" >
<div id="main">
	<html:errors />
		<input type="hidden" name="application_num"
			value="<bean:write name="application_num"/>" />
			<input type="hidden" name="party_id"
			value="<bean:write name="party_id"/>" />
		<input type="hidden" name="casesearchtime"
			value="<%=(String)request.getAttribute("casesearchtime") %>" />
 <!-- list -->
   <div class="cond_t2">
	<span class="buttons">
	 <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />交易信息</strong>
	</span>
   </div>
   <div class="list">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th>业务标识</th>
          <th>客户号</th>
          <th>交易日期</th>
          <th>交易机构</th>
          <th>帐户</th>
        
          <th>币种</th>
          <th>交易金额</th>
          <th>借/贷</th>
          <th>交易类型</th>
         
        </tr>
			<logic:iterate id="trans" name="t47_transactionList"
				type="com.ist.aml.report.dto.T47_transaction">
              
			<tr align="center" class="interval" >
    
					<td >
					<a href="#" onclick="_Open('../../inves/trade/t47_transaction_disp.do?transactionkey=<bean:write name="trans" property="transactionkey"/>')">
							<bean:write name="trans" property="transactionkey" scope="page" /> 
					</a>	
					</td>
					
					<td>
						<bean:write name="trans" property="host_cust_id" scope="page" />
					</td>
					<!-- <td><bean:write name="trans" property="party_chn_name" scope="page"/></td> -->
					<td>
						<bean:write name="trans" property="tx_dt_disp" scope="page" />
					</td>
					<td>
						<bean:write name="trans" property="organName" scope="page" />
					</td>
					<td>
						<bean:write name="trans" property="acct_num" scope="page" />
					</td>
					<td>
						<bean:write name="trans" property="currency_cd_disp" scope="page" />
					</td>
					<td>
						<bean:write name="trans" property="amt_string" scope="page" />
					</td>
					<td>
						<bean:write name="trans" property="debit_credit_disp" scope="page" />
					</td>
					<td>
						<bean:write name="trans" property="tx_type_cd_disp" scope="page" />
					</td>
					
					
				</tr>
			</logic:iterate>
		 </table>
  </div>
 <!-- list_page --> 
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
<!-- all end -->   
</div>
</html:form>
  <script language="JavaScript">
      parent.document.all("iframe2").style.height=document.body.scrollHeight+20;  
		</script>

</body>
</html>
