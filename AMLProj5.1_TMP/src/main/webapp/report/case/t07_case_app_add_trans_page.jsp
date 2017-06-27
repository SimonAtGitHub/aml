
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">

function selectAll(obj){

    if(document.forms[0].transactionkeyCheckBox!=null){
    if(obj.innerHTML=="全选"){
   
        obj.innerHTML="全不选"
		if(document.forms[0].transactionkeyCheckBox.value!=""){
                document.forms[0].transactionkeyCheckBox.checked=true;
    	}
        if(document.forms[0].transactionkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].transactionkeyCheckBox.length; i++ ){
             document.forms[0].transactionkeyCheckBox[i].checked=true;
        }
    }
    else{
	    obj.innerHTML="全选"
	    if(document.forms[0].transactionkeyCheckBox.value!="")
                document.forms[0].transactionkeyCheckBox.checked=false;
        if(document.forms[0].transactionkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].transactionkeyCheckBox.length; i++ )
	             document.forms[0].transactionkeyCheckBox[i].checked=false;
    }
  }
    else{
        alert("对不起！没有可选的项.");
    }
}
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

function dosubmit(theUrl){
var errMsg = "";
    _Date1 = document.forms[0].tx_dt_disp.value;
    _Date2 = document.forms[0].tx_enddt_disp.value;  
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

function dosubmitt(theUrl,type){
		
        var errMsg = "";
      
       if(type=='add'){
       		errMsg=CheckBoxMustChecked(document.forms[0]);
            
        }
        if( errMsg==''){
            document.forms[0].action=theUrl;
            document.forms[0].submit();
        }else{
            
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

function quit()
{
		window.close();
		opener.location.href='<%=request.getContextPath()%>/report/case/t07_case_app_add_trans.do';
		
}

</script>
</head>

<body class="mainbg">
	<html:form action="/case/t07_case_app_add_trans_page.do" method="post">
		<input type="hidden" name="bus_type_cd"
			value="<bean:write name="bus_type_cd"/>" />
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
<div class="cond_t">
	  <span>新建案例  - 添加交易 (请新增案例完成后到交易补录里补录)</span>
	   <span class="buttons">
	   <img src="../../images/blue/b_checkall.png" /><a href="#" onclick="selectAll(this)">全选</a>
	   <a href="#" onclick="dosubmitt('<%=request.getContextPath() %>/report/case/t07_case_app_add_trans_page_add.do?type=add','add')"><img src="../../images/blue/b_add2.png" />添加</a>
	   <a href="#" onclick="quit()"><img src="../../images/blue/b_save.png" />保存退出</a>	   	
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					交易起止日期：
				</td>
				<td>
			
			<html:text property="tx_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --   
			<html:text property="tx_enddt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />	
				</td>
				<td>
					交易账户：
				</td>
				<td>
					<html:text property="acct_num" styleClass="text_white"
						size="24" />
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
						size="10" onblur="" />

					<html:text property="organName" styleClass="text_white"
						size="23" readonly="true" maxlength="10" />
					 	<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
				
				</td>
			</tr>
			<tr>
				<td>
					业务标识编号：
				</td>
				<td>
					<html:text property="transactionkey" styleClass="text_white"
						size="18" />
				</td>
				<td>
					客户号：
				</td>
				<td>
					<html:text property="party_id"
						 onblur="" readonly="true" />
						 <!-- add ljd start -->
						 <html:hidden property="stcr" />
						  <!-- add ljd end -->
					<!--<html:text property="party_chn_name" styleClass="text_white"
						size="23" readonly="true" />
					 	<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
					-->
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
					借贷标志：
				</td>
				<td>
					<bean:define id="debit_credit_disp_str" name="debit_credit_disp_str"></bean:define><%=debit_credit_disp_str %>
				</td>
			</tr>
			<!-- ljd注释<logic:equal property="searchtype" value="overarea"
				name="t47_transactionActionForm">
				<html:hidden property="overarea_ind" />
			</logic:equal>
			--><tr>
				<%-- <td width="14%" height="22" align="right" bgcolor="ECF3FF">
					是否计算：
				</td>
				<td width="25%" align="left" bgcolor="F6F9FF">
					<html:select property="cal_ind" style="width:100x">
						<html:options collection="cal_indMap" property="label"
							labelProperty="value" />
					</html:select>
				</td>--%>
				<td>
					对手客户类型：
				</td>
				<td>
				<bean:define id="opp_party_class_cd_str" name="opp_party_class_cd_str"></bean:define><%=opp_party_class_cd_str %>
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
			<tr>
			<!--add ljd start overarea_ind-->
			
				<td>
				是否跨境：
				</td>
				<td>
					<bean:define id="overarea_ind_str" name="overarea_ind_str"></bean:define><%=overarea_ind_str %>
				</td>
				<!--add ljd end-->
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
				<!-- ljd add start -->
						<input type="button" name="ok" value="查 询" class="in_button1"
						onClick="dosubmit('<%=request.getContextPath()%>/report/case/t07_case_app_add_trans_page_query.do?newsearchflag=1')" />
					<!-- ljd add end -->
				</td>
			</tr>
		</table>
	</div>
  </div>
<html:errors />
<!-- list --> 
  <div class="list">
		<TABLE border="0" cellspacing="0" cellpadding="0">
			<TR>
				<TH>
					选择
				</TH>
				<TH>
					流水号
				</TH>
				<TH>
					客户号
				</TH>
				<TH>
					客户名称
				</TH>
				<TH>
					交易日期
				</TH>

				<TH>
					交易机构
				</TH>
				<TH>
					账户
				</TH>
				<TH>
					币种
				</TH>
				<TH>
					交易金额
				</TH>
				<TH>
					借/贷
				</TH>
				<TH>
					现/转标志
				</TH>
				<TH>
					筛选标志
				</TH>
			</TR>
			<logic:present name="t47_transactionList" scope="request">
				<logic:iterate id="transaction" indexId="i"
					name="t47_transactionList"
					type="com.ist.aml.report.dto.T47_transaction">
					<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("deposit_id", transaction.getAcct_num());
								String url = "/inves/trade/t47_transaction_list.do?searchtype="
								+ request.getParameter("searchtype");
								map.put("url", url);
								map.put("party_id", transaction.getParty_id());
								map.put("intPage", request.getParameter("intPage"));
								//map.put("deposit_id", transaction.getAcct_num());
								pageContext
								.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
					<TR align="center" class="interval"
						onMouseOver="this.className='interval2'"
						onMouseOut="this.className='interval'">
						<TD>
							<html:multibox property="transactionkeyCheckBox">
								<bean:write name="transaction" property="transactionkey" />
							</html:multibox>
							
						</TD>
						<TD>
							<a href="#"
								onclick="_Open('<%=request.getContextPath() %>/inves/trade/t47_transaction_disp.do?transactionkey=<bean:write name="transaction" property="transactionkey" />&tableName=ls')">
								<bean:write name="transaction" property="tx_no" /> </a>
						</TD>
						<TD>
							<bean:write name="transaction" property="host_cust_id" />
						</TD>
						<TD>
							<bean:write name="transaction" property="party_chn_name" />
						</TD>
						<TD>
							<bean:write name="transaction" property="tx_dt_disp" />
						</TD>

						<TD>
							<bean:write name="transaction" property="organkey" />
						</TD>
						<TD>
								<bean:write name="transaction" property="acct_num" />
						</TD>

						<TD>
							<bean:write name="transaction" property="currency_cd_disp" />
						</TD>
						<TD>
							<bean:write name="transaction" property="amt_disp" />
						</TD>

						<TD>
							<bean:write name="transaction" property="debit_credit_disp" />
						</TD>
						<TD>
							<bean:write name="transaction" property="cash_trans_flag_disp" />
						</TD>
						<TD>
							<bean:write name="transaction" property="validate_flag_disp" />
						</TD>
					</TR>
				</logic:iterate>
			</logic:present>
		</TABLE>
	</div>
<!-- list_page --> 
  <div class="list_page">
		<bean:write name="pageInfo" scope="request" filter="false" />
	</div>
<!-- all end -->   
</div>
	</html:form>
</body>
</html>
