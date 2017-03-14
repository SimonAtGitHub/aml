<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
 <script type="text/javascript"> 
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
		_Date1 = document.forms[0].check_start_dt.value;
		_Date2 = document.forms[0].check_end_dt.value;  
		if(!_isDateSpaceComplete(_Date1, _Date2))
			errMsg += "请填写完整的起始时间范围！";
			else if(_Date1!="" && !formatDateAlert(_Date1))
				return false;       
			else if(_Date2!="" && !formatDateAlert(_Date2))
				return false;	      
			else if(!_compareTwoDateForString(_Date1, _Date2) )
				errMsg += "开始时间不能大于结束时间！";		  		
  		isSub = true;
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
function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text" && ele[i].type.toLowerCase()!="hidden")continue;
       ele[i].value="";
    } 
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}
function selectAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = true;
        }
    }
}
function clearAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = false;
        }
    }
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}
</script>
<script type="text/javascript">
function dosubmit2(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	
}
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/custcheck/show_t10_check_cust_acct.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>账户详情</span> 	
 	</div>
   <div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	   <tr>
         <td>账号：</td>
         <td><bean:write name="t47_client" property="acct_num" scope="request" filter="false" /></td>
         <td>客户号：</td>
         <td><bean:write name="t47_client" property="party_id" scope="request" filter="false" /></td>
       </tr>
       <tr>
         <td>客户姓名：</td>
         <td><bean:write name="t47_client" property="party_chn_name" scope="request" filter="false" /></td>
         <td>结算户性质：</td>
         <td><bean:write name="t47_client" property="acct_type_cd_disp" scope="request" filter="false" /></td>
       </tr>
       <tr>
         <td>期限代码：</td>
         <td><bean:write name="t47_client" property="ib_type_cd" scope="request" filter="false" /></td>
         <td>机构：</td>
         <td><bean:write name="t47_client" property="organkey" scope="request" filter="false" /></td>
       </tr>
       <tr>
         <td>科目号：</td>
         <td><bean:write name="t47_client" property="subjectno" scope="request" filter="false" /></td>
         <td>开户时间：</td>
         <td><bean:write name="t47_client" property="open_dt_disp" scope="request" filter="false" /></td>
       </tr>
       <tr>
         <td>起息日期：</td>
         <td><bean:write name="t47_client" property="acct_processing_dt_disp" scope="request" filter="false" /></td>
         <td>到期日期：</td>
         <td><bean:write name="t47_client" property="mature_dt_disp" scope="request" filter="false" /></td>
       </tr>
       <tr>
         <td>上笔发生日期：</td>
         <td><bean:write name="t47_client" property="last_occur_dt_disp" scope="request" filter="false" /></td>
         <td>销户时间：</td>
         <td><bean:write name="t47_client" property="close_dt_disp" scope="request" filter="false" /></td>
       </tr>
       
       <tr>
         <td>余额：</td>
         <td><bean:write name="t47_client" property="amt_val" scope="request" filter="false" /></td>
         <td>凭证号：</td>
         <td><bean:write name="t47_client" property="token_id" scope="request" filter="false" /></td>
       </tr>
       <tr>
         <td>账户状态</td>
         <td><bean:write name="t47_client" property="acct_status_cd" scope="request" filter="false" /></td>
         <td>帐务机构号：</td>
         <td><bean:write name="t47_client" property="organKeys" scope="request" filter="false" /></td>
       </tr>
      
      </table>
  </div>
</html:form> 
</div>
</BODY>
</HTML>