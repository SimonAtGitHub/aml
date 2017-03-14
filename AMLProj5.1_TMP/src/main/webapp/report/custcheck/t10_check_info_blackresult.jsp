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

function _Confim(url){
   
        document.forms[0].action=url;
        document.forms[0].submit();
   
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
			 alert('黑名单类型为必选项');
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
	// {
	//	 alert('生效日期为必选项');
	//	 return false;
	// }
	//var invalidate_dt_new_disp=document.getElementById('invalidate_dt_new_disp').value;
	//if(invalidate_dt_new_disp=='')
	// {
	//	 alert('失效日期为必选项');
	//	 return false;
	// }
	
	document.forms[0].action='t47_client_blackorwhite_do.do?tablename=T07_BLACKLIST';
    document.forms[0].submit();
}
</script>
</HEAD>
<BODY leftmargin="0" topmargin="0" id="iframecontent">
<div id="main"> 
<html:form action="/custcheck/modifyT10_colu_result.do" method="post">
<html:hidden property="party_id"/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>黑名单新建</span>
	  <span class="buttons">
	   <a href="#" onclick="_Confim('modifyT10_check_info_result.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
	<!-- table content -->
	<html:errors />
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
			<td><font color="#FF0000">*</font>黑名单类型：</td>
			<td><html:select name="t10_check_cust_cardForm" styleId="blacktype" property="list_type" style="width:400px" 
		onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
			<html:options collection="m_list_type_bMap" property="label" labelProperty="value" />
			</html:select>
			</td>
		  </tr>
		  <tr>
			<td><font color="#FF0000">*</font>是否启用：</td>
			<td><html:select name="t10_check_cust_cardForm" property="isuse" styleId="isuse">
			<html:options collection="isuse_typeMap" property="label" labelProperty="value" />
			</html:select>
			</td>
			<td>黑名单建立原因：</td>
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
<!-- all end -->   
</div>
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
 
</html:form> 
</div>

</BODY>
</HTML>
