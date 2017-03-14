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
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function _Onblur(){
   document.forms[0].searchOrganName.value="";
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
function toExcel(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='exce'){
    
        //errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(checkRadio(document.forms[0].selectedReportname)<0){
           errMsg="请选择";
        }else
        {
        
         var case_type= document.forms[0].case_type.value;
         if(case_type=='1')
         {
         	errMsg="不能导出大额案例!";
         }
        }
        
      // var selected = document.forms[0].selectedReportname;
     //  var num = 0;    
      // for(var i=0;i<selected.length;i++){
      //     if(selected[i].checked){
      //         num++;
       //    }else{
      //         break;
        //   }
      //  }
      //  if(num<=0){
      //     errMsg = "请选择！";
      //  }
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

function setCase_type(case_type)
{
		//alert(case_type);
		document.forms[0].case_type.value=case_type;
 
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
		<%
			String caseseachtime = (String) request
					.getAttribute("caseseachtime");
			session.removeAttribute("caseseachtime");
			session.setAttribute("caseseachtime", caseseachtime);
		%>
	</head>
	<body class="mainbg" onload="initDate();">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="main">
			<html:form action="/reportsearch_ms/t07_reportsearch_bs.do"
				method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>所有<%=com.ist.util.Constans.CASE_NAME%>查询</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#" onclick="toExcel('export_allcase.do','exce');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出可疑<%=com.ist.util.Constans.CASE_NAME%></a>
							<!--<input type="button" name="upload" value="导出<%=com.ist.util.Constans.CASE_NAME%>" class="in_button1" onClick="toExcel('export_allcase.do','exce');" /> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0" id="searchtable">
							<tr>
								<td>
									数据日期：
								</td>
								<td>
                                   <html:text property="app_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                   <html:text property="app_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" size="10" maxlength="60"/>
				                    <html:text property="party_name" size="30" maxlength="60" readonly="true" />
 				                    <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>

								</td>
							</tr>
							<tr>

								<td>
									报送机构：
								</td>
								<td>
									<html:text property="app_org_id" size="7"  maxlength="60" />
					                <html:text property="app_org_name" size="30" readonly="true" maxlength="60" />
					                <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=app_org_id&input_name_disp=app_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								<td>
									案例类型：
								</td>
								<td>
									<html:select property="cast_type">
										<html:options collection="casetypeMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									案例种类：
								</td>
								<td>
									<html:select property="kind">
										<html:options collection="casecagetoryMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								<td>
									币种：
								</td>
								<td>
									<html:select property="curr_cd">
										<html:options collection="curr_cdMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								
								<td>
									案例状态：
								</td>
								<td>
									<html:select property="deal_state">
										<html:options collection="deal_stateMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								<td>
								    是否白名单:
								</td>
								<td> 
								    <html:select property="is_menu">
										<html:options collection="is_menuMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								</tr>
								<tr>
								<%-- <td>
									<html:select property="deal_state1">
										<html:options collection="deal_stateMap1" property="label"
											labelProperty="value" />
									</html:select>
								</td> --%>
								<td>
									报送状态：
								</td>
								<td>
									<html:select property="casesearchtime">
										<html:options collection="casesearchtimeMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								<td>
								    排序：
								</td>
								<td>
								    <html:select property="orderby">
										<html:options collection="casesorderMap" property="label" labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" >
									升序</html:radio>
									<html:radio property="order" value="2" >
									降序 </html:radio>
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('t07_reportsearch.do?newsearchflag=1','search')" />
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
								选择
							</th>
							<th>
								<%=com.ist.util.Constans.CASE_NAME%>编号
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
							<!-- <th>
								可疑程度
							</th> -->
							<th>
								案例种类
							</th>
							<th>
								<%=com.ist.util.Constans.CASE_NAME%>状态
							</th>
							<th>
								币种
							</th>
							<th>
								数据日期
							</th>
							<!-- <TD width="11%" nowrap>
					支行处理日期
				</TD> -->
							<th>
								数据性质
							</th>
						</tr>
						<input type="hidden" name="case_type"/>
						<logic:present name="searchT07_case_applicationList">
							<logic:iterate id="search" name="searchT07_case_applicationList"
								type="com.ist.aml.report.dto.T07_case_application">
								<%
									java.util.HashMap map = new java.util.HashMap();
													map.put("application_num", search
															.getApplication_num());
													map.put("casesearchtime", request
															.getAttribute("casesearchtime"));
													map.put("caseFlag", "1");
													pageContext.setAttribute("map", map,
															PageContext.PAGE_SCOPE);
								%>
								<tr align="center" class="interval"
									onmouseover="this.className='interval2'"
									onmouseout="this.className='interval'">
									<td>
										<!--<html:multibox property="selectedReportname">
						      <bean:write name="search" property="application_num" scope="page" />
						   </html:multibox>-->
										<input type="radio" name="selectedReportname"
											value="<%=search.getApplication_num()%>" onclick="setCase_type('<bean:write name="search" property="cast_type" scope="page" />')"   />
											
											
									</td>
									<td>
										<html:link name="map" page="/case/caseDetailinfo_ms.do"
											paramId="casesearchtime" paramName="search"
											paramProperty="casesearchtime">
											<bean:write name="search" property="application_num"
												scope="page" />
										</html:link>
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
									<!-- <td>
										<bean:write name="search" property="alert_level_disp"
											scope="page" />
									</td> -->
									<td>
										<bean:write name="search" property="case_kind_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="search" property="app_state_cd_s"
											scope="page" />
									</td>
									<td>
										<bean:write name="search" property="currency_cd_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_date_disp" scope="page" />
									</td>
									<!-- <TD>
							<bean:write name="search" property="last_upd_dt_disp" scope="page" />
						</TD> -->
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
	</body>
</html>