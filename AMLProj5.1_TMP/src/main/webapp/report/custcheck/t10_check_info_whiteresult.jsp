<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.TreeMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String cordaurl="";
	if(request.getAttribute("cordaurl")!=null){
 		cordaurl=(String)request.getAttribute("cordaurl");
 		cordaurl=cordaurl.substring(1);
 		cordaurl="\""+request.getContextPath() + cordaurl;
	}
%>
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<script type='text/javascript' src='/report/case/dwr/interface/CountryArea.js'></script>
<script type='text/javascript' src='/report/case/dwr/engine.js'></script>
<script type='text/javascript' src='/report/case/dwr/util.js'></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
     


<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
function  _Opendailog1(url,type){
 
     if(type=='option'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            
                isSub = true;
           
        }
    }
	 if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
    if(isSub && errMsg==''){
       
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
	 var errMsg = "";
    var isSub = false;
	var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "ff","dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");

  
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
	else if(type=='adit'){
        if(checkRadio(form1.username)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('你真的要删除选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='pause'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('你真的要暂停选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('你真的要激活选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        location.href=theUrl+"&"+Math.random();
    }
    if(isSub && errMsg==''){
        document.form1.action=theUrl;
        document.form1.submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
   
        document.form1.action=url;
        document.form1.submit();
   
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
function checkForm(theUrl){
   
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function add_row(divid,butttonid,resultid)
{
	
	var tag=document.getElementById(resultid).value;
	if(tag=='1'){
		document.getElementById(butttonid).value="取消";
		document.getElementById(divid).style.display = "inline";
		document.getElementById(resultid).value="2";
	}
	if(tag=='2'){
		document.getElementById(butttonid).value="添加";
		document.getElementById(divid).style.display = "none";
		document.getElementById(resultid).value="1";
	}
	
}
function add_do(tagid,tableid,theUrl){
	  var tagresut=document.getElementById(tagid).value;
	  var amt=document.getElementById('amt').value;
	  if(isNaN(amt)){
		  alert('请输入正确的数字');   
	        return false;
	  }
	  if(tagresut==1){
        alert('先添加，后保存');   
        return false;
	   } 
	   
    document.forms[0].action=theUrl+'?tablename='+tableid;
    document.forms[0].submit();
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
function doinsertchecktable(){
	var objname=document.getElementById('objname').value;
	 if(objname=='')
	 {
		 alert('客户名称为必选项');
		 return false;
	 }
	var blacktype=document.getElementById('blacktype').value;
	 if(blacktype=='')
	 {
		 alert('免检测类型为必选项');
		 return false;
	 }
var isuse=document.getElementById('isuse').value;
if(isuse=='')
 {
	 alert('是否启用为必选项');
	 return false;
 }
//var validate_dt_new_disp=document.getElementById('validate_dt_new_disp').value;
//if(validate_dt_new_disp=='')
 //{
//	 alert('生效日期为必选项');
//	 return false;
 //}
//var invalidate_dt_new_disp=document.getElementById('invalidate_dt_new_disp').value;
//if(invalidate_dt_new_disp=='')
// {
//	 alert('失效日期为必选项');
//	 return false;
// }
document.forms[0].action='t47_client_blackorwhite_do.do?tablename=T07_WHITELIST_INFO';
document.forms[0].submit();
}
</script>
</HEAD>
<BODY leftmargin="0" topmargin="0" id="iframecontent">
<div id="main"> 
<html:form action="/custcheck/modifyT10_colu.do" method="post">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>白名单新建</span>
	  <span class="buttons">
	   <a href="javascript:history.back(-1);"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
	
	<div class="cond_c2">
		<table border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td><font color="#FF0000">*</font>客户号：</td>
			<td><html:text name="t10_check_cust_cardForm"  property="party_id" readonly="true"/></td>
			<td><font color="#FF0000">*</font>客户名称：</td>
			<td><html:text name="t10_check_cust_cardForm"  property="obj_name" styleId="objname"/>
			 </td>
		  </tr>
		  <tr>
			<td><font color="#FF0000">*</font>客户类型：</td>
			<td><html:select name="t10_check_cust_cardForm" property="party_class_cd"  >
			<html:options collection="party_classMap" property="label" labelProperty="value" />
			</html:select>
			</td>
			<td><font color="#FF0000">*</font>*免检测类型：</td>
			<td><html:select name="t10_check_cust_cardForm" styleId="blacktype"  property="rule_type"
			style="width:130px" 
		onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
			<html:options collection="rule_typeMap" property="label" labelProperty="value" />
			</html:select>
			</td>
		  </tr>
		  <tr>
			<td><font color="#FF0000">*</font>是否启用：</td>
			<td><html:select name="t10_check_cust_cardForm" property="isuse"  styleId="isuse">
			<html:options collection="isuse_typeMap" property="label" labelProperty="value" />
			</html:select>
			</td>
			<td>白名单建立原因：</td>
			<td>
			<html:textarea property="reason_create" cols="29" rows="3"  >
				 </html:textarea>
				 
			</td>
		  </tr><!--
		  <tr>
			<td><font color="#FF0000">*</font>生效日期：</td>
			<td>
			 <html:text name="t10_check_cust_cardForm"  property="validate_dt_new_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
			
			</td>
			<td><font color="#FF0000">*</font>失效日期：</td>
			<td>	
			<html:text name="t10_check_cust_cardForm"  property="invalidate_dt_new_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
			
			
			</td>
		  </tr>
		  --><tr>
			<td colspan="4" align="center"><input name="" type="button" class="in_button1" value="提 交"  onclick="doinsertchecktable()"/>
			  <input type="reset" class="in_button1" value="重 置" />
			</td>
		  </tr>
		</table>
	</div>
  </div>
 
</div>
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
 
</html:form> 
</div>

</BODY>
</HTML>
