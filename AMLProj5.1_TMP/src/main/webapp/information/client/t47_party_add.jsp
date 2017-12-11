 <%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
function _submit(type,id){

if (type=='C'){
  document.forms[0].action= "/information/client/t47_party_modify1.do?newsearchflag=1&party_id="+id
  
  }else  {
  document.forms[0].action= "/information/client/t47_party_modify.do?newsearchflag=1&party_id="+id
  }
  document.forms[0].submit();
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          if(checkRadio(document.forms[0].party_id)<0){
           errMsg = "请选择！";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].party_id)<0){
                errMsg = "请选择！";
            }
            if(errMsg==''){
                if(confirm('你真的要删除所选的一批样品吗？')){
                    isSub = true;
                }
            }
        
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function card_inf_exp(type,value){
if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
				var validate_typeNode=document.getElementById(type);
				var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}
			}
		}else{
		 	var agent_card_type_value=document.forms[0].card_type;
		 	
			var class_cdValue='<bean:write name="party_class_cd"></bean:write>';			
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_type_inf.style.visibility='hidden';
			}else {
				document.forms[0].card_type_inf.focus();
			}
			if(class_cdValue=='C'){
				var legal_card_type_value=document.forms[0].legal_card_type.value;
					if(legal_card_type_value!='19' && legal_card_type_value!='29'){
						document.forms[0].legal_card_type_inf.style.visibility='hidden';
					}else {
						document.forms[0].legal_card_type_inf.focus();
					}				
			}
		}
		}
		function validate_type(value){
			var validate_type_value=eval('document.forms[0].'+value+'.value');
			//删除节点
			var validate_typeNode=document.getElementById(value);
			var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}			
			if(getLength(validate_type_value)>30||getLength(validate_type_value)<=0){
				//alert("请写入详细的类型信息或者证件类型的注释应小于30个字符！");
				var newimage=document.createElement("font");
				newimage.setAttribute("color", "#ff0000");
				var text=document.createTextNode("请输入证件的详细信息，并且在30个字符之内！");
				newimage.appendChild(text);
				parent.appendChild(newimage);
			}else{
				var newimage=document.createElement("img");
				newimage.setAttribute("src", "../../images/validate.jpg");
				parent.appendChild(newimage);
			}
		}
function _Click(party_id,party_chn_name){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function _Commit(){
    if(checkRadio(document.forms[0].party_id)<0){
           alert("请选择！");
           return false;
    } 
     opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     window.close();
}
function checkID(numstr){
var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='X'&& TempChar!='x'&& TempChar!='-'){
           i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
function checkForm(theUrl,type){
    var errMsg ="";
    //客户名称
    if (getLength(document.forms[0].party_chn_name.value)==0) {
        errMsg = "客户名称不能为空！";
        document.forms[0].party_chn_name.focus();
    }//证件类型
    else if (document.forms[0].card_type.value=="") {
        errMsg = "证件类型不能为空！";
       
    }
     else if ((document.forms[0].card_type.value =="19"||document.forms[0].card_type.value =="29")&&(getLength(document.forms[0].card_type_inf.value)>30||getLength(document.forms[0].card_type_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
    }
    
    else if (document.forms[0].card_type.value=="11"&&(getLength(document.forms[0].card_no.value)!=15&&getLength(document.forms[0].card_no.value)!=18)){
    errMsg = "身份证应为15或18位！";
        document.forms[0].card_no.focus();
    }
    else if(document.forms[0].card_type.value=="11"&&IdCardValidate(document.forms[0].card_no.value)==false){
        document.forms[0].card_no.focus();
    }
    //归属机构
    else if (getLength(document.forms[0].organkey.value)==0) {
        errMsg = "归属机构不能为空！";
        document.forms[0].organkey.focus();
    }
    //证件号码
    else if (getLength(document.forms[0].card_no.value)==0) {
        errMsg = "证件号码不能为空！";
        document.forms[0].card_no.focus();
    }else if(document.forms[0].card_no.length <= 18){
    	errMsg="证件号码必须小于18位";
    }
    //国籍
    else if (getLength(document.forms[0].country_cd.value)==0) {
        errMsg = "客户国籍不能为空！";
        document.forms[0].country_cd.focus();
    }
    //客户类型
    else if (getLength(document.forms[0].aml2_type_cd.value)==0) {
        errMsg = "客户类型不能为空！";
        document.forms[0].aml2_type_cd.focus();
    }
   //移动电话必须为数字
    else if((getLength(document.forms[0].cell_no.value)!=0) && (!checkTelephone(document.forms[0].cell_no.value))){
    	errMsg = "移动电话号码不符合标准！";
        document.forms[0].cell_no.focus();
    }//固定电话必须为数字
    else if((getLength(document.forms[0].tel_no.value)!=0) && (!checkTelephone(document.forms[0].tel_no.value))){
    	errMsg = "固定电话号码不符合标准！";
        document.forms[0].tel_no.focus();
    }//邮政编码必须为数字
    else if((getLength(document.forms[0].postalcode.value)!=0) && (!checkNum(document.forms[0].postalcode.value))){
    	errMsg = "邮政编码必须为数字！";
        document.forms[0].postalcode.focus();
    }//注册资金必须为数字
    else if((type=='C') && (getLength(document.forms[0].enrol_fund_amt.value)!=0) && (!checkNum(document.forms[0].enrol_fund_amt.value))){
    	errMsg = "注册资金必须为数字！";
        document.forms[0].enrol_fund_amt.focus();    
    }
    var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } else {
    	document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function validateCardNo(cardnovalue){
 var cardtype=document.forms[0].card_type.value;
 if(cardtype=="11"){
	 IdCardValidate(cardnovalue);
 }
}
function init() {
	var country_cdOptions = document.getElementById('country_cd').getElementsByTagName('option');
	for(var i = 0; i < country_cdOptions.length; i ++) {
		if(country_cdOptions[i].value == "CHN" && !country_cdOptions[i].selected) {
			country_cdOptions[i].selected = true;
			break;
		}
	}
	<logic:equal name="party_class_cd" value="I">
		var aml2_type_cdOptions = document.getElementById('aml2_type_cd').getElementsByTagName('option');
		for(var i = 0; i < aml2_type_cdOptions.length; i ++) {
			if(aml2_type_cdOptions[i].value == "02" && !aml2_type_cdOptions[i].selected) {
				aml2_type_cdOptions[i].selected = true;
				break;
			}
		}
	</logic:equal>
}
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0"  onload="card_inf_exp('1','');init();">
	<div id="main">
		<html:form action="/client/t47_party_add.do" method="post">
			<div class="conditions">
				<div class="cond_t">
				 <span>添加<logic:equal name="party_class_cd" value="I">对私</logic:equal><logic:equal name="party_class_cd" value="C">对公</logic:equal>客户信息 
				 </span>
				 <span class="buttons">
				 <a href="t47_party_list.do?newsearchflag=0"  ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
				 </span>
			</div>
			<html:errors/>
			<div class="cond_t">
										<span>客户概况：</span></div>
										<div class="cond_c">
									 <table  border="0" cellpadding="0" cellspacing="0">
								<html:hidden property="party_class_cd"></html:hidden>
								<tr>
									<td >
										 客户名称：
									</td>
									<td >
											<html:text property="party_chn_name" size="25" /> <font color="#FF0000">*</font> 
										</td>
								<td>
										 客户证件类型：
									</td>
									<td  >
									<logic:equal name="party_class_cd" value="I">
										<html:select property="card_type" style="width:250" onchange="card_inf_exp('card_type','card_type_inf');"
												onmouseover="selMouseOver(this,$('div_hint'))"
												onmouseout="selMouseOut(this,$('div_hint'))">
												<html:options collection="card_type_iMap" property="label"
													labelProperty="value" />
											</html:select> <font color="#FF0000">*</font> 
									</logic:equal>
										<logic:equal name="party_class_cd" value="C">
										<html:select property="card_type" style="width:250" onchange="card_inf_exp('card_type','card_type_inf');"
												onmouseover="selMouseOver(this,$('div_hint'))"
												onmouseout="selMouseOut(this,$('div_hint'))">
												<html:options collection="card_type_cMap" property="label"
													labelProperty="value" />
											</html:select> <font color="#FF0000">*</font> 
										</logic:equal>
											<html:text  property="card_type_inf" size="30" maxlength="30" onblur="validate_type('card_type_inf');"/>
										</td>								
								</tr>
								<tr>
								<td  >
										 客户归属机构：
									</td>
									
										<td >
										<html:text property="organkey"  size="10" readonly="true" onblur="_Onblur('organ_name')"/>		
										<html:text property="organ_name" size="20" readonly="true"/>
									
									 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organ_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									<font color="#FF0000">*</font> 
									 </td>
									<td  >
										 客户证件号码：
									</td>
									   <td  >
											<html:text property="card_no" size="25"  onblur="validateCardNo(this.value);" /> <font color="#FF0000">*</font> 
										</td>
								</tr>
								<tr>
									<td >
										 客户国籍：
									</td>
									  <td >
											<html:select property="country_cd">
												<html:options collection="nationalityMap" property="label"
													labelProperty="value" />
											</html:select> <font color="#FF0000">*</font> 
										</td>
									<td  >
										 客户类型：
									</td>
									<td  >
									<logic:equal name="party_class_cd" value="I">
										<html:select property="aml2_type_cd" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_cttp1Map" property="label"
												labelProperty="value" />
										</html:select> <font color="#FF0000">*</font> 
										</logic:equal>
										<logic:equal name="party_class_cd" value="C">
										<html:select property="aml2_type_cd" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_cttp2Map" property="label"
												labelProperty="value" />
										</html:select> <font color="#FF0000">*</font> 
										</logic:equal>
									</td>
								</tr>
								<tr>
								<logic:equal name="party_class_cd" value="I">
								   <td >
										 对私客户职业：
									</td>
									<td  >
										<html:select property="occupation" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_ctvc_iMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									</logic:equal>
										<logic:equal name="party_class_cd" value="C">
										<td >
										对公客户行业：
									</td>
									<td >
										<html:select property="industrykey" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_ctvc_cMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
										</logic:equal>
						          <logic:equal name="party_class_cd" value="C">
									  <td> 注册资金币种： </td>
					                  <td>
                   
								  <html:select property="enrol_fund_currency_cd">
                                      <html:options collection="pbc_currencyMap" property="label"
											labelProperty="value" />
                                     </html:select>
					                     </td>	
						             </logic:equal>
						               <logic:equal name="party_class_cd" value="I">
									   <td  >
										 系统客户类型：
									</td>
									<td >
									
										<html:select property="aml1_type_cd" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="aml1_indiMap" property="label"
												labelProperty="value" />
										</html:select>
										
									</td>
						             </logic:equal>
								</tr>
								<logic:equal name="party_class_cd" value="C">
								<tr>
								 <td  >注册资金：</td>
								 <td  ><html:text property="enrol_fund_amt" size="25" /> </td>
								  <td >法定代表人身份证件类型：</td>
								 <td >
              <html:select onchange="card_inf_exp('legal_card_type','legal_card_type_inf');" property="legal_card_type" style="width:250"  onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))" >
				<html:options collection="agent_typeMap" property="label" labelProperty="value" />
			</html:select> 
			<html:text  property="legal_card_type_inf" size="30" maxlength="30" onblur="validate_type('legal_card_type_inf');"/>
              </td>	
								
								</tr>
								<tr>
								  <td >法定代表人姓名：</td>
								<td  >  <html:text property="legal_obj" size="25" /> </td>
								 <td  >法定代表人身份证件号码：</td>
								<td  ><html:text property="legal_card_no" size="25" /></td>	
								</tr>
                                </logic:equal>
                                
                                <logic:equal name="party_class_cd" value="C">
								<tr>
									<td>机构信用代码：</td>
									<td><html:text property="org_credit_no" size="25"  /></td>
									<td>机构信用代码有效期：</td>
									<td>
									<html:text property="org_credit_vt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
								</tr>
                                </logic:equal>
                                
                                
                                	<logic:equal name="party_class_cd" value="C">
                                <tr>
                                 <td>
										 系统客户类型：
									</td>
									<td  colspan="3">
									
										<html:select property="aml1_type_cd" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="aml1_corpMap" property="label"
												labelProperty="value" />
										</html:select>
								
									</td>
                                </tr>
                                </logic:equal>
							</table>
					 
					 </div>
					 
							
							<div class="cond_t">
										<span>通讯信息：</span>
									 </div>
									 	<div class="cond_c">
								<table   border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td  >
										通信地址1：
									</td>
									<td >
										<html:text property="addr1" size="25" />
									</td>
									
									<td  >
										通信地址2：
									</td>
									<td >
										<html:text property="addr2" size="25" />
									</td>
								</tr>
								<tr>
									<td >
										移动电话：
									</td>
									<td >
										<html:text property="cell_no" size="25" />
									</td>
									<td >
										固定电话：
									</td>
									<td  >
										<html:text property="tel_no" size="25" />
									</td>
								</tr>
								<tr>
									<td  >
										网址：
									</td>
									<td  >
										<html:text property="net_address" size="25" />
									</td>
									<td  >
										E-Mail：
									</td>
									<td >
										<html:text property="email_addr" size="25" />
									</td>
								</tr>
								<tr>
									<td  >
										邮政编码：
									</td>
									<td  >
										<html:text property="postalcode" size="25" />
									</td>
									<td  ></td>
									<td  ></td>
								</tr>
									<tr>
									<td  >
									</td>
									<td   colspan="4" align="center" class="in_button">
									<logic:equal name="party_class_cd" value="I">
									<input type="button" name="button1" value="保 存" class="input" 
							     onclick="checkForm('<%=request.getContextPath()%>/information/client/t47_party_add_do.do?newsearchflag=1&party_class_cd=<bean:write name="party_class_cd"/>','I')" />
							     </logic:equal>
							     <logic:equal name="party_class_cd" value="C">
									<input type="button" name="button1" value="保 存" class="input" 
							     onclick="checkForm('<%=request.getContextPath()%>/information/client/t47_party_add_do.do?newsearchflag=1&party_class_cd=<bean:write name="party_class_cd"/>','C')" />
							     </logic:equal>
							       
									<html:reset styleClass="input" value="重 置"/>
									</td>
									<td  >
									
									</td>
								</tr>
							</table>
				 </div>
				 </div>
		</html:form>
	 </div>
	 <!--提示块-->
		<div id=div_hint
			style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div>
	</BODY>
</HTML>