<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
	<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
	<META content="MSHTML 6.00.2600.0" name=GENERATOR/>
	<script language="JavaScript" src="../../js/title.js"></script>
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	<script language="JavaScript">
function dosubmit(theUrl){
   var error="";
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
function checkForm(theUrl){
  var errMsg = "";
    if(getLength(document.forms[0].filename.value)==0){
        errMsg+="请选择要上传的数据包或者报文文件！";
        document.forms[0].filename.focus();
    }
    var filename=document.forms[0].filename.value;
    filename=filename.substring(filename.length-28);
    alert(filename);
    var patrn=/^[0-9]{15}-[0-9]{8}(.zip|.ZIP)$/; 
    if (!patrn.exec(filename)) {
       alert("上传的包名错误！");
    return false 
    }
    
    if(errMsg!=""){
     alert(errMsg);
     return false;
   }else{
     document.forms[0].action=theUrl;
     document.forms[0].submit();
   }
}
</script>
</head>
	<body   class="mainbg">
	<div id="main">
<html:form method="post" action="/t07_receipt/t07_receipt_add.do" enctype="multipart/form-data" >
	
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t"><span>回执文件管理</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/t07_receipt/t07_receipt_list.do?newsearchflag=2')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
      </span>
      </div>

     
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr><td height="8"></td></tr>
  </table>
  <html:errors />
 
  <logic:present name="errors">
                        <div class="cond_c">
   						  <table border="0" cellpadding="0" cellspacing="0">
						      	<tr bgcolor="ECF3FF">
									<td align="right">
										回执文件：
									</td>
									<td bgcolor="F6F9FF">
							           <font color="red"><bean:write name="feedbackName"/></font>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td align="right">
										加载操作：
									</td>
									<td bgcolor="F6F9FF">
										<font color="red"><bean:write name="errors"/></font>
									</td>
								</tr>														
																			
							</table>
	</div>					 
  </logic:present>
  
  <div class="cond_c">
	   <table border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" nowrap>上传文件：</td>
              <td>
                 <html:file property="filename" />
              </td>
              <td>&nbsp;</td>
            </tr>

            <tr>
              <td height="22" align="center" bgcolor="ECF3FF"></td>
              <td align="right" bgcolor="ECF3FF">&nbsp; </td>
              <td align="right" class="in_button">
               <input type=button value="上传并发送" class="input" name=Button23222  onClick="checkForm('t07_receipt_add_do.do');"/>
               </td>
            </tr>
           </table>
	</div>
	</div>
  </html:form>
  </div>
<!-- all end -->  

</body>
</html>
