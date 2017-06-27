<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">


function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function Export(theUrl)
{
	<logic:present name="t47_transactionList">
    <bean:size id="len" name="t47_transactionList" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		return false;
		</logic:equal>
    </logic:present>

    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function dosubmit(theUrl){
var errMsg = "";
    _Date1 = document.forms[0].tx_dt_disp.value;
    _Date2 = document.forms[0].tx_enddt_disp.value;
    
    if(_Date1 == '' && _Date2 == ''){
        errMsg += "交易起止日期不能为空！";
    }      
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	  
  			 if(errMsg!=''){
     alert(errMsg);
      return false; 
  }
   errMsg = DateDiff(_Date1,_Date2,183);
   if(errMsg!=''){
      alert(errMsg);
      bool = false;
      return false;
   }
   if(document.forms[0].party_id.value ==""){
		errMsg+="请选择客户进行查询！";
        document.forms[0].party_id.focus();
	}
	if(!checkFloat(document.forms[0].amt_start_search.value)){
		errMsg+="金额必须为数字！";
        document.forms[0].amt_start_search.focus();
	}
		if(!checkFloat(document.forms[0].amt_end_search.value)){
		errMsg+="金额必须为数字！";
        document.forms[0].amt_end_search.focus();
	}
	if(document.forms[0].amt_end_search.value !="" ){
	if(parseFloat(document.forms[0].amt_end_search.value) < parseFloat(document.forms[0].amt_start_search.value)){
		document.forms[0].amt_end_search.focus();
		errMsg = "起止交易金额不能大于最大交易金额";
     }
	}

	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmits(theUrl)
{
	document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}


   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}


</script>
	</head>
	<body class="mainbg">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="main">
			<html:form action="/blacklist/t52_remount_trans_list.do" method="post">
				<html:errors />
				<%-- <input type="hidden" name="bus_type_cd"
					value="<bean:write name="bus_type_cd"/>" /> --%>
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>
						所有交易
					</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1">
							<a href="#" onclick="dosubmits('t52_b_remout_list.do')">
							<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回
							</a>
						</span>
					</div>
					
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								流水号
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
								现/转标志
							</th>
							<th>
								筛选标志
							</th>
							<th>银行卡类型</th>							
							<th>银行卡卡号</th>									
						</tr>
						<logic:present name="t52_remount_transList" scope="request">
							<logic:iterate id="transaction" indexId="i"
								name="t52_remount_transList"
								type="com.ist.aml.blacklist.dto.T52_def_remount">
								<%
									java.util.HashMap map = new java.util.HashMap();
														map
																.put("deposit_id", transaction
																		.getAcct_num());
														String url = "/inves/trade/t47_transaction_list.do?searchtype="
																+ request.getParameter("searchtype");
														map.put("url", url);
														map.put("party_id", transaction.getParty_id());
														map.put("intPage", request
																.getParameter("intPage"));
														//map.put("deposit_id", transaction.getAcct_num());
														pageContext.setAttribute("map", map,
																PageContext.PAGE_SCOPE);
								%>
								<tr align="center" class="interval"
									onmouseover="this.className='interval2'"
									onmouseout="this.className='interval'">
									<td>
										<a href="#"
											onclick="_Open('./t47_transaction_disp.do?transactionkey=<bean:write name="transaction" property="transactionkey" />&tableName=ls')">
											<bean:write name="transaction" property="tx_no" /> </a>
									</td>
									<td>
										<bean:write name="transaction" property="host_cust_id" />
									</td>
									<td>
										<bean:write name="transaction" property="party_chn_name" />
									</td>
									<td>
										<bean:write name="transaction" property="tx_dt_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="organkey" />
									</td>
									<td>
										<bean:write name="transaction" property="acct_num" />
									</td>
									<td>
										<bean:write name="transaction" property="currency_cd_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="amt_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="debit_credit_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="cash_trans_flag_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="validate_flag_disp" />
									</td>
									<!-- add zhaowei start -->
									 <td><bean:write name="transaction" property="card_styleDisp" /></td>
									<td><bean:write name="transaction" property="card_no" /></td>
									<!-- add zhaowei end -->									
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>