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
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]--> 
<script language="JavaScript">
function _Onblur(){
   document.forms[0].searchOrganName.value="";
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
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

function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].app_dt_start_disp.value;
    _Date2 = document.forms[0].app_dt_end_disp.value;  
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
   errMsg = DateDiff(_Date1,_Date2,30);
   if(errMsg!=''){
      alert(errMsg);
      bool = false;
      return false;
   }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
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
function  _Disp(){
   var type=eval('document.forms[0].type');
   var tv = type.value;
   if(tv=="2"){
    document.getElementById("null1").style.display="none";
    document.getElementById("null2").style.display="none";
    document.getElementById("kind1").style.display="";
    document.getElementById("kind2").style.display="";
   } else {
     document.getElementById("null1").style.display="";
     document.getElementById("null2").style.display="";
     document.getElementById("kind1").style.display="none";
     document.getElementById("kind2").style.display="none";
     document.all.party_class_cd.value = "";
   }
}
var bool = true;
function toExcel(theUrl){
	<logic:present name="t47_transactionList">
    <bean:size id="len" name="t47_transactionList" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
    var _Date1 = document.forms[0].app_dt_start_disp.value;
    var _Date2 = document.forms[0].app_dt_end_disp.value;  
    if(_Date1=="" || _Date2==""){
    	alert("导出时请填写交易日期，相差时间不能超过30天！");
    	bool = false;
    	return false;
    }
   	if(!formatDateAlert(_Date1) || !formatDateAlert(_Date2)){
   		bool = false;
   		return false;
   	}
   	if(!_compareTwoDateForString(_Date1, _Date2)){
   		alert("开始时间不能大于结束时间！");
   		bool = false;
   		return false;
   	}
   	var errMsg = DateDiff(_Date1,_Date2,30);
    if(errMsg!=''){
    	alert(errMsg);
    	bool = false;
    	return false;
    }
	if(!bool || s_date != _Date1 || e_date != _Date2){
		alert("请查询！");
		return false;
	}
	document.forms[0].action=theUrl;
    document.forms[0].submit();
}
var s_date = "";
var e_date = "";
function initDate(){
  	s_date = document.forms[0].app_dt_start_disp.value;
  	e_date = document.forms[0].app_dt_end_disp.value;
}
</script>
		<%
			String caseseachtime = (String) request
					.getAttribute("caseseachtime");
			session.removeAttribute("caseseachtime");
			session.setAttribute("caseseachtime", caseseachtime);
		%>
</head>
<body  onload="initDate()" class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
<div id="main">
	<html:form action="/reportsearch_ms/t07_reportsearch_bs.do"
		method="post">

<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
		<span>大额交易查询</span>
		<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
			<a href="#" onclick="toExcel('export_trans_bh.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
			<!-- <input type="button" name="upload" value="导出Excel" class="input" onclick="toExcel();" /> -->
		</span>
	</div>
	<!-- table content -->
	<div class="cond_c" id="searchtable">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					交易日期：
				</td>
				<td>
				 
				  <html:text  property="app_dt_start_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                <html:text   property="app_dt_end_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								
				</td>
				<td>
					客户号：
				</td>
				<td>
					<html:text property="party_id" styleClass="text_white" size="10" maxlength="60"
										/>
				   <html:text property="party_name" readonly="true" styleClass="text_white" size="23" maxlength="60"/>
 				<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
						
				</td>
			</tr>
			<tr>
				<td>
					报送机构：
				</td>
				<td>
					<html:text property="app_org_id" styleClass="text_white"
										  size="10" maxlength="60"/>
					<html:text property="app_org_name" styleClass="text_white"
										  readonly="true" size="23" maxlength="60" />
					<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=app_org_id&input_name_disp=app_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				</td>
				 <td>
					账号：
				</td>
				<td>
					<html:text property="acct_num" />
				</td>
			</tr>
 
			<tr>
				
				<td>
					币种：
				</td>
				<td>
					<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define><%=curr_cd_str %>
				</td>
				<td>
					<%=com.ist.util.Constans.ALERT_NAME%>编号：
				</td>
				<td>
					<html:text property="stcrkey"  size="18" maxlength="10" />
				</td>
			</tr>
			<!-- add by wwy -->
			<tr>
				 <td>
					报送状态：
				</td>
				<td>
					<bean:define id="casesearchtime_str" name="casesearchtime_str"></bean:define><%=casesearchtime_str %>
				</td>
				<td>
					排序：
				</td>
				<td>
					<html:select property="orderby">
						<html:options collection="casesorderMap" property="label"
							labelProperty="value" />
					</html:select>
					<html:radio property="order" value="1" />
					升序
					<html:radio property="order" value="2" />
					降序 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" name="ok" value="查 询" class="in_button1"
						onclick="dosubmit('t07_reportsearch_bh.do?newsearchflag=1','search')" />
				</td>
			</tr>
		</table>
		</div>
	</div>
<html:errors />
<!-- list --> 
  <div class="list">
		<table border=0 cellpadding="0" cellspacing="0">
			<tr>
				<th>
					交易日期
				</th>
				<th>
					大额特征
				</th>
				<th>
					报送机构
				</th>
				<th>
					客户号
				</th>
				<th>
					客户名称
				</th>
				<th>
					账号
				</th>
				<th>
					收付标志
				</th>
				<th>
					币种
				</th>
				<th>
					交易金额
				</th>
				<th>
					资金来源和用途
				</th>
				<th>
					对手名称
				</th>
				<th>
					对手账号
				</th>
				<th>
					柜员流水号
				</th>
				<th>
					报送性质
				</th>
				<th>
					数据性质
				</th> 
				<th>
					行内员工
				</th>
			</tr>
			<logic:present name="t47_transactionList">
				<logic:iterate id="search" name="t47_transactionList"
					type="com.ist.aml.inves.dto.T47_transaction_ms">
						<%
							java.util.HashMap map = new java.util.HashMap();
							map.put("transactionkey",search.getTransactionkey());
							pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<tr>
						<td>
							<bean:write name="search" property="tx_dt_disp" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="stcr" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="app_org_id" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="party_id" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="party_chn_name" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="acct_num" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="receive_pay_cd_disp" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="currency_cd" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="amt_disp" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="use_des" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="opp_name" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="opp_acct_num" scope="page" />
						</td>
						<td>
						<a href="#" onclick="_Open('../../inves/trade/t47_transaction_disp.do?transactionkey=<%=search.getTransactionkey()%>&casesearchtime=1')">
     							<bean:write name="search" property="tx_no" scope="page"/></a></TD>
						<td>
							<bean:write name="search" property="case_kind" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="date_status_cd" scope="page" />
						</td>
						<td>
							<bean:write name="search" property="is_staff" scope="page" />
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</table>
	</div>
<!-- list_page --> 
  <div class="list_page">
		<logic:present name="pageInfo">
				<bean:write name="pageInfo" scope="request" filter="false" />
		</logic:present>
  </div>
<!-- all end -->
</html:form>
</div>
</body>
</html>