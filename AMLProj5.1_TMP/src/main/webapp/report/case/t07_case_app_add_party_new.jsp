<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>	

		<script type='text/javascript' src="../../js/validate.js" ></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/uc.js" ></script>		
		<script type="text/javascript" src="../../js/selectbox.js" ></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
<SCRIPT LANGUAGE="JavaScript">
var g_appid = "1";
function validateDetail() {
	
	g_changed = true;
	validate($$('ctnm',0), '', 'citp');
	g_changed = true;
	validate($$('ctnt',0), 'country', '');
	g_changed = true;
	card_inf_exp('citp','card_type_inf');
	validate($$('citp',0), 'card_type', '');
	g_changed = true;
	validate($$('ctid',0), 'citp', '');
	g_changed = true;
	validate3($$('addr1',0), '', '');
	g_changed = true;
	validate3($$('tel_no',0), '', '');
	g_changed = true;
	validate3($$('otherContact',0), '', '');
	i_c_change();
	g_changed = true;
	validate($$('cttp',0), 'pbc_cttp', '');
}
function _Commit(theUrl){
	var errMsg = "";
	   	if(!document.forms[0].is_party[0].checked&&!document.forms[0].is_party[1].checked){
      		errMsg="请选择是否本行客户";
      	}
    	
         
     if( errMsg==''){
         if(!checkAllValidate()) {
				//alert("存在未校正的数据，保存失败！");
				return false;
				
		}
         document.forms[0].action=theUrl;
         document.forms[0].submit();
     }else{
         
         alert(errMsg);
         return false;
     }
}
function quit()
{
		window.close();
		opener.location.href='<%=request.getContextPath()%>/report/case/t07_case_app_add_party.do';
		
}
function card_inf_exp(type,value){
	if(type!='1'){
		var agent_card_type_value=eval('document.forms[0].'+type+'.value');
		if(agent_card_type_value=='29'||agent_card_type_value=='19'){
			eval('document.forms[0].'+value+".style.display=''");
			eval('document.forms[0].'+value+".focus()");
		}else{
			eval('document.forms[0].'+value+".style.display='none'");
			showValidateMsg($$(value,0),'4','');
			var validate_typeNode=document.getElementsByName(type)[0];
			var parent=validate_typeNode.parentNode;
		for(var node=0;node<parent.childNodes.length;node++){
			var currentNode = parent.childNodes[node];
			if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
				parent.removeChild(currentNode);
			}
		}
		}
	}else{
	
		var agent_card_type_value=document.forms[0].citp.value;
		var opp_card_type_value=document.forms[0].legal_card_type.value;
		//}
		
		if(agent_card_type_value!='29'&& agent_card_type_value!='19'){
		
			document.forms[0].card_type_inf.style.display='none';
			showValidateMsg($$('card_type_inf',0),'4','');
		}else {
			document.forms[0].card_type_inf.focus();
		}
		if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
			document.forms[0].legal_card_type_inf.style.display='none';
			 showValidateMsg($$('legal_card_type_inf',0),'4','');
		}else {
			document.forms[0].legal_card_type_inf.focus();
		}
	}
}
function validate_type(value){
	var validate_type_value=eval('document.forms[0].'+value+'.value');		
	if(getLength(validate_type_value)>30||getLength(validate_type_value)<4
	||IndexSpaceLast(validate_type_value)>0){
		showValidateMsg($$(value,0),'2','请输入证件的详细信息，左右不能有空格，并且在4至30个字符之内!');
	}else{
	    showValidateMsg($$(value,0),'3','');
	}
}
function IndexSpaceLast(str2){
   var str1 = " ";
   var str3 = "　";
   if (str2.length>0){
 if ((str2.substr(str2.length-1,1)==str1)||(str2.substr(0,1)==str1)||(str2.substr(str2.length-1,1)==str3)||(str2.substr(0,1)==str3)){
 return(1);
 }
 }
}

function validate3(obj, ref1name, ref2name) {

var id = obj.name;
var vObj = obj;
var ref1 = "", ref2 = "";
var idx = id.indexOf("_disp");
if (idx == -1) {
idx = id.indexOf("_flag");
}
if (idx == -1) {
idx = id.indexOf("_value");
}
if (idx != -1) {
id = id.substr(0, idx);
vObj = $$(id, 0);
}
if (ref1name != "") {
var ref1obj = $$(ref1name, 0);
if (ref1obj != null) {
	ref1 = ref1obj.value;
} else {
	ref1 = ref1name;
}
}
if (ref2name != "") {
var ref2obj = $$(ref2name, 0);
if (ref2obj != null) {
	ref2 = ref2obj.value;
} else {
	ref2 = ref2name;
}
}

if (g_changed) {
showValidateMsg(vObj, 0, ""); // 显示验证状态
BasicReport.validateOneItem('2', vObj.name, vObj.value, ref1, ref2, updateValidateRes);//appid, obj.name, obj.value
g_changed = false;
}
}
function i_c_change(){

 	var value=document.forms[0].cttp.value;


   if(value=="02"){
   
	_display('op_duisi');
	_hidden('op_duigong');

   	 card_inf_exp('legal_card_type','legal_card_type_inf');
     showValidateMsg($$('ctvc_i',0), 1, '');
     
     }
  else{ 
 	  	_hidden('op_duisi'); 	  	
   		_display('op_duigong');
 
     card_inf_exp('legal_card_type','legal_card_type_inf');
     
     showValidateMsg($$('ctvc',0), 1, '');
     g_changed = true;
    validate3($$('legal_obj',0), '', 'legal_card_type');
    g_changed = true;
	validate3($$('legal_card_type',0), 'BITP', '');
	g_changed = true;
	validate3($$('legal_card_no',0), 'legal_card_type', '');
	g_changed = true;
	validate3($$('enrol_fund_amt',0), '', '');
     
     
   }
}
function validateAgent() {
　　  var agent_name=document.forms[0].legal_obj.value;
		var agent_card_type=document.forms[0].legal_card_type.value;
		var agent_card_no=document.forms[0].legal_card_no.value;
	 
		if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
			&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_name=='@N')
			)
		|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
			&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N')){
			showValidateMsg($$('agent_table',0),'4','');
			
		}else{
			showValidateMsg($$('agent_table',0),'2','法定代表人信息其中有一项为空时，所有法定代表人信息字段都应空，其中一项非空时，所有都必须非空');
		}
	}
function _hidden(classname)
{
	var obj=document.getElementsByTagName("tr");
	for(var i=0;i<obj.length;i++)
	{
	
		if(obj[i].className==classname)
		{	
		
			obj[i].style.display='none';
		}
	}
	
	var obj2=document.getElementsByTagName("td");
	for(var i=0;i<obj2.length;i++)
	{
	
		if(obj2[i].className.indexOf(classname)!='-1')
		{	
		
			obj2[i].style.display='none';
		}
	}
}
function _display(classname)
{
	var obj=document.getElementsByTagName("tr");
	for(var i=0;i<obj.length;i++)
	{	
		if(obj[i].className==classname)
		{
			obj[i].style.display="";
		}
	}
	var obj2=document.getElementsByTagName("td");
	
	for(var i=0;i<obj2.length;i++)
	{	
		
		if(obj2[i].className.indexOf(classname)!='-1')
		{
			obj2[i].style.display="";
		}
	}
}
function change_isParty(type)//是否本行客户
{	
	var flag=document.getElementsByName("is_party");
		//alert(flag[0].checked);
		var party_name=document.getElementsByName("ctnm");
		var party_id=document.getElementsByName("csnm");

		if(type!='init'){
			party_name[0].value='';
			party_id[0].value='';
		}
		if(flag[0].checked==true)
		{
			party_name[0].readOnly=true;				
			party_id[0].readOnly=true;				
			document.getElementById("no_party_id").style.display='';
			document.getElementById("no_party_id2").style.display='none';
			
		}else
		{
			party_name[0].readOnly=false;				
			party_id[0].readOnly=false;				
			document.getElementById("no_party_id").style.display='none';
			document.getElementById("no_party_id2").style.display='';
		}
		g_changed = true;
	     validate($$('ctnm',0), '', 'citp');
	
}

function check_party_id(obj)
{
	 if(!IdCardCheck(obj.value)){
		 	obj.focus();
	   	}
}
</SCRIPT>
</HEAD>
<BODY onload="card_inf_exp('1','');validateDetail();" leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/case/t07_case_app_add_party_page_new.do" method="post">

<div id="main">
<div class="conditions">
	<div class="cond_t">
	  <span>新增客户</span>
	  
	   <span class="buttons" >
	   <a href="#" onclick="_Commit('<%=request.getContextPath() %>/report/case/t07_case_app_add_party_page_new_do.do')""><img src="../../images/blue/b_save.png" />保存</a>	   	
	  </span>
	
	</div>
	<div class="cond_c2">
  		 <table border="0" cellpadding="0" cellspacing="0">
    
    <tr> 
									<td>是否本行客户</td>
									
									<td colspan="3">
									<html:radio property="is_party" value="1" onclick="change_isParty();">是</html:radio>
									<html:radio property="is_party" value="0" onclick="change_isParty();">否</html:radio>
									&nbsp<font color="red">*</font>	
									</td>
																	
								</tr>
	    <tr>
	      <td>客户名称：</td>
	      <td>
				<html:text property="ctnm" onchange="change();" onblur="validate(this, '', 'citp')" readonly="true"></html:text>			
				<a id="no_party_id" href="#" onclick="window.open('<%=request.getContextPath()%>/report/case/t47_party_list_bs.do?newsearchflag=1&input_name=csnm&input_name_disp=ctnm','enter2','height=400, width=900,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
	            <font color="#FF0000"> *</font>
	            <html:hidden property="organkey"/>
	      </td>
	                                  
	      <td>客户号：</td>
	   	  <td><html:text property="csnm" onchange="change();" onblur="validate(this, '', '');validateDetail();" readonly="true" />
										<span id="no_party_id2"  style="display:none">(此处填写证件号码)</span>
										<font color="#FF0000"> *</font>
	      </td>
	    </tr>
	    <tr>
			<td>客户身份证件类型：</td>
			<td colspan="3">
				<html:select property="citp"
							onchange="card_inf_exp('citp','card_type_inf');change();validate($$('citp',0), 'card_type', '');validate($$('ctnm',0), '', 'citp');change();validate($$('ctid',0), 'citp', '');">
				<html:options collection="cardtypeMap" property="label" labelProperty="value" />
				</html:select>
				<html:text property="card_type_inf" size="30" maxlength="30" onblur="validate_type('card_type_inf');" />
			</td>
									
	</tr>
	    <tr>
			<td>客户证件号码：</td>
			<td>
				<html:text property="ctid" onchange="change();" onblur="validate(this, 'citp', '')"	></html:text>
				<font color="#FF0000"> *</font>
			</td>
			<td>客户国籍：</td>
			<td>
				<html:select property="ctnt" onchange="change();validate(this, 'country', '');"> 
				<html:options collection="countryMap" property="label" labelProperty="value" />
				</html:select>
				<font color="#FF0000"> *</font>
			</td>
		</tr>
		<tr>
			<td>客户类型：</td>
			<td id="cusop">
				<html:select styleId="cttp" property="cttp" onblur="" onchange="i_c_change();change();validate(this, 'pbc_cttp', '');">
				<html:options collection="partytypeMap" property="key" labelProperty="value" />
				</html:select>
				<font color="#FF0000"> *</font>
			</td>
								
			<td class="op_duigong" style="display:none">注册资金：</td>
			<td class="op_duigong" style="display:none">
				<html:text property="enrol_fund_amt" onchange="change();" onblur="validate3(this, '', '');"></html:text>
			</td>
		</tr>
		<tr>
									<td>客户详细地址：</td>
									<td>
										<html:text property="addr1" onchange="change();" onblur="validate3(this, '', '');"></html:text>
									</td>
									<td>客户联系电话：</td>
									<td>
										<html:text property="tel_no" onchange="change();" onblur="validate3(this, '', '');"></html:text>
									</td>
								</tr>
								<tr>
									<td>客户其他联系方式：</td>
									<td>
										<html:text property="otherContact" onchange="change();" onblur="validate3(this, '', '');"></html:text>
									</td>
									<td class="op_duisi" >客户职业：</td>
									<td class="op_duisi" >
									 <html:select property="ctvc_i" onchange="showValidateMsg(this, 1, '');">
									  <html:options collection="pbc_ctvc_iMap" property="label" labelProperty="value" />
									 </html:select>
									</td>
									<td class="op_duigong" style="display:none">客户行业：</td>
									<td class="op_duigong" style="display:none">
									 <html:select property="ctvc" onchange="showValidateMsg(this, 1, '');">
									  <html:options collection="pbc_ctvc_cMap" property="label" labelProperty="value" />
									 </html:select>
									</td>
								</tr>
								<tr class="op_duigong" style="display:none">
								 <td>法定代表人身份证件类型：</td>
									<td colspan="3">
									<html:select property="legal_card_type" style="width:340"
													onchange="card_inf_exp('legal_card_type','legal_card_type_inf');change();validate3($$('legal_card_type',0), 'BITP', '');change();validate3($$('legal_card_no',0), 'legal_card_type', ''); change();validate3($$('legal_obj',0), '', 'legal_card_type');validateAgent()">
													<html:options collection="bi_card_typeMap"
														property="label" labelProperty="value" />
												</html:select>
												<html:text  property="legal_card_type_inf" size="30" maxlength="30" onblur="validate_type('legal_card_type_inf');"/>
									</td>	
									
								</tr>
								<tr class="op_duigong" style="display:none">
								   	
									<td>法定代表人姓名：</td>
									<td>
									  <html:text property="legal_obj" onchange="change();" 
									  onblur="validate3(this, '', 'legal_card_type');validateAgent()"></html:text>
									</td>								
									<td>法定代表人身份证件号码：</td>
									<td>
										<html:text property="legal_card_no"
													onchange="change();"
													onblur="validate3(this, 'legal_card_type', '');validateAgent()"></html:text>
									</td>
									
								</tr>
								<tr><td colspan="4"><table id="agent_table"><tr><td></td></tr></table></td></tr>
								
								
	  </table>
	</div>
</div>
  </div>
</html:form>
</BODY>
</HTML>
