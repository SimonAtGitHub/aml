<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("必须输入数字"); 
	form.focus(); 
	
	}
} 


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].defparakey.value)==0){
        errMsg+="参数编号不能为空！";
        document.forms[0].defparakey.focus();
    }
    else if(!document.forms[0].defparakey.value.match(new RegExp("^[0-9]+$"))){
        errMsg+="必须输入数字！";
        document.forms[0].defparakey.focus();
    }else if(getLength(document.forms[0].defparakey.value)>14){
        errMsg+="参数编号长度不能超过14位！";
        document.forms[0].defparakey.focus();
    }else if(getLength(document.forms[0].paratype_add.value)==0){
        errMsg+="参数类型不能为空！";
        document.forms[0].paratype_add.focus();
    }else if(getLength(document.forms[0].dyna_ind_add.value)==0){
        errMsg+="是否动态参数必须选！";
        document.forms[0].dyna_ind_add.focus();
    }else if(getLength(document.forms[0].flag_add.value)==0){
        errMsg+="是否启用必须选择！";
        document.forms[0].flag_add.focus();
    }else if(getLength(document.forms[0].para_val.value)==0){
        errMsg+="参数值不能为空！";
        document.forms[0].para_val.focus();
    }else if(getLength(document.forms[0].para_val.value)>=50){
        errMsg+="参数值的长度不能超过50位！";
        document.forms[0].para_val.focus();
    }
    else if(getLength(document.forms[0].para_des.value)==0){
        errMsg+="参数描述不能为空！";
        document.forms[0].para_des.focus();
    }else if(getLength(document.forms[0].para_des.value)>=100){
        errMsg+="参数描述不能超过100位！";
        document.forms[0].para_des.focus();
    }
    if(errMsg==""){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" >
	<div id="main">
<html:form method="post" action="/t21_defpara/t21_defpara_add.do">
   <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span> 参数添加  </span>
        <span class="buttons">
        
          
 	   <a href="#" onclick="dosubmit('t21_defpara_list.do')">
 	   <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a>
</span>
</div>
  <html:errors/>
<div class="cond_c2">

  <table   border="0" cellpadding="0" cellspacing="0">

							<tr>
								<td>
									<div align="right">
										<font color="red">*</font>参数编号：
									</div>
								</td>
								<td>
									<input type="text" name="defparakey" value="">(自动加前缀PKJC)
								</td>

								<td bgcolor="F6F9FF" align="left">
									<div align="right">
										<font color="red">*</font>参数类型：
									</div>
								</td>
								<td>
									<html:select property="paratype_add">
										<html:options collection="paratypeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							</tr>



							<tr>
								<td>
									<div align="right">
										<font color="red">*</font>是否为动态参数：
									</div>
								</td>
								<td>
									<html:select property="dyna_ind_add">
										<html:options collection="dyna_indMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>

								<td bgcolor="F6F9FF" align="left">
									<div align="right">
										<font color="red">*</font>是否启用：
									</div>
								</td>
								<td>
									<html:select property="flag_add">
										<html:options collection="flagMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							</tr>



							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>参数值：
									</div>

								</TD>

								<TD bgcolor="F6F9FF">
									<div align="left">
										<input type="text" name="para_val" value="">
									</div>
								</TD>

								<td height="22" align="right" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>参数描述：
									</div>
								</td>
								<td bgcolor="F6F9FF" align="left">
									<html:textarea cols="29" rows="3" property="para_des"></html:textarea>
									<br>
								</td>
							</tr>




							<tr>
								<td>
								</td>
								<td align="right" colspan="3">
									<input type="button" name="button1" class="in_button1"
										value="提 交"
										onclick="checkForm('t21_defpara_add_do.do')" />
									<input type="reset" name="button1" class="in_button1"
										value="重 置" />
								</td>
							</tr>
						</table>
  </div>
  
  </div>
    
</html:form>
</div>
</BODY>
</HTML>
