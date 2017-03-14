<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
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
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(forms[0]);
        isSub = true;
    }else if(type=='search' || type=='list' || type=='addtask'){
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
		<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000
}
-->
</style>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/calinfo/dm_server_list.do" method="post">
				<html:hidden property="newsearchflag" value="1" />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> AML&#35745;&#31639;&#31649;&#29702; -
							&#35745;&#31639;&#24341;&#25806;&#21015;&#34920; </span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									数据时间：
									<html:select property="calYM">
										<html:options collection="dataYmMap" property="label"
											labelProperty="value" />
									</html:select>

									计算SERVER：
									<html:select property="serverkey">
										<html:options collection="calserverMap" property="label"
											labelProperty="value" />
									</html:select>
									<input type=button value="确  定" name=Button32
										class="in_button1"
										onclick="dosubmit('dm_server_list.do','list')" />
									<input type=button value="添  加" name=Button33222
										class="in_button1"
										onclick="dosubmit('dm_task_add.do','addtask')" />
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
								时间
							</th>
							<th>
								数据域
							</th>
							<th>
								SERVER名称
							</th>
							<th>
								状态
							</th>
							<th>
								计算用时（S）
							</th>
							<th>
								错误信息
							</th>
							<th>
								维护日记
							</th>
							<th>
								操作
							</th>
						</tr>
						<logic:iterate id="server" name="t18_task_factList"
							type="com.ist.platform.dto.T18_task_fact">
							<%
								java.util.HashMap map = new java.util.HashMap();
											map.put("domainkey", server.getDomainkey());
											map.put("serverkey", server.getServerkey());
											map.put("statisticdate_disp", server
													.getStatisticdate_disp());
											pageContext.setAttribute("map", map,
													PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<bean:write name="server" property="statisticdate_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="server" property="domainkey" scope="page" />
									-
									<bean:write name="server" property="domainkey_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="server" property="serverkey" scope="page" />
									-
									<bean:write name="server" property="serverkey_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="server" property="calstatus" scope="page" />
									-
									<bean:write name="server" property="calstatus_disp"
										scope="page" />
									<logic:equal value="0" name="server" property="calstatus">
            (<html:link name="map"
											page="/calinfo/dm_tocontinue_byserverkey_do.do">
											<font color="#009900">继续计算</font>
										</html:link>)
         </logic:equal>
								</td>
								<td>
									<bean:write name="server" property="timestr" scope="page" />
								</td>
								<td> 
									<html:link name="map"
										page="/calinfo/dm_task_log_info.do?newsearchflag=1"><img src="../../images/blue/stutas_icon4.gif" title="错误信息"/></html:link>
								</td>
								<td>
									<html:link name="map" page="/calinfo/dm_server_log_edit.do">日志</html:link>
								</td>
								<td>
									<html:link name="map"
										page="/calinfo/dm_task_list.do?newsearchflag=1">任务查看</html:link>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>
