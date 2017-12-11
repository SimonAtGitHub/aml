<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
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
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
	<script language="JavaScript">
function dosubmit(theUrl){
   var error="";
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
</script>
<script language="JavaScript">
function checkForm(theUrl){
    var errMsg ="";
    if (getLength(document.forms[0].code_type.value)==0) {
        errMsg = "代码表不能为空！!";
        document.forms[0].code_type.focus();
    }else if (getLength(document.forms[0].filename.value)==0) {
        errMsg = "上传文件不能为空！";
        document.forms[0].filename.focus();
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
</script>
</HEAD>
<BODY leftmargin=0 topmargin=0  oncontextmenu=self.event.returnvalue=false 
>
<div id="main">
<html:form method="post" action="/code/code_modify.do" enctype="multipart/form-data" >
	<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>人行代码表维护 </span> 
     
   </div>
  <html:errors />
  <%if((String)request.getAttribute("errors1")!=null){ %>
 
	<TABLE width="98%" border=0 align="center" cellpadding="2"
		cellspacing="1">
		<font color="#FF0000" size="2"> <bean:write  name="errors1"  /></font>
	</TABLE>
  <% }%>
  
   <div class="cond_c">
  
          <table  border="0" cellpadding="0" cellspacing="0">
            <tr >
              <td >选择代码表：</td>
              <td>
                <html:select property="code_type" >
										<html:options collection="codeMap" property="label"
											labelProperty="value" />
									</html:select> 
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr >
              <td >上传文件：</td>
              <td>
                 <html:file property="filename"    onkeypress="return false;" />
              </td>
              <td>&nbsp;</td>
               <td colspan="4" align="center" class="in_button">
               <input type=button value="更新代码表" name=Button23222 class="input" onClick="checkForm('code_modify_do.do');">
               </td>
            </tr>

            
          </table>
    </div>
    </div>
    
	</html:form>
	</div>
</BODY>
</html>
