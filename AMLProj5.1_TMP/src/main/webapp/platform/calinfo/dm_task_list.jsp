<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='recal' || type=='havecal' ){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        isSub = true;
    }else if(type=='search' || type=='back' || type=='refresh'){
        isSub = true;
    }
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        //return false;
    }
}


</script>
		<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000
}
-->
<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />全 清");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />全 选");
	  });
});
</script>

</style>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/calinfo/dm_task_list.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> DM计算管理 - 任务列表 </span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('dm_task_list.do','refresh');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_refresh.png" />刷 新</a> <a href="#"
							id="checkall"><img
									src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a> <a href="#"
							onclick="dosubmit('dm_havecal_do.do','havecal');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_compute.png" />设置为已计算</a> <a href="#"
							onclick="dosubmit('dm_recal_do.do','recal');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_computer.png" />设置为重新计算</a> <a href="#"
							onclick="dosubmit('dm_server_list.do','back');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> <!--<input type=button value="查 询" name=Button33222 class="input" onClick="dosubmit('dm_task_query.do','search')"> -->
							<!--<input type=button value="刷  新" name=Button33222 class="input" onClick="dosubmit('dm_task_list.do','refresh')"> -->
							<!--<input type=button value="全  选" name=selectAllButton class="input" onClick="selectAll(this)"> -->
							<!--<input type=button value="设置为已计算" name=Button3322 class="input" onClick="dosubmit('dm_havecal_do.do','havecal')"> -->
							<!--<input type=button value="设置为重新计算" name=Button3322 class="input" onClick="dosubmit('dm_recal_do.do','recal')"> -->
							<!--<html:button property="backbutton" value="返  回" styleClass="input" onclick="dosubmit('dm_server_list.do','back')"/> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<strong>数据时间：</strong>
									<bean:write name="statisticdate_disp" />
									<strong> 数据域：</strong>
									<bean:write name="t18_server" property="domainname" />
									<strong> 计算引擎：</strong>
									<bean:write name="t18_server" property="servername" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								序号
							</th>
							<th>
								机构
							</th>
							<th>
								粒度
							</th>
							<th>
								任务名称
							</th>
							<th>
								任务类别
							</th>
							<th>
								状态
							</th>
							<th>
								开始时间
							</th>
							<th>
								结束时间
							</th>
							<th>
								计算用时（S）
							</th>
							<th>
								错误信息
							</th>
						</tr>
						<logic:iterate id="task" name="t18_task_factList"
							type="com.ist.platform.dto.T18_task_fact">
							<%
								java.util.HashMap map = new java.util.HashMap();
											//map.put("domainkey",task.getDomainkey());
											//map.put("serverkey",task.getServerkey());
											//map.put("taskkey",task.getTaskkey());
											map.put("schedulekey", task.getSchedulekey());
											//map.put("statisticdate_disp",task.getStatisticdate_disp());
											pageContext.setAttribute("map", map,
													PageContext.PAGE_SCOPE);

											java.util.HashMap map1 = new java.util.HashMap();
											map1.put("domainkey", task.getDomainkey());
											map1.put("serverkey", task.getServerkey());
											map1.put("taskkey", task.getTaskkey());
											map1.put("granularity", task.getGranularity());
											map1.put("organkey", task.getOrgankey());
											map1.put("statisticdate_disp", task
													.getStatisticdate_disp());
											pageContext.setAttribute("map1", map1,
													PageContext.PAGE_SCOPE);
							%>
							<tr>
								<td>
									<bean:write name="task" property="seq" scope="page" />
									<html:multibox property="selectedSchedulekey">
										<bean:write name="task" property="schedulekey" />
									</html:multibox>
								</td>
								<td>
									<bean:write name="task" property="organkey_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="granularity_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="task" property="taskkey" scope="page" />
									-
									<bean:write name="task" property="taskkey_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="tasktype_disp" scope="page" />
								</td>
								<td>
									<logic:notEqual value="4" name="task" property="calstatus">
									<bean:write name="task" property="calstatus_disp" scope="page" />
									<logic:equal value="0" name="task" property="calstatus">
            						(<html:link name="map"
											page="/calinfo/dm_tocontinue_byschedulekey_do.do">
											<font>继续计算</font>
										</html:link>)
        							 </logic:equal>
        							 </logic:notEqual>
        							 
        							 
         							<logic:equal value="4" name="task" property="calstatus">
         							<img src="../../images/blue/stutas_icon3.gif" title="已计算"/>
         							</logic:equal>
								</td>
								<td>
									<bean:write name="task" property="begindate_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="enddate_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="timestr" scope="page" />
								</td>
								<td>
									<html:link name="map1"
										page="/calinfo/dm_task_log_info.do?newsearchflag=1"><img src="../../images/blue/stutas_icon4.gif" title="错误信息"/></html:link>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
