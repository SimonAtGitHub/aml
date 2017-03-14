<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
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
	var cardTypeValue=document.forms[0].opp_card_type.value;
    var errMsg ="";
    var isSub = true;
    //客户名称
    if (getLength(document.forms[0].opp_name.value)==0) {
        errMsg = "客户名称不能为空！";
        document.forms[0].opp_name.focus();
    }
   
    //客户类型
    else if (getLength(document.forms[0].opp_pbc_party_class_cd.value)==0) {
        errMsg = "客户类型不能为空！";
        document.forms[0].opp_pbc_party_class_cd.focus();
    }
     //账号类型
    else if (getLength(document.forms[0].opp_acct_type_cd.value)==0) {
        errMsg = "账号类型不能为空！";
        document.forms[0].opp_acct_type_cd.focus();
    }
    else if ((cardTypeValue=='19'||cardTypeValue=='29')&&getLength(document.forms[0].opp_card_type_inf.value)==0) {
        errMsg = "证件类型说明不能为空！";
        document.forms[0].opp_card_type_inf.focus();
    }
    //账号
    else if (getLength(document.forms[0].opp_acct_num.value)==0) {
        errMsg = "账号不能为空！";
        document.forms[0].opp_acct_num.focus();
    }
   //证件类型
    else if (getLength(document.forms[0].opp_card_type.value)==0) {
        errMsg = "证件类型不能为空！";
        document.forms[0].opp_card_type.focus();
    }
    //证件号码
    else if (getLength(document.forms[0].opp_card_no.value)==0) {
        errMsg = "证件号码不能为空！";
        document.forms[0].opp_card_no.focus();
    }
    //验证证件号码格式
    else if(document.forms[0].opp_card_type.value=='11'){
        if(IdCardValidate(document.forms[0].opp_card_no.value)==false){
        	isSub = false;
            document.forms[0].opp_card_no.focus();
            }
       }
   //账号必须为数字
    else if(!checkNum(document.forms[0].opp_acct_num.value)){
    	errMsg = "账号必须为数字！";
        document.forms[0].opp_acct_num.focus();
    }
     //证件号码为数字
    else if(document.forms[0].opp_card_type=="11"&& !checkID(document.forms[0].opp_card_no.value)){
    	errMsg = "证件号码必须为数字或'X'！";
        document.forms[0].opp_card_no.focus();
    }

    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function validateCardNo(cardnovalue){
	 var cardtype=document.forms[0].opp_card_type.value;
	 if(cardtype=="11"){
	    IdCardValidate(cardnovalue);
	 }
}

function cardChange()
{
	var value=document.forms[0].opp_card_type.value;
	if(value=='19'||value=='29')
	{
		 document.forms[0].opp_card_type_inf.style.display='';
	}else
	{
		 document.forms[0].opp_card_type_inf.style.display='none';
	}

}
</script>
</head>
<body class="mainbg" onload="cardChange();">
<html:form method="post" action="/oppinfo/t47_opp_info_modify.do">
 <html:hidden  property="opp_sys_id" />
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>修改对手信息</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('t47_opp_info_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>
 <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td><font color="#FF0000">*</font>客户名称：</td>
         <td>
       
         <html:text property="opp_name" styleClass="text_white" size="25" /></td>
		 <td><font color="#FF0000">*</font>客户类型：</td>
         <td> <html:select property="opp_pbc_party_class_cd"  >
                      <html:options collection="clienttypeMap"
                                    property="label"
                                   labelProperty="value" />
                </html:select></td>
        </tr>
        <tr>
         <td><font color="#FF0000">*</font>账户类型：</td>
         <td>
    
                    <html:select property="opp_acct_type_cd" style="width:100%" >
                      <html:options collection="accttypeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select> 
         </td>
		 <td><font color="#FF0000">*</font>账号：</td>
         <td> 
          <html:text property="opp_acct_num" styleClass="text_white" size="25" />
         </td>
        </tr>
        <tr>
         <td><font color="#FF0000">*</font>证件类型：</td>
         <td colspan="3">
                      <html:select property="opp_card_type" onchange="cardChange();">
                      <html:options collection="card_typeMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
                    <html:text property="opp_card_type_inf" styleClass="text_white" size="25" style="display:none"/>
                    
        </td>
        </tr>
        <tr>
		 <td><font color="#FF0000">*</font> 证件号码：</td>
         <td colspan="3"> 
         <html:text property="opp_card_no" styleClass="text_white" size="25" onchange="validateCardNo(this.value);" />
         </td>
        </tr>
         <tr>
	  
		<td align="center" class="in_button" colspan="4">
		  <html:hidden property="organkey" value="0"/>
          <html:button property="button" value="提 交" onclick="checkForm('t47_opp_info_modify_do.do')"/>
		  <input name="" type="reset" value="重 置" />	
		  	</td>
	   </tr>
	  </table>
	</div>
  </div>
<!-- all end -->   
</div>

</html:form>
</body>
</html>


