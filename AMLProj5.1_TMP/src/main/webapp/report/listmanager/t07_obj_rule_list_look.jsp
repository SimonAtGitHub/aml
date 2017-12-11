<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js">
		
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
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
</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
		<html:form action="/listmanager/t07_obj_rule_list.do" method="post" styleId="form0" enctype="multipart/form-data">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>白名单查询</span>
						<span class="buttons"> 
						 <a href="#" id="hdd_display" class="bt_hidden"></a>
						 
						 </span>
					</div>
					<html:errors />
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td >
									创建日期：
								</td>

								<td >
								 <html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
  
									－
									 <html:text property="create1_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
  
									

								</td>
								<td>
									创建机构号：
								</td>
								<td bgcolor="F6F9FF">
									<html:text property="organkey" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字"></html:text>

									<br>
								</td>
							</tr>
							<tr>
								<td >
									客户类型：
								</td>
								<td bgcolor="F6F9FF">
									<bean:define id="party_class_str" name="party_class_str"></bean:define><%=party_class_str %>
								</td>
								<td>
									客户名称：
								</td>
								<td >
									<html:text property="obj_name" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
								</td>
							</tr>
							<tr >
								<td  >
									客户号：
								</td>
								<td >
									<html:text property="party_id" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的用户id|不能超过32个字符"/>
								</td>
								<td height="22" align="right" bgcolor="ECF3FF">
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
							<tr >
									<td align="right" >
										审批状态：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="ischeck">
											<html:options collection="ischeckforpartyMap"
												property="label" labelProperty="value" />
										</html:select>
									</td>								
									
									<td >
									</td>
									<td >

									<input type="button" name="button1" class="in_button1"
										value="查 询"
										onclick="dosubmit('t07_obj_rule_list_look.do?newsearchflag=1&intPage=0')" />
									
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
								<Th width=8%noWrap>
									客户类型
								</Th>
								<Th width=8%noWrap>
									客户状态
								</Th>
								<Th width=8%noWrap>
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
									<TD align="center" height=22>
										<html:link name="map" page="/listmanager/t07_obj_rule_disp.do?changeflag=2">
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
									<TD align="center" noWrap>
										<bean:write name="t07_obj_rule" property="isuse" scope="page" />
									</TD>
									<TD align="center" noWrap>
										<bean:write name="t07_obj_rule" property="ischeck_disp" scope="page" />
									</TD>
								</TR>

							</logic:iterate>
						</TABLE>
					</div>
					<div class="list_page">
						<table width="98%" border="0" align="center" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">&nbsp;
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</div>
					</div>
					</div>
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</BODY>
</HTML>
