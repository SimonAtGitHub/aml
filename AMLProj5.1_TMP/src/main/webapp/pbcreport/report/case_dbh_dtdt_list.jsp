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
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />

	</head>
	<body class="mainbg">
		<html:form action="/report/dbh_dtdt_list.do" method="post">
			<!-- list -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
							业务标识号
						</th>
						<th>
							客户号
						</th>
						<th>
							大额交易特征
						</th>
						<th>
							交易日期
						</th>
					</tr>
					<logic:iterate id="search" name="t07_dbh_dtdtList" type="com.ist.aml.pbcreport.dto.T07_dbh_dtdt">
						<tr>
							<td>
								<a href="<%=request.getContextPath()%>/inves/trade/t47_transaction_disp.do?tableName=t47_transaction&transactionkey=<bean:write name="search" property="ticd"/>" target="_blank">
								    <bean:write name="search" property="ticd" scope="page" />
							    </a>
							</td>
							<td>
								<bean:write name="search" property="csnm" scope="page" />
							</td>
							<td>
								<bean:write name="search" property="crcd_disp" scope="page" />
							</td>
							<td>
								<bean:write name="search" property="htdt_disp" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
		</html:form>
	</body>
</html>