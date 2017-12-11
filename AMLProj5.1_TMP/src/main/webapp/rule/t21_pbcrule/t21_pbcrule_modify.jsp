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
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
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

function CheckNumber(form) { 
	if (form.value.match(new RegExp("^[0-9]+$"))){ 
	form.focus();
	} else{
	alert("必须输入数字"); 
	}
} 

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].interfacekey.value)==0){
        errMsg+="接口类型不能为空！";
        document.forms[0].interfacekey.focus();
    }else if(getLength(document.forms[0].interfacekey.value>=4)){
		 errMsg+="接口类型述超长！";
        document.forms[0].interfacekey.focus();
	}else if(getLength(document.forms[0].pbc_des.value)==0){
        errMsg+="规则简述不能为空！";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_des.value)>=200){
        errMsg+="规则简述超长！";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_con.value)==0){
        errMsg+="规则详述不能为空！";
        document.forms[0].pbc_con.focus();
    }else if(getLength(document.forms[0].pbc_con.value)>=800){
        errMsg+="规则详述超长！";
        document.forms[0].pbc_con.focus();
    }else if(getLength(document.forms[0].flag.value)==0){
        errMsg+="是否启用不能为空！";
        document.forms[0].flag.focus();
    }
    if(errMsg==""){
 //       selectAllOptions(document.forms[0].list2);
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
				action="/t21_pbcrule/t21_pbcrule_modify.do">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>规则定义修改 </span>
						<span class="buttons"> 
						<a href="#" onclick="dosubmit('t21_pbcrule_list.do')">
<img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />返  回</a>
						 </span>
					</div>
					<html:errors />
					<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
									<font color="red">*</font>规则代码：
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="pbckey" styleClass="text_white"
											size="20" readonly="true" />
										<html:img border="0" page="../../images/lock.jpg"
											align="absmiddle" alt="内容不允许修 改"></html:img>
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
									<font color="red">*</font>接口类型：
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<html:select property="interfacekey">
										<html:options collection="interfaceMap" property="label"
											labelProperty="value" />
									</html:select>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>人行可疑特征代码：
								</td>
								<td>
									<html:select property="stcrkey" style="width:200px" onmouseover="FixWidth(this);">
									<html:options collection="stcrMap" property="label"
										labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>是否启用：
								</td>
								<td>
									<html:select property="flag">
										<html:options collection="flagMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							</tr>
							<tr>
						    	<td>
									<font color="red">*</font>计算方式：
								</td>
								<td>
									<html:select  property="gstype" disabled="true">
										<html:options collection="calculateMap" property="label" labelProperty="value"/>
									</html:select>
                                    <html:img  border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改"></html:img>
								</td>
							   <td>
									<font color="red">*</font>是否有交易：
								</td>
								<td>
									<html:select property="istrans">
										<html:options collection="trans_indMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							</tr>
							<tr>
							    
								<td>
									<font color="red">*</font>规则分类：
								</td>
								<td>
									<html:select property="pbctype">
										<html:options collection="pbctypeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<td>
										可疑交易行为代码：
								</td>
								<td>
								      <html:text property="actioncode" styleClass="text_white" maxlength="8"/>
									<a href="#" onClick="locate_pop_window('<%=request.getContextPath()%>','t21_actioncodeLocation','radio','forms[0]','actioncode','');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
								</td>
							</tr>
							<tr>
							    <td>
										用于高级模型：
								</td>
								<td>
									<html:radio  property="moduleflag" value="1">是</html:radio>
			                        <html:radio  property="moduleflag" value="0">否</html:radio>
								</td>
								
								<td>
									是否属性规则：
								</td>
								<td>
									<html:radio  property="suxflag" value="1">是</html:radio>
			                        <html:radio  property="suxflag" value="0">否</html:radio>
								</td>
							</tr>
							<tr>
							    <td>
										用于资金网络：
								</td>
								<td>
									<html:radio  property="is_model" value="1">是</html:radio>
			                        <html:radio  property="is_model" value="0">否</html:radio>
								</td>
								
								<td>
									单独形成案例：
								</td>
								<td>
									<html:radio  property="is_case" value="1">是</html:radio>
			                        <html:radio  property="is_case" value="0">否</html:radio>
								</td>
							</tr>
							
							
							<tr>
							   <td>
									<div align="right">
										<font color="red">*</font>规则简述：
									</div>
								</td>
								<td colspan="3">
								    <html:textarea rows="3" cols="70"  property="pbc_des" styleId="pbc_des"></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>规则详述 ：
								</td>
								<td bgcolor="F6F9FF" align="left" colspan="3">
									<html:textarea rows="5" cols="70"  property="pbc_con" styleId="pbc_con"></html:textarea>
									<br>
								</td>
							</tr>
							<tr>    <td></td>
									<td colspan="4" align="center" class="in_button">
										<html:button property="button" styleClass="input" value="提 交"
											onclick="checkForm('t21_pbcrule_modify_do.do')" />
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
