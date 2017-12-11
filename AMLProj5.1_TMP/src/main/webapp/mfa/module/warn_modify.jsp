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
<%--   if(getLength(document.forms[0].warnMatchValue.value)==0){--%>
<%--       errMsg+="预警匹配度不能为空！";--%>
<%--       document.forms[0].warnMatchValue.focus();--%>
<%--   }--%>
<%--   else if(checkPrice1(document.forms[0].warnMatchValue.value)==false){--%>
<%--      errMsg+="预警匹配度必须为数字！";--%>
<%--      document.forms[0].warnMatchValue.focus();--%>
<%--   }--%>
<%--   --%>
<%--   else--%>
  if(getLength(document.forms[0].doubleMoneyValue.value)==0){
      errMsg+="交易金额累计不能为空！";
      document.forms[0].doubleMoneyValue.focus();
   }
   else if(checkPrice1(document.forms[0].doubleMoneyValue.value)==false){
      errMsg+="交易金额累计格式不正确！";
      document.forms[0].doubleMoneyValue.focus();
   }
  
   else if(getLength(document.forms[0].doubleNumValue.value)==0){
      errMsg+="交易笔数不能为空！";
      document.forms[0].doubleNumValue.focus();
   }
   else if(checkNumber(document.forms[0].doubleNumValue.value)==false){
      errMsg+="交易笔数格式不正确！";
      document.forms[0].doubleNumValue.focus();
   }
  
   else if(getLength(document.forms[0].accountNumValue.value)==0){
      errMsg+="账户数不能为空！";
      document.forms[0].accountNumValue.focus();
   }
   else if(checkNumber(document.forms[0].accountNumValue.value)==false){
      errMsg+="账户数必须为数字！";
      document.forms[0].accountNumValue.focus();
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
<html:form method="post" action="/net/modify_paraWarn.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- table content -->
      <div class="cond_c2">
         <table border="0" cellpadding="0" cellspacing="0">
<%--          <tr>--%>
<%--			<td><font color="#ff0000">*</font>预警匹配度 >= </td>--%>
<%--			<td><html:hidden property="warnMatchKey" name="t23_net_para_dto"/>--%>
<%--			<html:text property="warnMatchValue" name="t23_net_para_dto"/>--%>
<%--			</td>--%>
<%--		  </tr>--%>
<%--		<tr>--%>
<%--			<td align="right"><strong>或</strong></td>--%>
<%--			<td ></td>--%>
<%--		</tr>--%>
		  <tr>
			<td><font color="#ff0000">*</font>交易金额累计>= </td>
			<td><html:hidden property="doubleMoneyKey" name="t23_net_para_dto"/>
			<html:text property="doubleMoneyValue" name="t23_net_para_dto"/>
			</td>
		  </tr>
		<tr>
			<td align="right"><strong>或</strong></td>
			<td ></td>
		</tr>
		  <tr>
			<td><font color="#ff0000">*</font>交易笔数>= </td>
			<td><html:hidden property="doubleNumKey" name="t23_net_para_dto"/>
			   <html:text property="doubleNumValue" name="t23_net_para_dto"/>
			</td>
		  </tr>
		<tr>
			<td align="right"><strong>或</strong></td>
			<td ></td>
		</tr>
		  <tr>
			<td><font color="#ff0000">*</font>账户数>= </td>
			<td><html:hidden property="accountNumKey" name="t23_net_para_dto"/>
			<html:text property="accountNumValue" name="t23_net_para_dto"/>
			</td>
		  </tr>
		  <tr>
            <td><input name="" type="button" class="in_button1" value="提 交" onclick="dosubmit('modify_paraWarn.do')" /></td>
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
