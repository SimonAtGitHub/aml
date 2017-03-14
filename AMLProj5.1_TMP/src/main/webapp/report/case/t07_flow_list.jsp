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
<script language="JavaScript" src="../../js/jquery.validator.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

		
		<script type="text/javascript">
function dosubmit(theUrl){  
         var errMsg = "";
         _Date1 = document.forms[0].case_date_start_disp.value;
         _Date2 = document.forms[0].case_date_end_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";
		
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
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("<%=request.getContextPath()%>/js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

function dosubmit2(theUrl){ 
	  document.forms[0].action=theUrl;
      document.forms[0].submit();
}

function  changeType(){
 var type=document.forms[0].cast_type.value;
 
     var url ="<%=request.getContextPath()%>/report/case/t07_flow_list.do?cast_type="+type;
	window.location =url;
}

function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
}

function change_lineColor(){
	var app_numBack = '<%=request.getAttribute("app_numBack")%>';
	var app_nums = '<%=request.getAttribute("application_nums")%>';
	var app_num = app_nums.split(',');
	if(app_numBack != '' && app_num.length > 0){
		var tb = document.getElementById("table_name");
		for(j=0;j<app_num.length;j++){
			if(app_num[j] == app_numBack){
				tb.rows[j+1].style.background='#FFF2C7';
				}
			}
		} 
}
</script>
	</head>
	<body class="mainbg" onload="change_lineColor();">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/case/t07_flow_list.do" method="post" styleId="form0">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>案例处理 - 案例处理列表</span>					
						<span class="buttons">
						    <a href="#" onclick="dosubmit2('validate_all_case.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_submit.png"></img> 验证所有案例</a>
							<a id="hdd_display" class="bt_hidden"></a>&nbsp;
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									数据日期：
								</td>
								<td>
									<html:text property="case_date_start_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									-
									<html:text size="12" property="case_date_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								<td>
								<logic:equal value="1" name="is_white">
								    是否白名单：
								</logic:equal>
								</td>
								<td> 
								<logic:equal value="1" name="is_white">
								    <html:select property="is_menu">
										<html:options collection="is_menuMap" property="label" labelProperty="value" />
									</html:select>
								 </logic:equal>
								 </td>
							</tr>
							<tr>
								<td><%=com.ist.util.Constans.CASE_NAME%>类型：</td>
										<td>
									<bean:define id="casetype_str" name="casetype_str"></bean:define>
				                 <%=casetype_str%>
								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" size="10" onblur="_Onblur('party_name')" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的用户id|不能超过32个字符"/>
									<html:text property="party_name" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
								<td>
									报送机构号：
								</td>
								<td>
									<html:text property="curr_org" size="7" onblur="_Onblur('curr_org_disp')" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字" />
									<html:text property="curr_org_disp" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=curr_org&input_name_disp=curr_org_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								<td>
									当前岗位：
								</td>
								<td>
									<html:select property="curr_post">
										<html:options collection="postMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									币种：
								</td>
								<td>
									<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define><%=curr_cd_str%>
								</td>
								<td>
								    数据性质：
								</td>
								<td>
									<bean:define id="date_status_str" name="date_status_str"></bean:define><%=date_status_str%>
								</td>
							</tr>
						   	 <tr>
						   	    <td>
						   	     	验证状态：
								</td>
								<td>
									<bean:define id="validate_ind_str" name="validate_ind_str"></bean:define>
									<%=validate_ind_str%>
								</td>
									<td>					   	    	 
						   	    案例种类：				   
								</td>
								
						   	    <td> 
						   	      <html:select property="case_kind"  >
										<html:options collection="casecagetoryMap" property="label" labelProperty="value" />
									</html:select>									
						   	    </td>
							</tr>
							<tr>
						   	    <td>
						   	    <logic:equal value="1" name="is_staff">
						   	      是否本行帐户：
						   	    </logic:equal>
								</td>
								<td>
								 <logic:equal value="1" name="is_staff">
								    <html:select property="isstaff">
										<html:options collection="staffflagMap" property="label" labelProperty="value" />
									</html:select>
								 </logic:equal>
								</td>
							
						   	    
						   	    <logic:equal value="1" name="experi">
								<td>
									案例来源：
								</td>
								<td>
								 <html:select property="case_source">
										<html:options collection="sourceMap" property="label" labelProperty="value" />
									</html:select>
								 <input type="button" name="button3" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/t07_flow_list.do?newsearchflag=1')" />
								</td>
								</logic:equal>
								<logic:equal value="0" name="experi">
									<td></td>
									<td>
										<input type="button" name="button3" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/t07_flow_list.do?newsearchflag=1')" />
									</td>
								</logic:equal>
							</tr>
						</table>
					</div>
				</div>
				<html:errors/>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0" id="table_name">
						<tr>
							<th><%=com.ist.util.Constans.CASE_NAME%>编号
							</th>
							<th>
								案例类型
							</th>
							<th>
								案例种类
							</th>
							<th>
								案例名称
							</th>
							
							
							<th>
								币种
							</th>
							<th>
								当前岗位
							</th>
							<th>
								报送机构
							</th>
							<th>
								数据日期
							</th>
							
							<th>
								报送日期
							</th>
							<th>
								数据性质
							</th>
							<th>
								状态
							</th>
							<th>
								验证状态
							</th>
						</tr>
						<logic:present name="t07_flowList">
							<logic:iterate id="flow" name="t07_flowList" type="com.ist.aml.report.dto.CreditTask">
								<tr>
									<%
										java.util.HashMap map = new java.util.HashMap();
													map.put("application_num", flow.getApplication_num());
													map.put("case_kind", flow.getCase_kind());
													pageContext.setAttribute("map", map,
															PageContext.PAGE_SCOPE);
													
									%>
									<td>
										<html:link name="map" page="/case/t07_flow_workbench.do">
											<font color="<bean:write name="flow" property="colorflag"/>">
											<bean:write name="flow" property="application_num" scope="page" />
											</font>
										</html:link>
									</font>
									</td>
									<td>
										<bean:write name="flow" property="cast_type_disp" scope="page" />
										
									</td>
									<td>
										<bean:write name="flow" property="case_kind_disp" scope="page" />
									</td>
									<!--<td>
										<bean:write name="flow" property="party_id" scope="page" />
										<logic:equal value="" name="flow" property="party_id" scope="page">
									      <bean:write name="flow" property="app_org_id" scope="page" />
									    </logic:equal>
									</td>-->
									<td>
										<bean:write name="flow" property="case_name" scope="page" />
										
									</td>
									
									<td>
										<bean:write name="flow" property="curr_cd_disp" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="curr_post_disp" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="app_org_id" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="case_date_disp" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="case_end_date_disp" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="date_status_cd" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="app_state_cd_disp" scope="page" />
									</td>
									<td>
									<logic:equal value="1" name="flow" property="validate_ind" scope="page">
									<img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />
									</logic:equal>
									<logic:notEqual value="1" name="flow" property="validate_ind" scope="page">
									<font color="red"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" /></font>
									</logic:notEqual>
										
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
			</div>
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</body>
</html>
