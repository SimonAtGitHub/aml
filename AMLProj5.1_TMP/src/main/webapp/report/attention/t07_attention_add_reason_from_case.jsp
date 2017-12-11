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
			
		    document.forms[0].action=theurl;
		    document.forms[0].submit();
		
		}else
		{
			alert(msg);
			return false;
		}
	}
	 function change_inValidDt(atten_type)
	 {
		
		 if(atten_type.value=="")
		 {
			 
			 document.forms[0].invalid_dt.value="";
		 }else
		 {
			 
			 jQuery.ajax({
					type:"post",
					url:"change_inValidDt.do",
					data:{atten_type:atten_type.value,add_post:"<bean:write name="curr_post"/>"},
					dataType:"text",
					success:function(msg){
						document.forms[0].invalid_dt.value=msg;
					 }
			});
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
		<html:form  action="/attention/add_attention_lib_form_case_do.do" method="post">
			<div id="main">
				<!-- conditions -->
				<html:hidden property="party_id"/>
				
               <html:messages id="error" message="true">
					  <bean:write name="error" filter="false"/>
			   </html:messages>
				<!-- table content -->
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						  <tr>
								<td>
									<font color="red">*</font>关注类型：
								</td>
								<td>
									
									<html:select property="atten_type" onchange="change_inValidDt(this);" require="true" datatype="require">
											<html:options collection="atten_typeMap" property="label"
												labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>失效日期：
								</td>
								<td>
									
									<input type="text" name="invalid_dt"  onclick="calendar.show(this);" readonly="true"
										class="calimg" size="12" />
											
								
								</td>
							</tr>

						<tr>
							<td style="width: 20%;">
								<font color="#FF0000">*</font>原因：
							</td>
							<td>
								<textarea name="op_reason" cols="38" rows="10"></textarea>
								
							</td>
						</tr>

						<tr>

							<td colspan="2" align="center">
								<input name="" type="button" class="in_button1" value="保 存"
									onClick="dosubmit('add_attention_lib_form_case_do.do');" />
						</tr>

					</table>
				</div>
			</div>
			</div>
		</html:form>
	</body>
</html>