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
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/pbc/getT1q_pbc_apply_task_logList.do" method="post">
				<div class="conditions">
					<div class="cond_t">
						<span>数据提取日志查询</span>
						<span class="buttons">
							<a href="#" id="hdd_display" class="bt_hidden"></a>
						</span>
					</div>
					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							     <td>
									提取编号：
								</td>
								<td>
									<html:text property="tb_id" maxlength="20"/>
								</td>
								
								<td>计算状态：</td>
								<td >
									<html:select  property="calstatus" style="width:100px;" onmouseover="FixWidth(this);">
										<html:options collection="countStatusMap" property="label" labelProperty="value"/>
									</html:select>
								</td>
								
							</tr>
							<tr>
							  <td>
									任务编号：
								</td>
								<td>
									<html:text property="taskkey" maxlength="20"/>
								</td>
								<td align="right">
										申请机构：
									</td>
									<td bgcolor="F6F9FF">
								<html:text property="organkey" size="10" onblur="_Onblur('organName')"/>
									<html:text property="organName" size="15" readonly="true" />&nbsp;
								<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
							</td>
							
							</tr>
							<tr>
								
								<td>
									排序：
								</td>
								<td>
									<div>
										<html:select property="orderby">
											<html:options collection="applysortMap" property="label"
												labelProperty="value" />
										</html:select>
										&nbsp;
										<html:radio property="order" value="1" />
										升序
										<html:radio property="order" value="2" />
										降序
										<html:hidden property="searchtype" />
									</div>
									</td>
									<td>
									<input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/datacheck/pbc/getT1q_pbc_apply_task_logList.do?newsearchflag=2','search');"/>
									</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
							 <th>任务类型</th> 
							 <th>任务编号</th>  
 							 <th>提取编号</th>    
 							 <th>表名</th>  
  							 <th>申请机构</th> 
  							 <th>任务执行时间</th>   
  							 <th>数据提取开始时间</th>   
  							 <th>数据提取结束时间</th>   
  							 <th>实际耗时（秒）</th>   
  							 <th>计算状态</th>   
  							<!-- <th>操作</th>    --> 
						</TR>
						<logic:iterate id="ta_pbc_apply" name="ta_pbc_applyList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
								<TD>
									<bean:write name="ta_pbc_apply" property="tasktype" />
								</TD>
								
								<TD>
								<logic:notEqual value="0" name="ta_pbc_apply" property="calstatus">
									<bean:write name="ta_pbc_apply" property="taskkey" />
								</logic:notEqual>	
								<logic:equal value="0" name="ta_pbc_apply" property="calstatus">
								<a href="#" onclick="window.open('t1q_errorlog_list.do?taskkey=<bean:write name="ta_pbc_apply" property="taskkey" />','enter2','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><bean:write name="ta_pbc_apply" property="taskkey" /></a>
								</logic:equal>
								</TD>
								<TD>
									<logic:notEqual value="4" name="ta_pbc_apply" property="calstatus">
									 <bean:write name="ta_pbc_apply" property="tb_id" />
									 </logic:notEqual>
									<logic:equal value="4" name="ta_pbc_apply" property="calstatus">
									<a href="#" onclick="window.open('t1q_apply_result_file.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />&table_ename=<bean:write name="ta_pbc_apply" property="table_ename" />','enter2','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><bean:write name="ta_pbc_apply" property="tb_id" /></a>	
									</logic:equal>
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="table_ename" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="organName" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="endtime_disp" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="data_dt_start" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="data_dt_end" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="usetime" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="calstatus_disp" />
								</TD>
								<!-- <TD>
									<a href="#" onclick="window.open('t1q_apply_result_file.do?tb_id=<bean:write name="ta_pbc_apply" property="tb_id" />&table_ename=<bean:write name="ta_pbc_apply" property="table_ename" />','enter2','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span>查看</span></a>	
									
								</TD> -->
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
