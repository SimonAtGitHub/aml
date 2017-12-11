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
function dosubmit1(theUrl,type){
    var errMsg = "";
  // errMsg = CheckBoxMustChecked(document.forms[0]);
 _Date1 = document.forms[0].app_dt_start_disp.value;
    _Date2 = document.forms[0].app_dt_end_disp.value;  
   var party_id=document.forms[0].party_id.value;
    if((_Date1 == '' && _Date2 == '')&&party_id==''){
        errMsg += "数据时间或客户号不能为空！";
    }    
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	  
  	//if(document.forms[0].party_class_cd.value==""){
  	 // errMsg="请选择客户类型";  
  	 //}
  	 if(document.forms[0].app_org_id.value==""){
  	  errMsg="请选择机构";  
  	 }
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
function _Open(url){
window.open(url,'enter2','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=no');
										
}
								
function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].app_dt_start_disp.value;
    _Date2 = document.forms[0].app_dt_end_disp.value;  
   var party_id=document.forms[0].party_id.value;
    if((_Date1 == '' && _Date2 == '')&&party_id==''){
        errMsg += "数据时间或客户号不能为空！";
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



</script>

	</head>
	<body class="mainbg" >
		<div id="main">
			<html:form action="/reportsearch/t07_reportsearch.do"
				method="post">
				<input type="hidden" name="cast_type" value="<bean:write name="cast_type"/>" />
			<input type="hidden" name="backurl" value="<%=request.getContextPath() %>/inves/reportsearch/t07_reportsearch.do?cast_type=<bean:write name="cast_type"/>"/>
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 
						   <logic:equal value="1" name="cast_type">
						        大额案例查询
						   </logic:equal>
						   <logic:equal value="2" name="cast_type">
						        可疑案例查询
						   </logic:equal>
						</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
								<!-- <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全选</a>
						 <a href="#" onclick="toExcel('t07_reportsearch_export.do','exce');">
							<img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出<%=com.ist.util.Constans.CASE_NAME%></a> -->
							<a href="#" onclick="dosubmit1('t07_reportbase_export.do');">
							<img  src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出<%=com.ist.util.Constans.CASE_NAME%>基本信息</a> 			
							<a href="#" onclick="dosubmit1('t07_reportbath_export.do');">
							<img  src="../../images/<%=session.getAttribute("style") %>/b_export.png" />批量导出<%=com.ist.util.Constans.CASE_NAME%></a> 	
						    			
							<!--<input type="button" name="upload" value="导出<%=com.ist.util.Constans.CASE_NAME%>" class="in_button1" onClick="toExcel('export_allcase.do','exce');" /> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0" id="searchtable">
							<tr>
								<td>
									<font color="red">*</font>数据日期：
								</td>
								<td>
                                   <html:text property="app_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                   <html:text property="app_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" size="10" maxlength="60" />
				                    <html:text property="party_name" size="30" maxlength="60" readonly="true" />
 				                    <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>

								</td>
							</tr>
							<tr>

								<td>
									报送机构：
								</td>
								<td>
									<html:text property="app_org_id" size="7"  maxlength="60"  onblur="_Onblur('app_org_name')"/>
					                <html:text property="app_org_name" size="30" readonly="true" maxlength="60" />
					                <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=app_org_id&input_name_disp=app_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								<logic:equal value="0" name="experi">
								<td>
									客户类型：
								</td>
								<td>
									<bean:define id="party_class_str" name="party_class_str"></bean:define><%=party_class_str %>
								</td>
								</logic:equal>
								<logic:equal value="1" name="experi">
								<td>
									案例来源：
								</td>
								<td>
								 <html:select property="case_source">
										<html:options collection="sourceMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								</logic:equal>
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
									<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define><%=curr_cd_str %>
								</td>
							</tr>
							<logic:equal value="2" name="cast_type">
							<tr>
								<td>
								可疑程度：
								</td>
								<td colspan="3">
									<html:select property="alert_level" style="width:270px" onmouseover="FixWidth(this);">
										<html:options collection="ssdgMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								
							</tr>
							</logic:equal>
							<tr>
								<logic:equal value="2" name="cast_type">
									<td>
										案例状态：
									</td>
									<td>
										<html:select property="app_state_cd">
											<html:options collection="deal_stateMap" property="label" labelProperty="value" />
										</html:select>
									</td>
								</logic:equal>
								<logic:equal value="1" name="cast_type">
								    <td>
								     案例状态:
									</td>
								    <td>
								      <html:select property="validate_ind">
											<html:options collection="validateindMap" property="label" labelProperty="value" />
									 </html:select>
									</td>
								</logic:equal>
								<td>
								    是否白名单：
								</td>
								<td> 
								    <bean:define id="is_menu_str" name="is_menu_str"></bean:define><%=is_menu_str %>
								</td>
							</tr>
							  <logic:equal value="1" name="is_staff">
							<tr>
						   	    <td>
						   	  
						   	      是否本行账户:
						   	   
								</td>
								<td>
								 <logic:equal value="1" name="is_staff">
								    <html:select property="isstaff">
										<html:options collection="staffflagMap" property="label" labelProperty="value" />
									</html:select>
								 </logic:equal>
								</td>
								<td>
								<logic:present name="is_grey">
								 
						   	      是否资金归集客户:
						   	   
						   	    </logic:present>
								</td>
								<td> 
								<logic:present name="is_grey">
						   	      <html:select property="is_grey">
										<html:options collection="staffflagMap" property="label" labelProperty="value" />
									</html:select>
						   	    </logic:present>
									
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
									报送状态：
								</td>
								<td>
									<bean:define id="casesearchtime_str" name="casesearchtime_str"></bean:define><%=casesearchtime_str %> (查询已报送数据时此处选择已报送)
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
										onclick="dosubmit('t07_reportsearch.do?newsearchflag=1&cast_type=<%=request.getAttribute("cast_type") %>','search')" />
								
								
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
								<%=com.ist.util.Constans.CASE_NAME%>编号
							</th>
							<th>
								案例名称
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
							<logic:equal value="2" name="cast_type">
							  <th>
								<%=com.ist.util.Constans.CASE_NAME%>状态
							</th> 
							</logic:equal>
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
						<logic:present name="searchT07_case_applicationList">
							<logic:iterate id="search" name="searchT07_case_applicationList"
								type="com.ist.aml.report.dto.T07_case_application">
								<%
								    String party_id=String.valueOf(search.getParty_id());
								    if(party_id.contains("#")){
								    	party_id = party_id.replace("#","%23"); 
								    }
									java.util.HashMap map = new java.util.HashMap();
													map.put("application_num", search
															.getApplication_num());
												
													map.put("caseFlag", "1");
														map.put("case_kind", search.getCase_kind());
													map
															.put(
																	"intPage",
																	request.getAttribute("intPage") == null ? "0"
																			: request
																					.getAttribute("intPage"));	
													map.put("cast_type",request.getAttribute("cast_type"));						
													pageContext.setAttribute("map", map,
															PageContext.PAGE_SCOPE);
					                  
								%>
								<tr>
									<logic:equal name="search" property="case_kind_flag"  value="1">
									<td>
										<html:link name="map" page="/case/caseDetailinfo.do"
											paramId="casesearchtime" paramName="search"
											paramProperty="casesearchtime">
											<bean:write name="search" property="application_num"
												scope="page" />
										</html:link>
									</td>
									</logic:equal>
									
									<logic:equal name="search" property="case_kind_flag" value="0">
									<td>
										<html:link name="map" page="/case/caseDetailinfo_main.do"
											paramId="casesearchtime" paramName="search"
											paramProperty="casesearchtime">
											<bean:write name="search" property="application_num"
												scope="page" />
										</html:link>
									</td>
									</logic:equal>
									<td>
											<bean:write name="search" property="case_name" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="app_org_id" scope="page" />
									</td>
						
									<td>
										<bean:write name="search" property="case_kind_disp"
											scope="page" />
									</td>
									<logic:equal value="2" name="cast_type">
									<td>
										<bean:write name="search" property="app_state_cd_s"
											scope="page" />
									</td> 
									</logic:equal>
									<td>
										<bean:write name="search" property="currency_cd_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_date_disp" scope="page" />
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
	</body>
</html>