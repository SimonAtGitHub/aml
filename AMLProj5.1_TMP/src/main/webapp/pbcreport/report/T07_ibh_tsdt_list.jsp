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
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>

		<script language="JavaScript">




function _dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}
function _Open(url){
   window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');  
}

</script>
	</head>
	<body class="mainbg">
		<html:form action="/report/T07_ibh_tsdt_list.do" method="post">
			<input type="hidden" name="validbackurl"
								value="<%=request.getContextPath()%>/pbcreport/report/T07_ibh_tsdt_list.do" />
		    	<input type="hidden" name="fromcase" value="<bean:write  name="t07_ibh_tsdt" property="fromcase" />" />
						
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
							原业务标识号
						</th>
						<th>
							验证状态
						</th>
					</tr>
				
					<logic:iterate id="tsdt" name="t07_ibh_tsdtList" indexId="i" type="com.ist.aml.pbcreport.dto.T07_ibh_tsdt">
						<tr>
							<td>
							<logic:equal name="t07_ibh_tsdt" property="tag" value="P0102">
							<a href="#" onclick="_dosubmit('<%=request.getContextPath()%>/pbcreport/validate/getValidateTransDisp.do?reportkey=<bean:write name="tsdt" property="reportkey" />&trans_type=IBH&rpdi_seqno=<bean:write name="tsdt" property="tsdt_seqno"/>&ticd=<bean:write name="tsdt" property="otic"/>')"><bean:write name="tsdt" property="tsdt_seqno" /></a>
							</logic:equal>
							<logic:notEqual name="t07_ibh_tsdt" property="tag" value="P0102">
							<a href="#"
									onclick="_Open('<%=request.getContextPath()%>/pbcreport/report/ibh_tsdt_detaillist.do?reportkey=<bean:write name="tsdt" property="reportkey" />&tsdt_seqno=<bean:write name="tsdt" property="tsdt_seqno" />')">
									<bean:write name="tsdt" property="tsdt_seqno" /> </a>
						
							</logic:notEqual>
							
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
							<td>
								<logic:equal name="tsdt" property="validate_ind" value="1">
									<bean:write name="tsdt" property="validate_ind_disp" />
								</logic:equal>
								<logic:equal name="tsdt" property="validate_ind" value="0">
									<font color="#FF0000"> 
									    <bean:write name="tsdt" property="validate_ind_disp" scope="page" />
								    </font>
								</logic:equal>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
		</html:form>
	</body>
</html>
