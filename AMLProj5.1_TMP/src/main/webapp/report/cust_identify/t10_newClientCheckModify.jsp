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
function insertAfter(targetElement){ //  targetElement ��ָ��Ԫ�ص�λ��
	var p = document.createElement("p");
	p.innerHTML = "<font color='red'>*</font>";
	var parent = targetElement.parentNode; // �ҵ�ָ��Ԫ�صĸ��ڵ� 
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
		errorMsg = "��ѡ�����";
		gEBI("country_cd").focus();
	}
	if(gEBI("party_class_cd").value == "C"){
		if(gEBI("organkey").value==null || gEBI("organkey").value==""){
			errorMsg = "�����Ų���Ϊ��";
			gEBI("organkey").focus();
		}
		if(gEBI("card_type_c").value==null || gEBI("card_type_c").value==""){
			errorMsg = "��ѡ��֤������";
			gEBI("card_type_c").focus();
		}
		if(!checkInfoType("card_type_c","card_type_cinfo")){
			errorMsg = "����ί�������֤��/֤���ļ�������Ϣ˵������Ϊ��";
			gEBI("card_type_cinfo").focus();
		}
		if(gEBI("card_no").value==null || gEBI("card_no").value==""){
			errorMsg = "֤�����벻��Ϊ��";
			gEBI("card_no").focus();
		}
		if(gEBI("aml2_type_cd").value==null || gEBI("aml2_type_cd").value==""){
			errorMsg = "��ѡ��ͻ�����";
			gEBI("aml2_type_cd").focus();
		}
		if(gEBI("enrol_fund_currency_cd").value == null || gEBI("enrol_fund_currency_cd").value==""){
			errorMsg = "��ѡ��ע���ʽ����";
			gEBI("enrol_fund_currency_cd").focus();
		}
		if(gEBI("enrol_fund_amt").value == null || gEBI("enrol_fund_amt").value==""){
			errorMsg = "ע���ʽ���Ϊ��";
			gEBI("enrol_fund_amt").focus();
		}
		if(isNaN(gEBI("enrol_fund_amt").value)){
			errorMsg = "ע���ʽ�ӦΪ����";
			gEBI("enrol_fund_amt").focus();
		}
		if(gEBI("legal_obj").value==null || gEBI("legal_obj").value==""){
			errorMsg = "������������������Ϊ��";
			gEBI("legal_obj").focus();
		}
		if(gEBI("legal_card_type").value==null || gEBI("legal_card_type").value==""){
			errorMsg = "��ѡ�񷨶����������֤������";
			gEBI("legal_card_type").focus();
		}
		if(!checkInfoType("legal_card_type","legal_card_typeinfo")){
			errorMsg = "��������������Ч֤����Ϣ˵������Ϊ��";
			gEBI("legal_card_typeinfo").focus();
		}
		if(gEBI("legal_card_no").value==null || gEBI("legal_card_no").value==""){
			errorMsg = "�������������֤�����벻��Ϊ��";
			gEBI("legal_card_no").focus();
		}else if(gEBI("legal_card_type").value==11){
			if(!IdentityCardValid(gEBI("legal_card_no").value)){
				errorMsg = "�������������֤�����ʽ����";
				gEBI("legal_card_no").focus();
			}
		}
		if(gEBI("legal_card_no_end_dt_disp").value==null || gEBI("legal_card_no_end_dt_disp").value==""){
			errorMsg = "����������֤�������ղ���Ϊ��";
			gEBI("legal_card_no_end_dt_disp").focus();
		}
		if(gEBI("stock_holder").value==null || gEBI("stock_holder").value==""){
			errorMsg = "ʵ�ʿعɹɶ���������Ϊ��";
			gEBI("stock_holder").focus();
		}
		if(gEBI("stock_holder_card_type").value==null || gEBI("stock_holder_card_type").value==""){
			errorMsg = "��ѡ��ʵ�ʿع������֤������";
			gEBI("stock_holder_card_type").focus();
		}
		if(gEBI("stock_holder_card_no")==null || gEBI("stock_holder_card_no").value==""){
			errorMsg = "ʵ�ʿع������֤�����벻��Ϊ��";
			gEBI("stock_holder_card_no").focus();
		}else if(gEBI("stock_holder_card_type").value==11){
			if(!IdentityCardValid(gEBI("stock_holder_card_no").value)){
				errorMsg = "ʵ�ʿع������֤�����ʽ����";
				gEBI("stock_holder_card_no").focus();
			}
		}
		if(gEBI("stock_holder_card_no_end_dt_disp").value==null || gEBI("stock_holder_card_no_end_dt_disp").value==""){
			errorMsg = "ʵ�ʿع���֤�������ղ���Ϊ��";
			gEBI("stock_holder_card_no_end_dt_disp").focus();
		}
			//add by zyd 2018-08-07 ����Ӫҵִ��
	if(gEBI("licence_end_dtdisp").value==null || gEBI("licence_end_dtdisp").value==""){
		errorMsg = "Ӫҵִ�յ����ղ���Ϊ��";
		gEBI("licence_end_dtdisp").focus();
	}
	//end 
	}else{
		if(gEBI("card_type").value==null || gEBI("card_type").value==""){
			errorMsg = "��ѡ��֤������";
			gEBI("card_type").focus();
		}
		if(!checkInfoType("card_type","card_typeinfo")){
			errorMsg = "����ί�������֤��/֤���ļ�������Ϣ˵������Ϊ��";
			gEBI("card_typeinfo").focus();
		}
		if(gEBI("card_no").value==null || gEBI("card_no").value==""){
			errorMsg = "֤�����벻��Ϊ��";
			gEBI("card_no").focus();
		}else if(gEBI("card_type").value==11){
			if(!IdentityCardValid(gEBI("card_no").value)){
				errorMsg = "���֤�������ʽ����";
				gEBI("card_no").focus();
			}
		}
		if(gEBI("card_end_dt_disp").value==null || gEBI("card_end_dt_disp").value==""){
			errorMsg = "֤�������ղ���Ϊ��";
			gEBI("card_end_dt_disp").focus();
		}
		if(gEBI("occupation").value==null || gEBI("occupation").value==""){
			errorMsg = "��ѡ��ͻ�ְҵ";
			gEBI("occupation").focus();
		}
		if(isNaN(gEBI("indiv_income").value)){
			errorMsg = "����ӦΪ����";
			gEBI("indiv_income").focus();
		}

	}
	if(gEBI("check_explain").value==null || gEBI("check_explain").value==""){
		errorMsg = "������۲���Ϊ��";
		gEBI("check_explain").focus();
	}
	if(gEBI("valid_dt_disp").value==null || gEBI("valid_dt_disp").value==""){
		errorMsg = "���������Ч�ڲ���Ϊ��";
		gEBI("valid_dt_disp").focus();
	}
	if(checkRadio(document.forms[0].check_result)<0){
		errorMsg+="��ѡ���ע�̶�";
    }
	if(gEBI("addwmenu_flag").value=="1"){
		if(gEBI("w_rule_type").value==""){
			errorMsg = "��ѡ���������";
			gEBI("w_rule_type").focus();
		}
		if(gEBI("reason_create").value==""){
			errorMsg = "����������ԭ����Ϊ��";
			gEBI("reason_create").focus();
		}
	}
	if(gEBI("addbmenu_flag").value=="1"){
		if(gEBI("m_list_type").value==""){
			errorMsg = "��ѡ����������";
			gEBI("m_list_type").focus();
		}
		if(gEBI("b_reason_create").value==""){
			errorMsg = "����������ԭ����Ϊ��";
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
						err = "ʶ���˲���Ϊ��";
						gEBI("checkuser_"+elementid).focus();
						break;
					}
					if(gEBI("checkdate_disp_"+elementid).value==""){
						err = "ʶ�����ڲ���Ϊ��";
						gEBI("checkdate_disp_"+elementid).focus();
						break;
					}
				}
				if(gEBI("context_"+elementid)!=null && gEBI("context_"+elementid).value==""){
					err = "��ע���ݲ���Ϊ��";
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
			<span>�˲�ͻ������Ϣ</span><html:hidden name="clientInfo" property="aml1_type_cd"/>
		</div>
		<logic:equal name="clientInfo" property="party_class_cd" value="I">
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>��������</td>
						<td><html:text name="clientInfo" property="party_chn_name" styleId="party_chn_name" readonly="true"/>
							<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������޸�" title="���ݲ������޸�"></html:img></td>
						<td>Ӣ������</td>
					  	<td><html:text name="clientInfo" property="party_eng_name" /><html:hidden name="clientInfo" property="organkey"/></td>
					</tr>
					<tr>
						<td>������</td>
						<td>
							<html:select name="clientInfo" property="country_cd" styleId="country_cd">
								<html:options collection="nationalityMap" property="label" labelProperty="value" />
							</html:select>
							<font color="red">*</font>
						</td>
					  	<td>��λ������ҵ��</td>
					  <td>
						<html:select name="clientInfo" property="industry" styleId="industry">
							<html:options collection="industryMap" property="label" labelProperty="value" />
						</html:select>
					  </td>
					</tr>
					<tr>
						<td>֤�����ͣ�</td>
						<td colspan=3>
					  		<html:select styleId="card_type" name="clientInfo" property="card_type"	onchange="checkInfoType('card_type','card_typeinfo')">
								<html:options collection="bitpMap" property="label" labelProperty="value" />
							</html:select><font color="#FF0000">*</font>
							<br/>
							<html:textarea styleId="card_typeinfo" style="width:80%;display:none" property="card_typeinfo" name="clientInfo"></html:textarea>
						</td>
					</tr>
					<tr>
					  <td>֤�����룺 </td>
					  <td><html:text name="clientInfo" property="card_no" styleId="card_no"/>
						<font color="#FF0000">*</font></td>
						<td>֤�������գ� </td>
						<td>
							<html:text name="clientInfo" property="card_end_dt_disp" styleId="card_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%" />
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
					  <td>ס���ػ򾭳���ס�أ�</td>
					  <td><html:text name="clientInfo" property="addr1" size="40"/></td>
					  <td>��ϵ�绰��</td>
					  <td><html:text name="clientInfo" property="cell_no" /></td>
					</tr>
					<tr>
						<td>ְҵ��</td>
						<td colspan=3>
							<html:select styleId="occupation" name="clientInfo" property="occupation" >
								<html:options collection="occupationMap" property="label" labelProperty="value" />
							</html:select>
							<font color="red">*</font>
						</td>
					<tr>
					  <td>ְ��</td>
						<td>
							<html:select styleId="duty" name="clientInfo" property="duty" >
								<html:options collection="dutyMap" property="label" labelProperty="value" />
							</html:select>
						</td>
					  <td>������λ��</td>
					  <td><html:text name="clientInfo" property="company" /></td>
					</tr>
					<tr>
					  <td>���룺</td>
					  <td><html:text name="clientInfo" styleId="indiv_income" property="indiv_income" /></td>
					  <td>����״����</td>
					  <td><html:text name="clientInfo" property="income_ecno" /></td>
					</tr>
					<tr>
						<td>������Դ��</td>
						<td><html:text name="clientInfo" property="income_source" /></td>
						<td>����Ŀ�ģ�</td>
						<td><html:text name="clientInfo" property="create_purpose" /></td>
					</tr>
				</table>
			</div>
		</logic:equal>
		<logic:equal name="clientInfo" property="party_class_cd" value="C">
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td>�ͻ�����������</td>
					  <td bgcolor="F6F9FF">
					  	<div align="left">
					  		<html:text styleId="organkey" name="clientInfo" property="organkey" readonly="true" size="7"/>&nbsp;
					  		<html:text name="clientInfo" property="organ_name_disp" readonly="true" size="45"/>
					  		<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������޸�" title="���ݲ������޸�"></html:img>
					  	</div>
					  </td>
					  <td>�ͻ��ţ�</td>
					  <td><html:text name="clientInfo" property="party_id" readonly="true"/>
						<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������޸�" title="���ݲ������޸�"></html:img>
					</tr>
					<tr>
					  <td>�ͻ����ƣ�</td>
					  <td><html:text name="clientInfo" property="party_chn_name" styleId="party_chn_name" size="45" readonly="true"/>
							<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������޸�" title="���ݲ������޸�"></html:img></td>
					  <td>�ͻ�������</td>
						<td>
							<html:select name="clientInfo" property="country_cd" styleId="country_cd">
								<html:options collection="nationalityMap" property="label" labelProperty="value" />
							</html:select>
							<font color="#FF0000">*</font> </td>
					</tr>
					<tr>
						<td>�ͻ����ͣ�</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="aml2_type_cd" styleId="aml2_type_cd" >
								<html:options collection="pbc_cttp2Map" property="label" labelProperty="value" />
							</html:select>
						<font color="#FF0000">*</font>
					
						</td>
					</tr>
					<tr>
					  <td>�ͻ�֤�����ͣ�</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="card_type_c" styleId="card_type_c" onchange="checkInfoType('card_type_c','card_type_cinfo')">
							<html:options collection="card_type_cMap" property="label" labelProperty="value" />
						</html:select><font color="red">*</font>
						<br/>
						<html:textarea styleId="card_type_cinfo" style="width:80%;display:none" property="card_type_cinfo" name="clientInfo"></html:textarea>
					</td>
					</tr>
					<tr>
						 <td>�ͻ�֤�����룺 </td>
						 <td>
						 	<html:text name="clientInfo" property="card_no" styleId="card_no"/>
							<font color="#FF0000">*</font>
						</td>
						<td>�Թ��ͻ���ҵ��</td>
						<td>
							<html:select name="clientInfo" property="industry">
								<html:options collection="industryMap" property="label" labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>��Ӫ��Χ</td>
						<td><html:text name="clientInfo" property="main_manage_scope" /></td>
						<td>��Ӫҵ��</td>
						<td><html:text name="clientInfo" property="main_manage_business" /></td>
					</tr>
					<tr>
					  <td>ע���ʽ���֣�</td>
					  <td>
					  	<html:select name="clientInfo" property="enrol_fund_currency_cd" styleId="enrol_fund_currency_cd">
								<html:options collection="currencyMap" property="label" labelProperty="value" />
							</html:select><font color="red">*</font>
					  </td>
					  <td>ע���ʽ�</td>
					  <td><html:text name="clientInfo" property="enrol_fund_amt" styleId="enrol_fund_amt"/><font color="red">*</font></td>
					</tr>
					<tr>
					  <td>����������������</td>
					  <td><html:text name="clientInfo" property="legal_obj" styleId="legal_obj"/><font color="red">*</font></td>
					</tr>
					<tr>
					  <td>�������������֤�����ͣ�</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="legal_card_type" styleId="legal_card_type" onchange="checkInfoType('legal_card_type','legal_card_typeinfo')">
								<html:options collection="bitpMap" property="label" labelProperty="value" />
							</html:select><font color="red">*</font>
						<br/>
						<html:textarea styleId="legal_card_typeinfo" style="width:80%;display:none" property="legal_card_typeinfo" name="clientInfo"></html:textarea>
					  </td>
					</tr>
					<tr>
						<td>�������������֤�����룺</td>
						<td><html:text name="clientInfo" property="legal_card_no" styleId="legal_card_no"/><font color="red">*</font></td>
						<td>����������֤��������</td>
						<td><html:text name="clientInfo" property="legal_card_no_end_dt_disp" styleId="legal_card_no_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/><font color="red">*</font></td>
					</tr>
					<tr>
					  <td>ʵ�ʿعɹɶ���</td>
					  <td><html:text name="clientInfo" property="stock_holder" styleId="stock_holder"/><font color="red">*</font></td>
					</tr>
					<tr>
						<td>ʵ�ʿع������֤�����ࣺ</td>
					  <td colspan=3>
					  	<html:select name="clientInfo" property="stock_holder_card_type" styleId="stock_holder_card_type" >
								<html:options collection="bitpMap" property="label" labelProperty="value" />
							</html:select><font color="red">*</font>
					  </td>
					</tr>
					<tr>
						<td>ʵ�ʿع������֤�����룺</td>
						<td><html:text name="clientInfo" property="stock_holder_card_no" styleId="stock_holder_card_no"/><font color="red">*</font></td>
						<td>ʵ�ʿع���֤��������</td>
						<td><html:text name="clientInfo" property="stock_holder_card_no_end_dt_disp" styleId="stock_holder_card_no_end_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/><font color="red">*</font></td>
					</tr>
	                  <tr>
	                  	<td>�������ô��룺</td>
						<td><html:text name="clientInfo" property="org_credit_no" /></td>
						<td>�������ô�����Ч�ڣ�</td>
						<td>
						<html:text name="clientInfo" property="org_credit_vt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/>
						</td>
	                  </tr>
	                  <!-- add by zyd ��������Ӫҵִ�յ�����  -->
	                     <tr>
	                  	<td>Ӫҵִ�յ����գ�</td>
						<td>
						<html:text name="clientInfo" property="licence_end_dtdisp" styleId="licence_end_dtdisp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/><font color="red">*</font>
						</td>					
	                  </tr>
	                  <!-- end -->
				</table>
			</div>
		</logic:equal>
	</div>
	
	<%
		LinkedHashMap checkStateMap = (LinkedHashMap) request.getAttribute("checkStateMap");
		Set<String> keySet = checkStateMap.keySet();//��ȡmap��keyֵ�ļ��ϣ�set����
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
				<tr><td></td><td align="center" colspan="3">�Ƿ�Ϊ����ʶ���ʩ��</td></tr>
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
							&nbsp;&nbsp;ʶ���ˣ�<input type="text" id="checkuser_<%=middleTemp.getElementid() %>" name="checkuser_<%=middleTemp.getElementid() %>" />&nbsp;<font color="red">*</font>&nbsp;
							ʶ��ʱ�䣺<input type="text" id="checkdate_disp_<%=middleTemp.getElementid() %>" name="checkdate_disp_<%=middleTemp.getElementid() %>" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"/>&nbsp;<font color="red">*</font>
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
				<tr><td></td><td align="center" colspan="3">�Ƿ���������쳣���Σ�</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("3");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td><%=middleTemp.getElementname() %><input type="hidden" name="elementid"  id="<%=middleTemp.getElementid() %>" value="<%=middleTemp.getUpcode() %>,<%=middleTemp.getElementid() %>,<%=middleTemp.getElementname() %>" /></td>
					<td>&nbsp;&nbsp;<input type="checkbox" id="istrue_<%=middleTemp.getElementid() %>" name="checkbox" value="<%=middleTemp.getElementid() %>" onclick="showOrNot(this,'sb_<%=middleTemp.getElementid() %>');" />
						<b id="sb_<%=middleTemp.getElementid() %>" style="display:none" >&nbsp;&nbsp;��ע��<textarea type="text" id="context_<%=middleTemp.getElementid() %>" name="context_<%=middleTemp.getElementid() %>" cols="60"></textarea>&nbsp;<font color="red">*</font></b>
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
			<span>�������</span><html:hidden name="checkResult" property="check_reason"/>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<%if("yes".equals(showCheckReason)){ %>
				<tr>
					<td>�������ԭ��</td>
					<td colspan="4"><bean:write name="checkResult" property="check_reason"/></td>
				</tr>
				<%} %>
				<tr>
					<td>������ۣ�</td>
					<td colspan="4"><html:textarea cols="120" name="checkResult" property="check_explain" styleId="check_explain"></html:textarea>&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
					<td>�������Ч�ڣ�</td>
					<td><html:text name="checkResult" property="valid_dt_disp" styleId="valid_dt_disp" onclick="calendar.show(this);" readonly="true" style="background:url(../../images/blue/icon_r.gif) no-repeat right 50%"></html:text>&nbsp;<font color="red">*</font></td>
					<td>��ע�̶ȣ�����Ƶ�ȣ���</td>
					<td align="left">
						<html:radio name="checkResult" property="check_result" value="0">�����ע</html:radio>
						<html:radio name="checkResult" property="check_result" value="1">һ���ע</html:radio>
						<html:radio name="checkResult" property="check_result" value="2">������ע</html:radio>
						<html:radio name="checkResult" property="check_result" value="3">�ص��ע</html:radio>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="conditions">
		<div class="cond_t">
			<span>�Ƿ��������</span>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td >�Ƿ��������</td>
					<td>
						<html:select name="listType" property="addwmenu_flag" styleId="addwmenu_flag" onchange="w_check()">
							<html:options collection="yesNoMap" property="label" labelProperty="value" />
						</html:select>
					</td>
					<td>�Ƿ��������</td>
					<td>
						<html:select name="listType" property="addbmenu_flag" styleId="addbmenu_flag" onchange="b_check()">
							<html:options collection="yesNoMap" property="label" labelProperty="value" />
						</html:select>
					</td>
				</tr>
				<tr id="w_flag2" style="display:none">
					<td>������ͣ�</td>
					<td>
						<html:select styleId="w_rule_type" name="listType" property="rule_type">
							<html:options collection="rule_typeMap" property="label" labelProperty="value" />
						</html:select><font color="red">*</font>
					</td>
				  
					<td height="22" align="right" bgcolor="ECF3FF"> ����������ԭ�� </td>
					<td bgcolor="F6F9FF" align="left">
						<html:textarea styleId="reason_create" cols="29" rows="3" name="listType" property="reason_create"></html:textarea><font color="red">*</font>
					</td>
				</tr>
				<tr id="b_flag2" style="display:none">
					<td>�������ͣ�</td>
					<td>
						<html:select styleId="m_list_type" name="listType" property="list_type" style="width:85px;" onmouseover="FixWidth(this);">
							<html:options collection="m_list_type_bMap" property="label" labelProperty="value" />
						</html:select><font color="red">*</font>
					</td>
					<td>����������ԭ��</td>
					<td bgcolor="F6F9FF" colspan="3">
						<html:textarea styleId="b_reason_create" cols="29" rows="3" name="listType" property="b_reason_create"></html:textarea><font color="red">*</font>
					</td>
				</tr>
			</table>
		</div>
		<table align="center">
			<tr>
				<td colspan="4" >
					<input type="button" name="button1" class="in_button1" value="�� ��"  onclick="checkForm('modifyNewClientCheck_do.do?check_exist=<%=check_exist %>&url=<%=url %>&check_type=<%=check_type %>&table_name=0');" />
					<input type="reset" value="�� ��" class="in_button1" />
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
