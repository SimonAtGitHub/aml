<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>

		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkID(numstr){
var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='X'&& TempChar!='x'&& TempChar!='-'){
           i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
function checkForm(theUrl){
   
    	document.forms[0].action=theUrl;
        document.forms[0].submit();
    
}

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

function _Click(){
     var Index=document.forms[0].opp_area_id.selectedIndex;
    
    if(Index!="0"){
      document.forms[0].opp_area.value=document.forms[0].opp_area_id.options[Index].text
      document.forms[0].opp_area.disabled=true;
    }else{
       document.forms[0].opp_area.disabled=false;
       document.forms[0].opp_area.value="";
    }
}
</script>
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/result_disp1.do">
			<html:hidden property="resulekey" />
			<html:errors />
			<logic:notEmpty name="t08_party_resultActionForm" property="party_chn_name">
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								客户名称：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="party_chn_name" />
							</td>
							<td>
								系统评级时间：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="appradate_disp" />
							</td>
						</tr>
						<tr>
							<td>
								客户类型：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="party_calss_cd_s" />
							</td>
							<td>
								系统初评等级：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="fristappralevel" />
							</td>
						</tr>
						<tr>
							<td>
								评级模板名称：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="template_name" />
							</td>
							<td>
								模板类型：
							</td>
							<td>
								<bean:write name="t08_party_resultActionForm" property="temptype_disp" />
							</td>
						</tr>
					
					</table>
				</div>
				<div class="cond_t2">
					<span class="buttons">
					    <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />评级公式:</strong>
					</span>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<bean:write name="t08_party_resultActionForm" property="outstr" />
				</div>
				<div class="list2">
					<table border="0" cellpadding="0" cellspacing="1">
						<tr>
							<th colspan="3">
								公式信息
							</th>
						</tr>
						<tr>
							<td class="st03">
								公式名称
							</td>
							<td class="st03">
								指标名
							</td>
							<td class="st03">
								指标值
							</td>
						</tr>
						<logic:present name="t08_party_resultList">
							<logic:iterate id="t08_party_result" name="t08_party_resultList"
								type="com.ist.aml.risk.dto.T08_party_result" indexId="i">
								<tr>
									<td rowspan=<%=t08_party_result.getKeysList().size()%>>
										<bean:write name="t08_party_result" property="gsname" />
									</td>
									<logic:iterate id="keysList" name="t08_party_result"
										type="com.ist.aml.risk.dto.T08_gs_indic" property="keysList"
										offset="0" length="1">
										<td>
											<bean:write name="keysList" property="gskey" />
										</td>
										<td>
											<bean:write name="keysList" property="indickey" />
										</td>
									</logic:iterate>
								</tr>
								<%
									if (t08_party_result.getKeysList().size() > 1) {
								%>
								<logic:iterate id="keysList" name="t08_party_result"
									type="com.ist.aml.risk.dto.T08_gs_indic" property="keysList"
									offset="1">
									<tr>
										<td>
											<bean:write name="keysList" property="gskey" />
										</td>
										<td>
											<bean:write name="keysList" property="indickey" />
										</td>
									</tr>
								</logic:iterate>
								<%
									}
								%>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="cond_t2">
					<span class="buttons">
					    <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />客户评级历史记录</strong> </span>
				</div>
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="1">
						<tr>
							<th>
								评定时间
							</th>
							<th>
								系统初评等级
							</th>
							<th>
								人工调整等级
							</th>
							<th>
								调整原因
							</th>
						</tr>
						<logic:present name="t08_party_result_hisList">
							<logic:iterate id="t08_party_result_his" name="t08_party_result_hisList" type="com.ist.aml.risk.dto.T08_party_result">
								<tr>
									<td>
										<bean:write name="t08_party_result_his" property="appradate_disp" />
									</td>
									<td>
										<bean:write name="t08_party_result_his" property="fristappralevel_disp" />
									</td>
									<td>
										<bean:write name="t08_party_result_his" property="level_disp" />
									</td>
									<td>
										<bean:write name="t08_party_result_his" property="reason" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
			</logic:notEmpty>
			<logic:empty name="t08_party_resultActionForm" property="party_chn_name">
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<b><font color="red">该客户还没进行风险评级！</font></b>
							</td>
						</tr>
					</table>
				</div>
			</logic:empty>
		</html:form>
	</body>
</html>

