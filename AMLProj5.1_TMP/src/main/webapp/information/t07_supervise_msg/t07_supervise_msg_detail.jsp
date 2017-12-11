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
   var error="";
       if(document.forms[0].msg_name.value==""){
            alert("督办标题不能为空！");
            return false;
            }
         if(document.forms[0].msg_type.value==""){
            alert("请选择督办类型");
            return false;
            }

         if(document.forms[0].receipt_org.value==""){
            alert("请选择接收机构");
            return false;
            }
       if(document.forms[0].msg_content.value==""){
            alert("督办内容不能为空！");
            return false;
            }
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
	  <logic:equal name="flag" value="0">
	   <a href="#" onclick="_submit('<%=request.getAttribute("backurl")%>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </logic:equal>
	  <logic:equal name="flag" value="1">
	   <a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
	  </logic:equal>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td >督办标题：</td>
         <td><bean:write name="t07_supervise_msg" property="msg_name"/></td>
		 <td>督办类型：</td>
         <td><bean:write name="t07_supervise_msg" property="msg_type"/>
       </td>
        </tr>
       <tr>
		 <td>接收机构：</td>
         <td ><bean:write name="t07_supervise_msg" property="receipt_org"/>
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
		 <td>回复人：</td>
         <td ><bean:write name="t07_supervise_msg" property="deal_user"/>
              </td>
		  <td>回复日期：</td>
         <td><bean:write name="t07_supervise_msg" property="deal_dt"/>
           
         </td>
        </tr>
         <tr>
		 <td>回复内容：</td>
         <td colspan="3"><bean:write name="t07_supervise_msg" property="dealadvise"/></td>
        </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>
  

