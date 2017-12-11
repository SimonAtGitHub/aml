<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/t10_check_cust_show.do" method="post">
<div class="conditions">
	<div class="cond_c2">
    <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <th colspan="4">客户概况</th>
	  </tr>
   	  <tr>
		<td>客户号：</td>
		<td><bean:write property="party_id" name="t10_survey_cust" /></td>
		<td>客户名称：</td>
		<td><bean:write property="party_chn_name" name="t10_survey_cust"/></td>
	  </tr>
   	  <tr>
		<td>客户归属机构：</td>
		<td><bean:write property="organname" name="t10_survey_cust" /></td>
		<td>客户证件号码：	</td>
		<td><bean:write property="card_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td> 客户证件类型：</td>
		<td><bean:write property="card_type" name="t10_survey_cust" /></td>
		<td>证件到期日：</td>
		<td><bean:write property="card_end_dt_disp" name="t10_survey_cust" /></td>
	 </tr>
	 <tr>
		<td >客户国籍：</td>
		<td><bean:write property="country_cd" name="t10_survey_cust" /></td>
		<td >客户职业：</td>
		<td><bean:write property="occupation" name="t10_survey_cust" /></td>
	 </tr>
	<tr>
		<td >客户状态：</td>
		<td><bean:write property="party_status_cd" name="t10_survey_cust" /></td>
		<td>建立业务关系日期：</td>
		<td><bean:write property="create_dt_disp" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>
		   客户名单类型：
		</td>
		<td colspan="3" style="white-space:normal;word-break:break-all;">
		   <logic:iterate id="list_type" name="list_typeList">
                <bean:write name="list_type" />&nbsp;&nbsp;&nbsp;&nbsp;
            </logic:iterate>
		</td>
	</tr>
	<tr>
		<th colspan="4" >通讯信息：</th>
	</tr>
	<tr>
		<td>通信地址：</td>
		<td><bean:write property="addr1" name="t10_survey_cust" /></td>
		<td>联系电话：</td>
		<td><bean:write property="tel_no" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>工作单位：</td>
		<td><bean:write property="company" name="t10_survey_cust" /></td>
		<td>移动电话：</td>
		<td><bean:write property="cell_no" name="t10_survey_cust" /></td>
	</tr>  
								
	<tr>
		<th colspan="4" >其他信息：</th>
	</tr>
	<tr>
		<td>客户经理号：</td>
		<td><bean:write property="manager_no" name="t10_survey_cust" /></td>
		<td>客户经理名：</td>
		<td><bean:write property="manager_name" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>地区代码：</td>
		<td><bean:write property="country_residence" name="t10_survey_cust" /></td>
		<td>性别：</td>
		<td><bean:write property="gender" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>其他补充信息：	</td>
		<td colspan="3" style="white-space:normal;word-break:break-all;">
			<bean:write property="other_info" name="t10_survey_cust" />
		</td>
	</tr>
	</table>
    </div>
</html:form> 
</body>
</html>
