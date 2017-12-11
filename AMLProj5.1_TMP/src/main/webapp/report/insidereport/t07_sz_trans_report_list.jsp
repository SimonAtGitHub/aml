<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!--<%@ page import="com.ist.platform.dto.T00_organ"%>
<%@ page import="java.util.ArrayList"%> -->
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

function dosubmit(theUrl){
var errMsg = "";
		var _Date1 = document.forms[0].dt_start_disp.value;
    	var _Date2 = document.forms[0].dt_end_disp.value;  
    	if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";
         else if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }  
       sel=allSelect(0,"list2","value","");
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
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/insidereport/t07_sz_trans_report.do"
				method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>按账户统计上报信息</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#"
							onclick="javascript:window.open('export_sz_trans_report.do','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a> <!--<input type="button" name="upload" value="导出<%=com.ist.util.Constans.CASE_NAME%>" class="in_button1" onClick="toExcel('export_allcase.do','exce');" /> -->
						</span>
						<!-- <html:button property="button2" value="导出Excel" styleClass="input" onclick="window.open('export_sz_trans_report.do','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes');"/> -->
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" id="searchtable">
							<tr>
								<td>
									交易日期：
								</td>
								<td>
									<html:text property="dt_start_disp"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />


									--
									<html:text property="dt_end_disp"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />


								</td>
								<td></td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									机构名称：
								</td>
								<td colspan="3">
									<bean:define id="organMultiSelHTMLStr"
										name="organMultiSelHTMLStr"></bean:define>
									<%=organMultiSelHTMLStr%>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="right">
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('t07_sz_trans_report.do?newsearchflag=1')" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border=0 cellpadding="0" cellspacing="0">
						<tr>
							<th>
								交易类型
							</th>
							<th>
								对公账户大额或可疑交易报告份数
							</th>
							<th>
								涉及总金额
							</th>
							<th>
								涉及交易笔数
							</th>
							<th>
								个人账户大额或可疑交易报告份数
							</th>
							<th>
								涉及总金额
							</th>
							<th>
								涉及交易笔数
							</th>
						</tr>
						<logic:iterate id="trans" name="t07_report_by_organList"
							type="com.ist.aml.report.dto.T07_report_by_organ">
							<tr align="center" class="interval"
								onmouseover="this.className='interval2'"
								onmouseout="this.className='interval'">
								<td>
									<bean:write name="trans" property="organname" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="total_num" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="total_val_string" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="alert_num" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="success_num" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="alert_val_string" scope="page" />
								</td>
								<td>
									<bean:write name="trans" property="handout_num" scope="page" />
								</td>
							</tr>
						</logic:iterate>
					</table>
					<html:hidden property="newsearchflag" />
				</div>
			</html:form>
		</div>
	</body>
</html>