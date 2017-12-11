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
		
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		
<SCRIPT LANGUAGE="JavaScript">
function opersubmit(theUrl){
	var errMsg = "";
	var form=document.forms[0];
     errMsg = CheckRadioMustChecked(form);
		if(errMsg!=''){
            alert(errMsg);
        	return false;
		}    
    if(confirm("确认您的操作吗!")){
       document.forms[0].action=theUrl;
        document.forms[0].submit();
        window.parent.ymPrompt.close();
    }
}
function CheckRadioMustChecked(form){
    var num=0;
    var errMsg=""
    num=CheckRadioCheckedNum(form);
    if(num<1) errMsg="请选择！";
    return errMsg;
}
function CheckRadioCheckedNum(form)
{
    var num=0;
    for ( var i=0; i < form.elements.length; i++ )
    {
        if (( true==form.elements[i].checked) && (form.elements[i].type == 'radio' )) num++;
    }
    return num;
};
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl,theType){
    var errMsg = "";
     if(getLength(document.forms[0].organkey.value)>12){
       errMsg += "归属机构输入内容太长！";
       document.forms[0].organkey.focus();
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
function _verifyOper(theUrl0,theUrl,theType){
	var form=document.forms[0];
	for ( var j=0; j < form.elements.length; j++ ){
		if(form.elements[j].type == 'radio'){ 
			if (true==form.elements[j].checked){
		        var str=form.elements[j].value;
		        var resulekey=str.substring(0,str.indexOf(","));
		        var organkey=str.substring(str.lastIndexOf(",")+1,str.length);
		        }
			}
	    
	    }
	theUrl0=theUrl0+"&resulekey="+resulekey+"&organkey="+organkey;
    jQuery.ajax({
 			type:"post",
			url:theUrl0,
			dataType:"text",
			success:function(msg){
				if(msg == ''){
					if(theType=='normal'){
                      opersubmit(theUrl);
                    }
				  }else{
					    alert(msg);
					}
			 }
	 });
}
</SCRIPT>
	</HEAD>
	<BODY class="mainbg">
	<div id="main">
		<html:form action="/result/t37_result_currView.do" method="post">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
						<div class="cond_t">
						<span>
							发起调整
						</span>
						<span class="buttons">
						<a href="javascript:void(0);" onclick="_verifyOper('t37_result_currToAuditVerify.do?','t37_result_currToAudit.do','normal');">
						<img src="../../images/blue/b_choose.png" />选定</a>
						<a href="javascript:void(0);" onclick="window.parent.ymPrompt.close();"><img src="../../images/blue/b_shut.png" />关闭</a>
						</span>
					</div>
                    <html:hidden name="t37_party_resultActionForm" property="post_id" />
                    <html:hidden name="t37_party_resultActionForm" property="tempcategory" />
					<div class="cond_c" id="searchtable">
						<table  border="0" cellpadding="0" cellspacing="0">
							<tr>
							    
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
									
								</td>
								<td>
								<input type="button" value="查  询" name=Button522
										onClick="checkForm('t37_result_currView.do?newsearchflag=1','search')"
										class="in_button1"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th width="5%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
							<th width="11%" nowrap>
								客户号
							</th>
							<th width="13%" nowrap>
								客户名称
							</th>
							<th width="11%" nowrap>
								客户类型
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
												String temptype=result.getTemptype();
												String organkey=result.getOrgankey();
												String resulekeys=resulekey+","+temptype+","+organkey;
										%>
										
										<input type="radio" name="rkeys" value=<%=resulekeys %> >
									</td>
									<td>
										<bean:write name="result" property="party_id" />
									</td>
									<td nowrap>
										<bean:write name="result" property="party_chn_name" />
									</td>
									
									
									<td>
							             <bean:write name="result" property="party_class_cd_disp" />
										
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
