<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<SCRIPT LANGUAGE="JavaScript">
function selectORClearBox(_form,_setval){
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	
function _Open(url){
window.open(url,'enter2','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=no');
										
}
function dosubmit(theUrl,type){
   var isSub = false;
   var errMsg = "";
   if(type=='search'){
   		if(!_compareTwoDateForString(document.forms[0].statistic_dt_disp.value, document.forms[0].statistic_dt_disp_end.value))
   		{
    		errMsg = "开始时间不能大于结束时间";	
    	}
    	else if (!_compareTwoDateForString(document.forms[0].create_dt_disp.value, document.forms[0].create_dt_disp_end.value))
    	{
    		errMsg = "开始时间不能大于结束时间";	
    	}
        isSub = true;
    }
    else if(type=='export'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
        	isSub = true;
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

function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/result/t37_party_result_notrans_list.do" method="post">
	<input type="hidden" name="backurl" value="t37_party_result_notrans_list.do"/>
		<div id="main">
				<!-- conditions -->
			<div class="conditions">
					<!-- title -->
				<div class="cond_t">
					<span>久悬户评级结果查询
					</span>
					<span class="buttons">
						<a href="#" id="hdd_display" class="bt_hidden"></a>
                    </span>
				</div>
                    <html:hidden  property="marked" />
				<div class="cond_c" id="searchtable">
					<table width="100%" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<td width="14%" height="22" align="right" nowrap>
									客户号：
								</td>
								<td width="36%">
									<html:text property="party_id" styleClass="text_white"
										size="10" maxlength="32" onchange="_Onblur('party_chn_name')"/>
										<html:text property="party_chn_name" styleClass="text_white"
					                    size="23" readonly="true" />
										 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
										
								</td>
								<td width="14%" align="right">
									归属机构：
								</td>
								<td width="37%">
									<html:text property="organkey" styleClass="text_white"
										size="10" maxlength="12" onchange="_Onblur('organ_name')" />
									<html:text property="organ_name" styleClass="text_white"
										size="23" readonly="readonly" />
									
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organ_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>

									

								</td>
							</tr>
							<tr>
								<td width="14%" height="22" align="right" nowrap
									>
									客户类型：
								</td>
								<td width="36%" nowrap>
									<html:select property="party_class_cd">
										<html:options collection="clienttypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="22" align="right" nowrap>
									系统评级结果：
								</td>
								<td width="36%">
									<html:select property="fristappralevel">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
							</tr>
							<tr>
                                <td width="14%" align="right">
									模板类型：
								</td>
								<td width="36%">
									<html:select property="temptype">
										<html:options collection="temp_type_map" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="22" align="right" nowrap>
									人工评级结果：
								</td>
								<td width="36%">
									<html:select property="emendationlevel">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
							</tr>
							<tr>
								<td width="14%" height="22" align="right">
									系统评级日期：
								</td>
								<td width="36%">
								<html:text property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                --
                                <html:text property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
								<td width="14%" height="22" align="right" nowrap>
									开户起至日期：
								</td>
								<td width="36%">
								<html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
 
									--
									<html:text property="create_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
								</td>

							</tr>
                            <tr >
                                <td width="14%" height="22" align="right">
									排序：
								</td>
								<td width="37%">
									<html:select property="orderby">
										<html:options collection="resultsortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									
								</td>
								<td></td>
								<td><input type="button" value="查  询" name=Button522
										onClick="dosubmit('t37_party_result_notrans_list.do?newsearchflag=1','search')"
										class="in_button1"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th nowrap bgcolor="A3C0EE">
								<input type="checkbox" name="guizbms" value="0"
									onClick="selectORClearBox(forms[0],this.checked)" />
							</th>
							<th width="13%" nowrap>
								客户名称
							</th>
							<th width="11%" nowrap>
								客户号
							</th>
							
							<th width="12%" nowrap>
								系统评级结果
							</th>
							<th width="12%" nowrap>
								最终等级
							</th>
							<th width="10%" nowrap>
								系统评级日期
							</th>
							<th width="10%" nowrap>
								开户日期
							</th>
							<th width="8%" nowrap>
								查看信息
							</th>
					
							<th width="18%" nowrap>
								所属机构
							</th>
								<th width="8%" nowrap>
								模板类型
							</th>
						</tr>
						<logic:present name="tempList">
							<logic:iterate id="result" name="tempList"
								type="com.ist.aml.newrisk.dto.T37_party_result_uh">
								<tr align="center" bgcolor="#FFFFFF">
								<%
										String party_id = result.getParty_id();
								        if(party_id.contains("#")){
								        	party_id = party_id.replace("#","%23");
								        }
									%>	
									<td align="center">
										<html:multibox property="selectedResulekey" >
											<bean:write name="result" property="resulekey" />
										</html:multibox>
									</td>
									<td nowrap>
										<bean:write name="result" property="party_chn_name" />
									</td>
									<td>
										<bean:write name="result" property="party_id" />
									</td>
									
									<td>
							             <bean:write name="result" property="fristappralevel_disp" />
									</td>
									<td>
										<bean:write name="result" property="levelkey_disp" />
									</td>
									
									<td>
										<bean:write name="result" property="statistic_dt_disp" />
									</td>
									<td>
										<bean:write name="result" property="create_dt_disp" />
									</td>
									<td>
										<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/newrisk/result/t10_checkparty_main.do?&party_id=<%=party_id %>&party_class_cd=<bean:write name="result" property="party_class_cd" />&dispatcher=_view','search')"><img src="../../images/<%=session.getAttribute("style")%>/b_caseinfo.png" title="详细信息" /></a> 
									</td>
									
									<td>
										<bean:write name="result" property="organ_name" />
									</td>
									<td>
										<bean:write name="result" property="temptype_disp" />
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
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</logic:present>
				</div>
				<!-- all end -->
			</div>
	</html:form>
</BODY>
</HTML>
