<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<script language="javascript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
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
function _Click(party_id,party_chn_name){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
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
				
					var card_type_value=document.forms[0].card_type.value;
					if(card_type_value!='19' && card_type_value!='29'){
						document.forms[0].card_type_inf.style.visibility='hidden';
					}else {
						document.forms[0].card_type_inf.focus();
					}					
		}
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
function checkForm(theUrl){
    var errMsg ="";
    //客户名称
    if (getLength(document.forms[0].party_chn_name.value)==0) {
        errMsg = "客户名称不能为空！";
        document.forms[0].party_chn_name.focus();
    }//证件类型
    else if (getLength(document.forms[0].card_type.value)==0) {
        errMsg = "证件类型不能为空！";
        document.forms[0].card_type.focus();
    }else if ((document.forms[0].card_type.value =="19"||document.forms[0].card_type.value =="29")&&(getLength(document.forms[0].card_type_inf.value)>30||getLength(document.forms[0].card_type_inf.value)<=0)) {
        errMsg = "请输入证件的详细信息，并且在30个字符之内！";
         document.forms[0].card_type_inf.focus();
    }
    //客户号
    else if (getLength(document.forms[0].host_cust_id.value)==0) {
        errMsg = "客户号不能为空！";
        document.forms[0].host_cust_id.focus();
    }
    //证件号码
    else if (getLength(document.forms[0].card_no.value)==0) {
        errMsg = "证件号码不能为空！";
        document.forms[0].card_no.focus();
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
   //客户号必须为数字
   // else if(!checkID(document.forms[0].card_no.value)){
    //	errMsg = "证件号码必须为数字或'X'!";
      //  document.forms[0].card_no.focus();
   // }//移动电话必须为数字
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
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0"  class="mainbg" onload="card_inf_exp('1','');"><br>
	<div class="main">
		<html:form action="/client/t47_party_modify.do" method="post">
			<div class="conditions">
				<div class="cond_t">
					<span>修改对私客户信息  </span>
					<span class="buttons"> <a href="t47_party_list.do?newsearchflag=0"><img
								src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a> </span>
				</div>
		
			  	<html:hidden property="party_id"></html:hidden>
									<html:hidden property="party_class_cd"></html:hidden>
			   
                  
                <div class="cond_t">    <span> 客户概况  </span> </div>
                   	  <div class="cond_c2">
                   <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
									<td  >
										 客户归属机构：
									</td>
									<logic:equal property="organkey_flag" name="t47_party"
										value="0">
										<td >
											<html:text  name="t47_party" property="organname" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										</td>
									</logic:equal>
									<logic:notEqual property="organkey_flag" name="t47_party"
										value="0">
												<td width="36%" bgcolor="F6F9FF">
											<%--<html:hidden property="organkey"/>--%>	
											<html:text property="organkey"  size="10" onblur="_Onblur('organ_name')"/>	
										<html:text name="t47_party" property="organname" size="20" readonly="true"/>
									 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									</td>
									</logic:notEqual>
									<td  >
										
									</td>
									
									<td  >
											
										</td>
									
								</tr>
								<tr>
								
									<td >
										 客户名称：
									</td>
									<logic:equal property="party_chn_name_flag" name="t47_party"
										value="0">
										<td >
											<html:text property="party_chn_name" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										
										</td>
									</logic:equal>
									<logic:notEqual property="party_chn_name_flag" name="t47_party"
										value="0">
										<td width="36%" bgcolor="F6F9FF">
											<html:text property="party_chn_name" size="25" /> <font color="#FF0000">*</font> 
										</td>
									</logic:notEqual>
									<td width="14%" align="right" bgcolor="ECF3FF">
										 客户证件类型：
									</td>
									<logic:equal property="card_type_flag" name="t47_party"
										value="0">
										<td >
											<html:text property="card_type_disp" size="25"
												readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										<html:hidden property="card_type"></html:hidden>
										</td>
									</logic:equal>
									<logic:notEqual property="card_type_flag" name="t47_party"
										value="0">
										
										<td >
											<html:select property="card_type" style="width:250" onchange="card_inf_exp('card_type','card_type_inf');"
												onmouseover="selMouseOver(this,$('div_hint'))"
												onmouseout="selMouseOut(this,$('div_hint'))">
												<html:options collection="card_typeMap" property="label"
													labelProperty="value" />
											</html:select> <font color="#FF0000">*</font> 
										<html:text  property="card_type_inf" size="15" maxlength="30" onblur="validate_type('card_type_inf');"/>
										</td>
									</logic:notEqual>
								</tr>
								<tr>
									<td >
										 客户号：
									</td>
									<logic:equal property="host_cust_id_flag" name="t47_party"
										value="0">
										<td width="36%" bgcolor="F6F9FF">
											<html:text property="host_cust_id" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										
										</td>
									</logic:equal>
									<logic:notEqual property="host_cust_id_flag" name="t47_party"
										value="0">
										<td >
											<html:text property="host_cust_id" size="25" readonly="true"/> <font color="#FF0000">*</font> 
										</td>
									</logic:notEqual>
									<td >
										 客户证件号码：
									</td>
									<logic:equal property="card_no_flag" name="t47_party" value="0">
										<td bgcolor="F6F9FF">
											<html:text property="card_no" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										
										</td>
									</logic:equal>
									<logic:notEqual property="card_no_flag" name="t47_party"
										value="0">
										<td bgcolor="F6F9FF">
											<html:text property="card_no" size="25"  onblur="validateCardNo(this.value);" /> <font color="#FF0000">*</font> 
										</td>
									</logic:notEqual>
								</tr>
								<tr>
									<td >
										 客户国籍：
									</td>
									<logic:equal property="country_cd_flag" name="t47_party"
										value="0">
										<td width="36%" bgcolor="F6F9FF">
											<html:text property="country_disp" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										<html:hidden property="country_cd"></html:hidden>
									</td>
									</logic:equal>
									<logic:notEqual property="country_cd_flag" name="t47_party"
										value="0">
										<td >
											<html:select property="country_cd">
												<html:options collection="nationalityMap" property="label"
													labelProperty="value" />
											</html:select> <font color="#FF0000">*</font> 
										</td>
									</logic:notEqual>
									<td >
										 客户类型：
									</td>
									<logic:equal property="aml2_type_cd_flag" name="t47_party"
										value="0">
									<td >
										<html:text property="aml2_type_disp" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										<html:hidden property="aml2_type_cd"></html:hidden>
								  </td>
									</logic:equal>
									<logic:notEqual property="aml2_type_cd_flag" name="t47_party"
										value="0">
										<td>
										<html:select property="aml2_type_cd" 
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_cttp1Map" property="label"
												labelProperty="value" />
										</html:select> <font color="#FF0000">*</font> 
									</td>
									</logic:notEqual>
								</tr>
								<tr>
									<td >
										 对私客户职业：
									</td>
									<logic:equal property="occupation_flag" name="t47_party"
										value="0">
									<td width="36%" bgcolor="F6F9FF">
										<html:text property="occupation_disp" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										<html:hidden property="occupation"></html:hidden>
									</td>
									</logic:equal>
									<logic:notEqual property="occupation_flag" name="t47_party"
										value="0">
										<td width="36%" bgcolor="F6F9FF">
										<html:select property="occupation" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="pbc_ctvc_iMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									</logic:notEqual>
									<td >
										 系统客户类型：
									</td>
									<logic:equal property="aml1_type_cd_flag" name="t47_party"
										value="0">
									<td width="36%" bgcolor="F6F9FF">
										 <html:text property="aml1_type_disp" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
										<html:hidden property="aml1_type_cd"></html:hidden>
										</td>
									</logic:equal>
									<logic:notEqual property="aml1_type_cd_flag" name="t47_party"
										value="0">
										<td width="36%" bgcolor="F6F9FF">
										<html:select property="aml1_type_cd" style="width:250"
											onmouseover="selMouseOver(this,$('div_hint'))"
											onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="aml1_indiMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									</logic:notEqual>
								</tr>

							</table>
						 
					 </div>
							<div class="cond_t">
										<span>通讯信息：</span>
									 </div>
									 	<div class="cond_c">
										 	<table   border="0" cellpadding="0" cellspacing="0">
										 		<tr>
									<td >
										通信地址1：
									</td>
									<logic:equal property="addr1_flag" name="t47_party"
										value="0" >
									<td >
										<html:text property="addr1" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="addr1_flag" name="t47_party"
										value="0">
										<td >
										<html:text property="addr1" size="25" />
									</td>
									</logic:notEqual>
									<td >
										通信地址2：
									</td>
									<logic:equal property="addr2_flag" name="t47_party"
										value="0" >
									<td width="36%" bgcolor="F6F9FF">
										<html:text property="addr2" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="addr2_flag" name="t47_party"
										value="0">
											<td >
										<html:text property="addr2" size="25" />
									</td>
									</logic:notEqual>
								</tr>
								<tr>
									<td >
										移动电话：
									</td>
									<logic:equal property="cell_no_flag" name="t47_party"
										value="0" >
									<td width="36%" bgcolor="F6F9FF">
										<html:text property="cell_no" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="cell_no_flag" name="t47_party"
										value="0">
										<td >
										<html:text property="cell_no" size="25" />
									</td>
									</logic:notEqual>
									<td >
										固定电话：
									</td>
									<logic:equal property="tel_no_flag" name="t47_party"
										value="0" >
									<td >
										<html:text property="tel_no" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="tel_no_flag" name="t47_party"
										value="0">
										<td width="36%" bgcolor="F6F9FF">
										<html:text property="tel_no" size="25" />
									</td>
									</logic:notEqual>
								</tr>
								<tr>
									<td  >
										网址：
									</td>
									<logic:equal property="net_address_flag" name="t47_party"
										value="0" >
									<td width="36%" bgcolor="F6F9FF">
										<html:text property="net_address" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="net_address_flag" name="t47_party"
										value="0">
										<td  >
										<html:text property="net_address" size="25" />
									</td>
									</logic:notEqual>
									<td  >
										E-Mail：
									</td>
									<logic:equal property="email_addr_flag" name="t47_party"
										value="0" >
									<td width="36%" bgcolor="F6F9FF">
										<html:text property="email_addr" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="email_addr_flag" name="t47_party"
										value="0">
										<td >
										<html:text property="email_addr" size="25" />
									</td>
									</logic:notEqual>
								</tr>
								<tr>
									<td >
										邮政编码：
									</td>
									<logic:equal property="postalcode_flag" name="t47_party"
										value="0" >
									<td >
										<html:text property="postalcode" size="25" readonly="true">
											<img src="../../images/lock.jpg" height='15'></html:text>
										<img src="../../images/lock.jpg">
									</td>
									</logic:equal>
									<logic:notEqual property="postalcode_flag" name="t47_party"
										value="0">
										<td >
										<html:text property="postalcode" size="25" />
									</td>
									</logic:notEqual>
									<td ></td>
									<td  ></td>
								</tr>
									<tr>
									<td  colspan="4" align="center">
									<input type="button" name="in_button1" value="提 交" class="in_button1" 
							onclick="checkForm('<%=request.getContextPath()%>/information/client/t47_party_modify_do.do')" />
							         	<html:reset styleClass="in_button1" value="重 置"/>
									</td>
									
								
								</tr>
							</table>
					 </div>
					 </div>
		</html:form>
</div>
		<!--提示块--> 
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
		
	</body>
</html>
