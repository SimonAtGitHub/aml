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
    
    var purpose = "";
    var objs = document.getElementsByName("searchPurpose");    
	for(var i=0;i<objs.length;i++)   
	{   
		  if(objs[i].checked)   
		  {   
			   if(objs[i].value=="1")   
			  {   
			   purpose = "1";  
			  }   
			  if(objs[i].value=="2")   
			   {   
			   purpose = "2";
			  }   
		}   
	}   
    
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
  if(purpose == "1"){
    errMsg = DateDiff(_Date1,_Date2,183);
  }
   if(errMsg!=''){
      alert(errMsg);
      bool = false;
      return false;
   }
   if(document.forms[0].party_id.value =="" && purpose == "1"){
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
			<html:form action="/trade/t47_transaction_search.do" method="post">
				<html:errors />
				<input type="hidden" name="bus_type_cd"
					value="<bean:write name="bus_type_cd"/>" />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><logic:equal property="searchtype"
								name="t47_transactionActionForm" value="all">
						所有交易
					</logic:equal> <logic:equal property="searchtype"
								name="t47_transactionActionForm" value="cash">
						现金交易
					</logic:equal> <logic:equal property="searchtype"
								name="t47_transactionActionForm" value="trans">
						转账交易
					</logic:equal> <logic:equal property="searchtype"
								name="t47_transactionActionForm" value="overarea">
						跨境交易
					</logic:equal> <logic:equal property="bus_type_cd"
								name="t47_transactionActionForm" value="1">
						限额交易
					</logic:equal> <logic:equal property="bus_type_cd"
								name="t47_transactionActionForm" value="2">
						定额交易
					</logic:equal> <logic:equal property="bus_type_cd"
								name="t47_transactionActionForm" value="3">
						大额交易
					</logic:equal> <logic:equal property="bus_type_cd"
								name="t47_transactionActionForm" value="4">
						信用卡交易
					</logic:equal> <logic:equal property="bus_type_cd"
								name="t47_transactionActionForm" value="5">
						网银交易
					</logic:equal> </span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1">
								<a href="#" onclick="Export('t47_transaction_excel_xls.do');"><img
										src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a> <!--<html:button property="button1" value="导出Excel"
						onclick="dosubmit('t47_transaction_excel.do')" /> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<font color="red">*</font>交易起止日期：
								</td>
								<td>
							    <html:text property="tx_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
								<html:text property="tx_enddt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								<td>
									交易账户：
								</td>
								<td>
									<html:text property="acct_num" styleClass="text_white"
										size="24" maxlength="50"/>
								</td>
							</tr>
							<tr>
								<td>
									交易金额：
								</td>
								<td>
									<html:text property="amt_start_search" styleClass="text_white"
										size="12" maxlength="10" />
									－
									<html:text property="amt_end_search" styleClass="text_white"
										size="12" maxlength="10" />
									(折人民币)
								</td>
								<td>
									交易机构号：
								</td>
								<td>
									<html:text property="organkey" styleClass="text_white"
										size="10" onblur="_Onblur('organName')" maxlength="50"/>

									<html:text property="organName" styleClass="text_white"
										size="23" readonly="true" maxlength="10" />
									 	<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
								 
								<td>
									<font color="red">*</font>客户：
								</td>
								<td>
									<html:text property="party_id" styleClass="text_white"
										size="10" onblur="_Onblur('party_chn_name')" maxlength="50"/>
									<html:text property="party_chn_name" styleClass="text_white"
										size="23" readonly="true" />
									 	<a href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								
								</td>
								<td>
									交易渠道：
								</td>
								<td>
									<html:select property="channel" style="width:100px">
										<html:options collection="channelMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>

							<logic:equal property="searchtype"
								name="t47_transactionActionForm" value="all" scope="request">
								<tr>
									<td>
										客户类型：
									</td>
									<td>
										<bean:define id="party_class_cd_str" name="party_class_cd_str"></bean:define><%=party_class_cd_str %>
									</td>
									<td>
										本外币标志：
									</td>
									<td>
										<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define><%=curr_cd_str %>
									</td>
								</tr>
							</logic:equal>

							<tr>
								<td>
									对手客户类型：
								</td>
								<td>
									<bean:define id="opp_party_class_cd_str" name="opp_party_class_cd_str"></bean:define><%=opp_party_class_cd_str %>
								</td>
								<td>
									借贷标志：
								</td>
								<td>
									<bean:define id="debit_credit_disp_str" name="debit_credit_disp_str"></bean:define><%=debit_credit_disp_str %>
								</td>
							</tr>
							<logic:equal property="searchtype" value="overarea"
								name="t47_transactionActionForm">
								<html:hidden property="overarea_ind" />
							</logic:equal>
							<tr>
								<%-- <td width="14%" height="22" align="right" bgcolor="ECF3FF">
					是否计算：
				</td>
				<td width="25%" align="left" bgcolor="F6F9FF">
					<html:select property="cal_ind" style="width:100x">
						<html:options collection="cal_indMap" property="label"
							labelProperty="value" />
					</html:select>
				</td>--%>
								<logic:equal property="searchtype"
									name="t47_transactionActionForm" value="all" scope="request">
									<td>
										现转标记：
									</td>
									<td>
										<bean:define id="cash_trans_flag_str" name="cash_trans_flag_str"></bean:define><%=cash_trans_flag_str %>
									</td>
								</logic:equal>
								<logic:equal property="searchtype" value="cash"
									name="t47_transactionActionForm">
									<td>
										现转标记：
									</td>
									<td>
										<html:select property="cash_trans_flag_disp" disabled="true">
											<html:option value="1">现金</html:option>
										</html:select>
										<html:hidden property="cash_trans_flag_disp" value="1" />
									</td>
								</logic:equal>
								<logic:equal property="searchtype" value="trans"
									name="t47_transactionActionForm">
									<td>
										现转标记：
									</td>
									<td>
										<html:select property="cash_trans_flag_disp" disabled="true">
											<html:option value="2">转账</html:option>
										</html:select>
										<html:hidden property="cash_trans_flag_disp" value="2" />
									</td>
								</logic:equal>
								<logic:equal property="searchtype"
									name="t47_transactionActionForm" value="overarea"
									scope="request">
									<td>
										现转标记：
									</td>
									<td>
										<html:select property="cash_trans_flag_disp"
											style="width:100x">
											<html:options collection="goflagMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</logic:equal>
								<logic:notEqual property="bus_type_cd"
									name="t47_transactionActionForm" value="" scope="request">
									<td>
										现转标记：
									</td>
									<td>
										<html:select property="cash_trans_flag_disp"
											style="width:100x">
											<html:options collection="goflagMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</logic:notEqual>
							 
								<td>
									排序：
								</td>
								<td>
									<html:select property="orderby" style="width:110">
										<html:options collection="tradesortMap" property="label"
											labelProperty="value" />
									</html:select>
									&nbsp;
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
								</td>
							</tr>
							<tr>
								<td>
									查询目的：
								</td>
								<td>
									<html:radio property="searchPurpose" value="1" />
									普通查询
									<html:radio property="searchPurpose" value="2" />
									回溯性查询
									&nbsp;&nbsp;&nbsp;&nbsp;
									涉恐名单更新日期：
									<html:text property="terr_update_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<html:hidden property="searchtype" />
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/inves/trade/t47_transaction_list.do?newsearchflag=1')" />
								</td>
							</tr>
							
						</table>
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
						</tr>
						<logic:present name="t47_transactionList" scope="request">
							<logic:iterate id="transaction" indexId="i"
								name="t47_transactionList"
								type="com.ist.aml.report.dto.T47_transaction">
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