<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<HTML>
	<HEAD>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<SCRIPT LANGUAGE="JavaScript">
//列表中"全部"/"取消"的切换
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}	
function _Open(url){
	var errMsg = "";
	var form=document.forms[0];
	errMsg = CheckBoxMustChecked(form);
	if(errMsg!=''){
        alert(errMsg);
    	return false;
	}
	for ( var j=0; j < form.elements.length; j++ )
    {
		if(form.elements[j].type == 'checkbox'){ 
			if (true==form.elements[j].checked){
		        var str=form.elements[j].value;
		        var str1=str.substring(0,str.indexOf(","));
		        var strOran=str.substring(str.lastIndexOf(",")+1,str.length);
		        var organkey = organkey+","+strOran;
		        var rkey=rkey+","+str1;
		        }
			}
	    
	    }
	
	var rkeys=rkey.substring(rkey.indexOf(",")+1,rkey.length);
	var organkeys=organkey.substring(organkey.indexOf(",")+1,organkey.length);
	
	ymPrompt.win({message:'<%=request.getContextPath()%>/newrisk/result/t37_party_resultReturn.do?status=3&rkeys='+rkeys+'&organkeys='+organkeys,width:500,height:350,title:'原因',handler:handler,iframe:true,fixPosition:true,dragOut:false});		
									
}
function opersubmit(theUrl){
	var errMsg = "";
	var form=document.forms[0];
		errMsg = CheckBoxMustChecked(form);
		
		if(errMsg!=''){
            alert(errMsg);
        	return false;
		}

	var levelkey; var n=0;
		for ( var i=0; i < form.elements.length; i++ )
    {
     if(form.elements[i].type == 'checkbox'){ 
     
        if (true==form.elements[i].checked){  
        var str=form.elements[i].value; 
        if(str!='0'){ 
          var strs= new Array(); //定义一数组
                strs=str.split(","); //字符分割            
              if(n==0){
              levelkey=strs[1]
              }else{
                if(levelkey!=strs[1]){
                    alert("请选择同一风险等级的客户");
                    return false;
                }
              }
              n=n+1;
        }
        }
  
        } 
        
    }
	 
		
    if(confirm("确认您的操作吗!")){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

function dosubmit(theUrl,type){
   var isSub = false;
   var errMsg = "";
   if(type=='search'){
        isSub = true;
    }else if(type=='return'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('真的要退回到编辑岗？')){
                isSub = true;
            }
        }
    }
    else if(type=='batch'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
        	isSub = true;
        }
    }
 //  if(!_compareTwoDateForString(document.forms[0].create_dt_start.value, document.forms[0].create_dt_end.value)) {
//	 errMsg = "开始时间不能大于结束时间";		    
//		   } 
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function checkForm(theUrl){
    var errMsg = "";
     modifydate_s = document.forms[0].modifydate_disp.value;
     modifydate_e = document.forms[0].modifydate_disp_end.value;
     statistic_dt_s = document.forms[0].statistic_dt_disp.value;
     statistic_dt_e = document.forms[0].statistic_dt_disp_end.value;
     create_dt_s = document.forms[0].create_dt_disp.value;
     create_dt_e = document.forms[0].create_dt_disp_end.value;
     if(getLength(document.forms[0].organkey.value)>12){
       errMsg += "归属机构输入内容太长！";
       document.forms[0].organkey.focus();
     }
     else if(!_isDateSpaceComplete(modifydate_s, modifydate_e)){
        errMsg += "请填写完整的人工调整日期！";
    }
    else if(!_isDateSpaceComplete(statistic_dt_s, statistic_dt_e)){
        errMsg += "请填写完整的系统评级日期！";
    }
    else if(!_isDateSpaceComplete(create_dt_s, create_dt_e)){
        errMsg += "请填写完整的开户起止日期！";
    }
    else if(!_compareTwoDateForString(modifydate_s, modifydate_e)||!_compareTwoDateForString(statistic_dt_s, statistic_dt_e)||!_compareTwoDateForString(create_dt_s, create_dt_e) ){
  		errMsg += "开始时间不能大于结束时间！";	
  	}
  		
    if(errMsg!=""){
     alert(errMsg);
     return false;
   }else{
     document.forms[0].action=theUrl;
     document.forms[0].submit();
   }
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/result/t37_party_result_list1.do" method="post">
	<input type="hidden" name="backurl" value="t37_party_result_list1.do?marked=<bean:write name="marked"/>"/>
		<div id="main">
				<!-- conditions -->
			<div class="conditions">
					<!-- title -->
				<div class="cond_t">
					<span>
						<logic:equal name="marked" value="0">评级结果再调整</logic:equal>
						<logic:equal name="marked" value="1">评级结果报告</logic:equal>
					</span>
					<span class="buttons">
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<logic:equal name="marked" value="0">
						 <a href="#" onClick="_Open('t31_party_resultReturn.do?status=3','return')">
						 <img src="../../images/<%=session.getAttribute("style") %>/b_passnot.png" />退回编辑岗</a>
						</logic:equal>
						
						<logic:equal name="marked" value="1">
							<a href="#" onclick="dosubmit('t31_party_resultBExcel.do','batch')" />
							<img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />批量导出Excel</a>
						</logic:equal>
                    </span>
				</div>
                    <html:hidden name="t37_party_resultActionForm" property="marked" />
                    <html:hidden  property="marked" />
				<div class="cond_c" id="searchtable">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="14%" height="22" align="right" nowrap>
									客户号：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:text property="party_id" styleClass="text_white"
										size="10" onchange="_Onblur('party_chn_name')"/>
										<html:text property="party_chn_name" styleClass="text_white"
					                    size="23" readonly="true" />
										 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
										
								</td>
								<td width="14%" align="right">
									归属机构：
								</td>
								<td width="37%" bgcolor="F6F9FF">
									<html:text property="organkey" styleClass="text_white"
										size="10" maxlength="12" onchange="_Onblur('organ_name')" />
									<html:text property="organ_name" styleClass="text_white"
										size="23" readonly="readonly" />
									
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organ_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>

									

								</td>
							</tr>
							<tr bgcolor="ECF3FF">
								<td width="14%" height="22" align="right" nowrap
									bordercolor="#000000">
									客户类型：
								</td>
								<td width="36%" nowrap bordercolor="#000000" bgcolor="F6F9FF">
									<html:select property="party_class_cd">
										<html:options collection="clienttypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="22" align="right" nowrap>
									系统评级结果：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:select property="fristappralevel">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
							</tr>
							<tr bgcolor="ECF3FF">
                                <td width="14%" bgcolor="F6F9FF" align="right">
									模板类型：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:select property="temptype">
										<html:options collection="temp_type_map" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="22" align="right" nowrap>
									人工评级结果：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:select property="emendationlevel">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
							</tr>
							<%--评级结果报告查询条件--%>
							<logic:equal name="marked" value="1">
							<tr bgcolor="ECF3FF">
                                <td width="14%" bgcolor="F6F9FF" align="right">
									评级类型：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:select property="tempcategory_s">
										<html:options collection="tempcategory_map" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="22" align="right" nowrap>
									开户起止日期：
								</td>
								<td width="36%" bgcolor="F6F9FF">
								<html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
 
									--
									<html:text property="create_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
								</td>
								
							</tr>
							<tr bgcolor="ECF3FF">
								<td width="14%" height="22" align="right" bgcolor="ECF3FF">
									人工调整日期：
								</td>
								<td width="36%" bgcolor="F6F9FF">
								<html:text property="modifydate_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                 --
                                 <html:text property="modifydate_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
								<td width="14%" height="22" align="right" bgcolor="ECF3FF">
									系统评级日期：
								</td>
								<td width="36%" bgcolor="F6F9FF">
								<html:text property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                --
                                <html:text property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>


							</tr>
							
							<tr bgcolor="ECF3FF">
							
                                <td width="14%" height="22" align="right">
									排序：
								</td>
								<td width="37%" bgcolor="F6F9FF">
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
								<td>
								 <input type="button" value="查  询" name=Button522
										onClick="checkForm('t37_party_result_list1.do?newsearchflag=1&marked=<bean:write name="marked"/>','search')"
										class="in_button1">
								</td>
							</tr>
							</logic:equal>
							
							<%--评级结果再调整查询条件--%>
							<logic:equal name="marked" value="0">
							<tr bgcolor="ECF3FF">
								<td width="14%" height="22" align="right" bgcolor="ECF3FF">
									人工调整日期：
								</td>
								<td width="36%" bgcolor="F6F9FF">
								<html:text property="modifydate_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                 --
                                 <html:text property="modifydate_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
								<td width="14%" height="22" align="right" bgcolor="ECF3FF">
									系统评级日期：
								</td>
								<td width="36%" bgcolor="F6F9FF">
								<html:text property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                --
                                <html:text property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>


							</tr>
							
                            <tr bgcolor="ECF3FF">
								

								
								<td width="14%" height="22" align="right" nowrap>
									开户起止日期：
								</td>
								<td width="36%" bgcolor="F6F9FF">
								<html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
 
									--
									<html:text property="create_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
								</td>
                                <td width="14%" height="22" align="right">
									排序：
								</td>
								<td width="37%" bgcolor="F6F9FF">
									<html:select property="orderby">
										<html:options collection="resultsortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									<input type="button" value="查  询" name=Button522
										onClick="checkForm('t37_party_result_list1.do?newsearchflag=1&marked=<bean:write name="marked"/>','search')"
										class="in_button1">
								</td>
							</tr>
							</logic:equal>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th width="5%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
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
								人工调整结果
							</th>
							<th width="10%" nowrap>
								系统评级日期
							</th>
							<th width="10%" nowrap>
								人工调整日期
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
							<logic:equal name="marked" value="1">
							</th>
								<th width="8%" nowrap>
								导出状态
							</th>
							</logic:equal>
									
						</tr>
						<logic:present name="t37_party_resultList">
							<logic:iterate id="result" name="t37_party_resultList"
								type="com.ist.aml.newrisk.dto.T37_party_result">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center">
										
										<%
												String party_id = result.getParty_id();
										        if(party_id.contains("#")){
										        	party_id = party_id.replace("#","%23");
										        }
												String party_class_cd = result.getParty_class_cd();
												String resulekey = result.getResulekey() ;
												if(resulekey.contains("#")){
													resulekey = resulekey.replace("#","%23");
												}
												String organkey = result.getOrgankey();
											  
											    String resulekeys=resulekey+","+party_id+","+party_class_cd+","+organkey;
										%>
										<input type="checkbox" name="rkeys" value=<%=resulekeys %> >
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
									<logic:equal name="result" property="modify_cd" value="1">
										<bean:write name="result" property="emendationlevel_disp" />
									</logic:equal>
									</td>
									
									<td>
										<bean:write name="result" property="statistic_dt_disp" />
									</td>
									<td>
										<bean:write name="result" property="modifydate_disp" />
									</td>
									<td>
										<bean:write name="result" property="create_dt_disp" />
									</td>
									<td>
										<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/newrisk/result/t10_checkparty_main.do?resulekey=<%=resulekey %>&party_id=<%=party_id %>&party_class_cd=<bean:write name="result" property="party_class_cd" />&organkey=<bean:write name="result" property="organkey" />&dispatcher=_view&temptype=<bean:write name="result" property="temptype" />','search')"><img src="../../images/<%=session.getAttribute("style")%>/b_caseinfo.png" title="详细信息" /></a> 
									</td>
									
									<td>
										<bean:write name="result" property="organ_name" />
									</td>
									<td>
										<bean:write name="result" property="temptype_disp" />
									</td>
									<logic:equal name="marked" value="1">
									<td>
										<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/newrisk/result/t31_party_resultSExcel.do?resulekey=<%=resulekey %>&party_id=<%=party_id %>&party_class_cd=<bean:write name="result" property="party_class_cd" />&organkey=<bean:write name="result" property="organkey" />','search')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出</a>
									</td>
									</logic:equal>
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
