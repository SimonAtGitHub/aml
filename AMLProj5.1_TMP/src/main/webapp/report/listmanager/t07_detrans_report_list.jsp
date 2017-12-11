<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!-- <%@ page import="com.ist.platform.dto.T00_organ"%>
<%@ page import="java.util.ArrayList"%> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
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

function dosubmit(theUrl){
var errMsg = "";
    _Date1 = document.forms[0].senddate_ch.value;
    _Date2 = document.forms[0].senddate_ch_b.value;  
   
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
  
    errMsg = DateDiff(_Date1,_Date2,5);	
    
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }  
 
     //  sel=allSelect(0,"list2","value","");
   
   document.forms[0].action=theUrl;
   document.forms[0].submit();
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
function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
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
function  _Commit(url){
     document.forms[0].action=url;
   document.forms[0].submit();
}


var bool = true;
function toExcel(url){
	<logic:present name="t07_report_by_organList">
    <bean:size id="len" name="t07_report_by_organList" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
	//window.open('export_t07_detrans.do','','height=160, width=300,left=100,top=100');
   document.forms[0].action=url;
   document.forms[0].submit();
}
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/insidereport/t07_detrans_report.do" method="post">
				<html:errors />
				<!-- <input type="hidden" name="cash_trans_flag" value="2"/> -->

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>上报交易查询</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> 
							<a onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<%--<a href="#"
							onclick="window.open('export_detrans_report.do?cash_trans_flag=2','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes');"><img
									src="../../images/blue/b_excel.png" />导出Excel</a> 
									
									--%>
							<!--<a href="#" onclick="dosubmit('export_t07_detrans.do?newsearchflag=1');">
							<img  src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>		
									-->
							<a href="#" onclick="toExcel('export_t07_detrans.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
									</span>
						<!-- <html:button property="button2" value="导出Excel" styleClass="input" onclick="window.open('export_detrans_report.do?cash_trans_flag=2','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes');"/> -->
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									报送日期：
								</td>
								<td>
								<html:text property="senddate_ch" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
 
									--
									<html:text property="senddate_ch_b" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
 
									
								</td>
								<td>
									预警类型：
								</td>
								<td>
						
									<html:select property="type">
										<html:options collection="alert_typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
								
									交易日期：
								</td>
								<td>
								<html:text property="dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
 
									--
									<html:text property="dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
 
									
								</td>
								<td>交易机构：
								</td>
								<td>
									<html:text property="organkey" size="9"   onblur="_Onblur('organname')"/>
					                <html:text property="organname" size="30" readonly="true" maxlength="60" />
					                <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
								</td>
								
							</tr>
							<tr>
								<td>
									报告号：
								</td>
								<td>
								<html:text property="reportkey"></html:text>
								</td>
								<td>报送机构：
								</td>
								<td>
									<html:text property="finc" size="9"   onblur="_Onblur('finn')"/>
					                <html:text property="finn" size="30" readonly="true" maxlength="60" />
					                <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=finc&input_name_disp=finn','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
								</td>  
								
							</tr>
							<tr>
								<td>
									客户号：
								</td>
								<td>
								<html:text property="csnm"></html:text>
								</td>
								<td>
									报文类型：
								</td>
								<td>
									<html:select property="msg_type_cd">
										<html:options collection="msg_type_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								
							</tr>
							<tr>
								<td>
									币种：
								</td>
								<td>
									<html:select property="curr_cd">
										<html:options collection="curr_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									客户类型：
								</td>
								<td>
									<html:select property="party_class_cd">
										<html:options collection="party_class_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								 
							</tr>
							
							<tr>
							 <td>
									报送状态：
								</td>
								<td>
									<html:select property="casesearchtime">
										<html:options collection="casesearchtimeMap" property="label" labelProperty="value" />
									</html:select> (查询已报送数据时此处选择已报送)
								</td>
							<td ></td>
								<td >
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('t07_detrans_report.do?newsearchflag=1')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border=0 cellpadding="0" cellspacing="0">
						<tr>
						   <th>
								交易号
							</th>
							   <th>
								报告号
							</th>
							<th>
								交易日期
							</th>
							<th>
								报送机构号
							</th>
							 <th>
								机构名称
							</th>
							<th>
								交易机构号
							</th>
							<!-- <th>
								交易账号
							</th> -->
							<th>
								客户号
							</th>
							<th>
								客户名称
							</th>
							<th>
								币种
							</th>
							<th>
								金额
							</th>
							<!--  <th>
								用途
							</th>-->
							<th>
								交易类型
							</th>
							<!-- <td height="22"  width="8%"   style="word-break:break-all" class="tdhead">收款人账号</td>
	  <td height="22"  width="8%"   style="word-break:break-all" class="tdhead">收款人名称</td>
	  <td height="22"  width="8%"   style="word-break:break-all" class="tdhead">收款人开户行</td> -->
	        <%
	        String  casesearchtime=(String)request.getAttribute("casesearchtime");
	        String fromcase="1";
	           if(casesearchtime!=null && casesearchtime.equals("1")){
	            fromcase="2";
	           }
	        %>

						</tr>
						<logic:iterate id="trans" name="t07_report_by_organList"
							type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
							<tr>
							<td>
							<%--<bean:write name="trans" property="crcd" />-<bean:write name="trans" property="cati_seqno" />--
								--%><logic:equal value="DE" name="alerttype">
								<logic:equal value="C" name="msg_type_cd">
									<!--<a href="#" onclick="_Open('<%=request.getContextPath()%>/pbcreport08/validate/cbh_tsdt_validate_disp08.do?reportkey=<bean:write name="trans" property="reportkey" />&tsdt_seqno=<bean:write name="trans" property="tsdt_seqno" />')"></a>	
										 		--><bean:write name="trans" property="tsdt_seqno" />
										 		
								</logic:equal>
								<logic:notEqual value="C" name="msg_type_cd">
								<!--<a href="#"
									onclick="_open('<%=request.getContextPath()%>/pbcreport08/report/ibh_tsdt_detaillist.do?closeflag=1&pbc_msg_type_cd=<bean:write name="msg_type_cd"  />&reportkey=<bean:write name="trans" property="reportkey" />&tsdt_seqno=<bean:write name="trans" property="tsdt_seqno" />&crcd=<bean:write name="trans" property="crcd" />&cati_seqno=<bean:write name="trans" property="cati_seqno" />&fromcase=<%=fromcase %>');return false"></a>
									--><bean:write name="trans" property="ticd" scope="page" />
								   
								</logic:notEqual>
									
								</logic:equal>	
								
								<logic:equal value="KY" name="alerttype">
									<!--<a href="#"
									onclick="_open('../../pbcreport/report/nbs_rpdi_detail.do?reportkey=<bean:write name="trans" property="reportkey"/>&rpdi_seqno=<bean:write name="trans" property="tsdt_seqno"/>&fromcase=<%=fromcase %>');return false"></a>-->
									<bean:write name="trans" property="ticd" scope="page" />
								   
								</logic:equal>
								
								   
								</td>
									<td>
									<bean:write name="trans" property="reportkey" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="tstm_disp" scope="page" />
								</td>
									<td>
									<bean:write name="trans" property="finc" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="finn" scope="page" />
								</td>
									<td>
									<bean:write name="trans" property="organKey" scope="page" />
								</td>
								<!-- <td>
									<bean:write name="trans" property="ctac" scope="page" />
								</td> -->
								<td>
									<bean:write name="trans" property="csnm" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="ctnm" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="crtp" scope="page" />
								</td>
								
								<td>
									<bean:write name="trans" property="crcd_disp" scope="page" />
								</td>
								<!-- <td>
									<bean:write name="trans" property="crpp" scope="page" />
								</td>-->
								<td>
									<bean:write name="trans" property="tstp"
										scope="page" />
								</td>
								<!--<TD><bean:write name="trans" property="tcac" scope="page"/></TD>
      <TD><bean:write name="trans" property="tcnm" scope="page"/></TD>
      <TD><bean:write name="trans" property="cfin" scope="page"/></TD> -->
							</tr>
						</logic:iterate>
					</table>
					<html:hidden property="newsearchflag" />
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