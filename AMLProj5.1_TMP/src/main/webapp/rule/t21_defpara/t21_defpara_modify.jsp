<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="save" content="history" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    
    if(getLength(document.forms[0].paratype.value)==0){
        errMsg+="参数类型不能为空！";
        document.forms[0].paratype.focus();
    }else if(getLength(document.forms[0].dyna_ind.value)==0){
        errMsg+="是否动态参数必须选！";
        document.forms[0].dyna_ind.focus();
    }else if(getLength(document.forms[0].flag.value)==0){
        errMsg+="是否启用必须选择！";
        document.forms[0].flag.focus();
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
</script>
	</HEAD>

	<BODY leftmargin=0 topmargin=0>
		<div id="main">
			<html:form method="post"
				action="/t21_defpara/t21_defpara_modify.do">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 修改参数 </span>
						<span class="buttons"> 
						<a href="#" onclick="dosubmit('t21_defpara_list.do')"><img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />返  回</a>
						 </span>
					</div>
					<html:hidden property="tablename" />

					<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="red">*</font>参数编号：
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="defparakey" styleClass="text_white"
											size="20" readonly="true" />
										<html:img border="0" page="../../images/lock.jpg"
											align="absmiddle" alt="内容不允许修 改"></html:img>
									</div>
								</TD>

								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="red">*</font>参数类型：
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="paratype">
											<html:options collection="paratypeMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>
								</td>
							</tr>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="red">*</font>是否为动态参数：
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="dyna_ind">
											<html:options collection="dyna_indMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>
								</td>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="red">*</font>是否启用：
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="flag">
											<html:options collection="flagMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>
								</td>
							</tr>


							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="red">*</font>参数值：
									</div>
								</td>
								<td>
									<html:text property="para_val" />
								</td>


								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="red">*</font>参数描述：
									</div>
								</td>
								<td bgcolor="F6F9FF" align="left">
									<html:textarea cols="29" rows="3" property="para_des" />
								</td>


							</tr>


							<tr>
                                    <td></td>
									<td colspan="3" align="center" class="in_button">
										<html:button property="button" styleClass="input" value="提 交"
											onclick="checkForm('t21_defpara_modify_do.do')" />
										<html:reset styleClass="input" value="重 置" />
									</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
