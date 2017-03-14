<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">		
	
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
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
           
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
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
        if(isSub && errMsg==''){       
            document.forms[0].action=theUrl;
            document.forms[0].submit();
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
	<BODY class="mainbg">
	<div id="main">
	<html:form action="/listmanager/t07_obj_rule_list.do" method="post">
		
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>资金归集客户管理</span>
						<span class="buttons">
						
						 <a href="#"
							onClick="dosubmit('t07_grey_add.do','add')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> <a href="#"
							onClick="dosubmit('t07_grey_modify.do','modi')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a> <!--  20091107
						<input type=button value="删 除" name=Button3 class="input"
							onClick="dosubmit('t07_obj_rule_delete_do.do','del')">
						--> </span>
					</div>
					<table width="100" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>
					<html:errors />
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%" height="22" align="right">
									创建日期：
								</td>

								<td width="40%" bgcolor="F6F9FF">
								 <html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
   
									－
									 <html:text property="create1_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
   
									

								</td>
								<td  align="right">
									机构号：
								</td>
								<td >
									
                      <input type="hidden" name="searchOrganName"  />
						<input type="text" name="organkey" size="13" value="" class="text_white"/>
				 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
									<br>
								</td>
							</tr>
							<tr bgcolor="ECF3FF">
								<td height="22" align="right">
									客户类型：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="party_class_cd">
										<html:options collection="party_class_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td height="22" align="right" bgcolor="ECF3FF">
									客户名称：
								</td>
								<td bgcolor="F6F9FF">
									<html:text property="obj_name" size="20" />
								</td>
							</tr>
							<tr bgcolor="ECF3FF">
								<td height="22" align="right" bgcolor="ECF3FF">
									客户号：
								</td>
								<td bgcolor="F6F9FF">
									<html:text property="party_id" size="20" />
								</td>
								<td>
										审批状态：
									</td>
									<td >
										<html:select property="ischeck">
											<html:options collection="ischeckforpartyMap"
												property="label" labelProperty="value" />
										</html:select>
									

										<input type="button" name="button1" class="in_button1"
										value="查 询"
										onclick="dosubmit('t07_grey_list.do?newsearchflag=1','search')" />
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
								<Th width=8% noWrap>
									客户状态
								</Th>
								<Th noWrap>
									审批状态
								</Th>

							</TR>
							<logic:iterate id="t07_grey" indexId="i"
								name="t07_greyList"
								type="com.ist.aml.report.dto.T07_OBJ_RULE">
								<%
											java.util.HashMap map = new java.util.HashMap();
											map.put("party_id", t07_grey.getParty_id());
											pageContext
											.setAttribute("map", map, PageContext.PAGE_SCOPE);
								%>
								<TR>
									<TD>
										<html:multibox property="selectedPartyId">
											<bean:write name="t07_grey" property="party_id" />-<bean:write name="t07_grey" property="ischeck" />
										</html:multibox>
										
									</TD>
									<TD align="center" height=22>
										<html:link name="map" page="/listmanager/t07_grey_disp.do">
											<bean:write name="t07_grey" property="party_id" />
										</html:link>
									</TD>
									<TD align="center" align="left">
										<bean:write name="t07_grey" property="obj_name"
											scope="page" />
									</TD>
									<TD align="center">
										<bean:write name="t07_grey" property="organkey"
											scope="page" />
									</TD>
									<TD align="center">
										<bean:write name="t07_grey" property="create_dt_disp"
											scope="page" />
									</TD>

									<TD align="center" noWrap>
										<bean:write name="t07_grey" property="party_class_cd"
											scope="page" />
									</TD>
									<TD align="center" noWrap>
										<bean:write name="t07_grey" property="isuse" scope="page" />
									</TD>
									<TD align="center" noWrap>
							<logic:equal value="4" name="t07_grey" property="ischeck">
								<font color=red style="font-size:12px;">审批不通过</font>
							</logic:equal>
							<logic:equal value="1" name="t07_grey" property="ischeck">
								通过
							</logic:equal>
							<logic:equal value="2" name="t07_grey" property="ischeck">
								添加审批
							</logic:equal>
								 <logic:equal value="3" name="t07_grey" property="ischeck">
								修改审批
							
							</logic:equal>
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
			</div>
			
		</html:form>
	</div>
	</BODY>
</HTML>
