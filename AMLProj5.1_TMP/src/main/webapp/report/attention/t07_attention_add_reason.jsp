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
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>

		<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script>
	function dosubmit(){
		var theurl=window.parent.document.getElementById("theurl").value;
		
		var reason =document.getElementsByName("op_reason")[0];
		
		var msg="";
		if(reason.value=='')
		{
			msg="原因不能为空!";
		}else if (getLength(reason.value)>1000){
			msg="原因长度不能大于1000!";	
		}
		if(msg=="")
		{
			
		    document.forms[0].action='<%=request.getContextPath()%>'+theurl;
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
		 var url=window.parent.location.href;
		
		 if(url.indexOf("?")==-1)
		 {
			 url=url+"?atten_post=<%= request.getAttribute("atten_post")%>";
		 }
	
		   window.parent.location.href=url;
		   window.parent.ymPrompt.close();
	   }
	   
	}
</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg"
		onload="refreshParent();">
		<form name="form1" action="" method="post">
			<div id="main">
				<!-- conditions -->
               <html:messages id="error" message="true">
					  <bean:write name="error" filter="false"/>
			   </html:messages>
				<!-- table content -->
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">


						<tr>
							<td style="width: 20%;">
								原因：
							</td>
							<td>
								<textarea name="op_reason" cols="38" rows="10"></textarea>
								<font color="#FF0000">*</font>
							</td>
						</tr>

						<tr>

							<td colspan="2" align="center">
								<input name="" type="button" class="in_button1" value="保 存"
									onClick="dosubmit();" />
						</tr>

					</table>
				</div>
			</div>
			</div>
		</form>
	</body>
</html>