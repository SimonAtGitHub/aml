<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.aml.cust_identify.dto.T10_newClientCheck" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<meta http-equiv=Content-Type content="text/html; charset=gb2312"/>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script language="JavaScript" src="../../js/calendar.js"></script>
	<script type="text/javascript" src="../../js/basefunc.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">

function w_check(){
	var w_val=document.forms[0].addwmenu_flag.value;
	if(w_val == 0){
		gEBI("reason_create").value = "";
		gEBI("w_rule_type").value = "";
		gEBI("w_flag2").style.display='none';
	}
	if(w_val == 1){
		if(document.forms[0].addbmenu_flag.value != 1){
			b_check();
		}else{
			document.forms[0].addbmenu_flag.value = 0;
			b_check();
		}
		gEBI("w_flag2").style.display='';
		gEBI("b_flag2").style.display='none';
	}
}
function b_check(){
	var b_val=document.forms[0].addbmenu_flag.value;
	
	if(b_val == 0){
		gEBI("b_reason_create").value = "";
		gEBI("m_list_type").value = "";
		gEBI("b_flag2").style.display='none';
	}
	if(b_val == 1){
		if(document.forms[0].addwmenu_flag.value != 1){
			w_check();
		}else{
			document.forms[0].addwmenu_flag.value = 0;
			w_check();
		}
		gEBI("b_flag2").style.display='';
		gEBI("w_flag2").style.display='none';
	}
}
function showOrNot(obj,id){
	var tmp = gEBI(id);
	if(obj.checked == true){
		tmp.style.display="";
	}else{
		tmp.style.display="none";
	}
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
/*
function insertAfter(targetElement){ //  targetElement 是指定元素的位置
	var p = document.createElement("p");
	p.innerHTML = "<font color='red'>*</font>";
	var parent = targetElement.parentNode; // 找到指定元素的父节点 
	parent.appendChild( p, targetElement ); 
}*/
function checkInfoType(id,info){
	if(gEBI(id) != null){
		var level_flag = gEBI(id).value;
		if(level_flag == '19'||level_flag == '29' ||level_flag == '99' || level_flag=='1H' || level_flag == '04'){
			gEBI(info).style.display='';
			//insertAfter(gEBI(info));
			var tmp = getLength(gEBI(info).value);
			if(tmp==0){
				return false;
			}
			return true;
		}else{
			gEBI(info).style.display='none';
			gEBI(info).value="";
			return true;
		}
	}
}
function checkForm(theUrl) {
	var errorMsg = "";

	if(gEBI("country_cd").value==null || gEBI("country_cd").value==""){
		errorMsg = "请选择国籍";
		gEBI("country_cd").focus();
	}
	if(gEBI("party_class_cd").value == "C"){
		if(gEBI("organkey").value==null || gEBI("organkey").value==""){
			errorMsg = "机构号不能为空";
			gEBI("organkey").focus();
		}
		if(gEBI("card_type_c").value==null || gEBI("card_type_c").value==""){
			errorMsg = "请选择证件类型";
			gEBI("card_type_c").focus();
		}
		if(!checkInfoType("card_type_c","card_type_cinfo")){
			errorMsg = "其他委托人身份证件/证明文件类型信息说明不能为空";
			gEBI("card_type_cinfo").focus();
		}
		if(gEBI("card_no").value==null || gEBI("card_no").value==""){
			errorMsg = "证件号码不能为空";
			gEBI("card_no").focus();
		}
		if(gEBI("aml2_type_cd").value==null || gEBI("aml2_type_cd").value==""){
			errorMsg = "请选择客户类型";
			gEBI("aml2_type_cd").focus();
		}
		if(gEBI("enrol_fund_currency_cd").value == null || gEBI("enrol_fund_currency_cd").value==""){
			errorMsg = "请选择注册资金币种";
			gEBI("enrol_fund_currency_cd").focus();
		}
		if(gEBI("enrol_fund_amt").value == null || gEBI("enrol_fund_amt").value==""){
			errorMsg = "注册资金不能为空";
			gEBI("enrol_fund_amt").focus();
		}
		if(isNaN(gEBI("enrol_fund_amt").value)){
			errorMsg = "注册资金应为数字";
			gEBI("enrol_fund_amt").focus();
		}
		if(gEBI("legal_obj").value==null || gEBI("legal_obj").value==""){
			errorMsg = "法定代表人姓名不能为空";
			gEBI("legal_obj").focus();
		}
		if(gEBI("legal_card_type").value==null || gEBI("legal_card_type").value==""){
			errorMsg = "请选择法定代表人身份证件类型";
			gEBI("legal_card_type").focus();
		}
		if(!checkInfoType("legal_card_type","legal_card_typeinfo")){
			errorMsg = "其他类个人身份有效证件信息说明不能为空";
			gEBI("legal_card_typeinfo").focus();
		}
		if(gEBI("legal_card_no").value==null || gEBI("legal_card_no").value==""){
			errorMsg = "法定代表人身份证件号码不能为空";
			gEBI("legal_card_no").focus();
		}else if(gEBI("legal_card_type").value==11){
			if(!IdentityCardValid(gEBI("legal_card_no").value)){
				errorMsg = "法定代表人身份证号码格式错误";
				gEBI("legal_card_no").focus();
			}
		}
		if(gEBI("legal_card_no_end_dt_disp").value==null || gEBI("legal_card_no_end_dt_disp").value==""){
			errorMsg = "法定代表人证件到期日不能为空";
			gEBI("legal_card_no_end_dt_disp").focus();
		}
		if(gEBI("licence_end_dt_disp").value==null || gEBI("licence_end_dt_disp").value==""){
			errorMsg = "客户证件到期日不能为空";
			gEBI("licence_end_dt_disp").focus();
		}
		if(gEBI("stock_holder").value==null || gEBI("stock_holder").value==""){
			errorMsg = "实际控股股东姓名不能为空";
			gEBI("stock_holder").focus();
		}
		if(gEBI("stock_holder_card_type").value==null || gEBI("stock_holder_card_type").value==""){
			errorMsg = "请选择实际控股人身份证件类型";
			gEBI("stock_holder_card_type").focus();
		}
		if(gEBI("stock_holder_card_no")==null || gEBI("stock_holder_card_no").value==""){
			errorMsg = "实际控股人身份证件号码不能为空";
			gEBI("stock_holder_card_no").focus();
		}else if(gEBI("stock_holder_card_type").value==11){
			if(!IdentityCardValid(gEBI("stock_holder_card_no").value)){
				errorMsg = "实际控股人身份证号码格式错误";
				gEBI("stock_holder_card_no").focus();
			}
		}
		if(gEBI("stock_holder_card_no_end_dt_disp").value==null || gEBI("stock_holder_card_no_end_dt_disp").value==""){
			errorMsg = "实际控股人证件到期日不能为空";
			gEBI("stock_holder_card_no_end_dt_disp").focus();
		}
	}else{
		if(gEBI("card_type").value==null || gEBI("card_type").value==""){
			errorMsg = "请选择证件类型";
			gEBI("card_type").focus();
		}
		if(!checkInfoType("card_type","card_typeinfo")){
			errorMsg = "其他委托人身份证件/证明文件类型信息说明不能为空";
			gEBI("card_typeinfo").focus();
		}
		if(gEBI("card_no").value==null || gEBI("card_no").value==""){
			errorMsg = "证件号码不能为空";
			gEBI("card_no").focus();
		}else if(gEBI("card_type").value==11){
			if(!IdentityCardValid(gEBI("card_no").value)){
				errorMsg = "身份证件号码格式错误";
				gEBI("card_no").focus();
			}
		}
		if(gEBI("card_end_dt_disp").value==null || gEBI("card_end_dt_disp").value==""){
			errorMsg = "证件到期日不能为空";
			gEBI("card_end_dt_disp").focus();
		}
		if(gEBI("occupation").value==null || gEBI("occupation").value==""){
			errorMsg = "请选择客户职业";
			gEBI("occupation").focus();
		}
		if(isNaN(gEBI("indiv_income").value)){
			errorMsg = "收入应为数字";
			gEBI("indiv_income").focus();
		}

	}
	if(gEBI("check_explain").value==null || gEBI("check_explain").value==""){
		errorMsg = "调查结论不能为空";
		gEBI("check_explain").focus();
	}
	if(gEBI("valid_dt_disp").value==null || gEBI("valid_dt_disp").value==""){
		errorMsg = "调查结论有效期不能为空";
		gEBI("valid_dt_disp").focus();
	}
	if(checkRadio(document.forms[0].check_result)<0){
		errorMsg+="请选择关注程度";
    }
	if(gEBI("addwmenu_flag").value=="1"){
		if(gEBI("w_rule_type").value==""){
			errorMsg = "请选择免检类型";
			gEBI("w_rule_type").focus();
		}
		if(gEBI("reason_create").value==""){
			errorMsg = "白名单建立原因不能为空";
			gEBI("reason_create").focus();
		}
	}
	if(gEBI("addbmenu_flag").value=="1"){
		if(gEBI("m_list_type").value==""){
			errorMsg = "请选择名单类型";
			gEBI("m_list_type").focus();
		}
		if(gEBI("b_reason_create").value==""){
			errorMsg = "黑名单建立原因不能为空";
			gEBI("b_reason_create").focus();
		}
	}
	errorMsg = validateCheckBox(errorMsg);
	/*
	if(gEBI("").value==null || gEBI("").value==""){
		errorMsg = "";
		gEBI("").focus();
	}
	*/
	if(errorMsg!= ""){
		alert(errorMsg);
		return false;
	}else{
		document.forms[0].action = theUrl;
		document.forms[0].submit();
	}
	
}
function IdentityCardValid(code){
	if(!(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(code))){
		return false;
	}else{
		return true;
	}
}
function gEBI(id){
	return document.getElementById(id);
}
function validateCheckBox(err){
	var str = document.getElementsByName("checkbox");
	var len = str.length;
	if(len>0){
		var elementid = "";
		for(var i = 0;i<len;i++){
			if(str[i].checked == true){
				elementid = str[i].value;
				if(gEBI("checkuser_"+elementid)!= null || gEBI("checkdate_disp_"+elementid)!=null){
					if(gEBI("checkuser_"+elementid).value==""){
						err = "识别人不能为空";
						gEBI("checkuser_"+elementid).focus();
						break;
					}
					if(gEBI("checkdate_disp_"+elementid).value==""){
						err = "识别日期不能为空";
						gEBI("checkdate_disp_"+elementid).focus();
						break;
					}
				}
				if(gEBI("context_"+elementid)!=null && gEBI("context_"+elementid).value==""){
					err = "备注内容不能为空";
					gEBI("context_"+elementid).focus();
					break;
				}
			}
		}
	}
	return err;
}
</script>
</HEAD>
<body leftmargin="0" topmargin="0" class="mainbg" id="iframecontent">
<div id="main">
<html:form styleId="form0" action="/cust_identify/new_client_investigation_view.do" method="post">
<%	
	String check_type = (String) request.getAttribute("check_type");
	String url = (String) request.getAttribute("url");
	if(url.contains("#")){
		url = url.replace("#","%23");
	}
	String check_exist = (String) request.getAttribute("check_exist");
	String showCheckReason = (String) request.getAttribute("showCheckReason");
%>
	<html:hidden name="clientInfo" property="party_id"/>
	<html:hidden name="clientInfo" property="party_class_cd" styleId="party_class_cd"/>
	<div class="conditions">
		<div class="cond_t">
			<span>核查客户身份信息</span><html:hidden name="clientInfo" property="aml1_type_cd"/>
		</div>
		<logic:equal name="clientInfo" property="party_class_cd" value="I">
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>中文名：</td>
						<td><html:text name="clientInfo" property="party_chn_name" styleId="party_chn_name" readonly="true"/>
							<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改" title="内容不允许修改"></html:img></td>
						<td>英文名：</td>
					  	<td><html:text name="clientInfo" property="party_eng_name" /><html:hidden name="clientInfo" property="organkey"/></td>
					</tr>
					<tr>
						<td>国籍：</td>
						<td>
							<html:select name="clientInfo" property="country_cd" styleId="country_cd">
								<html:options collection="nationalityMap" property="label" labelProperty="value" />
							</html:select>
							<font color="red">*</font>
						</td>
					  	<td>单位所属行业：</td>
					  <td>
						<html:select name="clientInfo" property="industry" styleId="industry">
							<html:options collection="industryMap" property="label" labelProperty="value" />
						</html:select>
					  </td>
					</tr>
					<tr>
						<td>证件类型：</td>
						<td colspan=3>
					  		<html:select styleId="card_type" name="clientInfo" property="card_type"	onchange="checkInfoType('card_type','card_typeinfo')">
								<html:options collection="bitpMap" property="label" labelProperty="value" />
							</html:select><font color="#FF0000">*</font>
							<br/>
							<html:textarea styleId="card_typeinfo" style="width:80%;display:none" property="card_typeinfo" name="clientInfo"></html:textarea>
						</td>
					</tr>
					<tr>
					  <td>证件号码： </td>
					  <td><html:text name="clientInfo" property="card_no" styleId="card_no"/>
						<font color="#FF0000">*</font></td>
						<td>证件到期日： </td>
						<td>
							<html:text name="clientInfo" property="card_end_dt_disp" styleId="card_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%" />
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
					  <td>住所地或经常居住地：</td>
					  <td><html:text name="clientInfo" property="addr1" size="40"/></td>
					  <td>联系电话：</td>
					  <td><html:text name="clientInfo" property="cell_no" /></td>
					</tr>
					<tr>
						<td>职业：</td>
						<td colspan=3>
							<html:select styleId="occupation" name="clientInfo" property="occupation" >
								<html:options collection="occupationMap" property="label" labelProperty="value" />
							</html:select>
							<font color="red">*</font>
						</td>
					<tr>
					  <td>职务：</td>
						<td>
							<html:select styleId="duty" name="clientInfo" property="duty" >
								<html:options collection="dutyMap" property="label" labelProperty="value" />
							</html:select>
						</td>
					  <td>工作单位：</td>
					  <td><html:text name="clientInfo" property="company" /></td>
					</tr>
					<tr>
					  <td>收入：</td>
					  <td><html:text name="clientInfo" styleId="indiv_income" property="indiv_income" /></td>
					  <td>经济状况：</td>
					  <td><html:text name="clientInfo" property="income_ecno" /></td>
					</tr>
					<tr>
						<td>收入来源：</td>
						<td><html:text name="clientInfo" property="income_source" /></td>
						<td>开户目的：</td>
						<td><html:text name="clientInfo" property="create_purpose" /></td>
					</tr>
				</table>
			</div>
		</logic:equal>
		<logic:equal name="clientInfo" property="party_class_cd" value="C">
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td>客户归属机构：</td>
					  <td bgcolor="F6F9FF">
					  	<div align="left">
					  		<html:text styleId="organkey" name="clientInfo" property="organkey" readonly="true" size="7"/>&nbsp;
					  		<html:text name="clientInfo" property="organ_name_disp" readonly="true" size="45"/>
					  		<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改" title="内容不允许修改"></html:img>
					  	</div>
					  </td>
					  <td>客户号：</td>
					  <td><html:text name="clientInfo" property="party_id" readonly="true"/>
						<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改" title="内容不允许修改"></html:img>
					</tr>
					<tr>
					  <td>客户名称：</td>
					  <td><html:text name="clientInfo" property="party_chn_name" styleId="party_chn_name" size="45" readonly="true"/>
							<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="内容不允许修改" title="内容不允许修改"></html:img></td>
					  <td>客户国籍：</td>
						<td>
							<html:select name="clientInfo" property="country_cd" styleId="country_cd">
								<html:options collection="nationalityMap" property="label" labelProperty="value" />
							</html:select>
							<font color="#FF0000">*</font> </td>
					</tr>
					<tr>
						<td>客户类型：</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="aml2_type_cd" styleId="aml2_type_cd" >
								<html:options collection="pbc_cttp2Map" property="label" labelProperty="value" />
							</html:select>
						<font color="#FF0000">*</font>
					
						</td>
					</tr>
					<tr>
					  <td>客户证件类型：</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="card_type_c" styleId="card_type_c" onchange="checkInfoType('card_type_c','card_type_cinfo')">
							<html:options collection="card_type_cMap" property="label" labelProperty="value" />
						</html:select><font color="red">*</font>
						<br/>
						<html:textarea styleId="card_type_cinfo" style="width:80%;display:none" property="card_type_cinfo" name="clientInfo"></html:textarea>
					</td>
					</tr>
					<tr>
						 <td>客户证件号码： </td>
						 <td>
						 	<html:text name="clientInfo" property="card_no" styleId="card_no"/>
							<font color="#FF0000">*</font>
						</td>
						<td>对公客户行业：</td>
						<td>
							<html:select name="clientInfo" property="industry">
								<html:options collection="industryMap" property="label" labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>主营范围</td>
						<td><html:text name="clientInfo" property="main_manage_scope" /></td>
						<td>主营业务</td>
						<td><html:text name="clientInfo" property="main_manage_business" /></td>
					</tr>
					<tr>
					  <td>注册资金币种：</td>
					  <td>
					  	<html:select name="clientInfo" property="enrol_fund_currency_cd" styleId="enrol_fund_currency_cd">
								<html:options collection="currencyMap" property="label" labelProperty="value" />
							</html:select><font color="red">*</font>
					  </td>
					  <td>注册资金：</td>
					  <td><html:text name="clientInfo" property="enrol_fund_amt" styleId="enrol_fund_amt"/><font color="red">*</font></td>
					</tr>
					<tr>
					  <td>法定代表人姓名：</td>
					  <td><html:text name="clientInfo" property="legal_obj" styleId="legal_obj"/><font color="red">*</font></td>
					</tr>
					<tr>
					  <td>法定代表人身份证件类型：</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="legal_card_type" styleId="legal_card_type" onchange="checkInfoType('legal_card_type','legal_card_typeinfo')">
								<html:options collection="bitpMap" property="label" labelProperty="value" />
							</html:select><font color="red">*</font>
						<br/>
						<html:textarea styleId="legal_card_typeinfo" style="width:80%;display:none" property="legal_card_typeinfo" name="clientInfo"></html:textarea>
					  </td>
					</tr>
					<tr>
						<td>法定代表人身份证件号码：</td>
						<td><html:text name="clientInfo" property="legal_card_no" styleId="legal_card_no"/><font color="red">*</font></td>
						<td>法定代表人证件到期日</td>
						<td><html:text name="clientInfo" property="legal_card_no_end_dt_disp" styleId="legal_card_no_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/><font color="red">*</font></td>
					</tr>
					<tr>
					  <td>实际控股股东：</td>
					  <td><html:text name="clientInfo" property="stock_holder" styleId="stock_holder"/><font color="red">*</font></td>
					</tr>
					<tr>
						<td>实际控股人身份证件种类：</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="stock_holder_card_type" styleId="stock_holder_card_type" >
								<html:options collection="bitpMap" property="label" labelProperty="value" />
							</html:select><font color="red">*</font>
					  </td>
					</tr>
					<tr>
						<td>实际控股人身份证件号码：</td>
						<td><html:text name="clientInfo" property="stock_holder_card_no" styleId="stock_holder_card_no"/><font color="red">*</font></td>
						<td>实际控股人证件到期日</td>
						<td><html:text name="clientInfo" property="stock_holder_card_no_end_dt_disp" styleId="stock_holder_card_no_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/><font color="red">*</font></td>
					</tr>
	                  <tr>
	                  	<td>机构信用代码：</td>
						<td><html:text name="clientInfo" property="org_credit_no" /></td>
						<td>机构信用代码有效期：</td>
						<td>
						<html:text name="clientInfo" property="org_credit_vt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/>
						</td>
	                  </tr>
	                  <tr>
	                    <td>对公客户证件到期</td>
						<td><html:text name="clientInfo" property="licence_end_dt_disp" styleId="licence_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/><font color="red">*</font></td>                  
	                  </tr>
				</table>
			</div>
		</logic:equal>
	</div>
	
	<%
		LinkedHashMap checkStateMap = (LinkedHashMap) request.getAttribute("checkStateMap");
		Set<String> keySet = checkStateMap.keySet();//获取map的key值的集合，set集合
		for(String key:keySet){
		    if(key != null && !key.equals("")){
		    	if("-1".equals(key)){
		    		ArrayList upList = (ArrayList) checkStateMap.get("-1");
		    		for(int i = 0; i<upList.size();i++){
		    			T10_newClientCheck upTemp = (T10_newClientCheck) upList.get(i);
	%>
	<div class="conditions">
		<div class="cond_t">
			<span><%=upTemp.getElementname() %><input type="hidden" name="elementid" value="<%=upTemp.getUpcode()%>,<%=upTemp.getElementid() %>,<%=upTemp.getElementname()%>" /></span>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
	<%
						if(upTemp.getElementid().equals("1")){
	%>
				<tr><td></td><td align="center" colspan="3">是否为以下识别措施：</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("1");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td><%=middleTemp.getElementname() %><input type="hidden" name="elementid" id="<%=middleTemp.getElementid() %>" value="<%=middleTemp.getUpcode() %>,<%=middleTemp.getElementid() %>,<%=middleTemp.getElementname() %>" /></td>
					<td>&nbsp;&nbsp;
						<input type="checkbox" value="<%=middleTemp.getElementid() %>" id="istrue_<%=middleTemp.getElementid() %>" name="checkbox" onclick="showOrNot(this,'sb_<%=middleTemp.getElementid() %>');" />
						<b id="sb_<%=middleTemp.getElementid() %>" style="display:none">
							&nbsp;&nbsp;识别人：<input type="text" id="checkuser_<%=middleTemp.getElementid() %>" name="checkuser_<%=middleTemp.getElementid() %>" />&nbsp;<font color="red">*</font>&nbsp;
							识别时间：<input type="text" id="checkdate_disp_<%=middleTemp.getElementid() %>" name="checkdate_disp_<%=middleTemp.getElementid() %>" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/>&nbsp;<font color="red">*</font>
						</b>
					</td>
				</tr>
	<%
							}
						}else if(upTemp.getElementid().equals("2")){
							ArrayList middleList = (ArrayList) checkStateMap.get("2");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td colspan="3" ><%=middleTemp.getElementname() %><input type="hidden" name="elementid"  id="<%=middleTemp.getElementid() %>" value="<%=middleTemp.getUpcode() %>,<%=middleTemp.getElementid() %>,<%=middleTemp.getElementname() %>" /></td>
					<td><textarea type="text" id="context_<%=middleTemp.getElementid() %>" name="context_<%=middleTemp.getElementid() %>" cols="120"></textarea></td>
				</tr>
	<%
							}
						}else if(upTemp.getElementid().equals("3")){
	%>
				<tr><td></td><td align="center" colspan="3">是否存在以下异常情形：</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("3");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td><%=middleTemp.getElementname() %><input type="hidden" name="elementid"  id="<%=middleTemp.getElementid() %>" value="<%=middleTemp.getUpcode() %>,<%=middleTemp.getElementid() %>,<%=middleTemp.getElementname() %>" /></td>
					<td>&nbsp;&nbsp;<input type="checkbox" id="istrue_<%=middleTemp.getElementid() %>" name="checkbox" value="<%=middleTemp.getElementid() %>" onclick="showOrNot(this,'sb_<%=middleTemp.getElementid() %>');" />
						<b id="sb_<%=middleTemp.getElementid() %>" style="display:none" >&nbsp;&nbsp;备注：<textarea type="text" id="context_<%=middleTemp.getElementid() %>" name="context_<%=middleTemp.getElementid() %>" cols="60"></textarea>&nbsp;<font color="red">*</font></b>
					</td>
				</tr>
	<%
							}
						}else{
							ArrayList middleList = (ArrayList) checkStateMap.get("3");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td colspan="3" ><%=middleTemp.getElementname() %><input type="hidden" name="elementid"  id="<%=middleTemp.getElementid() %>" value="<%=middleTemp.getUpcode() %>,<%=middleTemp.getElementid() %>,<%=middleTemp.getElementname() %>" /></td>
					<td><textarea type="text" id="context_<%=middleTemp.getElementid() %>" name="context_<%=middleTemp.getElementid() %>" cols="120"></textarea></td>
				</tr>
	<%
							}
						}
		    		%>
		    </table>
		</div>
	</div>
		    		<%
		    		}
		    	}
		    }
		}
	%>

	<div class="conditions">
		<div class="cond_t">
			<span>调查结论</span><html:hidden name="checkResult" property="check_reason"/>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<%if("yes".equals(showCheckReason)){ %>
				<tr>
					<td>发起调查原因：</td>
					<td colspan="4"><bean:write name="checkResult" property="check_reason"/></td>
				</tr>
				<%} %>
				<tr>
					<td>调查结论：</td>
					<td colspan="4"><html:textarea cols="120" name="checkResult" property="check_explain" styleId="check_explain"></html:textarea>&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
					<td>调查表有效期：</td>
					<td><html:text name="checkResult" property="valid_dt_disp" styleId="valid_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"></html:text>&nbsp;<font color="red">*</font></td>
					<td>关注程度（报送频度）：</td>
					<td align="left">
						<html:radio name="checkResult" property="check_result" value="0">无需关注</html:radio>
						<html:radio name="checkResult" property="check_result" value="1">一般关注</html:radio>
						<html:radio name="checkResult" property="check_result" value="2">持续关注</html:radio>
						<html:radio name="checkResult" property="check_result" value="3">重点关注</html:radio>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="conditions">
		<div class="cond_t">
			<span>是否加入名单</span>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td >是否白名单：</td>
					<td>
						<html:select name="listType" property="addwmenu_flag" styleId="addwmenu_flag" onchange="w_check()">
							<html:options collection="yesNoMap" property="label" labelProperty="value" />
						</html:select>
					</td>
					<td>是否黑名单：</td>
					<td>
						<html:select name="listType" property="addbmenu_flag" styleId="addbmenu_flag" onchange="b_check()">
							<html:options collection="yesNoMap" property="label" labelProperty="value" />
						</html:select>
					</td>
				</tr>
				<tr id="w_flag2" style="display:none">
					<td>免检类型：</td>
					<td>
						<html:select styleId="w_rule_type" name="listType" property="rule_type">
							<html:options collection="rule_typeMap" property="label" labelProperty="value" />
						</html:select><font color="red">*</font>
					</td>
				  
					<td height="22" align="right" bgcolor="ECF3FF"> 白名单建立原因： </td>
					<td bgcolor="F6F9FF" align="left">
						<html:textarea styleId="reason_create" cols="29" rows="3" name="listType" property="reason_create"></html:textarea><font color="red">*</font>
					</td>
				</tr>
				<tr id="b_flag2" style="display:none">
					<td>名单类型：</td>
					<td>
						<html:select styleId="m_list_type" name="listType" property="list_type" style="width:85px;" onmouseover="FixWidth(this);">
							<html:options collection="m_list_type_bMap" property="label" labelProperty="value" />
						</html:select><font color="red">*</font>
					</td>
					<td>黑名单建立原因：</td>
					<td bgcolor="F6F9FF" colspan="3">
						<html:textarea styleId="b_reason_create" cols="29" rows="3" name="listType" property="b_reason_create"></html:textarea><font color="red">*</font>
					</td>
				</tr>
			</table>
		</div>
		<table align="center">
			<tr>
				<td colspan="4" >
					<input type="button" name="button1" class="in_button1" value="提 交"  onclick="checkForm('modifyNewClientCheck_do.do?check_exist=<%=check_exist %>&url=<%=url %>&check_type=<%=check_type %>&table_name=0');" />
					<input type="reset" value="重 置" class="in_button1" />
				</td>
			</tr>
		</table>
	</div>
</html:form>
<script language="javascript">
w_check();
b_check();
checkInfoType("card_type","card_typeinfo");
checkInfoType('card_type_c','card_type_cinfo');
checkInfoType('legal_card_type','legal_card_typeinfo');
</script>
</div>
</BODY>
</HTML>
