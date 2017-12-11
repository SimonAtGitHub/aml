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
<script language="javascript">
function dosubmit(theUrl){
   var errMsg ="";
   if(getLength(document.forms[0].netIntervalValue.value)==0){
      errMsg+="网络内交易天数不能为空！";
      document.forms[0].netIntervalValue.focus();
   }
   else if(checkNumber(document.forms[0].netIntervalValue.value)==false){
      errMsg+="网络内交易天数必须为数字！";
      document.forms[0].netIntervalValue.focus();
   }
   else if(getLength(document.forms[0].dealStrokeValue.value)==0){
      errMsg+="交易笔数不能为空！";
      document.forms[0].dealStrokeValue.focus();
   }
   else if(checkNumber(document.forms[0].dealStrokeValue.value)==false){
      errMsg+="交易笔数必须为数字！";
      document.forms[0].dealStrokeValue.focus();
   }
   else if(getLength(document.forms[0].dealMoneyValue.value)==0){
      errMsg+="交易金额不能为空！";
      document.forms[0].dealMoneyValue.focus();
   }
   else if(checkPrice1(document.forms[0].dealMoneyValue.value)==false){
      errMsg+="交易金额格式不正确！";
      document.forms[0].dealMoneyValue.focus();
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
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/net/modify_paraNetCut.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- table content -->
      <div class="cond_c2">
       	<table border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td><font color="#ff0000">*</font>网络内交易天数>= </td>
			<td>
			<html:hidden property="netIntervalKey" name="t23_net_para_dto"/>
			<html:text property="netIntervalValue" name="t23_net_para_dto"/>
			</tr>
			<tr>
			<td><font color="#ff0000">*</font>交易笔数>= </td>
			<td>
			<html:hidden property="dealStrokeKey" name="t23_net_para_dto"/>
			<html:text property="dealStrokeValue" name="t23_net_para_dto"/>
			</tr>
			<tr>
			<td><font color="#ff0000">*</font>交易金额>= </td>
			<td><html:hidden property="dealMoneyKey" name="t23_net_para_dto"/>
			<html:text property="dealMoneyValue" name="t23_net_para_dto"/>
		  </tr>
          <tr>
            <td><input name="" type="button" class="in_button1" value="提 交" onclick="dosubmit('modify_paraNetCut.do')" /></td>
			<td> <input name="" type="reset" class="in_button1" value="重 置" /></td>
          </tr>
		</table>
      </div>
    </div>
    <!-- all end -->
  </div>
</html:form>
</body>
</html>
