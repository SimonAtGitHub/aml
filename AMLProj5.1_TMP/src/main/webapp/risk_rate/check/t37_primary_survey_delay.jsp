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

//这个函数是重置函数，直接<input type="reset"/>这种的话在提交之后就不能重置了，所以有了这个函数
function reset_input() {
	document.getElementById("organ_name").value="";
	document.getElementById("statistic_dt_disp").value="";
	document.getElementById("statistic_dt_disp_end").value="";
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/check/t37_primary_survey_delay_list.do" method="post">
	<input type="hidden" name="backurl" value="/check/t37_primary_survey_delay_list.do.do"/>
	
		<div id="main">
				<!-- conditions -->
			<div class="conditions">
					<!-- title -->
				<div class="cond_t">
					<span>结果查询 - 客户调查延期查询</span>
				</div>
							<div class="cond_c" id="searchtable">
					<table width="100%" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<td width="14%" height="22" align="right" nowrap>所属机构：</td>
								<td width="36%">
									<html:text styleId="organ_name" property="organ_name" styleClass="text_white" size="20" maxlength="32"/>
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organ_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
								<td width="14%" height="22" align="right">
									开户日期：
								</td>
								<td width="36%">
									<html:text styleId="statistic_dt_disp" property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
	                                --
	                                <html:text styleId="statistic_dt_disp_end" property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
								</td>
							</tr>
							
							<tr>
								<td width="14%" height="22" align="right" nowrap>
									
								</td>
								<td width="36%">
									
								</td>
								<td>
									<input type="button" value="查  询" name="Button522"
										onclick="dosubmit('t37_primary_survey_delay_list.do?newsearchflag=1','search')"
										class="in_button1" />
									
								</td>
								<td><input type="button" value="重 置" class="in_button1" onclick="reset_input()"/></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>客户号</th>
							<th>客户名称</th>
							<th>所属机构</th>
							<th>开户日期</th>
							<th>识别日期</th>
							<th>识别柜员号</th>
							<th>识别柜员名</th>
						</tr>
						<logic:present name="t37_primary_survey_delay_list">
							<logic:iterate id="result" name="t37_primary_survey_delay_list" indexId="i"
								type="com.ist.aml.risk_rate.dto.T37_primary_survey_delayResult">
								
								<tr align="center" bgcolor="#FFFFFF">
									
									<td>
										<bean:write name="result" property="party_id" />
									</td>
									<td>
							             <bean:write name="result" property="party_chn_name" />
									</td>
									<td>
										<bean:write name="result" property="organname" />
									</td>
									<td>
										<bean:write name="result" property="create_dt" format="yyyy-MM-dd"/>
									</td>
									<td>
										<bean:write name="result" property="check_dt" format="yyyy-MM-dd"/>
									</td>
									<td>
										<bean:write name="result" property="checker"/>
									</td>
									<td>
										<bean:write name="result" property="check_realname" />
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
