<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<!-- <link rel="stylesheet" href=<%=cssurl%> type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
</script>
	</head>
	<body id="iframecontent">
		<html:form action="/case/case_advice_more.do" method="post">
			<html:errors />
			<html:hidden property="application_num" />
			<logic:notEqual name="fromcase" value="1">
				<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> <%=com.ist.util.Constans.CASE_NAME%>相关信息 </span>
						<span class="buttons"> <a href="#"
							onclick="javascript:window.close();return false;"><img
									src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关闭</a>&nbsp;&nbsp; </span>
						<!-- <input name="button" type="button" class="input" onclick="javascript:window.close();return false;" value="关 闭"/></td> -->
					</div>
				</div>
			 </logic:notEqual>
			 <div class="cond_t2">
			   <span class="buttons">
			     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><%=com.ist.util.Constans.CASE_NAME%>意见</strong>
			   </span>
			 </div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								机构名称
							</th>
							<th>
								岗位名称
							</th>
							<th>
								操作员
							</th>
							<th>
							    <%=com.ist.util.Constans.CASE_NAME%>意见
							</th>
						</tr>
						<logic:iterate id="advi" name="getT07_case_adviList" type="com.ist.aml.report.dto.T07_case_application">
							<tr>
								<td>
									<bean:write name="advi" property="organname" scope="page" />
								</td>
								<td>
									<bean:write name="advi" property="post_name" scope="page" />
								</td>
								<td>
									<bean:write name="advi" property="last_upd_user" scope="page" />
								</td>
								<td style="white-space:normal;"> 
								
									<bean:write name="advi" property="reason" scope="page" />
									
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<logic:equal property="cast_type" name="t07_case_application" value="2">
									<div class="cond_t2">
		   <span class="buttons">
		     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />附件信息</strong>
		   </span>
		 </div>
					<div class="list" id="alerttrans1">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>
									文件名称
								</th>
								<th>
									上传日期
								</th>
								<th>
									上传人
								</th>
							</tr>
							<logic:iterate id="attach" name="t07_alert_attachList" type="com.ist.aml.report.dto.T07_alert_attach">
								<tr>
									<td>
										<a href="#"
											onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode(attach.getAttach_name())%>','','height=160, width=300,left=100,top=100');">
											<bean:write name="attach" property="attach_realname"
												scope="page" /> </a>
									</td>
									<td>
										<bean:write name="attach" property="load_date_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="attach" property="load_user" scope="page" />
									</td>
								</tr>
							</logic:iterate>
						</table>
					</div>
				</logic:equal>
				<logic:notEqual name="fromcase" value="1">
				    </div>
				</logic:notEqual>
			</html:form>
	</body>
</html>
