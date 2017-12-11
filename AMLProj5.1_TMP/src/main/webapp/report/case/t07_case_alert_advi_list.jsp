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
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form method="post" action="/case/t07_case_stcr_advi.do">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><%=com.ist.util.Constans.CASE_NAME%><%=com.ist.util.Constans.ALERT_NAME%>处理</span>
						<span class="buttons">
                            <a href="#" onclick="javascript:window.parent.ymPrompt.close();return false;">
                               <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭
                            </a>&nbsp;&nbsp; 
                        </span>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table>
						<tr>
							<th>岗位名称</th>
							<th>操作员</th>
							<th>操作时间</th>
							<th>操作类型</th>
							<th><%=com.ist.util.Constans.CASE_NAME%><%=com.ist.util.Constans.ALERT_NAME%>处理意见</th>
						</tr>
						<logic:notEmpty name="adviList">
						    <logic:iterate id="advi" name="adviList">
						    <tr>
								<td>
									<bean:write name="advi" property="post_name" />
								</td>
								<td>
									<bean:write name="advi" property="create_user" />
								</td>
								<td>
									<bean:write name="advi" property="create_dt_disp" />
								</td>
								<td>
									<bean:write name="advi" property="opertype_disp" />
								</td>
								<td>
									<bean:write name="advi" property="reason" />
								</td>
							</tr>
							</logic:iterate>
						</logic:notEmpty>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
