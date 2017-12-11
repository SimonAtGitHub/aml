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
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function _Onblur(){
   document.forms[0].searchOrganName.value="";
}
function dosubmit2(theUrl){
  document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}

function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].case_tran_mindate_disp.value;
    _Date2 = document.forms[0].case_tran_maxdate_disp.value;  
    if(_Date1 == '' && _Date2 == ''){
        errMsg += "数据时间不能为空！";
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
function toExcel(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='exce'){
  
        if( checkRadio(document.forms[0].selectedReportname)<0){
          errMsg="请选择!"; 
        }
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
var s_date = "";
var e_date = "";
function initDate(){
  	s_date = document.forms[0].app_dt_start_disp.value;
  	e_date = document.forms[0].app_dt_end_disp.value;
}

function dealState(){
    var searchTime = document.getElementById("casesearchtime").value;
    var deal_state = document.getElementById("deal_state");
    var deal_state1 = document.getElementById("deal_state1");
    var deal = document.getElementById("deal");
    var deal1 = document.getElementById("deal1");
    if(searchTime == '1'){
       deal.style.display = 'none';
       deal1.style.display = '';
       deal_state.value = "";
    }else if(searchTime == '0'){
       deal.style.display = '';
       deal1.style.display = 'none';
       deal_state1.value = "";
    }
}
</script>

	</head>
	<body class="mainbg" onload="initDate()">
		<div id="main">
			<html:form action="/reportsearch/t07_reportsearch.do"
				method="post">
				<input type="hidden" name="cast_type" value="<bean:write name="cast_type"/>" />
			<input type="hidden" name="backurl" value="<%=request.getContextPath() %>/inves/reportsearch/t07_case_report_list.do?cast_type=<bean:write name="cast_type"/>"/>
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>数据查询 - 
						    <logic:equal value="1" name="cast_type">
						        大额报告查询
						   </logic:equal>
						   <logic:equal value="2" name="cast_type">
						        可疑报告查询
						   </logic:equal>
						   
						</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a></span>
					</div>
				<div class="cond_c3">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<input type="button" name="button1" value="大额" class="in_button1"  disabled="disabled" onclick="dosubmit2('<%=request.getContextPath()%>/inves/reportsearch/t07_case_report_list.do?newsearchflag=2&cast_type=1&intPage=0','change')" />
					<input type="button" name="button2" value="可疑" class="in_button1"
						onclick="dosubmit2('<%=request.getContextPath()%>/inves/reportsearch/t07_case_report_list.do?newsearchflag=2&cast_type=2&intPage=0','change')" />
				</td>
			</tr>
		</table>
	</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0" id="searchtable">
						
							<tr>
							<td>
									报送日期：
								</td>
								<td>
								 <html:text property="case_tran_mindate_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" /> --
                                   <html:text property="case_tran_maxdate_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" />
								</td>
							
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" size="10" maxlength="60" />
				                    <html:text property="party_name" size="30" maxlength="60" readonly="true" />
 				                    <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>

								</td>
							</tr>
							<tr>

								<td>
									报送机构：
								</td>
								<td>
									<html:text property="app_org_id" size="7"  maxlength="60"  onblur="_Onblur('app_org_name')"/>
					                <html:text property="app_org_name" size="30" readonly="true" maxlength="60" />
					                <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=app_org_id&input_name_disp=app_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
								</td>
								<td>
									客户类型：
								</td>
								<td>
									<bean:define id="party_class_str" name="party_class_str"></bean:define><%=party_class_str %>
								</td>
							</tr>
							<tr>
								<td>
									数据日期：
								</td>
								<td>
                                   <html:text property="app_dt_start_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" /> --
                                   <html:text property="app_dt_end_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" />
								</td>
								
								<td>
									币种：
								</td>
								<td>
									<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define><%=curr_cd_str %>
								</td>
							</tr>
							<logic:equal value="2" name="cast_type">
							<tr>
								<td>
								可疑程度：
								</td>
								<td colspan="3">
									<html:select property="alert_level">
										<html:options collection="ssdgMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							</logic:equal>
							
							<tr>
							   
								<td>
								    案例特征：
								</td>
								<td>
								    <html:select property="stcr" style="width:270px" onmouseover="FixWidth(this);">
										<html:options collection="stcrMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								 <td>
								    数据性质：
								</td>
								<td>
								    <bean:define id="date_status_cd_str" name="date_status_cd_str"></bean:define><%=date_status_cd_str %>
								</td>
							</tr>
							
							<tr>
							
                                  <td>
									报文类型：
								</td>
								<td>
									<html:select property="kind">
										<html:options collection="casecagetoryMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								
								<td>
								    是否白名单：
								</td>
								<td> 
								   <bean:define id="is_menu_str" name="is_menu_str"></bean:define><%=is_menu_str %>
								</td>
							</tr>
							 <tr>
							 <td>
									报送状态：
								</td>
								<td>
									<bean:define id="casesearchtime_str" name="casesearchtime_str"></bean:define><%=casesearchtime_str %> (查询已报送数据时此处选择已报送)
								</td>
								
					          <td>
								    报文名称：
								</td>
								<td> 
									<html:text property="addtional" maxlength="41"/>
								
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('t07_case_report_list.do?newsearchflag=1','search')" />
								
								
								</td>
								
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!--  <th>
								选择
							</th>-->
							<th>
								案例号
							</th>
								<th>
								报告号
							</th>
							<th>
								客户号
							</th>
							<th>
								客户名称
							</th>
							<th>
								报送机构
							</th>
					
							<th>
								报文类型
							</th>
							<th>
								币种
							</th>
							<th>
								数据日期
							</th>
					    <th>
					         报送日期
				        </th> 
				        	<th>
								报文名称
							</th>
							<th>
								数据性质
							</th>
						</tr>
						<logic:present name="searchT07_case_applicationList">
							<logic:iterate id="search" name="searchT07_case_applicationList"
								type="com.ist.aml.report.dto.T07_case_application">
								<%
									java.util.HashMap map = new java.util.HashMap();
													map.put("application_num", search
															.getApplication_num());
													map.put("casesearchtime", search.getCasesearchtime());
														map.put("case_kind", search.getCase_kind());
													map.put("caseFlag", "2");
													map.put("backurl", "/inves/reportsearch/t07_case_report_list.do?cast_type="+search.getCast_type());
													map.put("intPage",request.getAttribute("intPage") == null ? "0": request.getAttribute("intPage"));	
													map.put("cast_type",request.getAttribute("cast_type"));	
													map.put("msgkey",search.getMsgkey());
													map.put("msg_file",search.getName());
													map.put("packetkey",search.getPacketkey());
													pageContext.setAttribute("map", map,
															PageContext.PAGE_SCOPE);
								%>
								<tr>
									<td>
										<html:link name="map" page="/case/caseDetailinfo.do"
											paramId="casesearchtime" paramName="search"
											paramProperty="casesearchtime">
											<bean:write name="search" property="application_num"
												scope="page" />
										</html:link>
									</td>
											<td>
										<bean:write name="search" property="reportkey" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="party_id" scope="page" />
									
									</td>
									<td>
										<bean:write name="search" property="party_name" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="app_org_id" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_kind_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="search" property="currency_cd_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_date_disp" scope="page" />
									</td>
								  <td>
							  <bean:write name="search" property="tx_dt_disp" scope="page" />
						         </td> 
						           <td>
							  <bean:write name="search" property="name" scope="page" />
						         </td> 
									<td>
										<bean:write name="search" property="date_status_cd"
											scope="page" />
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
			</html:form>
		</div>
			<script language="JavaScript">
			var casetype=document.forms[0].cast_type.value;
			//alert(casetype);
			if(casetype=="1"){
			     document.all.button1.disabled=true;
			     document.all.button2.disabled=false;
			}else{
			   document.all.button1.disabled=false;
			     document.all.button2.disabled=true;
			}
			</script>
	</body>
</html>