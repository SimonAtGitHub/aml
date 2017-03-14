<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<title>关注库修改</title>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	    <script language="JavaScript" src="../../js/jquery.validator.js"></script>
	    <script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		

 function dosubmit(theUrl){    

	 if(document.forms[0].all.invalid_dt.value=="")
	 {
		 alert("失效日期不能为空！");
		 return false;
		
	 } 
	 
       document.forms[0].action=theUrl;
       if (jQuery('#form0').validateAll()) {
    	cancelDisabled();
    	
		document.forms[0].submit();
	}
 }

 function change_inValidDt(atten_type)
 {
	 jQuery.ajax({
			type:"post",
			url:"change_inValidDt.do",
			data:{atten_type:atten_type.value},
			dataType:"text",
			success:function(msg){
				document.forms[0].invalid_dt.value=msg;
			 }
	});
 }

function cancelDisabled() {

	var elements=document.forms[0].elements;
	for (var i = 0; i < elements.length; i++) {

		if (elements[i].type == "select-one" &&  elements[i].disabled==true) {
			elements[i].disabled=false;
		}
	}
}

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" styleId="form0"
			action="/attention/t07_attention_lib_modify_do.do">
			
			<html:hidden name="t07_attention_lib" property="atten_id"/>
			<html:hidden property="atten_post"/>
			<html:hidden property="op_result"/>
			<html:hidden property="atten_source"/>
			<html:hidden property="target_post"/>
			<html:hidden property="op_type"/>
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>关注库修改</span>
						<span class="buttons"> <a href="t07_attention_lib_list.do?atten_post=<%=request.getAttribute("atten_post") %>" ><img
									src="../../images/blue/b_back.png" />返 回</a></span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0">

                            <html:hidden property="atten_id"/>
							<tr>
								<td>
									<font color="red">*</font>客户名称：
								</td>
								<td>
									<html:text name="t07_attention_lib"  property="party_chn_name"  readonly="true" /><img src="../../images/blue/b_lock.png" height='20'/>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>客户号：
								</td>
								<td>
									<html:text name="t07_attention_lib" property="party_id"   readonly="true" /><img src="../../images/blue/b_lock.png" height='20'/>
								</td>
							</tr>

							<tr>
								<td>
									<font color="red">*</font>客户类型：
								</td>
								<td>
									<html:select name="t07_attention_lib" property="party_class_cd" disabled="true">
											<html:options collection="party_class_cdMap" property="label"
												labelProperty="value"  />
									</html:select>									
									<img src="../../images/blue/b_lock.png" height='20'/>
								</td>
							</tr>
								<tr>
								<td>
									<font color="red">*</font>证件类型：
								</td>
								<td>
									<html:select name="t07_attention_lib" property="card_type" disabled="true">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
									</html:select>									
									<img src="../../images/blue/b_lock.png" height='20'/>
								</td>
							</tr>
								<tr>
								<td>
									<font color="red">*</font>证件号码：
								</td>
								<td>
								    <html:text name="t07_attention_lib" property="card_no"   readonly="true" /><img src="../../images/blue/b_lock.png" height='20'/>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>归属机构：
								</td>
								<td>
									<html:text name="t07_attention_lib" property="organkey" size="10" readonly="true"/>-<html:text name="t07_attention_lib" property="organname" size="40" readonly="true"/>
									<img src="../../images/blue/b_lock.png" height='20'/>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>关注类型：
								</td>
								<td>
									
									<html:select  name="t07_attention_lib" property="atten_type" onchange="change_inValidDt(this);" require="true" datatype="require">
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
									
									<html:text name="t07_attention_lib"  property="invalid_dt"  onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" size="12" />
											
								
								</td>
							</tr>


							<tr>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>原因：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<textarea name="op_reason"  rows="4"  require="true" datatype="require|limit_max" max="1000" msg="不能为空|不能超过1000个字符"><bean:write name="op_reason" scope="request"/></textarea>


									</div>
								</TD>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="button" class="in_button1" value="提 交"
										onClick="dosubmit('t07_attention_lib_modify_do.do');" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->


			</div>
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</body>
</html>
