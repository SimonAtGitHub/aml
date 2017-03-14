<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
--><link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<div id="tab_menu">
<a target="sysrule" href="<%=request.getContextPath()%>/mfa/net/para_detection_c.do" class="bglink">监测范围参数</a>

<a target="sysrule" href="<%=request.getContextPath()%>/mfa/net/para_warn_c.do" class="">网络预警参数</a>
 
<a target="sysrule" href="<%=request.getContextPath()%>/mfa/net/para_netCut_c.do" class="">网络截断条件</a>

</div>
<iframe src="<%=request.getContextPath()%>/mfa/net/para_detection_c.do" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
</div>
</body>
</html>
