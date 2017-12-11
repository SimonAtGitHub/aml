<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		
		
		<SCRIPT LANGUAGE="JavaScript">
		
	function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}
	
  function selectAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = true;
        }
    }
}

  function clearAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = false;
        }
    }
}
	
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
     function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'||type=='del'){
        if (checkRadio(document.forms[0])<0){
            alert("请选择!");
            return false;
        }
        }
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            var len=document.forms[0].selectedPartyId.length;
            if(len >= 1)
            {
            	for(var i=0;i<len;i++){
            		var obj = document.forms[0].selectedPartyId[i];
            		if(obj.checked){
            			if(document.getElementById("check_"+obj.value).value !='2' && document.getElementById("check_"+obj.value).value !='5'){
            				errMsg+="您选择的客户" + obj.value + "，无权对其进行修改！";
            				break;
            			}
            		}
           	 }
            }
 			else
 			{
 				var obj = document.forms[0].selectedPartyId;
            	if(document.getElementById("check_"+obj.value).value !='2' && document.getElementById("check_"+obj.value).value !='5')
            	{
            		errMsg+="您选择的客户" + obj.value + "，无权对其进行修改！";
            	}
 			}
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            var len=document.forms[0].selectedPartyId.length;
            if(len >= 1)
            {
            	for(var i=0;i<len;i++){
            	var obj = document.forms[0].selectedPartyId[i];
            	if(obj.checked){
            		if(document.getElementById("check_"+obj.value).value !='2' ){
            			errMsg+="您选择的客户"+ obj.value + "已处于非待审核状态，无权进行删除！";
            			break;
            			}
            		}
            	}
 
            }
            else
            {
            	var obj = document.forms[0].selectedPartyId;
            	if(document.getElementById("check_"+obj.value).value !='2' )
            	{
            		errMsg+="您选择的客户" + obj.value + "已处于非待审核状态，无权进行删除！";
            	}
            }
            
            if(errMsg==''){
                if(confirm('你真的要删除选择的名单吗？')){
                    isSub = true;
                }
            }
        }
        else if(type=='search' || type=='add'){
            isSub = true;
        }
        if(type=='search'){
    	_Date1 = document.forms[0].create_dt_disp.value;
    	_Date2 = document.forms[0].create1_dt_disp.value;  
    	if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";
         else if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";		  		
  		isSub = true;
 	}
 	if(type=='inport'){
             isSub = true;
             if(getLength(document.forms[0].filename.value)==0){
               errMsg="请选择文件路径！";
             }  
        }
    
 	if(isSub && errMsg=='')
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
function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text" && ele[i].type.toLowerCase()!="hidden")continue;
       ele[i].value="";
    }
    
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}

</SCRIPT>
<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />全 清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />全 选");
	  });
});
</script>

	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form action="/listmanager/t07_obj_rule_list.do" method="post" styleId="form0" enctype="multipart/form-data">
			<input type="hidden" name="status" value=""/>
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>白名单管理</span>
						</div>
						<div class="cond_t2">
						<span class="buttons">
						 <a href="#" id="hdd_display" class="bt_hidden"></a>  
						  <span class="buttons"> <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a>
						 <a href="#"
							onClick="dosubmit('t07_obj_rule_add.do','add')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> 
						 <a href="#" onClick="dosubmit('t07_obj_rule_modify.do','modi')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a> 
						<a href="#" onClick="dosubmit('t07_obj_rule_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	
						<logic:equal name="organlevel" value="0">
						<html:file property="filename" styleClass="input"/>
			<a href="#"  
				onClick="dosubmit('t07_obj_rule_list_inport.do','inport')"><img src="../../images/<%=session.getAttribute("style") %>/b_import.png" />导入名单</a>
			<a href="#"   
				onClick="window.open('<%=request.getContextPath() %>/common/download_attach.jsp?url=/report/listmanager/t07_listtablewhite.xls&flag=1','','height=160, width=300,left=100,top=100');">
				<img src="../../images/<%=session.getAttribute("style") %>/b_download.png" />下载表样</a>
				</logic:equal>
						</span>
					</div>
					
					<html:errors />
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%" height="22" align="right">
									创建日期：
								</td>

								<td width="40%" >
								 <html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
   
									－
									 <html:text property="create1_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>

								</td>
								<td width="10%" align="right">
									创建机构：
								</td>
								<td >
									<html:text property="organkey" size="10" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字"/>
									<html:text property="organname" styleClass="text_white"
										size="23" readonly="true" maxlength="10" />
<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									<br>
								</td>
							</tr>
							<tr>
								<td height="22" align="right">
									客户类型：
								</td>
								<td >
									<bean:define id="party_class_str" name="party_class_str"></bean:define><%=party_class_str %>
								</td>
								<td height="22" align="right">
									客户名称：
								</td>
								<td >
									<html:text property="obj_name" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
								</td>
							</tr>
							<tr>
								<td height="22" align="right">
									客户号：
								</td>
								<td >
									<html:text property="party_id" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的用户id|不能超过32个字符" />
								</td>
								<td height="22" align="right">
									排序：
								</td>
								<td >

									<html:select property="listsearch_type">
										<html:options collection="listsearch_typeMap" property="label"
											labelProperty="value" />
									</html:select>

									<html:radio property="fashion" value='asc' />
									升序

									<html:radio property="fashion" value='desc' />
									降序

									
								</td>
							</tr>
							
							<tr>
									<td align="right">
										审批状态：
									</td>
									<td >
										<html:select property="ischeck">
											<html:options collection="ischeckforpartyMap"
												property="label" labelProperty="value" />
										</html:select>
									</td>								
									
									<td >
                                       &nbsp;
									</td>
									<td >

										<input type="button" name="button1" class="in_button1"
										value="查 询"
										onclick="dosubmit('t07_obj_rule_list.do?newsearchflag=1&intPage=0','search')" />
									</td>
								</tr>
						</table>
					</div>
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<Th width=5% height=22 noWrap>
									选择
								</Th>
								<Th width=15% noWrap>
									客户号
									<br>
								</Th>
								<Th width=15% noWrap>
									客户名称
								</Th>
								<Th width=25% noWrap>
									创建机构
								</Th>
								<Th width=13% noWrap>

									创建时间
								</Th>
								<Th width=8% noWrap>
									客户类型
								</Th>
<%--								<Th width=8% noWrap>--%>
<%--									客户状态--%>
<%--								</Th>--%>
								<Th width=8% noWrap>
									审批状态
								</Th>
							</TR>
							<logic:iterate id="t07_obj_rule" indexId="i"
								name="t07_obj_ruleList"
								type="com.ist.aml.report.dto.T07_OBJ_RULE">
								<%
											java.util.HashMap map = new java.util.HashMap();
											map.put("party_id", t07_obj_rule.getParty_id());
											pageContext
											.setAttribute("map", map, PageContext.PAGE_SCOPE);
								%>
								<TR>
									<TD>
										<html:multibox property="selectedPartyId" >
											<bean:write name="t07_obj_rule" property="party_id" />
										</html:multibox>
									
										 
										<input type="hidden"
											id="check_<bean:write name="t07_obj_rule" property="party_id" />"
											name="check_<bean:write name="t07_obj_rule" property="party_id" />"
											value="<bean:write name="t07_obj_rule" property="ischeck" />">
									</TD>
									<TD align="center" height=22>
										<html:link name="map" page="/listmanager/t07_obj_rule_disp.do?changeflag=1">
											<bean:write name="t07_obj_rule" property="party_id" />
										</html:link>
									</TD>
									<TD align="center" align="left">
										<bean:write name="t07_obj_rule" property="obj_name"
											scope="page" />
									</TD>
									<TD align="center">
										<bean:write name="t07_obj_rule" property="organkey"
											scope="page" />
									</TD>
									<TD align="center">
										<bean:write name="t07_obj_rule" property="create_dt_disp"
											scope="page" />
									</TD>

									<TD align="center" noWrap>
										<bean:write name="t07_obj_rule" property="party_class_cd"
											scope="page" />
									</TD>
<%--									<TD align="center" noWrap>--%>
<%--										<bean:write name="t07_obj_rule" property="isuse" scope="page" />--%>
<%--									</TD>--%>
									
									<%-- start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作 --%>
									<%-- <TD align="center" noWrap>
										<logic:equal value="4" name="t07_obj_rule" property="ischeck">
											<font color=red style="font-size:12px;">审批不通过</font>
										</logic:equal>
										<logic:equal value="1" name="t07_obj_rule" property="ischeck">
								通过
							</logic:equal>
										<logic:equal value="2" name="t07_obj_rule" property="ischeck">
								添加审批
							</logic:equal>
										<logic:equal value="3" name="t07_obj_rule" property="ischeck">
								修改审批
								<a
												href="<%=request.getContextPath() %>/report/listmanager/t07_obj_rule_update_disp.do?party_id=<bean:write name="t07_obj_rule" property="party_id" />">查看</a>
										</logic:equal>
									</TD> --%>
									<TD align="center" noWrap>
										<logic:equal value="4" name="t07_obj_rule" property="ischeck">
											<font color=red style="font-size:12px;">
											    <bean:write name="t07_obj_rule" property="ischeck_disp" scope="page" />
											</font>
										</logic:equal>
										<logic:equal value="7" name="t07_obj_rule" property="ischeck">
											<font color=red style="font-size:12px;">
											    <bean:write name="t07_obj_rule" property="ischeck_disp" scope="page" />
											</font>
										</logic:equal>
										<logic:notEqual value="4" name="t07_obj_rule" property="ischeck">
										    <logic:notEqual value="7" name="t07_obj_rule" property="ischeck">
										        <bean:write name="t07_obj_rule" property="ischeck_disp" scope="page" />
										    </logic:notEqual>
										</logic:notEqual>
										<logic:equal value="3" name="t07_obj_rule" property="ischeck">
								           <a href="<%=request.getContextPath() %>/report/listmanager/t07_obj_rule_update_disp.do?party_id=<bean:write name="t07_obj_rule" property="party_id" />">查看</a>
										</logic:equal>
										<logic:equal value="6" name="t07_obj_rule" property="ischeck">
								           <a href="<%=request.getContextPath() %>/report/listmanager/t07_obj_rule_update_disp.do?party_id=<bean:write name="t07_obj_rule" property="party_id" />">查看</a>
										</logic:equal>
									</TD>
									<%-- start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作 --%>
									
								</TR>

							</logic:iterate>
						</TABLE>
					</div>
					<div class="list_page">
						<table width="98%" border="0" align="center" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</div>
					</div>
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</BODY>
</HTML>
