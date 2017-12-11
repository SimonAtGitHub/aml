<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
	<title></title>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
function checkForm(theUrl){
     var errMsg ="";
     if(getLength(document.forms[0].check_type.value)==0){
        errMsg="请选择识别类型！";
     	document.forms[0].check_type.focus();
     }
     else if(getLength(document.forms[0].party_id.value)>32){
     	errMsg="客户号不能超过32个字符！";
     	document.forms[0].party_id.focus();
     	}
     else if(getLength(document.forms[0].party_chn_name.value) == 0){
	    errMsg="客户名称不能为空！";
	    document.forms[0].party_chn_name.focus();
	    }
	 else if(getLength(document.forms[0].party_chn_name.value) > 200){
	    errMsg="客户名称不能超过200个字符！";
	    document.forms[0].party_chn_name.focus();
	  }
	 else if(getLength(document.forms[0].party_class_cd.value) == 0){
	    errMsg="请选择客户类型！";
	    document.forms[0].party_class_cd.focus();
	    }
     else if(getLength(document.forms[0].risk_type_str.value) == 0){
	    errMsg="请填写识别原因！";
	    document.forms[0].risk_type_str.focus();
	   }
     if(errMsg!=""){
        alert(errMsg);
        return false;
     }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function validateCardNo(cardnovalue){
 var cardtype=document.forms[0].card_type.value;
 if(cardtype=="11"){
    IdCardValidate(cardnovalue);
 }
}
function _check()
{
	var flag=document.forms[0].party_class_cd.value;
	if(flag=="C"){
	    document.all.id_relaleder.style.display='';
	    document.all.id_aml1.style.display='none';
    }
    else if(flag=="I"){
	   	document.all.id_aml1.style.display='';
	   	document.all.id_relaleder.style.display='none';
    }
 
}

function _Open(url){
    url=url+".do?input_name=party_id&input_name_disp=obj_name&input_name_type=party_class_cd";
  window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
  // window.open(url);
      
}

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" action="/cust_identify/t10_checkparty_arti.do">
			
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>新增人工客户识别</span>
						
					</div>
					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td></td>
							<td height="8"></td>
						</tr>
					</table>
					<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>识别类型：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="check_type" style="width:300" >
										<html:options collection="check_typeMap" property="label"
												labelProperty="value" />&nbsp;
										</html:select>
										<br>
									</div>
								</TD> 
							</tr>
							
							<tr>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>客户名称：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">

										<html:text property="party_chn_name" styleClass="text_white" maxlength="50" size="20" value="" />
											<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list1.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name&type=party_class_cd&organ_temp=organkey&card_temp_t=card_type&card_temp_n=card_no&dispatcher=linkage','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
											<span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span>
											</a>

										
									</div>
								</TD>
							</tr>
							<tr>
								<TD>
								<div align="right">
										客户号：
										</div>
								</TD>
								<TD bgcolor="F6F9FF" align="left">
									<html:text property="party_id" value="" maxlength="50"></html:text>
								</TD>
							</tr>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>客户类型：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
										<html:select styleId="party_class_cd" property="party_class_cd" style="width:125px" onchange="_check()">
											<html:options collection="clienttypeMap" property="label"
												labelProperty="value" />&nbsp;
										</html:select>
								</TD> 
							</TR>
							<tr>
								<TD>
								<div align="right">
										归属机构：
										</div>
								</TD>
								<td bgcolor="F6F9FF">
									<html:text property="organkey" readonly="true" ></html:text>
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
									<span  class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									<br>
								</td>
							</tr>
							<tr>
            					<td>证件类型：</td>
            					<TD bgcolor="F6F9FF">
										<html:select property="card_type" style="width:300px">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />&nbsp;
										</html:select>
								</TD> 
          					</tr>
          					
							<tr>
            					<td>证件号：</td>
            					<td><html:text property="card_no" size="20" onchange="validateCardNo(this.value);" /></td>
          					</tr>
          					
          					<tr id="id_aml1" style="display:none">
          						<td>系统客户类型：</td>
          						<TD bgcolor="F6F9FF">
										<html:select property="aml1_type_cd" style="width:100px">
											<html:options collection="aml1_typeMap" property="label"
												labelProperty="value" />&nbsp;
										</html:select>
								</TD> 
          					</tr>
          					
          					<tr id="id_relaleder"  style="display:none">
          						<td>是否涉及受益人：</td>
          						<TD bgcolor="F6F9FF">
										<html:select property="is_relaleder" style="width:125px">
											<html:options collection="is_relalederMap" property="label"
												labelProperty="value" />&nbsp;
										</html:select>
								</TD> 
          					</tr>
          					
          					<tr>
          						<td><font color="#FF0000">*</font>识别原因：</td>
								<td colspan="3">
									<html:textarea property="risk_type_str" cols="70" rows="6" readonly="true">
									</html:textarea>
										<a href="#" title="识别原因列表" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/report/cust_identify/check_reason_list.do?',width:600,height:400,title:'参数',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_location.png" />识别原因列</a>
								</td>
          					</tr>
          					

						<tr>
								<td>
								</td>
								<td align="right">
									<input type="button" name="button1" class="in_button1" value="提 交"
										onclick="checkForm('addT10_checkparty_arti_do.do?changeflag=2&url=t10_checkparty_arti.do?')" />
									<input type="reset" name="button1" class="in_button1" value="重 置" />
								</td>
							</tr>
						</table>
					</div>
				</div>
		</html:form>
	</BODY>

</HTML>
