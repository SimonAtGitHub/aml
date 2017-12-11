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
<html:form action="/nb/t13_mfa_nbadd_do.do" method="post">
<html:hidden property="net_id"/>
<html:hidden property="is_new"/>
<html:hidden property="organkey"/>
<div class="main">
	<div class="conditions">
	<!-- title -->
					<div class="cond_t">
						<span>新建</span>		
						 <span class="buttons">
						<a href="#"
							onClick="dosubmit('<%=request.getContextPath() %>/report/nb/t13_mfa_nb_search.do?intPage=<%=request.getSession().getAttribute("intPage") %>');">
							<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
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
		<td height="22" align="right" bgcolor="ECF3FF">网络名称：</td>
		<TD bgcolor="F6F9FF">
			<html:text property="net_name" maxlength="50"></html:text>
		</TD>
		
	</tr>
  
	<tr>
		<td height="22" align="right" bgcolor="ECF3FF">视图模式：</td>
		<TD bgcolor="F6F9FF">
		<div align="left">
										<html:select property="view_mode">
											<html:options collection="view_modeMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>	
		</TD>
	</tr>
	<tr>
		<td height="22" align="right" bgcolor="ECF3FF">显示模式：</td>
		<TD bgcolor="F6F9FF">
		<div align="left">
										<html:select property="display_mode">
											<html:options collection="display_modeMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>	
		</TD>
	</tr>
 	
	<tr>
								
								<td colspan="4" align="center">
									<input type="button" name="button1" class="in_button1" value="提 交"
										onclick="checkForm('t13_mfa_nbadd_do.do?intPage=<%=request.getSession().getAttribute("intPage") %>')" />
									<input type="reset" name="button1" class="in_button1" value="重 置" />
								</td>
								
							</tr>
	
   </TABLE>
					</div>
					</div>
		</html:form>
		
	</BODY>
</HTML>