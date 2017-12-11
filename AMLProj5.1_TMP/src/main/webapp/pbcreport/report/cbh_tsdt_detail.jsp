<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}
</SCRIPT>
		<style type="text/css">
<!--
.style1 {color: #FF0000}
.STYLE2 {color: #000000}
-->
</style>
</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/report/cbh_tsdt_detail.do" method="post">
			<table width="98%" border="0" align="center" cellpadding="2"
				cellspacing="0">
				
				<logic:equal name="t07_cbh_tsdt" property="tag" value="1">
				<tr>
					<%
					String fromcase = (String)session.getAttribute("fromcase");
					if(fromcase==null || !fromcase.equalsIgnoreCase("1")) {
					 %>
					<td class="td1" colspan="2">
						<span class="css014"> <strong><strong><font
									color="0072BC">数据校正- 纠错<%=com.ist.util.Constans.REPORT_NAME %> - 交易信息详情</font> </strong> </strong> </span>
					</td>
					<%
					} else {%>
					<input type="hidden" name="casekey" value="<bean:write name="casekey"></bean:write>"/>
					<%
					} %>
					<td width="42%" align="right" nowrap class="td2">
					<input type="button" value="校正" class="input"
							onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/validate/getValidateTransDisp.do')" />&nbsp;
					<input type="button" value="返回" class="input"
							onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_list.do')" />&nbsp;
					
					<html:hidden property="tag" />
					<input type="hidden" name="tsdt_seqno" value="<bean:write name="t07_cbh_tsdt" property="tsdt_seqno"/>"/>
        			<input type="hidden" name="report_type" value="1"/>
        			<input type="hidden" name="validbackurl" value="<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_detail.do?reportkey=<bean:write name="t07_cbh_tsdt" property="reportkey"/>&tsdt_seqno=<bean:write name="t07_cbh_tsdt" property="tsdt_seqno"/>&pbc_msg_type_cd=C&tag=1"/>
					</td>
				</tr>
				</logic:equal>
				<logic:notEqual name="t07_cbh_tsdt" property="tag" value="1">
				<tr>
					<td class="td1" colspan="2">
						<span class="css014"> <strong><font color="0072BC"><%=com.ist.util.Constans.REPORT_NAME %>管理 - 纠错大额<%=com.ist.util.Constans.REPORT_NAME %> - 交易信息详情 </font> </strong> </span>
					</td>
					<td width="42%" align="right" nowrap class="td2">
						<input type="button" name="button1" value="返回" class="input"
							onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_list.do')" />
					</td>
				</tr>
				</logic:notEqual>
        <html:hidden name="t07_cbh_tsdt" property="reportkey"/>	
        	
			</table>

			<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="88%"><span class="css014"> <strong><font color="0072BC"><b>金融机构信息</b></font></strong></span> 
      </td>
      <td width="12%" align="right">&nbsp;</td>
    </tr>
  </table>
<TABLE align=center border=1 borderColor=333333 cellPadding=0
				cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
				<TBODY>
					<TR>
						<TD align="center" valign="top"
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr bgcolor="ECF3FF">
								
									<td width="10%" height="22" align="right">
										网点名称：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="finn"/>
									</td>
									<td width="10%" height="22" align="right">
										所在地区行政区划代码：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="firc"/>(<bean:write name="t07_cbh_tsdt" property="firc_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										与大额交易的关系：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="rltp"/>(<bean:write name="t07_cbh_tsdt" property="rltp_disp"/>)
									</td>
									<td width="10%" height="22" align="right">
										网点代码类型：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="fict"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										网点代码：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="finc"/>
									</td>
									<td width="10%" height="22" align="right">
										账户类型：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="catp"/>(<bean:write name="t07_cbh_tsdt" property="catp_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										账号：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="ctac"/>
									</td>
									<td width="10%" height="22" align="right">
										
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									
									</td>
								</tr>	
		      	    </table>
			    </TBODY>
			 </TABLE>
	<table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="88%"><span class="css014"> <strong><font color="0072BC"><b>代办人信息</b></font></strong></span> 
      </td>
      <td width="12%" align="right">&nbsp;</td>
    </tr>
  </table>
  <TABLE align=center border=1 borderColor=333333 cellPadding=0
				cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
				<TBODY>
					<TR>
						<TD align="center" valign="top"
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										交易代办人姓名：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tbnm"/>
									</td>
									<td width="10%" height="22" align="right">
										代办人身份证件类型：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tbit"/>(<bean:write name="t07_cbh_tsdt" property="tbit_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										代办人身份证件号码：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tbid"/>
									</td>
									<td width="10%" height="22" align="right">
										代办人国籍：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tbnt"/>(<bean:write name="t07_cbh_tsdt" property="tbnt_disp"/>)
									</td>
								</tr>
									
		      	    </table>
			    </TBODY>
			 </TABLE> 
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="88%"><span class="css014"> <strong><font color="0072BC"><b>交易信息</b></font></strong></span> 
      </td>
      <td width="12%" align="right">&nbsp;</td>
    </tr>
  </table>
	<TABLE align=center border=1 borderColor=333333 cellPadding=0
				cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
				<TBODY>
					<TR>
						<TD align="center" valign="top"
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										交易时间：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tstm_disp"/>
									</td>
									<td width="10%" height="22" align="right">业务标示号：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="ticd"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易方式：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tstp"/>(<bean:write name="t07_cbh_tsdt" property="tstp_disp"/>)
									</td>
									<td width="10%" height="22" align="right">涉外收支交易分类与代码：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tsct"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">资金收付标识：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tsdr"/>(<bean:write name="t07_cbh_tsdt" property="tsdr_disp"/>)
									</td>
									<td width="10%" height="22" align="right">交易去向：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tdrc"/>(<bean:write name="t07_cbh_tsdt" property="tdrc_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易发生地：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="trcd"/>(<bean:write name="t07_cbh_tsdt" property="trcd_disp"/>)
									</td>
									<td width="10%" height="22" align="right">
										资金用途：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="crpp"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">币种：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="crtp"/>(<bean:write name="t07_cbh_tsdt" property="crtp_disp"/>)
									</td>
									<td width="10%" height="22" align="right">交易金额：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="crat"/>
									</td>
								</tr>	
		      	    </table>
			    </TBODY>
			 </TABLE>
		 <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="88%"><span class="css014"> <strong><font color="0072BC"><b>对方金融机构及交易对手信息</b></font></strong></span> 
      </td>
      <td width="12%" align="right">&nbsp;</td>
    </tr>
  </table>
  	 <TABLE align=center border=1 borderColor=333333 cellPadding=0
				cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
				<TBODY>
					<TR>
						<TD align="center" valign="top"
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										网点名称：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="cfin"/>
									</td>
									<td width="10%" height="22" align="right">机构代码网点类型：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="cfct"/>(<bean:write name="t07_cbh_tsdt" property="cfct_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">网点代码：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="cfic"/>
									</td>
									<td width="10%" height="22" align="right">交易对手姓名：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tcnm"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易对手证件类型：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tcit"/>(<bean:write name="t07_cbh_tsdt" property="tcit_disp"/>)
									</td>
									<td width="10%" height="22" align="right">交易对手证件号码：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tcid"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易对手账户类型：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tcat"/>(<bean:write name="t07_cbh_tsdt" property="tcat_disp"/>)
									</td>
									<td width="10%" height="22" align="right">
										交易对手账号：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_cbh_tsdt" property="tcac"/>
									</td>
								</tr>	
		      	    </table>
			    </TBODY>
			 </TABLE>		 
		</html:form>
	</BODY>
</HTML>
