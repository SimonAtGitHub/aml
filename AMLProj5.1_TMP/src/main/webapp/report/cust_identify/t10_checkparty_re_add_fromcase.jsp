<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>		
	    <script language="JavaScript" src="../../js/jquery.validator.js"></script>
	    <script type="text/javascript" src="../../js/calendar.js"></script>

		<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script>
	function dosubmit(theurl){
		
		
		var reason =document.getElementsByName("check_reason")[0];
		
		var msg="";
		if(reason.value=='')
		{
			msg="原因不能为空!";
		}else if (getLength(reason.value)>500){
			msg="原因长度不能大于500个字符或250个汉字!";	
		}
		if(msg=="")
		{
		
		    document.forms[0].action=theurl;
		    document.forms[0].submit();
		
		}else
		{
			alert(msg);
			return false;
		}
	}
	 
	function refreshParent()
	{
	
	   var refresh='<%=request.getAttribute("refresh")%>';
	
	   if(refresh=="1")
	   {
		
		   window.parent.ymPrompt.close();
	   }
	   
	}
</script>
	</head>
	
	<body leftmargin="0" topmargin="0" class="mainbg"
		onload="refreshParent();">
		<html:form  action="/cust_identify/t10_checkparty_re_add_fromcase.do" method="post">
			<div id="main">
				<!-- conditions -->
				<html:hidden property="party_id"/>			

				<html:errors/>
				<!-- table content -->
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
												

						<tr>
							<td style="width: 20%;">
								<font color="#FF0000">*</font>原因：
							</td>
							<td>
								<html:textarea styleId="check_reason" property="check_reason" cols="38" rows="10"></html:textarea>
								
							</td>
						</tr>

						<tr>

							<td colspan="2" align="center">
								<input name="" type="button" class="in_button1" value="保 存"
									onClick="dosubmit('t10_checkparty_re_add_fromcase_do.do');" />
						</tr>

					</table>
				</div>
			</div>
			</div>
		</html:form>
	</body>
</html>