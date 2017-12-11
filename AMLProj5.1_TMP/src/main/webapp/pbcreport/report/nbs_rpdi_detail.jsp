<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">

function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}

</script>
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

.STYLE2 {
	color: #000000
}
-->
</style>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/report/nbs_rpdi_detail.do" method="post">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>可疑交易信息详情</span>
						<span class="buttons"> <a href="#"
							onclick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a> <!-- <html:button property="b2" value="关 闭" styleClass="input" onclick="window.close()"/> -->
						</span>
					</div>
					<!-- table content -->
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>客户信息</b></strong> </span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
						
							<tr>

								<td width="10%">
									客户名称：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="ctnm" />
								</td>
								<td width="10%">
									客户身份证件类型：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="citp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="citp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									客户证件号码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="ctid" />
								</td>
								<td>
									账号：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="ctac" />
								</td>
							</tr>
						</table>
					</div>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>代办人信息</b>
									 </strong> </span>
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%">
									交易代办人姓名：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="bknm" />
								</td>
								<td width="10%">
									代办人身份证件类型：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="bitp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="bitp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									代办人身份证件号码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="bkid" />
								</td>
								<td>
									代办人国籍：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="bknt" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="bknt_disp" />
									)
								</td>
							</tr>
						</table>
					</div>

					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>交易信息</b>
									</strong> </span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%">
									交易时间：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="tstm_disp" />
								</td>
								<td width="10%">
									交易发生地：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="trcd" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="trcd_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									业务标识码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="ticd" />
								</td>
								<td>
									交易方式：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tstp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tstp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									涉外收支交易分类与代码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tsct" />
								</td>
								<td>
									收付标识：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tsdr" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tsdr_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									资金来源和用途：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="crsp" />
								</td>
								<td>
									币种：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="crtp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="crtp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									交易金额：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="crat" />
								</td>
								<td>

								</td>
								<td>

								</td>
							</tr>
						</table>
					</div>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>对方金融机构及交易对手信息</b>
									</strong> </span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%">
									机构名称：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="cfin" />
								</td>
								<td width="10%">
									金融机构代码类型：
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="cfct" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="cfct_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									机构代码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="cfnc" />
								</td>
								<td>
									金融机构网点行政区划代码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="cfrc" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="cfrc_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									交易对手姓名：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcnm" />
								</td>
								<td>
									交易对手证件类型：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcit" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tcit_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									交易对手证件号码：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcid" />
								</td>
								<td>
									交易对手账号类型：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcac" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tcat_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									交易对手账号：
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcac" />
								</td>
								<td>

								</td>
								<td>

								</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</body>
</html>
