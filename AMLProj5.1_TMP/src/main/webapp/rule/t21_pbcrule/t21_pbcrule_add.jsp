<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="save" content="history" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<SCRIPT LANGUAGE="JavaScript">


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("必须输入数字"); 
	form.focus(); 
	
	}
} 

function checkForm(theUrl){ 
    var errMsg = "";
    var pbckey=document.forms[0].pbckey.value;
    if(getLength(document.forms[0].pbckey.value)==0){
        errMsg+="规则代码不能为空！";
        document.forms[0].pbckey.focus();
    }
    else if(pbckey.indexOf("-") == -1){
        errMsg+="规则代码的后缀编号用'-'连接!";
        document.forms[0].pbckey.focus();
    }
    else if(!pbckey.substring(pbckey.indexOf("-")+1,pbckey.length).match(new RegExp("^[0-9a-zA-z]+$"))){
        errMsg+="规则代码后缀编号为数字或字母！";
        document.forms[0].pbckey.focus();
    }
    else if(getLength(pbckey.substring(pbckey.indexOf("-")+1,pbckey.length))>4){
        errMsg+="规则代码后缀编号长度不能超过4位!";
        document.forms[0].pbckey.focus();
    }
    else if(getLength(document.forms[0].interfacekey.value)==0){
        errMsg+="请选择接口类型！";
        document.forms[0].interfacekey.focus();
    }else if(getLength(document.forms[0].stcrkey.value)==0){
        errMsg+="请选择人行可疑特征代码！";
        document.forms[0].stcrkey.focus();
    }else if(getLength(document.forms[0].flag.value)==0){
        errMsg+="请选择是否启用！";
        document.forms[0].flag.focus();
    }
    else if(getLength(document.forms[0].pbc_des.value)==0){
        errMsg+="规则简述不能为空！";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_des.value)>=200){
        errMsg+="规则简述内容过多,请控制在200字符以内！";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_con.value)==0){
        errMsg+="规则详述不能为空！";
        document.forms[0].pbc_con.focus();
    }else if(getLength(document.forms[0].pbc_con.value)>=800){
        errMsg+="规则详述内容过多,请控制在800字符以内！";
        document.forms[0].pbc_con.focus();
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
	<BODY class="mainbg">
		<div id="main">
			<html:form method="post" action="/t21_pbcrule/t21_pbcrule_add.do">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 添加规则 </span>
						<span class="buttons">
						<a href="#" onclick="dosubmit('t21_pbcrule_list.do')">
 	                       <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返  回</a> 
						</span>
							<html:errors/>
					</div>
					
					<div class="cond_c2">

						<table border="0" cellpadding="0" cellspacing="0">
						
						
						<tr>
								<td>
									<div align="right">
										<font color="red">*</font>规则代码：
									</div>
								</td>
								<td>
								 <html:text property="pbckey" styleClass="text_white"/>
								</td>

								<td bgcolor="F6F9FF" align="left">
									<div align="right">
										<font color="red">*</font>接口类型：
									</div>
								</td>
								<td>
									<html:select property="interfacekey">
										<html:options collection="interfaceMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							
							<tr>
								<td>
									<div align="right">
										<font color="red">*</font>人行可疑特征代码：
									</div>
								</td>
								<td>
									<html:select property="stcrkey" style="width:200px" onmouseover="FixWidth(this);">
									<html:options collection="stcrMap" property="label"
										labelProperty="value" />
									</html:select>
								</td>
								
								<td bgcolor="F6F9FF" align="left">
									<div align="right">
										<font color="red">*</font>是否启用：
									</div>
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
									<html:select  property="gstype">
										<html:options collection="calculateMap" property="label" labelProperty="value"/>
									</html:select>

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
								    <html:textarea rows="3" cols="70"  property="pbc_des" styleId="pbc_des" maxlength="200"></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									<div align="right">
									<font color="red">*</font>规则详述 ：
									</div>
								</td>
								<td bgcolor="F6F9FF" align="left" colspan="3">
									<html:textarea rows="4" cols="70"  property="pbc_con" styleId="pbc_con" maxlength="800"></html:textarea>
									<br>
								</td>
							</tr>
	
							<tr>
							<td></td>
							<td colspan="4" align="center" class="in_button">
								<html:button property="button" styleClass="input" value="提 交"
									onclick="checkForm('t21_pbcrule_add_do.do')" />
								<html:reset styleClass="input" value="重 置" />
							</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="sys_warning">
			    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />提示：</strong>
				<p>
				  1、规则代码规范：银行标记 + 大额或可疑 + "-" + 编号，如：CPKY-1001。 <br/>
				
				</p>
			  </div>
			</html:form>
		</div>
	</BODY>
</HTML>
