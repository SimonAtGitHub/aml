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
		 <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
 <script type="text/javascript" src="../../js/calendar.js"></script>

<script type="text/javascript" src="../../js/aml.js">
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
	
	
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
function dosubmit(theUrl){
        var errMsg = "";
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
			
        if(errMsg=='')
        {       
            document.forms[0].action=theUrl;
            if(jQuery('#form0').validateAll()){
		          document.forms[0].submit()
		         }
            //document.forms[0].submit();
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
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id="main">
		<html:form action="/listmanager/t07_blacklist_list.do" method="post" styleId="form0" enctype="multipart/form-data">
		
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>
						
							黑名单查询
						
									</span>
									 <span class="buttons">
									  <a href="#" id="hdd_display" class="bt_hidden"></a> 
									  <a href="#"  
									  onClick="dosubmit('t07_blacklist_export.do','export')">
										<img src="../../images/<%=session.getAttribute("style") %>/b_download.png" />黑名单导出</a>
									 </span>
									</div>
			
			<html:errors />
			<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
					<TR>
									<td height="22">
										创建日期：
									</td>

									<td>
									<html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
 
										
										－
										<html:text property="create1_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
 
										
									</td>
									<td>
										创建机构号：
									</td>
									<td >
										<html:text property="organkey" require="false" datatype="number|limit_max" max="10" msg="请输入数字|不能超过10个数字">
										</html:text>
										<br>
									</td>
									<td >
									</td>
								</tr>
								<tr>
									<td height="22">
										客户类型：
									</td>
									<td >
										<bean:define id="party_class_str" name="party_class_str"></bean:define><%=party_class_str %>
									</td>
									<td>
										客户名称：
									</td>
									<td >
										<html:text property="obj_name" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
									</td>
									<td >
									</td>
								</tr>
								<tr>
									<td height="22" align="right">
										客户号：
									</td>
									<td >
										<html:text property="party_id" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的用户id|不能超过32个字符"/>
									</td>
									<td align="right">
										审批状态：
									</td>
									<td >
										<html:select property="ischeck">
											<html:options collection="ischeckforpartyMap"
												property="label" labelProperty="value" />
										</html:select>
									</td>		
									
								</tr>
								<tr>
									<td>
										创建机构名称：
									</td>
									<td >
										<html:text property="organname" require="false" datatype="safeString|limit_max" max="20" msg="请输入合法的机构名称|不能超过20个数字"/>
									</td>
																		<td align="right">
										排序：
									</td>
									<td >

										<html:select property="listsearch_type">
											<html:options collection="listsearch_typeMap"
												property="label" labelProperty="value" />
										</html:select>

										<html:radio property="fashion" value='asc' />
										升序

										<html:radio property="fashion" value='desc' />
										降序
									</td>

									<td >
                                         &nbsp;
										</td>
								</tr>
								
								<tr>
									<td height="22" align="right">
						             
							                名单类型：
						               
									</td>
										<td  >
											<html:select property="m_list_type" style="width:200px" onmouseover="FixWidth(this);">
												<html:options collection="m_list_typeMap" property="label"
													labelProperty="value" />
											</html:select> 
										</td>						
									<td align="right">
										&nbsp;
									</td>
									
									<td >

										<input type="button" class="in_button1" value="查 询"
											onClick="dosubmit('t07_blacklist_list_look.do?newsearchflag=1&intPage=0')" />
										</td>
								</tr>
							</table>
							</div>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
		<div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
					<TH width=15% noWrap>
						客户号
						<br>
					</TH>
					<TH width=15% noWrap>
						客户名称
					</TH>
					<TH width=25% noWrap>
						创建机构
					</TH>
					<TH width=13% noWrap>

						创建时间
					</TH>
					<TH width=8%noWrap>
						客户类型
					</TH>
					<TH width=8%noWrap>
						客户状态
					</TH>
					<Th width=8%noWrap>
									审批状态
					</Th>
				</TR>
				<logic:iterate id="t07_blacklist" indexId="i"
					name="t07_blacklistList"
					type="com.ist.aml.report.dto.T07_Blacklist">
					<%
						java.util.HashMap map = new java.util.HashMap();
										map.put("party_id", t07_blacklist.getParty_id());
										pageContext.setAttribute("map", map,
												PageContext.PAGE_SCOPE);
					%>
					<TR>
						<TD align="center" height=22>
							<html:link name="map" page="/listmanager/t07_blacklist_disp.do?changeflag=2">
								<bean:write name="t07_blacklist" property="party_id" />
							</html:link>
						</TD>
						<TD align="center" align="left">
							<bean:write name="t07_blacklist" property="obj_name" scope="page" />
						</TD>
						<TD align="center">
							<bean:write name="t07_blacklist" property="organkey" scope="page" />
						</TD>
						<TD align="center">
							<bean:write name="t07_blacklist" property="create_dt_disp"
								scope="page" />
						</TD>

						<TD align="center" noWrap>
							<bean:write name="t07_blacklist" property="party_class_cd"
								scope="page" />
						</TD>
						<TD align="center" noWrap>
							<bean:write name="t07_blacklist" property="isuse" scope="page" />
						</TD>
						<TD align="center" noWrap>
							<bean:write name="t07_blacklist" property="ischeck_disp" scope="page" />
						</TD>
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
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
         	//.checkFormSearch();
         </script>
	</BODY>
</HTML>
