<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!-- 
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		 -->
		 <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   var error="";
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
</SCRIPT>
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
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<form name="t07_receiptActionForm" method="post"
			action="/t07_receipt/t07_receipt_disp.do">
			<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>回执查看</span>
				<span class="buttons">
						<a href="#" onClick="dosubmit('t07_receipt_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
				 </span>
	</div>
			<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
								<tr bgcolor="ECF3FF">
									<td width="30%" align="right">
										原<%=com.ist.util.Constans.CASE_NAME %>号：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_receipt" property="application_num" />
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="30%" align="right">
										原报告号：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_receipt" property="reportkey" />
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="30%" align="right">
										回执号：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_receipt" property="receiptkey" />
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="30%" align="right">
										回执类型：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_receipt" property="receipt_type_cd_disp" />
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="30%" align="right">
										报文名：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_receipt" property="msgFile" />
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
			</TABLE>
			</div>
		</form>
		</div>
	</BODY>
</HTML>
