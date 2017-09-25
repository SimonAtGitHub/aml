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
function dosubmit(theUrl,type){
   var isSub = false;
   var errMsg = "";
   if(type=='search'){
        isSub = true;
    }
   if(type=='search'){
   		if(!_compareTwoDateForString(document.forms[0].statistic_dt_disp.value, document.forms[0].statistic_dt_disp_end.value))
   		{
    		errMsg = "开始时间不能大于结束时间";	
    	}
    	else if (!_compareTwoDateForString(document.forms[0].last_upd_dt_disp.value, document.forms[0].last_upd_dt_disp_end.value))
    	{
    		errMsg = "开始时间不能大于结束时间";	
    	}
    	//else if(getLength(document.forms[0].organkey.value)==0){
        //errMsg+="请选择归属机构！";
        //document.forms[0].organkey.focus();
       // }
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

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/check/t37_level_adjust_custom_list.do" method="post">
	<input type="hidden" name="backurl" value="/check/t37_level_adjust_custom_list.do"/>
	
		<div id="main">
				<!-- conditions -->
			<div class="conditions">
					<!-- title -->
				<div class="cond_t">
					<span>结果查询 - 调整过风险等级的客户查询</span>
				</div>
				<div class="cond_c" id="searchtable">
					<table width="100%" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<td width="14%" height="22" align="right" nowrap>客户号：</td>
								<td width="36%">
									<html:text property="party_id" styleClass="text_white" size="10" maxlength="32"/>
								</td>
								<td width="14%" height="22" align="right" nowrap>调整人：</td>
								<td width="36%">
									<html:text property="last_upd_user" styleClass="text_white" size="10" maxlength="32"/>
								</td>
							</tr>
							<tr>
								<td width="14%" height="22" align="right" nowrap>
									调整前风险等级：
								</td>
								<td width="36%">
									<html:select property="level_before_adjust">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
								<td width="14%" height="22" align="right">
									系统评级日期：
								</td>
								<td width="36%">
									<html:text property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
	                                --
	                                <html:text property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
								</td>
							</tr>
							<tr>
								<td width="14%" height="22" align="right" nowrap>
									调整后风险等级：
								</td>
								<td width="36%">
									<html:select property="level_after_adjust">
										<html:options collection="riskLevelMap" property="label"
											labelProperty="value" />
									</html:select>
									<br>
								</td>
								<td width="14%" height="22" align="right">
									调整日期：
								</td>
								<td width="36%" >
								<html:text property="last_upd_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
                                 --
                                 <html:text property="last_upd_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
							</tr>
							
                            <tr >
                            	<td width="14%" height="22" align="right" nowrap>调整序号：</td>
								<td width="36%">
									<html:text property="audit_no" styleClass="text_white" size="10" maxlength="32"/>
								</td>
								<td width="14%" height="22" align="right">
									排序：
								</td>
                                <td width="36%">
                                	<html:select property="orderby">
										<html:options collection="resultsortMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									&nbsp;&nbsp;
									<input type="button" value="查  询" name=Button522
										onClick="dosubmit('t37_level_adjust_custom_list.do?newsearchflag=1','search')"
										class="in_button1">
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th width="13%" nowrap>
								客户号
							</th>
							<th width="11%" nowrap>
								调整人
							</th>
							<th width="12%" nowrap>
								调整前风险等级
							</th>
							<th width="10%" nowrap>
								调整后风险等级
							</th>
							<th width="12%" nowrap>
								评级日期
							</th>
							<th width="12%" nowrap>
								调整日期
							</th>
							<th width="12%" nowrap>
								调整序号
							</th>
						</tr>
						<logic:present name="t37_level_adjust_customList">
							<logic:iterate id="result" name="t37_level_adjust_customList"
								type="com.ist.aml.risk_rate.dto.T37_level_audit">
								<tr align="center" bgcolor="#FFFFFF">
									
									<td nowrap>
										<bean:write name="result" property="party_id" />
									</td>
									<td>
										<bean:write name="result" property="last_upd_user" />
									</td>
									<td>
							             <bean:write name="result" property="level_before_adjust_disp" />
									</td>
									<td>
										<bean:write name="result" property="level_after_adjust_disp" />
									</td>
									<td>
										<bean:write name="result" property="statistic_dt_disp" />
									</td>
									<td>
										<bean:write name="result" property="last_upd_dt_disp"/>
									</td>
									<td>
										<bean:write name="result" property="audit_no" />
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
