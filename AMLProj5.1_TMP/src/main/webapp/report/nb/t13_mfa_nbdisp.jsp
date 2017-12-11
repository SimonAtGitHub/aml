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
<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript">

function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmit(theUrl){

      document.forms[0].action=theUrl;
      document.forms[0].submit();
  
}

</script>
</head>
<body id="iframecontent">
<html:form action="/nb/t13_mfa_nbdisp.do" method="post">

<div class="main">
	<div class="conditions">
	<!-- title -->
					<div class="cond_t">
						<span>资金网络管理详细信息</span>		
						 <span class="buttons">
	  <a href="#" onClick="dosubmit('<bean:write name="url"/>');"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>	
					</div>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<html:errors />
			<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
   
   <tr>
		<td width="160" height="22" align="right" bgcolor="ECF3FF">网络编号：</td>
		<TD bgcolor="F6F9FF">
		
			<bean:write name="t13_mfa_nb" property="net_id" />
		</TD>
	
		 <td height="22" align="right" bgcolor="ECF3FF">网络名称：</td>
		<TD bgcolor="F6F9FF">
			<bean:write name="t13_mfa_nb" property="net_name" />
		</TD>
		
	</tr>
	<tr>
		<td height="22" align="right" bgcolor="ECF3FF">视图模式：</td>
		<TD bgcolor="F6F9FF">
			<bean:write name="t13_mfa_nb" property="view_mode_disp" />
		</TD>
	
		<td height="22" align="right" bgcolor="ECF3FF">显示模式：</td>
		<TD bgcolor="F6F9FF">
			<bean:write name="t13_mfa_nb" property="display_mode_disp" />
		</TD>
	</tr>
	<tr>
		<td height="22" align="right" bgcolor="ECF3FF">是否新增：</td>
		<TD bgcolor="F6F9FF">
			<bean:write name="t13_mfa_nb" property="is_new"  />
		</TD>
	
		<td height="22" align="right" bgcolor="ECF3FF">归属机构：</td>
		<TD bgcolor="F6F9FF">
			<bean:write name="t13_mfa_nb" property="organkey" />
		</TD>
	</tr>
	
   </TABLE>
					</div>
					</div>
		</html:form>
		
	</BODY>
</HTML>