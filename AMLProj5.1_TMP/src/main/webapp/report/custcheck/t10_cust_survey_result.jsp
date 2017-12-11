<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.TreeMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<script type='text/javascript' src='/report/case/dwr/interface/CountryArea.js'></script>
<script type='text/javascript' src='/report/case/dwr/engine.js'></script>
<script type='text/javascript' src='/report/case/dwr/util.js'></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/modifyT10_colu.do" method="post">
<div class="conditions">
	  <div class="cond_c2">
	    <table border="0" cellpadding="0" cellspacing="0">
	  	<tr>
			<td>调查结论：</td>
			<td><bean:write property="check_result_display" name="t10_check_cust_result" /></td>
			<td>调查结论有效期：</td>
			<td><bean:write property="valid_dt_display" name="t10_check_cust_result"  /></td>
		</tr>
		<tr>
			<td>调查类型：</td>
			<td><bean:write property="check_type" name="t10_check_cust_result" /></td>
			<td>调查人：</td>
			<td><bean:write property="checker" name="t10_check_cust_result"  /></td>
		</tr>
		<tr>
		   <td>调查人机构：</td>
		   <td><bean:write property="checker_org" name="t10_check_cust_result"  /></td>
		   <td>调查情况说明：</td>
		   <td><bean:write property="check_explain" name="t10_check_cust_result"  /></td>
		</tr>	
	  </table>
     </div>
 </div>
</html:form> 
</body>
</html>
