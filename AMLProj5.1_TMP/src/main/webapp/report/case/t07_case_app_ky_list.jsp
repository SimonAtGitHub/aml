<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="<%=request.getContextPath()%>/js/title.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/jquery.validator.js"></script>
		<script type="text/javascript">
/**function  _Disp(){
 var type=eval('document.forms[0].cast_type');
 
   var tv=type.value;
 
   if(tv=="2"){
    document.all.null1.style.display="none";
    document.all.null2.style.display="none";
    document.all.kind1.style.display="";
     document.all.kind2.style.display="";
   
     }
  else{
   document.all.null1.style.display="";
    document.all.null2.style.display="";
    document.all.kind1.style.display="none";
     document.all.kind2.style.display="none";
     document.all.party_class_cd.value="";
   }
}**/
function _Onblur(){
   document.forms[0].organName.value="";
}
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

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

function _confirm(theurl){
	if(theurl.indexOf('app_state_cd=4')>0){
	
	if(confirm('确定排除此案例吗？')){
		document.forms[0].action=theurl;	
    	document.forms[0].submit();
	}
	}else{
	document.forms[0].action=theurl;	
    	document.forms[0].submit();
	}
}
</script>
	</head>
	<!--<BODY leftmargin="0" topmargin="0" onload="_Disp()">  -->
	<body class="mainbg">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/case/t07_case_app_ky_list.do" method="post" styleId="form0">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>案例处理 - 可疑案例特殊处理列表</span>						
						 <span class="buttons">
						   <a id="hdd_display" class="bt_hidden"></a>
						   <!--  <a href="#"><img src="../../images/<%=session.getAttribute("style") %>/b_excluded.png" />排除</a>
						-->
					
						<logic:present name="huifuflag">
						 <logic:equal  name="huifuflag"  value="1">
						   <logic:empty name="backstr">
						  <a href="#" onclick="_confirm('t07_case_huifu_commit.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_recovery.png" />批量提交</a>
						   </logic:empty>
						 </logic:equal>
						</logic:present>
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
								 <html:text property="case_date_start_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" /> --
                                 <html:text property="case_date_end_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" />	
									
								</td>
							  <td>
								案例类型：
								</td>
								<td>
								<html:select property="type">
										<html:options collection="casetypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>	
							<tr>
								
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" size="10" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的用户id|不能超过32个字符" />
									<html:text property="party_name" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
					 
								<td>
									创建机构：
								</td>
								<td>
									<html:text property="app_org_id" size="7" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字"/>
									<html:text property="app_org_name" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=app_org_id&input_name_disp=app_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
					
							</tr>
							<tr>
								<td>案例编号：</td>
								<td><html:text property="application_num" require="false" datatype="safeString|limit_max" max="64" msg="请输入合法的案例编号|不能超过64个字符" /></td>
							<td>
									当前岗位：
								</td>
								<td>
									<html:select property="post_id">
										<html:options collection="postMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
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
								<td></td>
								<td>
									<input type="button" name="button3" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/t07_case_app_ky_list.do?newsearchflag=1&delete_flag=1')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors/>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
						
							<th>案例编号
							</th>
							<th>
								类型
							</th>
						<!--  	<th>
								案例种类
							</th>-->
							<!--<th>
								客户号
							</th>
							--><th>
								案例名称
							</th>
							<th>
								当前岗位
							</th>
							<th>
								币种
							</th>
							<th>
								报送机构
							</th>
							<th>
								交易日期
							</th>
							<th>
								操作
							</th>
							
						</tr>
						<logic:present name="t07_case_applicationList">
						<logic:iterate id="case1" name="t07_case_applicationList"
							type="com.ist.aml.report.dto.T07_case_application">
							<tr>
								<%
									java.util.HashMap map = new java.util.HashMap();
												map.put("application_num", case1.getApplication_num());
												map.put("caseFlag","0");
												map.put("intPage",request.getAttribute("intPage")==null?"0":request.getAttribute("intPage"));;
												pageContext.setAttribute("map", map,
														PageContext.PAGE_SCOPE);
								%>
								<td>									
										<bean:write name="case1" property="application_num" scope="page" />
								</td>
								
							<td>
									<bean:write name="case1" property="cast_type_disp" scope="page" />
								</td> 
									<!-- <td>
									<bean:write name="case1" property="case_kind_disp" scope="page" />
								</td>--><!--
								<td>
									<bean:write name="case1" property="party_id" scope="page" />
								</td>
								--><td>
										<bean:write name="case1" property="case_name" scope="page" />
								</td>
								<td>
									<bean:write name="case1" property="post_name" scope="page" />
								</td>
								<td>
									<bean:write name="case1" property="currency_cd_disp" scope="page" />
								</td>
								<td>
									<bean:write name="case1" property="app_org_id" scope="page" />
								</td>
								<td>
									<bean:write name="case1" property="case_date_disp" scope="page" />
								</td>
								
								<td>
									<logic:equal value="1" name="case1" property="app_state_cd">
										<a href="#" onclick="_confirm('<%=request.getContextPath() %>/report/case/t07_case_app_ky_paichu_or_huifu.do?application_num=<bean:write name="case1" property="application_num" />&party_id=<bean:write name="case1" property="party_id" />&app_state_cd=4')">排除</a>
									</logic:equal>
									<logic:equal value="3" name="case1" property="app_state_cd">
										<a href="#" onclick="_confirm('<%=request.getContextPath() %>/report/case/t07_case_app_ky_paichu_or_huifu.do?application_num=<bean:write name="case1" property="application_num" scope="page" />&app_state_cd=4')">排除</a>
									</logic:equal>
									<logic:equal value="4" name="case1" property="app_state_cd">
										<a href="#" onclick="_confirm('<%=request.getContextPath() %>/report/case/t07_case_app_ky_paichu_or_huifu.do?application_num_s=<bean:write name="case1" property="application_num" scope="page" />&curr_cd=<bean:write name="case1" property="curr_cd"  />&app_state_cd=8&party_id_s=<bean:write name="case1" property="party_id" />&cast_type=<bean:write name="case1" property="cast_type" />&flow_id=<bean:write name="case1" property="flow_id" />')">恢复</a>
									</logic:equal>
								</td>
								
							</tr>
						</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<logic:present name="pageInfo" >
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
