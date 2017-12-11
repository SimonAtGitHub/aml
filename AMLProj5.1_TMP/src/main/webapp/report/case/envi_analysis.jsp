<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
		
			String basefuncurl = url + "/js/basefunc.js";
			
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
	
		<script language="JavaScript" src=<%=basefuncurl%>></script>
	
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/envi_analysis.do">
			<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									累计流入金额：
								</td>
								<td><bean:write name="t07_case_feature" property="totalamt_in_str" /></td>
								<td>
								          累计流入笔数：
								</td>
								<td><bean:write name="t07_case_feature" property="totalcount_in_str" /></td>
							</tr>
							<tr>
								<td>
									累计流出金额：
								</td>
								<td><bean:write property="totalamt_out_str" name="t07_case_feature" /></td>
								<td>
									累计流出笔数：
								</td>
								<td><bean:write name="t07_case_feature" property="totalcount_out_str" /></td>
							</tr>
							<tr>
								<td>
									流向：
								</td>
								<td><bean:write property="direction" name="t07_case_feature" /></td>
								<td>
									净发生金额：
								</td>
								<td><bean:write property="netamt_str" name="t07_case_feature" /></td>
							</tr>
							<tr>
								<td>
									平均流入集中度：
								</td>
								<td><bean:write property="avgamt_in_str" name="t07_case_feature" />元/笔</td>
								<td>
									平均流出集中度：
								</td>
								<td><bean:write property="avgamt_out_str" name="t07_case_feature" />元/笔</td>
							</tr>
							<tr>
								<td>
									平均集中度：
								</td>
								<td><bean:write property="avgamt_str" name="t07_case_feature" />元/天</td>
								<td>
									流入速度：
								</td>
								<td><bean:write property="speed_in_str" name="t07_case_feature" />元/天</td>
							</tr>
								<tr>
									<td>
										流出速度：
									</td>
									<td>
										     <bean:write property="speed_out_str" name="t07_case_feature" />元/天
									</td>
									<td>
										流速：
									</td>
									<td>
										    <bean:write property="speed_str" name="t07_case_feature" />元/天
									</td>
								</tr>
						</table>
					</div>
		</html:form>
	</body>
</html>

