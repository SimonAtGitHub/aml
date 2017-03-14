<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
		
		var g_appid = "1";
		function validateDetail() {
			//while(g_ArrMsg.length > 0) // 验证提示框
			//	g_ArrMsg.pop();
			
			g_changed = true;
			validate($$('ctnm',0), '', 'citp');
			//g_changed = true;
			//validate($$('csnm',0), '', '');
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
			//validate_organ();
		}
		
		function validate_organ(){
			//g_changed = true;
			//validate($$('finm',0), '', '');
			//g_changed = true;
			//validate($$('ficd',0), '', '00');
			g_changed = true;
			validate($$('firc',0), 'trcd', '');
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
			//var report_type_value = '1';					
			//if(class_cd=='1' && report_type_value=='2'){
			var opp_card_type_value=document.forms[0].legal_card_type.value;
			//}
			
			if(agent_card_type_value!='29'&& agent_card_type_value!='19'){
			
				document.forms[0].card_type_inf.style.display='none';
				showValidateMsg($$('card_type_inf',0),'4','');
			}else {
				document.forms[0].card_type_inf.focus();
			}
			//if(class_cd=='1'&& report_type_value=='2'){
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
				document.forms[0].legal_card_type_inf.style.display='none';
				 showValidateMsg($$('legal_card_type_inf',0),'4','');
			}else {
				document.forms[0].legal_card_type_inf.focus();
			}
			//}
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

			//g_validateObj = obj;
	if (g_changed) {
		showValidateMsg(vObj, 0, ""); // 显示验证状态
				//g_validating = true;
				// 调用验证函数，并且设置验证完后处理响应函数				
		BasicReport.validateOneItem('2', vObj.name, vObj.value, ref1, ref2, updateValidateRes);//appid, obj.name, obj.value
				//var para = { "app_id":g_appid, "field_id":vObj.name, "value":vObj.value, "ref1":ref1, "ref2":ref2 };
				//BasicReport.validateItem(para, updateValidateRes);
		g_changed = false;
	}
}
       
	function fPopUpCalendarDlg(ctrlobj) {
		showx = event.screenX - event.offsetX - 4 - 210; // + deltaX;
		showy = event.screenY - event.offsetY + 18; // + deltaY;
		newWINwidth = 210 + 4 + 18;

		retval = window
				.showModalDialog(
						"../js/date.htm",
						"",
						"dialogWidth:197px; dialogHeight:210px; dialogLeft:"
								+ showx
								+ "px; dialogTop:"
								+ showy
								+ "px; status:no; directories:yes;scrollbars:no;Resizable=no; ");
		if (retval != null) {
			ctrlobj.value = retval;
		} else {
			//alert("canceled");
		}
	}
	function _Onblur(pname) {
		var obj = eval("document.forms[0]." + pname);
		obj.value = "";
	}
	function _Opendailog1(url, type) {

		if (type == 'option') {
			errMsg = CheckBoxMustChecked(form1);
			if (errMsg == '') {

				isSub = true;

			}
		}
		if (type == 'modi') {
			if (checkRadio(form1.radioname) < 0) {
				errMsg = "请选择";
			}
			isSub = true;
		}
		if (isSub && errMsg == '') {

		} else {
			if (errMsg != '')
				alert(errMsg);
			return false;
		}
		var errMsg = "";
		var isSub = false;
		var showx = event.screenX - event.offsetX / 2; // + deltaX;
		var showy = event.screenY - event.offsetY + 18; // + deltaY;
		showx = 20;
		showy = 20;

		var flag = window
				.showModalDialog(
						url,
						"ff",
						"dialogWidth:500px; dialogHeight:500px; dialogLeft:"
								+ showx
								+ "px; dialogTop:"
								+ showy
								+ "px; status:no; directories:yes;scrollbars:no;resizable:yes;");

		if (flag == "1") {
			document.form[0].action = 'AlertAnalyse_List.htm';
			document.form[0].submit();
		}
	}
	function _Opendailog(url) {

		var showx = event.screenX - event.offsetX / 2; // + deltaX;
		var showy = event.screenY - event.offsetY + 18; // + deltaY;
		showx = 20;
		showy = 20;

		var flag = window
				.showModalDialog(
						url,
						"dialogWidth:500px; dialogHeight:500px; dialogLeft:"
								+ showx
								+ "px; dialogTop:"
								+ showy
								+ "px; status:no; directories:yes;scrollbars:no;resizable:yes;");
		if (flag == "1") {
			document.form[0].action = 'AlertAnalyse_List.htm';
			document.form[0].submit();
		}
	}
	function dosubmit(theUrl, type) {
		var errMsg = "";
		var isSub = false;
		if (type == 'search') {
			isSub = true;
		}
		if (isSub && errMsg == '') {
			//alert(theUrl);
			document.forms[0].action = theUrl;
			document.forms[0].submit();
		} else {
			if (errMsg != '')
				alert(errMsg);
			return false;
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
		
		
function _Confim(url, type){

        var errMsg ="";
		var trans= document.frames[0].document.getElementsByName('transactionkeyCheckBox');
	
	      	
      	if(document.forms[0].finm.value==''){
      		errMsg="机构名称不能为空";
      	}
      	else if(document.forms[0].ficd.value==''){
			errMsg = "金融机构代码不能为空！";
		}
      	//else if(kytz.length>3){
        //     errMsg ="可疑特征不能大于三个";             
		//}
		else if (document.forms[0].ctnm.value==''){
        	errMsg = "客户名称不能为空！";
    	}
		else if (document.forms[0].csnm.value==''){
            errMsg = "客户号不能为空！";
   		}

      	if(type=='save'){
			if(trans.length==0){
				errMsg = "请添加交易！";
			}
      	}
		//else if(kytz.length==0){
		//errMsg = "可疑特征不能为空！";
		//}
		//else if(document.forms[0].tkms.value==''){
		//errMsg = "采取措施不能为空！";
		//}else if(document.forms[0].ssds.value==''){
		//errMsg = "可疑行为描述不能为空！";
		//}
		if (errMsg != "") {
        alert(errMsg);
        return false;
    	} 
		if(type=='save' && !checkAllValidate()) {
				//alert("存在未校正的数据，保存失败！");
				return false;
				
		}else if(type=='validate') {
			//alert("存在未校正的数据，保存失败！");
			return checkAllValidate();
			
		}
			else
			{
			   //selectAllOptions(document.forms[0].list2);
			   document.forms[0].action=url;
			   document.forms[0].submit();
			}
		}
		   function _back(url){
         
          document.forms[0].action=url;
		   document.forms[0].submit();
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
 
 function changeCaseType(theUrl){
		window.location.href=theUrl;

}

		function caseChange(obj)
		{
		var url='<%=request.getContextPath()%>/report/case/t07_case_app_add_de_';
		if(obj.value=='D')
		{
			window.location.href=url+'d.do';
		}else if(obj.value=='N')
		{
			window.location.href=url+'n.do?type=n';
		}else if(obj.value=='A')
		{
			window.location.href=url+'n.do?type=a';
		}
		else if(obj.value=='C')
		{
			window.location.href=url+'c.do';
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
			
		}

		function check_party_id(obj)
		{
			 if(!IdCardCheck(obj.value)){
				 	obj.focus();
			   	}
		}
</SCRIPT>


<style type="text/css">
.STYLE2 {
	color: #ff0000
	}
</style>
</head>
<!--  <body leftmargin="0" topmargin="0" onload="card_inf_exp('1','');change_isParty('init');" class="mainbg">-->
<body leftmargin="0" topmargin="0"  class="mainbg">
<div id="main">
 <html:form action="/case/t07_case_app_add_de_n.do" method="post">
		
 		<div class="conditions">
 		
 		
				<div class="cond_t">
				  <span>人工识别 - 大额</span>
				   <span class="buttons">
			              <a href="#" onclick="changeCaseType('<%=request.getContextPath()%>/report/case/t07_case_app_add_ky_n.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_sus.png" />可 疑</a>
			               <a href="#" class="makegray"><img src="../../images/<%=session.getAttribute("style") %>/b_large.png" />大 额</a>
				  </span>
				</div>
			 
			 		<div class="cond_c2">
			          <table  border="0" cellpadding="0" cellspacing="0">
						<tr>
			              <td>案例种类：</td>
			        		 <td>
			        		 	<html:select property="case_kind" onchange="caseChange(this)">
								 <html:options collection="casecagetoryMap" property="label"	labelProperty="value" />
								 </html:select>
								<font color="#FF0000">*</font>
								</td>
							<td>案例币种：</td>
							<td>
								<html:select property="curr_cd">
								 <html:options collection="currcdMap" property="label"	labelProperty="value" />
								 </html:select>
								<font color="#FF0000">*</font>
								</td>
			      		</tr>
			          <tr>
			       		<td>机构名称：</td>
			          	<td><html:text property="ficd" readonly="true" size="10"/>
			          		<html:text  property="finm" readonly="true" size="20"/>
							 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=ficd&input_name_disp=finm','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
						    
						<font color="#FF0000"> *</font>
						</td>
						<td>大额特征
						</td>
						<td>
							<html:select property="stcr">
								 <html:options collection="bh_tezhengMap" property="label"	labelProperty="value" />
								 </html:select>
								<font color="#FF0000">*</font>
						</td>
			      	 </tr>
				  </table>
				</div>
 		</div>
 		
 			
 			<html:errors />
 		
 			<div class="conditions">
	 		<div class="cond_t">
		  		<span>客户信息</span>
			</div>			
			<div class="cond_c2">
				<table id="agent_table" border="0" cellpadding="0" cellspacing="0">
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
									<td >客 户 号：</td>
									<td> 
							
										<html:text property="csnm" onchange="change();" onblur="validate(this, '', '');validateDetail();" readonly="true" />
										<span id="no_party_id2"  style="display:none">(此处填写证件号码)</span>
										<font color="#FF0000"> *</font>
									</td>	
                                </tr>
								<tr>
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
							</table>
						</div>
			  
		
         </div>
        
       <!--   <% String url1=request.getContextPath()+"/report/case/t07_case_app_add_party.do";%>
			  <iframe src="<%=url1%>" width="100%" height="100" frameborder="0"  scrolling="auto" name="iframe_party" id="iframe_party"></iframe>
			 -->  
			 <iframe src="<%=request.getContextPath()%>/report/case/t07_case_app_add_trans.do"
				width="100%"  frameborder="0"  scrolling="no" name="iframe_cus"
				id="iframe_cus"></iframe>
		<div style=" text-align:right; height:60px">
		 <input name="" class="in_button1" type="button" value="完成" onClick="_Confim('<%=request.getContextPath() %>/report/case/t07_case_app_add_de_n_comp.do','save')"/>	
	   	</div>
		</html:form>
		</div>
	</BODY>
</HTML>
