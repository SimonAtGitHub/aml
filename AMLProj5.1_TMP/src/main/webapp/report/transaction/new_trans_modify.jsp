<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		
        <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />      
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/validate.js"></script>
		<script type="text/javascript" src="../../js/country.js"></script>
		<script type="text/javascript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>	
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
		String sItem2 = "";
		%>

		<logic:iterate id="area" name="areaList"
			type="com.ist.platform.dto.T87_PBC_AREA">
			<%
					String upId = area.getPbc_up_areakey();
					String areaId = area.getPbc_areakey();
					String areaName = area.getPbc_areaname();
					String idname2 = upId + "@" + areaId + "#" + areaName;
					sItem2 = sItem2 + ",\"" + idname2 + "\"";
			%>
		</logic:iterate>
		<%
				if (!sItem2.equals("")) {
				sItem2 = sItem2.substring(1);
			}
		%>
		<script language="JavaScript">


//将字符串转化成javascript中的数组
var g_appid = "2";
arrItem=new Array(<%=sItem2%>);
function _Click(fromstr,tostr){
   changelocation(fromstr,tostr,arrItem);
}
function  _Disp(country,area,other){
   var countryobj=eval('document.forms[0].'+country);
   var areaobj=eval('document.all.'+area);
   var otherobj=eval('document.all.'+other);
    var index=countryobj.selectedIndex; 
   var selvalue=countryobj.value;
   if(selvalue=="CHN"||selvalue=="Z01"||selvalue=="Z02"||selvalue=="Z03"){
   areaobj.style.display="";
   otherobj.style.display="none";
   }else{
    areaobj.style.display="none";
     otherobj.style.display="";
   }
}
function _Open(url){
 
   window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
   //window.open(url);
      
}

function card_inf_exp(type,value){//modify by dingke 20130710
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
				validate_type(value);
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
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
			var agent_card_type_value=document.forms[0].agent_card_type.value;
			var opp_card_type_value=document.forms[0].opp_card_type.value;
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_inf.style.visibility='hidden';
				showValidateMsg($$('card_inf',0),'4','');
			}else {
				document.forms[0].card_inf.focus();
				validate_type('card_inf');
			}
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
				document.forms[0].opp_card_inf.style.visibility='hidden';
				showValidateMsg($$('opp_card_inf',0),'4','');
			}else {
				document.forms[0].opp_card_inf.focus();
				validate_type('opp_card_inf');
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
		
		function validateAgent() {
　　　　　　 　var agent_name=document.forms[0].agent_name.value;	
			var agent_card_type=document.forms[0].agent_card_type.value;
			var agent_card_no=document.forms[0].agent_card_no.value;
			var agent_country=document.forms[0].agent_country.value;
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_name=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','代办人信息其中有一项为空时，所有代办人信息字段都应空，其中一项非空时，所有都必须非空');
			}
		}
function  _Change(curr_cd){

   var currobj=eval('document.forms[0].curr_cd');
   var cash_ind = eval('document.forms[0].cash_ind');
   var cash_indValue = cash_ind.value;
   var selvalue=currobj.value;
   if(selvalue=="1"){//本币
   		if(cash_indValue=="00"){//现钞
   			document.all.settle1.style.display="";
    		document.all.settle2.style.display="none";
    		document.all.settle3.style.display="none";
    		document.all.settle4.style.display="none";
   		}else{//非现
   			document.all.settle1.style.display="none";
    		document.all.settle2.style.display="none";
    		document.all.settle3.style.display="";
    		document.all.settle4.style.display="none";
   		}
   }else{//外币
   		if(cash_indValue=="00"){//现钞
   			document.all.settle1.style.display="none";
    		document.all.settle2.style.display="";
    		document.all.settle3.style.display="none";
    		document.all.settle4.style.display="none";
   		}else{//非现
   			document.all.settle1.style.display="none";
    		document.all.settle2.style.display="none";
    		document.all.settle3.style.display="none";
    		document.all.settle4.style.display="";
   		}
   }
}

function checkForm(theUrl){
    var errMsg ="";

    var nowDate = new Date();
	var str = nowDate.getFullYear()+"-"+(nowDate.getMonth() + 1)+"-"+nowDate.getDate();
	
     if(getLength(document.forms[0].organkey.value)==0){
    	 errMsg="交易机构号不能为空  ";
   	 }else  if(getLength(document.forms[0].party_chn_name.value)==0){
         errMsg="客户名称不能为空  ";
     }else  if(getLength(document.forms[0].host_cust_id.value)==0){
		 errMsg="客户号不能为空  ";
	 }else  if ((document.forms[0].agent_card_type.value=='19')&&(getLength(document.forms[0].card_inf.value)>30||getLength(document.forms[0].card_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
     }else	if ((document.forms[0].opp_card_type.value=='19' || document.forms[0].opp_card_type.value=='29')&&(getLength(document.forms[0].opp_card_inf.value)>30||getLength(document.forms[0].opp_card_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
     }else  if(getLength(document.forms[0].party_class_cd.value)==0){
        errMsg="客户类型不能为空  ";
     }else  if(getLength(document.forms[0].receive_pay_cd.value)==0){
     	errMsg="收付标志不能为空  ";
     }else  if(getLength(document.forms[0].debit_credit.value)==0){
    	errMsg="借贷标志不能为空  ";
     }else  if(getLength(document.forms[0].tx_type_cd.value)==0){
     	errMsg="交易类型不能为空  ";
	 }else if(getLength(document.forms[0].tx_cd.value)==0){
  		errMsg="交易代码不能为空  ";
     }else  if(getLength(document.forms[0].overarea_ind.value)==0){
       errMsg="是否跨境交易不能为空  ";
     }else if(getLength(document.forms[0].amt.value)==0){
       errMsg="原金额不能为空  ";
     }else if(!checkFloat(document.forms[0].amt.value))	{
			   		alert("金额应为数字!");
			   	 	document.forms[0].amt.focus();
			   	 	return false;
	}
     else if(getLength(document.forms[0].tx_dt_disp.value)==0){
       errMsg="交易日期不能为空  ";
    }
	else if(!_compareTwoDateForString(document.forms[0].tx_dt_disp.value,str))
	{
		errMsg = "交易日期不能大于当前系统日期";
	}
     else if(getLength(document.forms[0].cash_ind.value)==0){
          errMsg="现钞标志不能为空  ";
    }else if(getLength(document.forms[0].currency_cd.value)==0){
          errMsg="币种不能为空  ";
    }else if(document.forms[0].tx_go_country.value=="CHN"&&(document.forms[0].tx_go_area.value=="-1"||document.forms[0].tx_go_area.value=="")){
          errMsg="交易去向至少定位到省一级!";
    }else if(document.forms[0].tx_occur_country.value=="CHN"&&(document.forms[0].tx_occur_area.value=="-1"||document.forms[0].tx_occur_area.value=="")){
          errMsg="交易发生地至少定位到省一级!";
    }else if(document.forms[0].opp_country.value=="CHN"&&(document.forms[0].opp_area.value=="-1"||document.forms[0].opp_area.value=="")){
          errMsg="对方行政区代码至少定位到省一级!";
    }else if(getLength(document.forms[0].use_des.value)==0){
      	  errMsg="用途或来源不能为空";
    }else if(document.forms[0].receive_pay_cd.value=="01" && document.forms[0].debit_credit.value=="D"){
      errMsg="收付标志和借贷标志不符 ";
    }
    else if(document.forms[0].receive_pay_cd.value=="02" && document.forms[0].debit_credit.value=="C"){
      errMsg="收付标志和借贷标志不符 ";
    }else if(document.forms[0].is_party[1].checked==true)   {
		 if(!IdCardCheck(document.forms[0].host_cust_id.value)){
			 	document.forms[0].host_cust_id.focus();
		   	 	return false;
			}
			 
	 }	 

	 
	    
   	if(errMsg!=""){
        alert(errMsg);
        return false;
    }
   	if(!checkAllValidate()) {
			return false;
	}else{
	   alert("验证成功");
	}
		
    document.forms[0].action=theUrl;
    document.forms[0].submit();
    

}
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function change_area(){
var area1='0';
var area2='0';
var area3='0';
var area4='0';
var area5='0';
var area6='0';
area1='<bean:write name='t47_transaction' property='tx_go_area2'/>';
area2='<bean:write name='t47_transaction' property='tx_go_area1'/>';
area3='<bean:write name='t47_transaction' property='tx_occur_area2'/>';
area4='<bean:write name='t47_transaction' property='tx_occur_area1'/>';
area5='<bean:write name='t47_transaction' property='opp_area2'/>';
area6='<bean:write name='t47_transaction' property='opp_area1'/>';
  changeArea('tx_go_area','tx_go_area1',arrItem,'tx_go_area2',area2,'1');
  changeArea('tx_go_area1','tx_go_area2',arrItem,'',area1,'0');
  changeArea('tx_occur_area','tx_occur_area1',arrItem,'tx_occur_area2',area4,'1');
  changeArea('tx_occur_area1','tx_occur_area2',arrItem,'',area3,'0');
  changeArea('opp_area','opp_area1',arrItem,'opp_area2',area6,'1');
  changeArea('opp_area1','opp_area2',arrItem,'',area5,'0');
}

</script>
<script type="text/javascript">
	function changeSF_JD(obj){
		var str = obj.value;
		if(str=='01'){//收
			document.forms[0].debit_credit.value='C';
		}
		if(str=='02'){//付
			document.forms[0].debit_credit.value='D';
		}
		if(str=='C'){//贷
			document.forms[0].receive_pay_cd.value='01';
		}
		if(str=='D'){//借
			document.forms[0].receive_pay_cd.value='02';
		}
	}
	function change_isParty(type)//是否本行客户
	{	
		var flag=document.getElementsByName("is_party");
			//alert(flag[0].checked);
			var party_name=document.getElementsByName("party_chn_name");
			var party_id=document.getElementsByName("host_cust_id");

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
</script>


	<body  class="mainbg" onload="card_inf_exp('1','');_Change('curr_cd');_Disp('tx_go_country','org','space');_Disp('tx_occur_country','org1','space1');_Disp('opp_country','org2','space2');change_area();change_isParty('init');">
	
	<html:form action="/transaction/new_trans_modify.do" method="post">
	<div id="main"><html:hidden name="t47_transaction" property="validateflag" />
	<!-- conditions -->
			<div class="conditions">
				
				
					<div class="cond_t">
						<span>修改交易</span>
						<span class="buttons"> 
								<a href="#" onclick="checkForm('new_trans_modify_do.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
								<a href="#" onclick="dosubmit('new_trans_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> 
						</span>
					</div>

					<input type="hidden" name="transactionkey" value="<bean:write name="transactionkey"/>"/>
					<div class="cond_c2">
						
						<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />机构信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
						
							<tr>
								<td>
									机构网点代码：
								</td>
								<td>
									<html:text property="organkey" 	size="25" readonly="true" />

										<%
												String root = request.getContextPath();
												String root3 = "\"window.open('"
												+ root
												+ "/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes')\"";
										%>
									<a href="#" onclick=<%=root3%> ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
										
										<font color="red">*</font>

									</td>
									<td>
										机构名称：
									</td>
									<td>
										<html:text property="organName" 
											size="25" readonly="true" />
									</td>
								</tr>
								<tr	>
									<td>
										机构与大额交易的关系：
									</td>
									<td colspan="3">
										<html:select property="org_trans_rela" >
											<html:options collection="org_trans_relaMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									
								</tr>
							
			</table>
					</div>
					
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />代办人信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" align="center"
							id="agent_table">		
								<tr>
									<td>
										代办人姓名：
									</td>
									<td>
										<html:text property="agent_name" 
											size="25" onchange="change();"
											onblur="validate(this, 'agent_country', 'agent_card_type');" />
									</td>
									<td>
										代办人国籍：
									</td>
									<td>
									
											<html:select property="agent_country"  
										onchange="change();validate($$('agent_name',0), 'agent_country', '');validateAgent();"
										>
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>
									</td>
								</tr>
								<tr>
									<td>
										代办人证件类型：
									</td>
								
									<td align="left" colspan="3">
									<html:select property="agent_card_type" style="width:250px"  
										onchange="card_inf_exp('agent_card_type','card_inf');change();validate($$('agent_card_no',0), 'agent_card_type', '');validateAgent();"
										>
										<html:options collection="BITPMap" property="label"
												labelProperty="value" />
									</html:select>
									<html:text property="card_inf" size="25" maxlength="30"
										onblur="validate_type('card_inf');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
								</tr>
								<tr>
									<td>
										代办人证件号码：
									</td>
									<td colspan="3">
											<html:text property="agent_card_no" onchange="change();"  size="25"
										onblur="validate(this, 'agent_card_type', '');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
									</td>
								</tr>
								</table>
					</div>
								
						<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />交易信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table width="100%" border="0" cellpadding="1" cellspacing="1">
	
						
								
                            <tr>
									<td>
										流水号：
									</td>
									<td >
										<html:text property="tx_no" 
											size="25"/>
                                    </td>
									<td>
										交易类型：
									</td>
									<td>
										<html:select property="tx_type_cd" onchange="_ChangeColor()">
											<html:options collection="tx_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
								</tr>
								<tr> 
									<td>是否本行客户</td>
									
									<td colspan="3">
									<html:radio property="is_party" value="1" onclick="change_isParty();">是</html:radio>
									<html:radio property="is_party" value="0" onclick="change_isParty();">否</html:radio>&nbsp<font color="red">*</font>	
									
									</td>
								
								</tr>
								<tr>
									<td >
										客户名称：
									</td>
									<td >
										<html:text property="party_chn_name" readonly="true"
											size="25" />

										<a id="no_party_id" href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=host_cust_id&input_name_disp=party_chn_name','', 'height=400, width=900,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>	
										<font  color="red">*</font>
										
									</td>
									<td>
										客户号：
									</td>
									<td >
										<html:text property="host_cust_id" readonly="true" 
											size="25"/>										
										<span id="no_party_id2"  style="display:none">(此处填写身份证号)</span>
										<font  color="red">*</font>
									</td>
								</tr>
								

								<tr>
									<td>
										账号：
									</td>
									<td>
										<html:text property="acct_num" 
											size="20" onchange="change();"
											onblur="validate(this, '', '')" />
										
										
									</td>
									<td >
										客户类型：
									</td>
									<td >
										<html:select property="party_class_cd"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="party_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>

								</tr>
								<tr>
									<td>
										收/付：
									</td>
									<td>
										<html:select property="receive_pay_cd"
											onchange="changeSF_JD(this);"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="receive_payMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
									<td>
										借/贷：
									</td>
									<td>
										<html:select property="debit_credit"
											onchange="changeSF_JD(this);"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="debit_creditMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
								</tr>
								
								<tr>
									<td>
										是否跨境交易：
									</td>
									<td>
										<html:select property="overarea_ind">
											<html:options collection="overareaMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
									<td>
										原金额：
									</td>

									<td>
										<input type="text" name="amt"  value="<bean:write name="t47_transactionActionForm" property="amt_disp"/>" size="25" maxlength="15"/>
										
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										本外币标志：
									</td>
									<td>
										<html:select property="curr_cd" onchange="_Change('curr_cd')"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="currencyMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
									<td>
										交易日期：
									</td>
									<td>
										<input type="text" name="tx_dt_disp" value="<bean:write name="t47_transactionActionForm" property="tx_dt_disp" scope="request"/> "
											size="12"  onclick="calendar.show(this);"  class="calimg"/>										
										<font color="red">*</font>
									</td>
									

								</tr>


								<tr>
									<td>
										现钞标志：
									</td>
									<td height="22" bgcolor="F6F9FF">
										<html:select property="cash_ind" onchange="_Change('curr_cd');"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="t87_pbc_cashMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>

									</td>
									<td>
										币种：
									</td>

									<td >
										<html:select property="currency_cd"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="currency_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
									</tr>
									<tr>
									<td >
										支付工具及结算方式：
									</td>
									<td >
										<html:select property="settle_type_cd1" styleId="settle1"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="t87_pbc_gjfs1Map" property="label"
												labelProperty="value" />
										</html:select>
									
									
										<html:select property="settle_type_cd2" styleId="settle2"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="t87_pbc_gjfs2Map" property="label"
												labelProperty="value" />
										</html:select>
									
										<html:select property="settle_type_cd3" styleId="settle3"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="t87_pbc_gjfs3Map" property="label"
												labelProperty="value" />
										</html:select>
									
										<html:select property="settle_type_cd4" styleId="settle4"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="t87_pbc_gjfs4Map" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									<td>
										 交易代码：
									</td>
									<td >
										<html:select property="tx_cd">
											<html:options collection="tx_cdMap" property="label"
												labelProperty="value" />
										</html:select>
										
										<font color="red">*</font>
									</td>
									
								</tr>
								<tr>
									<td>
										涉外收支交易分类与代码：
									</td>
									<td colspan="3">
										<html:select property="tsctkey" 
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="tsctMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									
								</tr>
							


								<tr>
									<td>
										交易去向：
									</td>
									<td colspan='3'>
										<html:select property="tx_go_country"
											onchange="_Disp('tx_go_country','org','space')">
											<html:options collection="countryMap" property="label"
												labelProperty="value" />
										</html:select>
									
									<span id="org">
									<html:select property="tx_go_area"
											onchange="_Click('tx_go_area','tx_go_area1')">
											<html:options collection="area1Map" property="label"
												labelProperty="value" />
										</html:select>&nbsp;&nbsp;<html:select property="tx_go_area1"
											onchange="_Click('tx_go_area1','tx_go_area2')">
											<option value="-1">
												请选择
											</option>
										</html:select>&nbsp;&nbsp;<html:select property="tx_go_area2">
											<option value="-1">
												请选择
											</option>
										</html:select>
									</span>
									<span id="space" ></span>
								</td>
									
								</tr>
								<tr>
									<td>
										交易发生地：
									</td>
									<td colspan='3'>
										<html:select property="tx_occur_country"
											onchange="_Disp('tx_occur_country','org1','space1')">
											<html:options collection="countryMap" property="label"
												labelProperty="value" />
										</html:select>
										
									<span id="org1">
										<html:select property="tx_occur_area"
											onchange="_Click('tx_occur_area','tx_occur_area1')">
											<html:options collection="area1Map" property="label"
												labelProperty="value" />
										</html:select>&nbsp;&nbsp;<html:select property="tx_occur_area1"
											onchange="_Click('tx_occur_area1','tx_occur_area2')">
											<option value="-1">
												请选择
											</option>
										</html:select>&nbsp;&nbsp;<html:select property="tx_occur_area2">
											<option value="-1">
												请选择
											</option>
										</html:select>
										</span>
										<span id="space1" ></span>
									</td>
									
								</tr>
								<tr>
									<td>
										用途或来源：
									</td>
									<td colspan="3">
										<html:textarea property="use_des" cols="80" rows="2"
											onchange="change();" onblur="validate(this, '', '')"></html:textarea>
										<font color="red">*</font>
									</td>
									
								</tr>
					</table>
					</div>
						<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />对手信息</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">

			
								<html:hidden property="opp_sys_id" />
								<html:hidden property="opp_pbc_party_class_cd" />
								<html:hidden property="opp_party_id" />
								<tr>
									<td>
										对方客户名称：
									</td>
									<td>

										<html:text property="opp_name" 
											size="25" onchange="change();"
											onblur="validate(this, 'opp_area', 'opp_card_type');" />
										<a href="#" onclick="_Open('<%=request.getContextPath() %>/report/case/t47case_opp_info_list.do?flag=1')" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
										<span id="color00"></span> 


									</td>

									<td>
										对手是否离岸账户：
									</td>
									<td>
										<html:select property="opp_off_shore_ind">
											<html:options collection="oppoffMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								<tr>
								<!-- 
									<td>
										对方客户类型：
									</td>
									<td >
										<html:select property="opp_party_class_cd"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="party_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										

										<span id="color01"></span>
										
									</td>  -->
									<td>
										对方账号：
									</td>
									<td >
										<html:text property="opp_acct_num" 
											size="25" onchange="change();"
											onblur="validate(this, 'opp_acct_type_cd', '');" />

										<span id="color12"> </span>
									</td>
									</tr>
									<tr>
									<td>
										对方账号类型：
									</td>
									<td colspan="3"><!-- style="width:160" -->
										<html:select property="opp_acct_type_cd" 
											onchange="change();validate($$('opp_acct_num',0), 'opp_acct_type_cd', '');">
											<html:options collection="pbc_catpMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								
								<tr>
									<td>
										对方客户证件类型：
									</td>
									<td colspan="3">
										<html:select property="opp_card_type"  styleId="opp_card_type"
											onchange="card_inf_exp('opp_card_type','opp_card_inf');change();validate($$('opp_name',0), 'opp_area', 'opp_card_type');change();validate($$('opp_card_no',0), 'opp_card_type', '');">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:text  property="opp_card_inf" styleId="opp_card_inf" size="30" maxlength="30" onblur="validate_type('opp_card_inf');"/>
									</td>
									</tr>
								

								<tr>
									<td>
										对方客户证件号码：
									</td>
									<td>
										<html:text property="opp_card_no" 
											size="25" onchange="change();"
											onblur="validate(this, 'opp_card_type', '');" />
									</td>


									<td>
										对方金融机构代码类型：
									</td>
									<td>
										<html:select property="opp_organ_type" 
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="change();"
											onblur="validate($$('opp_organkey',0), '', 'opp_organ_type');">
											<html:options collection="opp_organ_typeMap" property="label"
												labelProperty="value" />
										</html:select>

									</td>
								</tr>
								<tr>
									<td>
										对方金融机构名称：
									</td>
									<td>
										<html:text property="opp_organname" 
											size="25" onchange="change();"
											onblur="validate(this, '', '')" />
									</td>
									<td>
										对方金融机构代码：
									</td>
									<td>
										<html:text property="opp_organkey" 
											size="25" onchange="change();"
											onblur="validate(this, '', 'opp_organ_type');" />
  										<a href="#" onclick="_Open('<%=request.getContextPath() %>/report/case/t47case_opp_bank_list.do?flag=1&newflag=1')" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />机构信息</span></a>  
									</td>
								</tr>
								<tr bgcolor="F6F9FF">
									<td>
										对方机构行政区代码：
									</td>
									<td colspan='3'>
										<html:select property="opp_country"
											onchange="_Disp('opp_country','org2','space2')">
											<html:options collection="countryMap" property="label"
												labelProperty="value" />
										</html:select>
										
									
									<span id="org2" >	
										<html:select property="opp_area"
											onchange="_Click('opp_area','opp_area1')">
											<html:options collection="area1Map" property="label"
												labelProperty="value" />
												
										</html:select>&nbsp;&nbsp;<html:select property="opp_area1"
											onchange="_Click('opp_area1','opp_area2')">
											<option value="-1">
												请选择
											</option>
											
										</html:select>&nbsp;&nbsp;<html:select property="opp_area2">
											<option value="-1">
												请选择
											</option>
										</html:select>
										</span>
										<span id="space2" ></span>
									</td>
									
								</tr>
								</table>
					</div>
							
				
		</div>
				<!--提示块-->
				<div id=div_hint	style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div>
</div>
</html:form>
</body>
</html>
