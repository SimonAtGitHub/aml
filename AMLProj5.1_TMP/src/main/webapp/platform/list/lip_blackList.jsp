<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		 
			function query()   
			{   
				var mes='';
				var type=document.getElementsByName("type")[0].value;	
				var value=document.getElementsByName("value")[0].value;
				
				
				if(type==null||trim(type)=='')
				{
					mes='名单库类型不能为空！';
				}
				
				if(value==null||trim(value)=='')
				{
					mes+='查询内容不能为空！';
				}
				
				if(mes=='')
				{			
				
				 	window.location.href = 'http://98.10.1.160:7002/lip/query.do?type='+type+'&value='+value; 
				 	//var url='http://192.168.106.114:8085/lip/query.do';
				 	//var url='http://98.10.1.162:7001/lip/query.do';
					//url+='?type='+type+'&value='+value; 
					//url='http://www.sohu.com';
				 	//window.open(url,'查询结果','height=600,width=600,left=300,top=100,scrollbars=yes,resizable=yes');
				 }
				 else
				 {
				 	alert(mes);
				 }  
			}   
	
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<form  method="post">
			<table width="98%" border="0" align="center" cellpadding="2"
				cellspacing="0">
				<tr>
					<td width="100%" class="td1">
						<span class="css014"> <strong><font color="0072BC">查询名单库名单</font> </strong> </span>
					</td>
					
				</tr>
			</table>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			
			<TABLE align=center border=1 borderColor=333333 cellPadding=0
				cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
				<TBODY>
					<TR>
						<TD height="60" align="center" valign="top"
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								
								<tr bgcolor="ECF3FF">
									<td height="27" align="right" bgcolor="ECF3FF">
										名单库类型
									</td>
									<td bgcolor="F6F9FF">
										<select name="type">
										<!--html<:options collection="orderList" property="label"
												labelProperty="value" /> -->											
											<option value="10000">客户黑名单</option>
											<option value="10020">地区黑名单</option>
										</select>
									</td>
									<td height="28" align="right" bgcolor="ECF3FF">
										查询内容：
									</td>
									<td bgcolor="F6F9FF">
										<input type="text" name="value" size="20" />
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td></td>
									<td></td>
									<td></td>
									<td><input type="button"  styleClass="input" value="查 询" onclick="query()" />
									</td>
								</tr>
							</table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
<form>
	</BODY>
</HTML>
