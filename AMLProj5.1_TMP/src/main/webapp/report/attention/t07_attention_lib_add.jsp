<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<title>关注库添加</title>
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
		document.forms[0].submit();
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
				data:{atten_type:atten_type.value,add_post:"P"},
				dataType:"text",
				success:function(msg){
					document.forms[0].invalid_dt.value=msg;
				 }
		});
	 }
	 
	 
 }



</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" styleId="form0"
			action="/attention/t07_attention_lib_add_do.do">
			
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
						<span>关注库添加</span>
						<span class="buttons"> <a href="t07_attention_lib_list.do?atten_post=<%=request.getAttribute("atten_post") %>" ><img
									src="../../images/blue/b_back.png" />返 回</a></span>
					</div>
					
					<html:messages id="errors" message="true">
							<bean:write name="errors" filter="fasle" />
					</html:messages>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">

                            
							<tr>
								<td>
									<font color="red">*</font>客户名称：
								</td>
								<td>
									<input type="text" name="party_chn_name" size="20" value="" require="true" 
									datatype="require" max="32" msg="不能为空" />
									
									<a href="javascript:void(0);" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list1.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name&type=party_class_cd','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
											<span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span>
											</a>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>客户号：
								</td>
								<td>
									<input type="text" name="party_id" size="20"  require="true"
										datatype="require|safeString|limit_max" max="32"
										msg="不能为空|请输入合法的用户id|不能超过32个字符" />
								</td>
							</tr>

							<tr>
								<td>
									<font color="red">*</font>客户类型：
								</td>
								<td>
									<html:select property="party_class_cd" require="true" datatype="require">
											<html:options collection="party_class_cdMap" property="label"
												labelProperty="value" />
									</html:select>
								</td>
							</tr>
								<tr>
								<td>
									<font color="red">*</font>证件类型：
								</td>
								<td>
									<html:select property="card_type" require="true" datatype="require">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
									</html:select>
								</td>
							</tr>
								<tr>
								<td>
									<font color="red">*</font>证件号码：
								</td>
								<td>
									<input type="text" name="card_no" size="20" value="" require="true" datatype="require|limit_max" max="64" msg="不能为空|不能超过64个字符">
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>归属机构：
								</td>
								<td>
									<input type="text" name="organkey" size="10" value="" readonly="readonly" require="true" datatype="require"/>-<input type="text" name="organname" value="" readonly="readonly" >									
									
								  <a href="javascript:void(0);" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				

								</td>
							</tr>
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
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>原因：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<textarea name="op_reason" style="width: 350px" rows="4" require="true" datatype="require|limit_max" max="1000" msg="不能为空|不能超过1000个字符"></textarea>


									</div>
								</TD>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="button" class="in_button1" value="提 交"
										onClick="dosubmit('t07_attention_lib_add_do.do');" />
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
