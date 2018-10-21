<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.util.DateUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<!--
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />	
	</head>
	<body class="mainbg">
	<%ArrayList list=(ArrayList)request.getAttribute("t47_transactionLogList");
	if(list!=null&&list.size()>0) {%>
	<div id="main">		
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th  nowrap>
								流水号
							</th>
							<th  nowrap>
								交易日期
							</th>
							<th  nowrap>
								客户号
							</th>
							<th nowrap>
								补录日期
							</th>
							<th  nowrap>
								补录用户
							</th>
						</tr>
						<logic:present name="t47_transactionLogList">
							<logic:iterate id="result" name="t47_transactionLogList"
								type="com.ist.aml.report.dto.T47_trans_recordLog">
								<tr align="center" bgcolor="#FFFFFF">
									<td>
										<bean:write name="result" property="tx_no" />
									</td>
									<td nowrap>
									<%java.util.Date tx_dt_disp=result.getTx_dt();
									   String tx_dt_show=DateUtils.dateToStringShort(tx_dt_disp);
									    tx_dt_disp=null;%>
										<%= tx_dt_show%>
									</td>
									<td>
							             <bean:write name="result" property="party_id" />
									</td>
									<td>
										<bean:write name="result" property="create_dt" />
									</td>
										<td>
										<bean:write name="result" property="create_usr" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="list_page">
					<logic:present name="pageInfo">
						<table width="98%" align="center" border="0" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</logic:present>
				</div>
				<!-- all end -->
		</div>
		<%} else{ %>
		<h1 style="text-align:center;position:relative;top:120px;">没有发现补录日志</h1>	
		<%} %>
	</body>
</html>
