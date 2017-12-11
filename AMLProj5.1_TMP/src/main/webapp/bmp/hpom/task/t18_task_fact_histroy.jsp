<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css"
			rel="stylesheet" type="text/css">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/jquery.autocomplete.css"
			type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl){
	
        document.forms[0].action=theUrl;
        document.forms[0].submit();
	}
	
</SCRIPT>	
</head>

<body >
<div id='content'>
	<html:form action="/t18_task_fact/getT18_task_fact_history.do" method="POST">
    <div class='awp_title'>
     <table>
       <td><span class="awp_title_td2">历史列表</span></td>
       <td width="84%" align="right">
			<input type="button" value="返 回" onClick="dosubmit('t18_task_fact_list.do')"/>
		</td>
      </tr>
     </table>
	</div>
	
	<div class="awp_detail">
		<table>
				<tr>
					<td>数据源名称：</td>
					<td><bean:write name="t18_task_fact" property="dsname" scope="request" /></td>
					<td>粒度：</td>
					<td><bean:write name="t18_task_fact" property="granularity_diap" scope="request" /></td>
				</tr>
				<tr>
					<td>数据时间：</td>
					<td><bean:write name="t18_task_fact" property="statisticdate" scope="request" /></td>
					<td>任务编号：</td>
					<td><bean:write name="t18_task_fact" property="taskkey" scope="request" /></td>
				</tr>
				<tr>
					<td>任务类别：</td>
					<td><bean:write name="t18_task_fact" property="typename" scope="request" /></td>
					<td>业务编码：</td>
					<td><bean:write name="t18_task_fact" property="businesskey" scope="request" /></td>
				</tr>
		</table>
	</div>
	<div  class='awp_list'>
	<table>
			<tr align="center">
				<!-- <td width="10%" nowrap>
					日志编码		
				</td>
				<td width="10%" nowrap>
					任务编码				
				</td>
				
				<td width="10%" nowrap>
					任务类别			
				</td>
				
				<td width="5%" nowrap>
					业务编码	
				</td>
				
				 <td width="5%" nowrap>
					数据时间
				</td>
				<td width="5%" nowrap>
					数据源名称
				</td>
				<td width="5%" nowrap>
					粒度				
				</td>
				 -->
				<td width="5%" nowrap>
					开始时间	
				</td>
				<td width="5%" nowrap>
					结束时间
				</td>
				<td width="5%" nowrap>
					实际耗时（分钟）
				</td>
				<td width="5%" nowrap>
					计算状态
				</td>
			</tr>
			
			<logic:notEmpty name="t18_callog_list">
				 <logic:iterate id="dto" name="t18_callog_list"
					type="com.ist.bmp.hpom.dto.T18_callog">
					<TR align="center" >
						<td nowrap><bean:write name="dto" property="begintime"  /></td>
						<td nowrap><bean:write name="dto" property="endtime"  /></td> 
						<td nowrap><bean:write name="dto" property="usetime"  /></td>
						<td nowrap>
						<%
						String calstatus = dto.getCalstatus();
						String calstatus_disp = dto.getCalstatus_disp();
						if("0".equals(calstatus)){
						%>						
							<img alt="<%=calstatus_disp %>" src="<%=request.getContextPath()%>/skin/blue/images/stutas_icon0.gif" />						
						<%
						}else if("2".equals(calstatus)){
						%>
							<img alt="<%=calstatus_disp %>" src="<%=request.getContextPath()%>/skin/blue/images/stutas_icon2.gif" />
						<%
						}else if("3".equals(calstatus)){
						%>
							<img alt="<%=calstatus_disp %>" src="<%=request.getContextPath()%>/skin/blue/images/stutas_icon3.gif" />
						<%
						}else {						
						%>	
							<img alt="<%=calstatus_disp %>" src="<%=request.getContextPath()%>/skin/blue/images/stutas_icon4.gif" />
						<%
						}
						%>								
						</td>
					</TR>
				</logic:iterate>
				</logic:notEmpty>
		</table>
	</div>
	</html:form>
	</div>
</body>
</html>