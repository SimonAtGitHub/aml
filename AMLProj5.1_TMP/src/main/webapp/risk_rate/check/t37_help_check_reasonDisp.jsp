<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/check/t37_help_case.do" method="post">
<div class="conditions">
	<!-- table content -->
	<div class="cond_t">
		<span>协查信息</span>
     	<span class="buttons">
			<a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/blue/b_shut.png" />关闭</a>
		</span>
	</div>
	<div class="cond_c2" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
			<td>客户号：</td>
			<td>
	         	<bean:write name="t37_help_check" property="party_id" />
			</td>
		</tr>
		<tr>
			<td>发起时间：</td>
			<td>
				<bean:write name="t37_help_check" property="send_date_disp" />
			</td>
		</tr>
		<tr>
			<td>协查原因：</td>
			<td>
				<bean:write name="t37_help_check" property="check_reason" />
			</td>
		</tr>
		<tr>
			<td>发起协查机构：</td>
			<td>
				<bean:write name="t37_help_check" property="send_org"/>
			</td>
		</tr>
		<tr>
			<td>协查机构：</td>
			<td>
				<bean:write name="t37_help_check" property="check_org"/>
			</td>
		</tr>
		<tr>
        	<td>协查结果：</td>
        	<td>
        		<bean:write name="t37_help_check" property="check_result"/>
        	</td>
        </tr>
	  </table>
	</div>
  </div>
  </html:form>
<!-- all end -->   
</div>
</form>
</body>
</html>
