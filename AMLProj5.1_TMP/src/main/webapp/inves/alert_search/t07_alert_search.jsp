<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/App_Select.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>


<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
 
		<%
			String sItem2 = "";
		%>

		<logic:iterate id="area" name="ruleList"
			type="com.ist.aml.report.dto.T07_alert">
			<%
				String upId = area.getInterfacekey();
						if ("BH".equals(upId)) {
							upId = "1";
						} else {
							upId = "2";
						}
						String areaId = area.getPbckey();
						String areaName = area.getPbc_des();
						String idname2 = upId + "@" + areaId + "#" + areaName;
						sItem2 = sItem2 + ",\"" + idname2 + "\"";
			%>
		</logic:iterate>
		<%
			if (!sItem2.equals("")) {
				sItem2 = sItem2.substring(1);
			}
		%>
		 
		<SCRIPT LANGUAGE="JavaScript">
arrItem=new Array(<%=sItem2%>);
function _Click(fromstr,tostr){
   changelocation(fromstr,tostr,arrItem);
}

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
if(!_compareTwoDateForString(document.forms[0].alert_dt_start_disp.value, document.forms[0].alert_dt_end_disp.value)) {
   document.forms[0].alert_dt_start_disp.focus();
	 errMsg = "开始时间不能大于结束时间";		    
		   } 
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function dosubmit1(theUrl){
var errMsg = "";
if(!_compareTwoDateForString(document.forms[0].alert_dt_start_disp.value, document.forms[0].alert_dt_end_disp.value)) {
   document.forms[0].alert_dt_start_disp.focus();
	 errMsg = "开始时间不能大于结束时间";		    
		   } 
if(document.forms[0].organnum.value==""){
  errMsg = "请选择机构";	
}
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
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
function deletesubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除选择的预警吗？')){
                isSub = true;
            }
        }
    }else if(type=='count'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
                isSub = true;
        }
    }else if(type=='pause'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要暂停选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要激活选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function submit1(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
   
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
</SCRIPT>
	</head>
	<body class="mainbg">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/alert_search/t07_alert_list.do" method="post">
		
			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>所有预警</span>
					<span class="buttons"> <a href="#" id="hdd_display"
						class="bt_hidden"></a>
						
						<a href="#" onclick="dosubmit1('t07_alerttrans_export.do');">
							<img  src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出预警交易信息</a> 
						</span>
				</div>
				<!-- table content -->
				<div class="cond_c" id="searchtable">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>

							<td>
								预警起止日期：
							</td>
							<td>
                                 
								<html:text property="alert_dt_start_disp" size="12"
									onclick="calendar.show(this);" readonly="readonly"
									styleClass="calimg" />
								--
								<html:text property="alert_dt_end_disp" size="12"
									onclick="calendar.show(this);" readonly="readonly"
									styleClass="calimg" />

							</td>
							<td>
								预警对象：
							</td>
							<td>
								<html:text property="name" />
							</td>
						</tr>
						<tr>
							<td width="15%" height="22" align="right" bgcolor="ECF3FF">
								案例编号：
							</td>
							<td>
								<html:text property="application_num" />
							</td>
							<td>
								客户号：
							</td>
							<td>
								<html:text property="objkey" />
							</td>
						</tr>
						<tr>

							<td>
								归属机构：
							</td>
							<td>
								<html:text property="organnum" size="10"
									onblur="_Onblur('organName')" />
								<html:text property="searchOrganName" size="13" readonly="true" />
								<a href="#"
									onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organnum&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
									class="cond_buttons"><img
											src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span> </a>
							</td>
							<td>
								预警类型：
							</td>
							<td>
								<html:select property="alert_type_cd"
									onchange="_Click('alert_type_cd','pbcrule')">
									<html:options collection="alerttypeMap" property="label"
										labelProperty="value" />
								</html:select>(查询可疑预警时此处选择可疑)
							</td>
						
						</tr>
						<tr>

							<td>
								币种：
							</td>

							<td>
								<html:select property="curr_cd" style="width:100">
									<html:options collection="curr_cdMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
								<td width="14%" height="22" align="right">
								规则名称：
							</td>
							<td>
								<html:select property="pbcrule" style="width:300">
									<html:options collection="pbcruleMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>

						<tr>
							<td>
								数据状态：
							</td>
							<td>
								<html:select property="alertsearchtime">
									<html:options collection="alertsearchtimeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td>
								排序：
							</td>
							<%
								String root4 = "dosubmit('t07_alert_list.do?newsearchflag=1')";
									String root5 = "submit1('t07_alert_list.do?newsearchflag=1')";
							%>
							<td width="36%" align="left" bgcolor="F6F9FF">
								<html:select property="orderby">
									<html:options collection="alertorderMap" property="label"
										labelProperty="value" />
								</html:select>
								<html:radio property="order" value="1" />
								升序
								<html:radio property="order" value="2" />
								降序 &nbsp;&nbsp;&nbsp;&nbsp;
								<logic:notEqual property="searchtype" value="today"
									name="t07_alertActionForm">
									<input type="button" name="ok" value="查 询" class="in_button1"
										onClick=<%=root4%>>
								</logic:notEqual>
							
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="list">
				<table cellspacing="0" cellpadding="0" border="0">

					<TR align=center bgcolor="#A3C0EE">

						<th>
							预警序号
						</th>
						<th>
							案例编号
						</th>
						<th>
							预警规则
						</th>
						<th>客户号</th>
						<th>客户名称</th>
					
						<!--<th>
							交易笔数
						</th>
						<th>
							交易金额
						</th>  -->
						<th>
							归属机构
						</th>
						<th>
							预警日期
						</th>
					
					</TR>
					<logic:present name="t07_alertList">
						<logic:iterate id="search" name="t07_alertList"
							type="com.ist.aml.report.dto.T07_alert">

							<%
								java.util.HashMap map = new java.util.HashMap();
												map.put("alertkey", search.getAlertkey());
												map.put("alertsearchtime", request.getParameter("alertsearchtime"));
												map.put("alert_type_cd", search.getAlert_type_cd());
												
												pageContext.setAttribute("map", map,
														PageContext.PAGE_SCOPE);
							%>
							<tr >
								<td>
									<html:link name="map" page="/alert_search/t07_alert_disp.do"
										paramName="search">
										<bean:write name="search" property="alertkey" scope="page" />
									</html:link>

								</td>
								<td>
									<bean:write name="search" property="application_num"
										scope="page" />
								</td>
								<td height="22">
									<%-- <logic:equal name="search" property="alert_type_cd" value="1">大额</logic:equal>
								<logic:equal name="search" property="alert_type_cd" value="2">可疑</logic:equal>--%>
									<bean:write name="search" property="rulekey_disp" scope="page" />
								</td>

								<td height="22">
									<bean:write name="search" property="objkey" scope="page" />
								</td>
								<td height="22">
									<bean:write name="search" property="objname" scope="page" />
								</td>
								<!-- <td>
									<bean:write name="search" property="trans_num" scope="page" />
								</td>
								<td>
									<bean:write name="search" property="amount_string" scope="page" />
								</td> -->
								<td>
									<bean:write name="search" property="organname" scope="page" />
								</td>
								<td>
									<bean:write name="search" property="alert_dt_disp" scope="page" />
								</td>
								
							</tr>
						</logic:iterate>
					</logic:present>
				</table>
			</div>
				<div class="list_page">
						<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			
		</html:form>
 
	</body>
</html>