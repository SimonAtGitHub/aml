<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>

<script language="JavaScript">
function checkForm(theUrl){
    var errMsg = "";

    if(getLength(document.forms[0].interfacekey.value)==0){
        errMsg+="请选择规则类型！";
        document.forms[0].interfacekey.focus(); 
    }
    else if(getLength(document.forms[0].gs_type.value)==0){
        errMsg+="请选择计算方式！";
        document.forms[0].gs_type.focus(); 
    }
    else if(getLength(document.forms[0].curr_cd.value)==0){
        errMsg+="请选择币种！";
        document.forms[0].curr_cd.focus(); 
    }
    else if(getLength(document.forms[0].rule_des.value)==0){
        errMsg+="规则名称不能为空！";
        document.forms[0].rule_des.focus();
    }
    else if(getLength(document.forms[0].rule_des.value)>128){
        errMsg+="规则名称长度过长！";
        document.forms[0].rule_des.focus();
    }
    else if(getLength(document.forms[0].party_acct_cd.value)==0){
        errMsg+="请选择预警主体！";
        document.forms[0].party_acct_cd.focus(); 
    }
    else if(getLength(document.forms[0].type_des.value)==0){
        errMsg+="主体描述不能为空！";
        document.forms[0].type_des.focus();
    }
    else if(getLength(document.forms[0].type_des.value)>100){
        errMsg+="主体描述长度过长！";
        document.forms[0].type_des.focus();
    }
    else if(getLength(document.forms[0].rule_con.value)> 256){
        errMsg+="规则详述不能超过256个字符！";
        document.forms[0].rule_con.focus(); 
    }
    if(errMsg==""){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
      
    }else{
        alert(errMsg);
        return false;
    }
}

function dosubmit(theUrl)
{
	document.forms[0].action=theUrl;
    document.forms[0].submit();
}
</script>
</head>
<body class="mainbg">
<div id="main">
	<html:form method="post" action="/t21_rule/modify_rule_disp_do.do">
	    <html:hidden property="tplakey"/>
		<div class="conditions">
			<div class="cond_t">
						<span> 规则定义</span>
						
			</div>
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<font color="red">*</font>所属规则：
								</td>
								<td colspan="3">
									<html:text property="pbc_des" size="50" readonly="true"/>
									<html:img  border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修 改"></html:img>
								</td>
								
							</tr>
							
							<tr>
								<td>
									<font color="red">*</font>规则类型：
								</td>
								<td>
									<html:select  property="interfacekey">
										<html:options collection="interfaceMap" property="label" labelProperty="value"/>
									</html:select>
								</td>
								<td>
									<font color="red">*</font>计算方式：
								</td>
								<td>
									<html:select  property="gs_type" disabled="true">
										<html:options collection="calculateMap" property="label" labelProperty="value"/>
									</html:select>
                                    <html:img  border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改"></html:img>
								</td>
								</tr>
								<tr>
								<td>
									<font color="red">*</font>规则编号：
								</td>
								<td>
									<html:text property="rulekey" readonly="true"></html:text>
									<html:img  border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改"></html:img>
								</td>
								<td>
									<font color="red">*</font>币种：
								</td>
								<td>
									<html:select property="curr_cd">
										<html:options collection="curr_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							
							<tr>
								
								<td>
									<font color="red">*</font>规则名称：
								</td>
								<td colspan="3">
									<html:text property="rule_des" size="70"></html:text>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>预警主体：
								</td>
								<td>
									<html:select property="party_acct_cd">
										<html:options collection="party_acct_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>主体描述：
								</td>
								<td>
									<html:text property="type_des" size="30"></html:text>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>粒度：
								</td>
								<td colspan="3">
									<html:select property="granulairty">
										<html:options collection="granularityMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								
							</tr>
							
							<tr>
								<td>
									规则详述：
								</td>
								<td colspan="3">
								<html:textarea property="rule_con" cols="70" rows="6"></html:textarea>
									
								</td>
								
								
								
							</tr>
							
							<tr>
							</tr>
							<tr>
							<td></td>
							<td colspan="4" align="center" class="in_button">
								<html:button property="button" styleClass="input" value="提 交"
									onclick="checkForm('modify_rule_disp_do.do?')"/>
								<input name="" type="reset" value="重 置" />
							</td>
							</tr>
						</table>
			</div>			
		</div>
	</html:form>
	</div>
	<script language="JavaScript">
	 var gstype=document.forms[0].gs_type.value;
	 if(gstype!=""){
	  var obj=parent.document.all.ruledef;
	      var obj1=parent.document.all.sqldef;
	  if(gstype=="1"){
	    obj.style.display=""
	    obj1.style.display="none"
	   }else{
	     obj.style.display="none"
	    obj1.style.display=""
	   }
	 }
	</script>
</BODY>
</HTML>
