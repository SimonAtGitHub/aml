<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>

		<script language="JavaScript">
   
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='search'){
    	if(!_compareTwoDateForString(document.forms[0].alert_dt_start_disp.value, document.forms[0].alert_dt_end_disp.value)) {
   			document.forms[0].alert_dt_start_disp.focus();
	 		errMsg = "开始时间不能大于结束时间";		    
		   } 
		   isSub = true;
    }
    else if(type=='back' || type=='view'){
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


</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="t27_alert/t27_alert_listByRulekey.do" method="post">
				<div class="conditions">
					<div class="cond_t">
						<span>预警结果</span>
						<span class="buttons">
							<a href="#" id="hdd_display" class="bt_hidden"></a>
							<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/rule/t21_rule/t21_rule_verify_list.do?newsearchflag=1&deployflag=1','back')"><img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />返回</a>
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="15%" height="22" align="right" bgcolor="ECF3FF">
									预警日期：
								</td>
								<td>

								<html:text property="alert_dt_start_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />
								--
								<html:text property="alert_dt_end_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />

								</td>
								<td>
									客户号：
								</td>
								<td>
									<html:text property="party_id" size="10"/>
									<html:text property="party_chn_name" styleClass="text_white"
					                    size="23" readonly="true" />
										 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								
							</tr>
							<tr>
								<td>币种：</td>
								<td>
									<html:select  property="curr_cd">
										<html:options collection="curr_cdMap" property="label" labelProperty="value"/>
									</html:select>
								</td>
								<td>
								</td>
								<td>
									<input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('t27_alert_listByRulekey.do?newsearchflag=1&rulekey=<bean:write name="t27_alertActionForm" property="rulekey"/>','search');"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
 							 <th>预警编号</th>     
  							 <th>预警对象</th> 
  							 <th>币种</th>
  							 <th>预警日期</th>   
						</TR>
						<logic:iterate id="t27_alert" name="t27_alertList" indexId="i"
							type="com.ist.aml.rule.dto.T27_alert">
							<TR align="center">
								
								<TD>
								 <a href="#" onclick="dosubmit('t27_alert_dispByRulekey.do?alertkey=<bean:write name="t27_alert" property="alertkey" />&linktype=rule_alert','view')">
											<bean:write name="t27_alert" property="alertkey" /></a>
									
								</TD>
								<TD>
									<bean:write name="t27_alert" property="objname" />
								</TD>
								<TD>
									<bean:write name="t27_alert" property="curr_cd_disp" />
								</TD>
								<TD>
									<bean:write name="t27_alert" property="alert_dt_disp" />
								</TD>      
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
		</div>
	</BODY>
</HTML>
