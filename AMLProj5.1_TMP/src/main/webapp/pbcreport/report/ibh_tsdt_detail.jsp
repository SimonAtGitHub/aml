<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
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
.style1 {color: #FF0000}
.STYLE2 {color: #000000}
-->
</style>
</head>
	<body class="mainbg">
	<div id="main">
		<html:form action="/report/ibh_tsdt_detaillist.do" method="post">
		<div class="conditions">
			<div class="cond_t">
					<span> <strong><font color="0072BC">大额交易信息详情 </font> </strong> </span>
					<logic:equal name="closeflag" value="1">
					<span class="buttons" >
					 <a href="#" onclick="window.close()"><img src="../../images/blue/b_edit.png" />关 闭</a>
	                </span>
					 
					</logic:equal>
					<logic:notEqual name="closeflag" value="1">
					<span class="buttons" onclick="history.back();">
					<img src="../../images/blue/b_back.png" />返回
	                </span>
					</logic:notEqual>
					
			</div>

			<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			 <div class="cond_c2">
			  <table border="0" cellpadding="0" cellspacing="0">
			   <tr>
                   <th colspan="4"><strong>金融机构信息</strong></th>
                </tr> 
					<tr>
									<td width="10%" height="22" align="right">
										网点名称：
									</td>
									<td>
									<bean:write name="t08_ibh_tsdt" property="finn"/>
									</td>
									<td>
										所在地区行政区划代码：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="firc"/>(<bean:write name="t08_ibh_tsdt" property="firc_disp"/>)
									</td>
					</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										与大额交易的关系：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="rltp"/>(<bean:write name="t08_ibh_tsdt" property="rltp_disp"/>)
									</td>
									<td width="10%" height="22" align="right">
										网点代码类型：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="fict"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										网点代码：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="finc"/>
									</td>
									<td width="10%" height="22" align="right">
										账户类型：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="catp"/>(<bean:write name="t08_ibh_tsdt" property="catp_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										账号：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="ctac"/>
									</td>
									<td width="10%" height="22" align="right">
										
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									
									</td>
								</tr>	

               <tr>
                   <th colspan="4"><strong>代办人信息</strong></th>
                </tr> 

								<tr>
									<td>
										交易代办人姓名：
									</td>
									<td >
									<bean:write name="t08_ibh_tsdt" property="tbnm"/>
									</td>
									<td>
										代办人身份证件类型：
									</td>
									<td>
									<bean:write name="t08_ibh_tsdt" property="tbit"/>(<bean:write name="t08_ibh_tsdt" property="tbit_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">
										代办人身份证件号码：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tbid"/>
									</td>
									<td width="10%" height="22" align="right">
										代办人国籍：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tbnt"/>(<bean:write name="t08_ibh_tsdt" property="tbnt_disp"/>)
									</td>
								</tr>
  <tr>
                   <th colspan="4"><strong>交易信息</strong></th>
  </tr> 

								<tr >
									<td>
										交易时间：
									</td>
									<td>
									<bean:write name="t08_ibh_tsdt" property="tstm_disp"/>
									</td>
									<td>业务标示号：</td>
									<td>
									<bean:write name="t08_ibh_tsdt" property="ticd"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易方式：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tstp"/>(<bean:write name="t08_ibh_tsdt" property="tstp_disp"/>)
									</td>
									<td width="10%" height="22" align="right">涉外收支交易分类与代码：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tsct"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">资金收付标识：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tsdr"/>(<bean:write name="t08_ibh_tsdt" property="tsdr_disp"/>)
									</td>
									<td width="10%" height="22" align="right">交易去向：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tdrc"/>(<bean:write name="t08_ibh_tsdt" property="tdrc_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易发生地：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="trcd"/>(<bean:write name="t08_ibh_tsdt" property="trcd_disp"/>)
									</td>
									<td width="10%" height="22" align="right">
										资金用途：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="crpp"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">币种：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="crtp"/>(<bean:write name="t08_ibh_tsdt" property="crtp_disp"/>)
									</td>
									<td width="10%" height="22" align="right">交易金额：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="crat_disp"/>
									</td>
								</tr>	
   <tr>
                   <th colspan="4"><strong>对方金融机构及交易对手信息</strong></th>
  </tr>
  	 
								<tr>
									<td>
										网点名称：
									</td>
									<td>
									<bean:write name="t08_ibh_tsdt" property="cfin"/>
									</td>
									<td>机构代码网点类型：</td>
									<td>
									<bean:write name="t08_ibh_tsdt" property="cfct"/>(<bean:write name="t08_ibh_tsdt" property="cfct_disp"/>)
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">网点代码：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="cfic"/>
									</td>
									<td width="10%" height="22" align="right">交易对手姓名：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tcnm"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易对手证件类型：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tcit"/>(<bean:write name="t08_ibh_tsdt" property="tcit_disp"/>)
									</td>
									<td width="10%" height="22" align="right">交易对手证件号码：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tcid"/>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="10%" height="22" align="right">交易对手账户类型：</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tcat"/>(<bean:write name="t08_ibh_tsdt" property="tcat_disp"/>)
									</td>
									<td width="10%" height="22" align="right">
										交易对手账号：
									</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t08_ibh_tsdt" property="tcac"/>
									</td>
								</tr>	
		      	  </table>	
			 </div>	
			 </div> 
		</html:form>
		</div>
	</BODY>
</HTML>
