<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
<META content="MSHTML 6.00.2600.0" name=GENERATOR />
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    if(getLength(document.forms[0].note.value)>4000){
    	errMsg="计算日志不能大于4000个字符！";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
 <html:form action="/calinfo/dm_server_log_edit_do.do" method="post">
<html:hidden property="domainkey" name="t18_server_log"/>
<html:hidden property="serverkey" name="t18_server_log"/>
<html:hidden property="statisticdate_disp" name="t18_server_log"/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
          <span>
          	DM计算管理 - 维护日记
          </span>
      <span class="buttons">
          <a href="javascript:dosubmit('dm_server_list.do','back')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返  回</a>
        </span>
     </div>
  </div>
 <!-- table content -->
 <div class="cond_c2">
  <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td> 数据时间：</td>
              <td><bean:write name="t18_server_log" property="statisticdate_disp"/></td>
            </tr>
            <tr>
              <td>计算引擎：</td>
              <td><bean:write name="t18_server_log" property="servername"/></td>
            </tr>
            <tr>
              <td>修改人：</td>
              <td><bean:write name="t18_server_log" property="modifer"/></td>
            </tr>
            <tr>
              <td>修改时间：</td>
              <td><bean:write name="t18_server_log" property="modifydate_disp"/></td>
            </tr>
            <tr>
              <td>计算日志：</td>
              <td><textarea name="note" cols="80" rows="10"  class="text_white" ><bean:write name="t18_server_log" property="note"/></textarea></td>
            </tr>
            <tr>
              <td>&nbsp;</td>  
              <td>
                  <html:hidden property="organkey" value="0"/>
                  <html:button property="button" styleClass="in_button1" value="提 交" onclick="checkForm('dm_server_log_edit_do.do')" />
                  <html:reset styleClass="in_button1" value="重 置" />
			  </td>
            </tr>
          </table>
  </div>
 </div>
</html:form>
</BODY>
</HTML>
