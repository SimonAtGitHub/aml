<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>
		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>

		
		<SCRIPT LANGUAGE="JavaScript">
function fPopUpCalendarDlg1(ctrlobj)
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

function selectORClearBox(_form,_setval){
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	

function dosubmit(theUrl,type){
   var isSub = false;
   var errMsg = "";
   if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    
    }else if(type=='search' || type=='add' || type=='back'){
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你确定要删除该公式？')){
                isSub = true;
            }
        }
    }
    if(type=='search')
    {
    	 if(!_compareTwoDateForString(document.forms[0].create_dt_start.value, document.forms[0].create_dt_end.value)) {
	 errMsg = "开始时间不能大于结束时间";		    
		   } 
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
function selectORClearBox(_form,_setval){
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/t31_def_gs/t31_def_gs_list.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
			<!-- title -->
				<div class="cond_t">
					<span><bean:write name="t31_def_gsActionForm" property="templatename" /> - 公式评级体系 </span>
						
					<span class="buttons"> 
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onClick="dosubmit('t31_def_gs_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />添 加</a> 
						<a href="#" onClick="dosubmit('t31_def_gs_modify.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
						<a href="#" onClick="dosubmit('t31_def_gs_delete_do.do','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
					</span>
				</div>
				<html:hidden property="templatekey" />
				<html:hidden property="templatename" />
				<html:hidden property="party_class_cd" />
				<html:hidden property="granularity" />
				<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									公式名称：
								</td>
								<td>
									<html:text property="gsname" styleClass="text_white"/>
								</td>
								<td>
									公式等级：
								</td>
								<td>
									<html:select property="levelkey">
										<html:options collection="levelMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									创建起止时间：
								</td>
								<td>
								 <html:text property="create_dt_start" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
  
									
									-
									<html:text property="create_dt_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
  
									
								</td>
								<td>
									公式状态：
								</td>
								<td>
									<html:select property="flag">
										<html:options collection="flagMap" property="label" labelProperty="value" />
									</html:select>
									<input type=button value="查  询" name=Button522 class="in_button1"
										onClick="dosubmit('t31_def_gs_list.do?newsearchflag=1','search')"
										class="input"></input>
								</td>
							</tr>
							
						</table>
				</div>
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>
								
								<%
								ArrayList list１ = new ArrayList();
								if (request.getAttribute("t31_def_gsList") != null) {
				 				list１ = (ArrayList) request.getAttribute("t31_def_gsList");
				 				}
								if(list１.size()>1){
								%>
								<input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)" />
								<%} 
								else {%>
									选择
								<%} %>		
								</th>
								
								<th>
									公式名称
								</th>
								<th>
									粒度(评级周期)
								</th>
								<th>
									公式等级
								</th>
								<th>
									客户类型
								</th>
								<th>
									公式创建时间
								</th>
								<th>
									公式状态
								</th>
							</tr>
							<logic:present name="t31_def_gsList">
								<logic:iterate id="t31_def_gs" name="t31_def_gsList"
									type="com.ist.aml.newrisk.dto.T31_def_gs">
									<tr>
										<td>
											<html:multibox property="gskeys">
												<bean:write name="t31_def_gs" property="gskey" />
											</html:multibox>
										</td>
										<td>
											<a href='<%=request.getContextPath()%>/newrisk/t31_def_gs/t31_def_gs_disp.do?templatekey=<bean:write name="t31_def_gs" property="templatekey"/>&templatename=<%=(String)request.getAttribute("templatename")%>&gskey=<bean:write name="t31_def_gs" property="gskey"/>&party_class_cd=<%=(String)request.getAttribute("party_class_cd")%>'>
												<bean:write name="t31_def_gs" property="gsname" />
											</a>
										</td>
										<td>
											<bean:write name="t31_def_gs" property="granularity_disp" />
										</td>
										<td>
											<bean:write name="t31_def_gs" property="level_disp" />
										</td>
										<td>
											<bean:write name="t31_def_gs" property="party_class_cd_disp" />
										</td>
										<td>
											<bean:write name="t31_def_gs" property="create_dt" />
										</td>
										<td>
											<bean:write name="t31_def_gs" property="flag_disp" />
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
						</table>
					</div>
					<div class="list_page">
						<logic:present name="pageInfo">
							<table width="98%" align="center" border="0" cellpadding="3"
								cellspacing="3">
								<tr>
									<td align="center">
									<logic:present name="pageInfo" scope="request">
										<bean:write name="pageInfo" scope="request" filter="false" />
									</logic:present>
									</td>
								</tr>
							</table>
						</logic:present>
					</div>
				</div>
				</div>
	</html:form>
</BODY>
</HTML>
