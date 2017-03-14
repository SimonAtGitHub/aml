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
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>

		<SCRIPT LANGUAGE="JavaScript">


function dosubmit(theUrl,type){
    var errMsg = "";
    if(type=='search'){
  
	   	if(!_isDateSpaceComplete(document.forms[0].alert_dt_start_disp.value, document.forms[0].alert_dt_end_disp.value)){
	   		document.forms[0].alert_dt_start_disp.focus();
	 		errMsg = "请填写完整的时间范围！";
	         }  
	     else if(!_compareTwoDateForString(document.forms[0].alert_dt_start_disp.value, document.forms[0].alert_dt_end_disp.value)) {
	    	 document.forms[0].alert_dt_start_disp.focus();
	 		errMsg = "开始时间不能大于结束时间！";		    
		   } 
		   isSub = true;
    }
   
    if(errMsg==''){
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
	</head>
	<body class="mainbg">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/t27_alert/t27_alert_all_list.do" method="post">
		<html:hidden property="searchtype" />

			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>预警查询</span>
					<span class="buttons"> 
					<a href="#" id="hdd_display" class="bt_hidden"></a>
					</span>
				</div>

				<!-- table content -->
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
								预警类型：
							</td>
							<td>
								<html:select property="alerttype" style="width:100">
									<html:options collection="alerttypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td width="15%" height="22" align="right" bgcolor="ECF3FF">
								预警编号：
							</td>
							<td>
								<html:text property="alertkey" />
							</td>
                            <td width="15%" height="22" align="right" bgcolor="ECF3FF">
								规则编码：
							</td>
							<td>
								<html:text property="pbckey" />
								<a href="#" onClick="locate_pop_window('<%=request.getContextPath()%>','t21_pbcruleLocation','radio','forms[0]','pbckey','');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
							</td>
							
						</tr>
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
							</td>
							<td>
								<input type="button" name="ok" value="查 询" class="in_button1"
									onClick="dosubmit('t27_alert_all_list.do?newsearchflag=1','search')" />
							</td>
							
						</tr>
					</table>
				</div>
			</div>

			<div class="list">
				<table cellspacing="0" cellpadding="0" border="0">

					<tr align=center>
						<th>
							预警编号
						</th>
						<th>
							预警类型
						</th>
						<th>
							系统规则
						</th>
						<th>
							主体
						</th>
						<th>
							预警名称
						</th>
						<th>
							预警日期
						</th>

					</tr>
					<logic:iterate id="t27_alert" name="t27_alertList"
						type="com.ist.aml.rule.dto.T27_alert">

						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("alertkey", t27_alert.getAlertkey());

								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR align="center" >
							

							<TD align="center" height=22>
							    <a href="#" onclick="dosubmit('t27_alert_dispByRulekey.do?alertkey=<bean:write name="t27_alert" property="alertkey" />&linktype=search_allAlert','view')">
									<bean:write name="t27_alert" property="alertkey" />
								</a>	
							</TD>

							<TD>
								<bean:write name="t27_alert" property="alerttype_disp" />
							</TD>

							<td>
								<bean:write name="t27_alert" property="rulekey_disp" scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="objkey" scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="objname"
									scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="alert_dt_disp" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>

		</html:form>

	</body>
</html>
