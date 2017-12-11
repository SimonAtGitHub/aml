<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<!--
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>

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
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl,theType){
    var errMsg = "";
     statistic_dt_s = document.forms[0].statistic_dt_disp.value;
     statistic_dt_e = document.forms[0].statistic_dt_disp_end.value;
     if(getLength(document.forms[0].organkey.value)>12){
       errMsg += "归属机构输入内容太长！";
       document.forms[0].organkey.focus();
     }
    else if(!_isDateSpaceComplete(statistic_dt_s, statistic_dt_e)){
        errMsg += "请填写完整的系统评级日期！";
    }
    else if(!_compareTwoDateForString(statistic_dt_s, statistic_dt_e)){
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

function open_helpcheck(theUrl,name) {
	var backurl=document.forms[0].backurl.value;
	var tempcategory=document.forms[0].tempcategory.value;
	theUrl=theUrl+"&backurl="+backurl+"&tempcategory="+tempcategory+"&party_chn_name="+encodeURI(encodeURI(name));
	ymPrompt.win({message:theUrl,width:650,height:350,title:'',handler:handler,iframe:true,fixPosition:true,dragOut:false}); 
	}

</SCRIPT>
	</HEAD>
	<BODY class="mainbg">
	<div id="main">
		<html:form action="/result/t37_party_result_list.do" method="post">
		<input type="hidden" name="backurl" value="t37_party_result_list.do?post_id=<bean:write name="t37_party_resultActionForm" property="post_id" />&tempcategory=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>"/>
		<input type="hidden" name="url" value="<%=request.getContextPath()%>/risk_rate/result/t37_party_result_list.do?post_id=<bean:write name="t37_party_resultActionForm" property="post_id" />&tempcategory=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>"/>
		<html:hidden property="tempcategory"/>
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
						<div class="cond_t">
						<span><logic:equal value="P2001" name="t37_party_resultActionForm" property="post_id">
						          <logic:equal value="1" name="t37_party_resultActionForm" property="tempcategory">
						                           新开客户审查
						          </logic:equal>
							      <logic:equal value="2" name="t37_party_resultActionForm" property="tempcategory">
						                           存量客户审查
						          </logic:equal>
						          
							</logic:equal>
							</span>
						<span class="buttons">
						    <a href="#" id="hdd_display" class="bt_hidden"></a>&nbsp;
 		                    <logic:iterate id="operlist" name="workbench_operlist"
								type="com.ist.aml.risk_rate.dto.T31_n_move">
								   <a href="#"  name="<%=operlist.getOper_id()%>"
									onClick="opersubmit('<%=operlist.getOper_url() %>');">
									<img src="../../images/<%=session.getAttribute("style") %>/b_pass.png" /><%=operlist.getOper_desc()%>
								   </a>
							</logic:iterate> 
                      </span>
					</div>
                    <html:hidden name="t37_party_resultActionForm" property="post_id" />
                    <html:hidden name="t37_party_resultActionForm" property="tempcategory" />
					<div class="cond_c" id="searchtable">
						<table  border="0" cellpadding="0" cellspacing="0">
							<tr>
							    <td>
									归属机构：
								</td>
								<td>
									<html:text property="organkey" styleClass="text_white"
										size="10" maxlength="12" onchange="_Onblur('organ_name')" />
									<html:text property="organ_name" styleClass="text_white"
										size="23" readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organ_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" styleClass="text_white"
										size="10" maxlength="64" onchange="_Onblur('party_chn_name')"/>
										<html:text property="party_chn_name" styleClass="text_white"
					                    size="23" readonly="true" />
										 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								
							</tr>
							<tr>
								<td>
									系统评级结果：
								</td>
								<td>
									<html:select property="fristappralevel">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
								<td>
									系统评级日期：
								</td>
								<td>
								<html:text property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                --
                                <html:text property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
							</tr>
							<tr>
								<td>
									评级结果状态：
								</td>
								<td>
									<html:select property="status_cd">
										<html:options collection="rate_status_cdMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
								<td>
									协查状态：
								</td>
								<td>
									<html:select property="hcheck_status">
										<html:options collection="hcheck_statusMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
							</tr>
							<logic:equal value="1" name="t37_party_resultActionForm" property="tempcategory">
                            <tr>
                                <td>
									排序：
								</td>
								<td>
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
										onClick="checkForm('t37_party_result_list.do?newsearchflag=1','search')"
										class="in_button1">
								</td>
							</tr>
							</logic:equal>
							<logic:equal value="2" name="t37_party_resultActionForm" property="tempcategory">
							<tr>
							    <td>
									当前评级结果：
								</td>
								<td>
									<html:select property="lastlevelkey">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
                                <td>
									排序：
								</td>
								<td>
									<html:select property="orderby">
										<html:options collection="resultsortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									<input type="button" value="查  询" name=Button522
										onClick="checkForm('t37_party_result_list.do?newsearchflag=1','search')"
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
							
							<th width="11%" nowrap>
								系统评级结果
							</th>
							<th width="10%" nowrap>
								系统评级日期
							</th>
							<logic:equal value="2" name="t37_party_resultActionForm" property="tempcategory">
							<th width="11%" nowrap>
							          当前评级结果
							</th>
							</logic:equal>
							<th width="8%" nowrap>
								开户日期
							</th>
							<th width="10%" nowrap>
								操作
							</th>
							<th width="10%" nowrap>
								评级结果状态
							</th>
							<th width="10%" nowrap>
								协查状态
							</th>
							<th width="18%" nowrap>
								所属机构
							</th>
						</tr>
						<logic:present name="t37_party_resultList">
							<logic:iterate id="result" name="t37_party_resultList"
								type="com.ist.aml.risk_rate.dto.T37_party_result">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center">
										
										<%
												String party_id = result.getParty_id();
										        if(party_id.contains("#")){
										        	party_id = party_id.replace("#","%23");
										        }
												String resulekey = result.getResulekey() ;
												if(resulekey.contains("#")){
													resulekey = resulekey.replace("#","%23");
												}
											    String organkey=result.getOrgankey();
											    String flow_id=result.getFlow_id();
											    String hcheck_status=result.getHcheck_status();
											    String higherlevel=result.getHigherlevel();
											    //edit by helong 2015/4/8 form获取[]参数，#不影响
											    String resulekeys=result.getResulekey()+","+flow_id+","+higherlevel+","+organkey;
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
										<bean:write name="result" property="statistic_dt_disp" />
									</td>
									<logic:equal value="2" name="t37_party_resultActionForm" property="tempcategory">
									  <td>
									     <bean:write name="result" property="lastlevelkey_disp" />
									  </td>     
									</logic:equal>
									<td>
										<bean:write name="result" property="create_dt_disp" />
									</td>
									<td>
										   <a
											href="#" onclick="dosubmit('<%=request.getContextPath()%>/risk_rate/result/t37_party_resultMain.do?resulekey=<%=resulekey%>&check_type=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>&templatekey=<bean:write name="result" property="templatekey" />&temptype=<bean:write name="result" property="temptype" />&tempcategory=<bean:write name="result" property="tempcategory" />&party_id=<%=party_id %>&party_class_cd=<bean:write name="result" property="party_class_cd" />&organkey=<bean:write name="result" property="organkey"/>&rate_source=1')"><img src="../../images/<%=session.getAttribute("style")%>/toolsicon02.gif" title="调整" /></a>
										<logic:equal  name="is_showSurvey" value="1">
										   &nbsp;&nbsp;<a 
										   href="#" onclick="dosubmit('<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_riskRateMain.do?ischecked=newclient&check_type=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>&check_exist=0&party_id=<%=party_id %>&party_class_cd=<bean:write name="result" property="party_class_cd" scope="page" />')"><img src="../../images/<%=session.getAttribute("style")%>/b_pass.png" title="调查" /></a> 
										</logic:equal>
										<logic:equal name="is_showCheck" value="1">
										   <%if(hcheck_status!=null&&(hcheck_status.equals("0") || hcheck_status.equals("3"))){ %>
										      &nbsp;&nbsp;<a 
										    href="#" onclick="open_helpcheck('<%=request.getContextPath()%>/risk_rate/check/t37_helpcheck.do?party_id=<%=party_id %>&party_class_cd=<bean:write name="result" property="party_class_cd" />&resultkey=<%=resulekey%>&organkey=<bean:write name="result" property="organkey"/>&rate_source=1','<bean:write name="result" property="party_chn_name" />');"><img src="../../images/<%=session.getAttribute("style")%>/b_inves.png" title="发起协查" /></a> 
										   <%} %>
										  
										   
										</logic:equal>	
									</td>
									<td>
										<bean:write name="result" property="status_cd_disp"/>
									</td>
									<td>
										<bean:write name="result" property="hcheck_status_disp"/>
									</td>
									<td>
										<bean:write name="result" property="organ_name" />
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
			
		</html:form>
		</div>
	</BODY>
</HTML>
