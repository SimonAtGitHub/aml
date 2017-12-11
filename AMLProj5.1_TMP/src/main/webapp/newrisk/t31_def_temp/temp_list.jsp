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
    
    }else if(type=='add'){
        //location.href=theUrl+"&"+Math.random();
        //location.href=theUrl;
        isSub = true;
    }else if(type=='search')
    {  
    	   if(!_isDateSpaceComplete(document.forms[0].create_dt_start.value, document.forms[0].create_dt_end.value)){
       		errMsg = "请填写完整的起始时间范围！";
       		}
    	   else if(!_compareTwoDateForString(document.forms[0].create_dt_start.value, document.forms[0].create_dt_end.value)) {
    			 errMsg = "开始时间不能大于结束时间";	
    		}
    	   
   		 else if(getLength(document.forms[0].templatename_s.value)>256)
    		{
    			 errMsg = "评级模板名称输入过长！";	
        	}
    	   isSub = true;
    }
    else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要禁用该模板？')){
                isSub = true;
            }
        }
    }else if(type=='reuse'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要启用该模板？')){
                isSub = true;
            }
        }
    }else if(type=='copy'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要复制该模板？')){
                isSub = true;
            }
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

function _Commit(tempname,theUrl)
{
	document.forms[0].templatename.value=tempname;
	
	 document.forms[0].action=theUrl;
        document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/t31_def_temp/t31_def_tempList.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
			<!-- title -->
				<div class="cond_t">
					<span>配置管理 - <logic:equal name="temptype" value="1">积分评级体系模板</logic:equal>
									<logic:equal name="temptype" value="2">公式评级体系模板</logic:equal>
					</span>
						
					<span class="buttons"> 
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onClick="dosubmit('t31_def_temp_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />添 加</a>
						<!--  
						<a href="#" onClick="dosubmit('t31_def_temp_main_modify.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
						 -->
						<a href="#" onClick="dosubmit('t31_def_temp_copy.do','copy');"><img src="../../images/<%=session.getAttribute("style") %>/b_copy.png" />复 制</a>
						<a href="#" onClick="dosubmit('flag_change.do?flag=0','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />禁 用</a>
						<a href="#" onClick="dosubmit('flag_change.do?flag=1','reuse');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />启 用</a>
					</span>
				</div>
					<html:hidden property="temptype" />
					<html:hidden property="templatename" />
				<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									评级模板名称：
								</td>
								<td>
									<html:text property="templatename_s" styleClass="text_white" maxlength="250"/>
								</td>
								<td>
									客户类型：
								</td>
								<td>
									<html:select property="party_class_cd">
										<html:options collection="clienttypeMap" property="label"
											labelProperty="value" />
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
									模板状态：
								</td>
								<td>
									<html:select property="flag">
										<html:options collection="tflagMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
							    <td>
							            评级周期：
							    </td>
							    <td>
							       <html:select property="granularity">
											<html:options collection="granularityMap" property="label" labelProperty="value" />
									</html:select>
							    </td>
								<td>
									模板类别：
								</td>
								<td>
									<html:select property="tempcategory">
										<html:options collection="tcategoryMap" property="label" labelProperty="value" />
									</html:select>
									&nbsp;&nbsp;
									<input type=button value="查  询" name=Button522 class="in_button1"
										onClick="dosubmit('t31_def_tempList.do?newsearchflag=1&temptype=<bean:write name="temptype"/>','search')"
										class="input" />
								</td>
							</tr>
						</table>
				</div>
					<%
					if ((String) request.getAttribute("err") != null) {
					%>
					<TABLE width="98%" border=0 align="center" cellpadding="2"
						cellspacing="1">
						<font color="#FF0000" size="2"> <bean:write name="err" />
						</font>
					</table>
					<%
					}
					%>
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							<%
						ArrayList list１ = new ArrayList();
						if (request.getAttribute("t31_def_tempList") != null) {
				 			list１ = (ArrayList) request
				 			.getAttribute("t31_def_tempList");
				 		}
						
						if(list１.size()>0){
						%>
								<th>
									<input type="checkbox" name="guizbms" value="0"
										onClick="selectORClearBox(forms[0],this.checked)" />
								</th>
								<%} %>
								<th>
									评级模板名称
								</th>
								<th>
									评级周期
								</th>
								<th>
									客户类型
								</th>
								<th>
									模板创建时间
								</th>
								<th>
									模板状态
								</th>
								<th>
									模板类别
								</th>
							</tr>
							<logic:present name="t31_def_tempList">
								<logic:iterate id="t31_def_temp" name="t31_def_tempList"
									type="com.ist.aml.newrisk.dto.T31_def_temp">
									<tr>
										<td>
											<html:multibox property="templatekeys">
												<bean:write name="t31_def_temp" property="templatekey" />
											</html:multibox>
										</td>
										
										<!-- 
										<logic:equal name="temptype" value="1">
										<td>
											<a href="<%=request.getContextPath()%>/newrisk/t31_def_temp/temp_jf_disp.jsp?templatekey=<bean:write name='t31_def_temp' property='templatekey'/>&temptype=1&templatename=<bean:write name='t31_def_temp' property='templatename'/>">
												<bean:write name="t31_def_temp" property="templatename" />
											</a>
										</td>
										</logic:equal>
										<logic:equal name="temptype" value="2">
										<td>
											<a href="#" onclick="_Commit('<bean:write name="t31_def_temp" property="templatename" />','../t31_def_gs/t31_def_gs_list.do?newsearchflag=1&templatekey=<bean:write name="t31_def_temp" property="templatekey"/>&party_class_cd=<bean:write name="t31_def_temp" property="party_class_cd"/>&granularity=<bean:write name="t31_def_temp" property="granularity"/>');">
												<bean:write name="t31_def_temp" property="templatename" />
											</a>
										</td>
										</logic:equal>
										 -->
										 <logic:equal name="temptype" value="1">
										 <td>
											<a href="<%=request.getContextPath()%>/newrisk/t31_def_temp/t31_def_temp_main_modify.do?templatekey=<bean:write name='t31_def_temp' property='templatekey'/>&temptype=1&templatename=<bean:write name='t31_def_temp' property='templatename'/>">
												<bean:write name="t31_def_temp" property="templatename" />
											</a>
										</td>
										</logic:equal>
										<logic:equal name="temptype" value="2">
										<td>
											<a href="#" onclick="_Commit('<bean:write name="t31_def_temp" property="templatename" />','../t31_def_temp/t31_def_temp_main_modify.do?newsearchflag=1&templatekey=<bean:write name="t31_def_temp" property="templatekey"/>&party_class_cd=<bean:write name="t31_def_temp" property="party_class_cd"/>&granularity=<bean:write name="t31_def_temp" property="granularity"/>');">
												<bean:write name="t31_def_temp" property="templatename" />
											</a>
										</td>
										</logic:equal>
										
										
										<td>
											<bean:write name="t31_def_temp" property="granularity_disp" />
										</td>
										<td>
											<bean:write name="t31_def_temp" property="party_class_cd_disp" />
										</td>
										<td>
											<bean:write name="t31_def_temp" property="create_dt" />
										</td>
										<td>
											<bean:write name="t31_def_temp" property="flag_disp" />
										</td>
										<td>
											<bean:write name="t31_def_temp" property="tempcategory_disp" />
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
		</html:form>
	</BODY>
</HTML>
