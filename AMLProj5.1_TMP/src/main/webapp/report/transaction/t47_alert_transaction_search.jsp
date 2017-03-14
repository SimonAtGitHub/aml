<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<SCRIPT LANGUAGE="JavaScript">
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}
function dosubmit(theUrl,type){
var errMsg = "";
var searchtype=document.forms[0].searchtype.value;
	if(document.forms[0].amt_end_search.value !="" ){
	if(parseFloat(document.forms[0].amt_end_search.value) < parseFloat(document.forms[0].amt_start_search.value)){
		document.forms[0].amt_end_search.focus();
		errMsg = "开始交易金额不能大于结束交易金额！";
}
	}
	if(searchtype!="today"){
   if(!_compareTwoDateForString(document.forms[0].tx_dt_search_disp.value, document.forms[0].tx_enddt_search_disp.value)) {
   document.forms[0].tx_dt_search_disp.focus();
	 errMsg = "开始时间不能大于结束时间";		    
		   }
		   } 
	 if(type=='search'){
	     _Date1 = document.forms[0].tx_dt_search_disp.value;
         _Date2 = document.forms[0].tx_enddt_search_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	
	 }
	 if(errMsg=='')
     {
         document.forms[0].action=theUrl;
         if(jQuery('#form0').validateAll()){
		          document.forms[0].submit()
		         }
     }else{
         if(errMsg!='')
             alert(errMsg);
         return false;
     }
   event.srcElement.disabled = true;
}
function  _Opendailog1(url,type){
 
     if(type=='option'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            
                isSub = true;
           
        }
    }
	 if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
    if(isSub && errMsg==''){
       
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
	 var errMsg = "";
    var isSub = false;
	var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "ff","dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");

  
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }

function $getSelectedIds(){
	return $getSelectedValues("selectedid");
}	
function $getSelectedValues(fieldName){
   	var checks=document.getElementsByName(fieldName);
   	var ret=new Array();
   	var i;
   	for (i=0 ; i<checks.length; i++){   	
   		if (checks[i].checked)
   			ret =ret.concat(checks[i].value);
   	}
   	
   	return ret;
}

function modify(theUrl, id){

	var form=document.forms[0];
	var ids=$getSelectedIds();
	if (ids.length == 0){
		alert("请选择修改的信息！");
		return false;
	} else if(ids.length > 1){
        alert("只能选择一条进行修改！");
        return false;
	}
	if (!id)
		id=ids[0];
	  document.form1.action=url;
	
	  // form.modifydp_info.value=modifydp_info;
	  // document.forms[0].action=renderParsToUrl("investigate_modify_do.do" , modifydp_info);
	   document.forms[0].submit();	
}
function dosubmitt(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('你真的要删除选择调查信息吗？')){
                    isSub = true;
                }
            }
        }
          else if(type=='delcheck'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('你真的要删除选择检查点内容吗？')){
                    isSub = true;
                }
            }
        }
        else if(type=='search' || type=='add'){
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
   
   
    url=url+".do?newsearchflag=1";
    alert(url);
    window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
    //window.open(url);
      
}

function _openTrade(url){
 
   window.open(url,'','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
 // window.open(url);
      
}


</script>

	</head>
	<body  class="mainbg">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/transaction/t47_alert_transaction_list.do" method="post" styleId="form0">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 
						   <strong>
						       <font color="0072BC">
						           <logic:equal
										property="searchtype" name="t47_transactionActionForm"
										value="all">
										所有补录交易
									</logic:equal> 
									<logic:equal property="searchtype"
													name="t47_transactionActionForm" value="today">
										一次交易补录
									</logic:equal> 
									<logic:equal property="searchtype"
													name="t47_transactionActionForm" value="complete">
										已补录的交易
									</logic:equal>
						        </font> 
						    </strong>
						</span>
						<span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	   </span>
					    <logic:equal name="t47_transaction" property="searchtype"
								value="all">
						<span class="buttons">
								<html:button property="button1" styleClass="input"
									value="导出Excel"
									onclick="dosubmit('t47_alert_transaction_excel.do')" />
						</span>
					    </logic:equal> 
						<logic:equal name="t47_transaction" property="searchtype"
								value="today_">
						  <span class="buttons">
								<html:button property="button1" styleClass="input"
									value="导出Excel"
									onclick="dosubmit('t47_alert_transaction_excel.do')" />
						  </span>
					   </logic:equal> &nbsp; 
					   
					</div>
					<!-- table content -->
					<div class="cond_c"   id="searchtable"> 
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<logic:equal property="searchtype" value="today" name="t47_transactionActionForm">
									<td>
										交易起止日期：
									</td>
									<td>	
									<html:text property="tx_dt_search_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg"  /> --
                               		<html:text property="tx_enddt_search_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg"  />
									</td>
								</logic:equal>
								<td>
									原客户号：
								</td>
								<td>
									<html:text property="host_cust_id" styleClass="text_white" size="24" require="false" datatype="safeString|limit_max" max="24" msg="请输入合法的客户id|不能超过24个字符" />
								</td>
							</tr>
							<html:hidden property="tx_today_disp" />
							<tr>
								<logic:equal property="searchtype" value="today"
									name="t47_transactionActionForm">
									<td>
										是否已补录：
									</td>
									<td>
										<bean:define id="yesNo_str" name="yesNo_str"></bean:define>
				            			<%=yesNo_str%>
									</td>
								</logic:equal>
								<td>
									交易账户：
								</td>
								<td>
									<html:text property="acct_num_search" styleClass="text_white" size="24" 
									require="false" datatype="safeString|limit_max" max="64" msg="请输入合法的交易账户|不能超过64个字符" />
								</td>
							</tr>
							<tr>
								<td>
									交易金额：
								</td>
								<td>
									<html:text property="amt_start_search" styleClass="text_white"
										size="12" require="flase" datatype="double|limit_max" msg="格式不正确！|长度不能超过20位！" max="20" />
									－
									<html:text property="amt_end_search" styleClass="text_white"
										size="12" require="flase" datatype="double|limit_max" msg="格式不正确！|长度不能超过20位！" max="20" />
									(折人民币)
								</td>
								<td>
									交易机构：
								</td>
								<td>

									<html:text property="organkey_search" styleClass="text_white"
										size="10" onblur="_Onblur('organName')" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字"/>
									<html:text property="organName" styleClass="text_white"
										size="23" readonly="true" maxlength="10" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey_search&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
								<td>
									现转标记：
								</td>
								<td>
									<bean:define id="goflag_str" name="goflag_str"></bean:define>
				            		<%=goflag_str%>
								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id_search" styleClass="text_white"
										size="10" onblur="_Onblur('party_chn_name_disp')" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的客户id|不能超过32个字符" />
									<html:text property="party_chn_name_disp"
										styleClass="text_white" size="23" maxlength="10"
										readonly="true" />
 				<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id_search&input_name_disp=party_chn_name_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
								<td>
									本外币：
								</td>
								<td>
									<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define>
				            		<%=curr_cd_str%>
								</td>
								
								<td>
									客户类型：
								</td>
								<td>
									<bean:define id="clienttype_str" name="clienttype_str"></bean:define>
				            			<%=clienttype_str%>
								</td>
								
							</tr>
							<tr>
								<logic:notEqual property="searchtype" value="all"
									name="t47_transactionActionForm">
									<td>
										借贷标志：
									</td>
									<td>
										<bean:define id="trackflag_str" name="trackflag_str"></bean:define>
				            			<%=trackflag_str%>
									</td>
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
										降序&nbsp;&nbsp;&nbsp;&nbsp;
										<html:hidden property="searchtype" />
										<input type="button" name="ok" value="查 询" class="in_button1" 
											onclick="dosubmit('<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?newsearchflag=1','search')" />
									</td>
								</logic:notEqual>

							</tr>
							<html:hidden property="re_ind_search" />

							
							<logic:equal property="searchtype" value="all"
								name="t47_transactionActionForm">
								<tr>
									<td>
										交易流水号
									</td>
									<td>
										<html:text property="tx_no" styleClass="text_white" size="24"
											maxlength="24" />
									</td>

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
										降序&nbsp;&nbsp;&nbsp;&nbsp;
										<html:hidden property="searchtype" />
									</td>
								</tr>
								<!-- add by lkl -->
								<tr>
									<td>
										柜员号
									</td>
									<td>
										<html:text property="teller" styleClass="text_white" size="24"
											maxlength="24" />
									</td>

									<td></td>
									<td>
										<input type="button" name="ok" value="查 询" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?newsearchflag=1','search')" />
									</td>
								</tr>

								<!-- end -->
							</logic:equal>

						</table>
					</div>
				</div>
				<html:errors />
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								流水号
							</th>
							<th>
								原客户号
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
								金额(折人民币)
							</th>
							<th>
								传票号
							</th>
							<th>
								借/贷
							</th>
							<th>
								现转标记
							</th>
							<!--  <th>
								操作
							</th>
							-->
						</tr>
						<logic:present name="t47_transactionList" scope="request">
							<logic:iterate id="transaction" indexId="i"
								name="t47_transactionList"
								type="com.ist.aml.report.dto.T47_transaction">

								<tr>
									<td>
									
										<a	href="<%=request.getContextPath()%>/report/case/t47_transaction_modify.do?tableName=t47_transaction_ub&type=1&url=<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?searchtype=<bean:write name="t47_transactionActionForm" property="searchtype" />&transactionkey=<bean:write name="transaction" property="transactionkey" />&currency_cd=<bean:write name="transaction" property="currency_cd" />">
										<bean:write name="transaction" property="tx_no" />
										</a>
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
										<bean:write name="transaction" property="organName" />
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
										<bean:write name="transaction" property="cny_amtDisp" />
									</td>
									<td>
										<bean:write name="transaction" property="voucher_no" />
									</td>
									<td>
										<bean:write name="transaction" property="debit_credit_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="cash_trans_flag_disp" />
									</td>


								<!-- 	<td>



										<a	href="<%=request.getContextPath()%>/report/case/t47_transaction_modify.do?tableName=t47_transaction_ub&type=1&url=<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?searchtype=<bean:write name="t47_transactionActionForm" property="searchtype" />&transactionkey=<bean:write name="transaction" property="transactionkey" />&currency_cd=<bean:write name="transaction" property="currency_cd" />">
											<%
												String addtional = transaction.getAddtional();

																	if (addtional != null && addtional.equals("1")) {
											%> 修 改 <%
												} else {
											%> <font color="#FF0000"> 补录 </font> <%	}
 											%> </a>


									</td>
 								-->


								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />

				</div>
			</div>
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</body>
</html>
