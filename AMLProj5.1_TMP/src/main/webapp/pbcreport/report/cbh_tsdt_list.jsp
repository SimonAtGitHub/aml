<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.CreditTask"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>

		<script language="JavaScript">




function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}

</script>
	</head>
	<body class="mainbg">
		<html:form action="/report/cbh_tsdt_list.do" method="post">
		
					
		  
		   <%
								CreditTask credittask = (CreditTask) session
												.getAttribute("credittask");
			
										String button1Value = "";
										if(credittask!=null)
										if (credittask.getPost_id().equals("P0102")) { // 编辑岗
											button1Value = "1";
											}else{
											button1Value = "0";
											}
											
						 %>		
				
			<div class="cond_t2">
				<span class="buttons"> 
				   <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />
				       <%=com.ist.util.Constans.REPORT_NAME%>代码：
				   </strong>
					   <bean:write name="t07_cbh_tsdt" property="reportkey" />
				</span>
			</div>
			<!-- list -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
					
							序号
						</th>
						<th>
							原客户号
						</th>
						<th>
							原大额交易发生日期
						</th>
						<th>
							原大额交易特征代码
						</th>
						<th>
							原业务标示号
						</th>
						<logic:equal name="t07_cbh_tsdt" property="tag" value="1">
							<th>
								通过校正
							</th>
						</logic:equal>
					</tr>

					<logic:iterate id="tsdt" name="t07_cbh_tsdtList" indexId="i" type="com.ist.aml.pbcreport.dto.T07_cbh_tsdt">
						<tr>
						
							<td>
						

							<% if(!button1Value.equals("1")){ %>
								<a
									href="<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_detail.do?reportkey=<bean:write name="tsdt" property="reportkey"/>&tsdt_seqno=<bean:write name="tsdt" property="tsdt_seqno" />&tag=<bean:write name="t07_cbh_tsdt" property="tag" />">
									<bean:write name="tsdt" property="tsdt_seqno" />
								</a>
								<%
									} else {
								%>
								<a
									href="<%=request.getContextPath()%>/pbcreport/validate/getValidateTransDisp.do?reportkey=<bean:write name="tsdt" property="reportkey"/>&fromcase=1&ticd=<bean:write name="tsdt" property="ticd" />&rpdi_seqno=<bean:write name="tsdt" property="tsdt_seqno" />&trans_type=CBH&report_type=1&validbackurl=<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_list.do">
									<bean:write name="tsdt" property="tsdt_seqno" />
								</a>
								<%
									}
								%>
							</td>
							<td>
								<bean:write name="tsdt" property="ocnm" />
							</td>
							<td>

								<bean:write name="tsdt" property="otdt_disp" />
							</td>
							<td>
								<bean:write name="tsdt" property="otcd" />
							</td>
							<td>
								<bean:write name="tsdt" property="otic" />
							</td>
							<logic:equal name="t07_cbh_tsdt" property="tag" value="1">
								<td>
									<bean:write name="tsdt" property="validate_ind_disp" />
								</td>
							</logic:equal>
						</tr>
					</logic:iterate>
				</table>
			</div>
		</html:form>
	</body>
</html>
