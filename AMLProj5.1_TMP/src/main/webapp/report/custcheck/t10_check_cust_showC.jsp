<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
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
		<td><bean:write property="party_chn_name" name="t10_survey_cust" /></td>
	 </tr>
	 <tr>
		<td>营业执照号：</td>
		<td><bean:write property="business_licence" name="t10_survey_cust" /></td>
		<td>营业执照到期日：</td>
		<td><bean:write property="licence_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>
		   客户名单类型：
		</td>
		<td>
		   <logic:iterate id="list_type" name="list_typeList">
                <bean:write name="list_type" />&nbsp;&nbsp;&nbsp;&nbsp;
                <br/>
                <br/>
            </logic:iterate>
		</td>
		<td>建立业务关系日期：</td>
		<td><bean:write property="create_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	    <th colspan="4">公司信息</th>
	  </tr>
	  <tr>
		<td>组织机构代码：</td>
		<td><bean:write property="organ_code" name="t10_survey_cust" /></td>
		<td>组织机构代码到期日：</td>
		<td><bean:write property="organ_code_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>机构信用代码：</td>
		<td><bean:write property="org_credit_no" name="t10_survey_cust" /></td>
		<td>机构信用代码有效期：</td>
		<td>
		<bean:write property="org_credit_vt_disp" name="t10_survey_cust" />
		</td>
	  </tr>
	  <tr>
		<td>国税登记证号：</td>
		<td><bean:write property="nation_affair_no" name="t10_survey_cust" /></td>
		<td>国税登记证到期日：</td>
		<td><bean:write property="nation_affair_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>地税登记证号：</td>
		<td><bean:write property="local_affair_no" name="t10_survey_cust" /></td>
		<td>地税登记证到期日：</td>
		<td><bean:write property="local_affair_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	    <td>注册资金：</td>
	    <td><bean:write property="enrol_fund_amt" name="t10_survey_cust" /></td>
		<td>注册资金币种：</td>
		<td><bean:write property="enrol_fund_currency_cd" name="t10_survey_cust" /></td>
      </tr>
	  <tr>
		<td>基本账号：</td>
		 <td><bean:write property="base_acct_num" name="t10_survey_cust" /></td>
		<td>基本账号归属行：</td>
		<td><bean:write property="base_bank_id" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>基本账号归属网点：</td>
		<td><bean:write property="base_bank_org" name="t10_survey_cust" /></td>
		<td>经营范围：</td>
		<td><bean:write property="main_manage_scope" name="t10_survey_cust" /></td>
	  </tr>
	   <tr>
		<td>行业：</td>
		<td><bean:write property="industrykey" name="t10_survey_cust" /></td>
		<td>企业类型：</td>
		<td><bean:write property="company_type_cd" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>主营业务：</td>
		<td><bean:write property="main_manage_scope" name="t10_survey_cust" /></td>
		<td>法人代表：</td>
		<td><bean:write property="legal_obj" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>法人代表证件类型：</td>
		<td><bean:write property="legal_card_type" name="t10_survey_cust" /></td>
		<td>法人代表证件号码：</td>
		<td><bean:write property="legal_card_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>法人居住地：</td>
		<td><bean:write property="legal_addr" name="t10_survey_cust" /></td>
		<td>法人联系方式：</td>
		<td><bean:write property="legal_tel" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>法定代表人证件到期日：</td>
		<td><bean:write property="legal_card_no_end_dt_disp" name="t10_survey_cust" /></td>
		<td></td>
		<td></td>
	  </tr>
	  <tr>
	    <th colspan="4">通讯信息</th>
	  </tr>
	  <tr>
		<td>通信地址：</td>
		<td><bean:write property="addr1" name="t10_survey_cust" /></td>
		<td>联系电话：</td>
		<td><bean:write property="tel_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	     <td>移动电话：</td>
		<td colspan="3"><bean:write property="cell_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	  <th colspan="4">其他信息</th>
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
		<td>启用标志：</td>
		<td><bean:write property="flag" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>其他补充信息：</td>
		<td colspan="3"><html:textarea property="other_info" name="t10_survey_cust" rows="4" cols="100" styleId="other_info"></html:textarea></td>
	  </tr>
	</table>
    </div>
    </div>
</html:form> 
</body>
</html>
