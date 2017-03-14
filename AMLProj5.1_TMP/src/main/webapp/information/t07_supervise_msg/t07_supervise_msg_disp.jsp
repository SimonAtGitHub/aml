<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function dosubmit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
    function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
function _submit(theUrl){
	
	if(getLength(document.forms[0].dealadvise.value.replace(/[\s\u12288\u3000]*/g,''))==0){
         	alert("回复内容不能都为空格！");
         	document.forms[0].dealadvise.focus();
         	return false;
      }else if(getLength(document.forms[0].dealadvise.value)>64){
         	alert("回复内容不能大于64个字符！");
         	document.forms[0].dealadvise.focus();
        	 return false;
      }
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}

function _submit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}

</script>
</head>
<body class="mainbg">
<html:form  method="post" action="/t07_supervise_msg/t07_supervise_msg_detail.do" enctype="multipart/form-data"  >
 
  <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>督办详情</span>
	  <span class="buttons">
	   <a href="#" onclick="_submit('<%=request.getAttribute("backurl")%>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td >督办标题：</td>
         <td><bean:write name="t07_supervise_msg" property="msg_name"/>
         <html:hidden name="t07_supervise_msg" property="msg_id"/>
         </td>
		 <td>督办类型：</td>
         <td><bean:write name="t07_supervise_msg" property="msg_type"/>
       </td>
        </tr>
       <tr>
		 <td>接收机构：</td>
         <td ><bean:write name="t07_supervise_msg" property="msg_org"/>
              </td>
		  <td>失效日期：</td>
         <td><bean:write name="t07_supervise_msg" property="voer_dt"/>
           
         </td>
        </tr>
        <tr>
		 <td> 数据类型：</td>
         <td ><bean:write name="t07_supervise_msg" property="case_type_s"/>
              </td>
		  <td>客户类型：</td>
         <td><bean:write name="t07_supervise_msg" property="party_class_cd_s"/>
           
         </td>
        </tr>
            <tr>
		 <td>创建人：</td>
         <td ><bean:write name="t07_supervise_msg" property="create_user"/>
              </td>
		  <td>创建时间：</td>
         <td><bean:write name="t07_supervise_msg" property="create_dt"/>
           
         </td>
        </tr>
	      <tr>
		 <td>督办内容：</td>
         <td colspan="3"><bean:write name="t07_supervise_msg" property="msg_content"/></td>
        </tr>
         <tr>
		 <td>回复内容：</td>
         <td colspan="3" align="left">
         <html:textarea rows="3" cols="50" name="t07_supervise_msg"   property="dealadvise"></html:textarea>
        </tr>
         <tr>
	     <td></td>
		<td align="center" class="in_button" colspan="3">
		 <input name="" type="button" value="提 交" onclick="_submit('t07_supervise_msg_modify1_do.do')" />	
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
  

