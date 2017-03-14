<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.lang.String"%>
<%@ page import="java.lang.Double"%>
<%@page import="com.ist.aml.report.dto.T07_case_stcr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<%
			String url = request.getContextPath();
		String cssurl=url+"/css/aml_"+session.getAttribute("style")+".css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<!-- <link rel="stylesheet" href=<%=cssurl%> type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript">

</script>
	</head>
	<body id="iframecontent">
			<html:form method="post" action="/case/caseInfo.do">
			
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
						<div class="cond_c2">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										报文名称：
									</td>
									<td>
										<bean:write name="t07_receipt" property="msg_file" />
									</td>
									<td>所在数据包：
									</td>
									<td>
									<a href="#" style="text-decoration:underline;"
											onClick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<bean:write name="t07_receipt" property="packet_filepath" />','','height=160, width=300,left=100,top=100');">
											<bean:write name="t07_receipt" property="packet_filename" /> </a>(点击下载)
									</td>
								</tr>
								<tr>
									<td>回执名称：
									</td>
									<td>
										<bean:write name="t07_receipt" property="receipt_file" />
									</td>
									<td>
										回执类型：
									</td>
									<td>
										<bean:write name="t07_receipt" property="receipt_type_cd_disp" />
									</td>
								</tr>
							</table>
						</div>
				</div>
					<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<TR align=center class="tdhead">
					<TH width="30%" nowrap>
						回执定位
					</TH>
					<TH width="30%" nowrap>
						回执提示
					</TH>
				</TR>

				<logic:present name="t07_receiptList">
					<logic:iterate id="receipt" name="t07_receiptList"
						type="com.ist.aml.pbcreport.dto.T07_receipt">
						<TR align="center" class="interval"
							onMouseOver="this.className='interval2'"
							onMouseOut="this.className='interval'">
							<TD>
								<bean:write name="receipt" property="err_location" />
							</TD>
							<TD>
								<bean:write name="receipt" property="errs" />
							</TD>
						</TR>
					</logic:iterate>
				</logic:present>
					</table>
				</div>
			 
			</html:form>
	</body>
</html>