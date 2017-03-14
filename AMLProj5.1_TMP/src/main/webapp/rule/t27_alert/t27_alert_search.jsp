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

		<SCRIPT LANGUAGE="JavaScript">
function _Click(fromstr,tostr){
   changelocation(fromstr,tostr,arrItem);
}

function _Onblur(){
   document.forms[0].searchOrganName.value="";
}

function fPopUpCalendarDlg(ctrlobj)
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




function dosubmit(theUrl){
var errMsg = "";
if(!_compareTwoDateForString(document.forms[0].alert_dt_start_disp.value, document.forms[0].alert_dt_end_disp.value)) {
   document.forms[0].alert_dt_start_disp.focus();
	 errMsg = "开始时间不能大于结束时间";		    
		   } 
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</SCRIPT>
</head>
<body class="mainbg">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/t27_alert/t27_alert_search.do" method="post">
		<html:hidden property="searchtype" />
			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>扩展规则 - 扩展预警查询</span>
					<span class="buttons"> <a href="#" id="hdd_display"
						class="bt_hidden"></a> </span>
				</div>

				<!-- table content -->
				<div class="cond_c" id="searchtable">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15%" height="22" align="right" bgcolor="ECF3FF">
								预警起止日期：
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
								预警对象类型：
							</td>
							<td>
								<html:select property="obj_type_cd" style="width:100">
									<html:options collection="alertobj_typeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td width="15%" height="22" align="right" bgcolor="ECF3FF">
								客户号：
							</td>
							<td>
								<html:text property="objkey" />
							</td>
							
							<td>
								归属机构：
							</td>
							<td>
								<html:text property="organkey" size="10"
									onblur="_Onblur('organKey')" />
								<html:text property="searchOrganName" size="13" readonly="true" />
								<a href="#"
									onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
									class="cond_buttons"><img
											src="../../images/<%=session.getAttribute("style")%>/b_location.png" />定位</span>
								</a>
							</td>
						</tr>
						<tr>

							

						</tr>
						<tr>
                            <td>
								扩展系统规则名称：
							</td>
							<td>
								<html:select property="pbckey" style="width:200px" onmouseover="FixWidth(this);">
									<html:options collection="pbcruleMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							
							<td>
								预警状态：
							</td>
							<td>
								<html:select property="alert_status_cd">
									<html:options collection="T27_alert_statusMap"
										property="label" labelProperty="value" />
								</html:select>
							</td>
							
							
						</tr>

						<tr>
							<td>
								币种：
							</td>

							<td>
								<html:select property="curr_cd" style="width:100">
									<html:options collection="curr_cdMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td>
								排序：
							</td>
							<td width="36%" align="left" bgcolor="F6F9FF">
								<html:select property="orderby">
									<html:options collection="T27_alertorderMap" property="label"
										labelProperty="value" />
								</html:select>
								<html:radio property="order" value="1" />
								升序
								<html:radio property="order" value="2" />
								降序 &nbsp;&nbsp;&nbsp;&nbsp;
								
								<input type="button" name="ok" value="查 询" class="in_button1"
									onClick="dosubmit('<%=request.getContextPath()%>/rule/t27_alert/t27_alert_search.do?newsearchflag=1&searchtype=2&intPage=0')" />
							</td>
						</tr>
						
						<tr>
							
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
							客户号
						</th>
						<th>
							预警对象(客户名称)
						</th>
						<th>
							归属机构
						</th>
						<th>
							预警日期
						</th>
						<th>
							交易笔数
						</th>
						<th>
							系统规则
						</th>
						<th>
							预警状态
						</th>

					</tr>
					<logic:iterate id="t27_alert" name="t27_alertList"
						type="com.ist.aml.rule.dto.T27_alert">

						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("alertkey", t27_alert.getAlertkey());

								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR align="center" class="interval"
							onMouseOver="this.className='interval2'"
							onMouseOut="this.className='interval'">
							<TD align="center" height=22>
								<html:link name="map" page="/t27_alert/t27_alert_disp.do">
									<bean:write name="t27_alert" property="alertkey" />
								</html:link>
							</TD>

							<TD>
								<bean:write name="t27_alert" property="objkey" />
							</TD>

							<td>
								<bean:write name="t27_alert" property="objname" scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="organkey" scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="alert_dt_disp" scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="trans_num" scope="page" />
							</td>

							<td>
								<bean:write name="t27_alert" property="rulekey"
									scope="page" />
							</td>

							<td height="22">
								<bean:write name="t27_alert" property="alert_status_cd_disp"
									scope="page" />
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
