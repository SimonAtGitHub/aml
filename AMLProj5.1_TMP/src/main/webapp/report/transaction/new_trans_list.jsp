<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
        <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
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

function dosubmit1(theUrl){

var errMsg = "";
	//if(getLength(document.forms[0].amt_start_search.value)>0||getLength(document.forms[0].amt_end_search.value)>0){
	
	//if(!checkNum(document.forms[0].amt_start_search.value)){
	//	errMsg+="交易金额必须为数字！";
   //     document.forms[0].amt_start_search.focus();
        
	//}else if(!checkNum(document.forms[0].amt_end_search.value)){
	//	errMsg+="折人民币金额必须为数字！";
    //    document.forms[0].amt_end_search.focus();
        
	//}
	//
	//}
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

     _Date1 = document.forms[0].tx_dt_disp.value;
     _Date2 = document.forms[0].tx_enddt_disp.value;  
     if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
     if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;
	 if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！"; 
   if(!_compareTwoDateForString(document.forms[0].tx_dt_disp.value, document.forms[0].tx_enddt_disp.value)) {
   document.forms[0].tx_dt_disp.focus();
	 errMsg = "开始时间不能大于结束时间";		    
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
function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            isSub = true;
        }
        else if(type=='del'){
            
            if(errMsg==''){
                if(confirm('你真的要删除该交易吗？')){
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

function SelectOrgS(){
  showx = event.screenX - event.offsetX/2; // + deltaX;
    showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 120;
    showy = 120;
    retval = window.showModalDialog("/inves/trade/t47_party_search.do", "", "dialogWidth:800px;dialogHeight:600px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; ");


	if (retval != null)
	{
     
       // document.frm.orgName.value = retval.orgName;      
       	//document.frm.ORGID.value = retval.orgId;  
        
	}
}
</script>

	</head>
	<body >
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="main">
			<html:form action="/transaction/new_trans_list.do" method="post">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 添加交易 </span>
						<span class="buttons"> <!--<a href=" #"
							onclick="dosubmit('new_trans.do','add')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> -->
							<a href=" #"
							onclick="dosubmit('<%=request.getContextPath()%>/report/transaction/new_trans_new.do?caseType=3','add')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> </span>
								
					</div>
					<html:errors />
					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									交易起止日期：
								</td>
								<td>
								 <html:text property="tx_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> －
								 <html:text property="tx_enddt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />		
								</td>
								<td>
									交易账户：
								</td>
								<td>
									<html:text property="acct_num" maxlength="50"/>
								</td>
							</tr>
							<tr>
								<td>
									交易金额：
								</td>
								<td>
									<html:text property="amt_start_search" size="10" maxlength="10" />
									－
									<html:text property="amt_end_search" size="10" maxlength="10"/>
									(折人民币)
								</td>
								<td>
									交易机构号：
								</td>
								<td>
									<html:text property="organkey" onblur="_Onblur('organName')" size="8" maxlength="50"/>

									<html:text property="organName" readonly="true" size="20"/>
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								
								</td>
							</tr>
							<tr>

								<td>
									客户类型：
								</td>
								<td>
									<bean:define id="party_class_str" name="party_class_str"></bean:define> <%=party_class_str%>
								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" maxlength="50"
										onblur="_Onblur('party_chn_name')" size="8"/>
									<html:text property="party_chn_name" readonly="true"  size="20"/>
									 	<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>


							<tr>
								<td>
									借贷标志：
								</td>
								<td>
									<bean:define id="debit_credit_str" name="debit_credit_str"></bean:define> <%=debit_credit_str%>
								</td>
								<td>
									本外币标志：
								</td>
								<td>
									<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define> <%=curr_cd_str%>
								</td>
							</tr>

							<tr>
								<!--<td>
									 是否计算：
								</td> -->
								<!--<td>
									<html:select property="cal_ind" style="width:100x" >
                      <html:options collection="cal_indMap" property="label" labelProperty="value" />
                    </html:select>
								</td>-->
								<td>
									排序：
								</td>
								<td>
									<div>
										<html:select property="orderby">
											<html:options collection="tradesortMap" property="label"
												labelProperty="value" />
										</html:select>
										&nbsp;
										<html:radio property="order" value="1" />
										升序
										<html:radio property="order" value="2" />
										降序
										<html:hidden property="searchtype" />
										
									</div>
								</td>
								<td colspan="1"  class="in_button">
								<input type="button" name="ok" value="查 询" class="input"
								onclick="dosubmit1('<%=request.getContextPath()%>/report/transaction/new_trans_list.do?newsearchflag=1');"/></td>
								


							</tr>

						</table>

					</div>
				</div>
				<div class="list">
					<table border=0 cellpadding="0" cellspacing="0">
						<tr>
							<th>
								业务标识
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
								操作
							</th>
						<!-- 	<th>
								交易类型
							</th>  -->
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
									<td height=22>
										<a href="<%=request.getContextPath()%>/report/transaction/new_trans_modify.do?transactionkey=<bean:write name="transaction" property="transactionkey" />"><bean:write name="transaction" property="transactionkey" /></a>
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
										<bean:write name="transaction" property="debit_credit_disp" />
									</td>
									<td>
										<a href="#" onclick="dosubmit('new_trans_delete.do?transactionkey=<bean:write name="transaction" property="transactionkey" />','del')">
										<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
									</td>
									<!--  <td>
										<bean:write name="transaction" property="tx_type_cd_disp" />
									</td>-->

								</tr>
							</logic:iterate>
						</logic:present>
					</table>
					
					
					</div>
					
					 <div class="list_page">
						 <logic:present name="pageInfo" scope="request"> 
							<bean:write name="pageInfo" scope="request" filter="false" />
						</logic:present>
					</div>
					
			</html:form>
		</div>
	</body>
</html>