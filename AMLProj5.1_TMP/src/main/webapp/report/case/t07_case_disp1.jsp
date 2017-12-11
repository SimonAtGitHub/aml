<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
		
			String basefuncurl = url + "/js/basefunc.js";
			
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
	
		<script language="JavaScript" src=<%=basefuncurl%>></script>
	
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/case_disp2.do">
			<html:errors />
			
			
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									案例种类：
								</td>
								<td><bean:write name="t07_case_application" property="case_kind_disp" /></td>
								<td>
								    <%=com.ist.util.Constans.CASE_NAME%>类型：
								    
								</td>
								<td><bean:write name="t07_case_application" property="cast_type_disp" /></td>
							</tr>
							<tr>
								<td>
									数据性质：
								</td>
								<td><bean:write property="date_status_cd" name="t07_case_application" /></td>
								<td>
									归属机构：
								</td>
								<td><bean:write name="t07_case_application" property="app_org_id" /> (<bean:write property="app_org_name" name="t07_case_application" />)</td>
							</tr>
							<tr>
								<td>
									筛选日期：
								</td>
								<td><bean:write property="app_dt_disp" name="t07_case_application" /></td>
								<td>
									数据日期：
								</td>
								<td><bean:write property="case_date_disp" name="t07_case_application" /></td>
							</tr>
							<logic:equal property="cast_type" name="t07_case_application"  value="2">
							<tr>
								<td>
									客户号：
								</td>
								<td><bean:write property="party_id" name="t07_case_application" /></td>
								<td>
									客户名称：
								</td>
								<td><bean:write property="party_chn_name" name="t07_case_application" /></td>
							</tr>
				</logic:equal>
							<tr>
								<td>
									交易总数：
								</td>
								<td><bean:write property="trans_count" name="t07_case_application" /></td>
								<td>
									交易金额：
								</td>
								<td><bean:write property="trans_amt" name="t07_case_application" /></td>
							</tr>
							<logic:equal property="cast_type" name="t07_case_application" value="2">
								<tr>
									<td>
										可疑程度：
									</td>
									<td>
										<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
										     <bean:write property="alert_level_disp" name="t07_case_application" /></logic:notEqual></td>
									<td>
										采取措施：
									</td>
									<td>
										<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
										    <bean:write property="take_action" name="t07_case_application" /></logic:notEqual></td>
								</tr>
								<tr>
									<td>
										可疑行为描述：
									</td>
									<td colspan="3" style="white-space:normal;">
										<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
									         <bean:write property="action_descrip" name="t07_case_application" /></logic:notEqual></td>
								</tr>
						    </logic:equal>
							<tr>
								<td>
								   <%=com.ist.util.Constans.CASE_NAME%>特征信息：
								</td>
								<td colspan="3"> 
								  <logic:iterate id="stcr" name="stcrList">
								  	<bean:write name="stcr" /><br/></logic:iterate></td>
							</tr>
							<logic:notEmpty name="caseModuleList">
							<tr>
								<td>
								   案例生成条件：
								</td>
								<td colspan="3"> 
								  <logic:iterate id="module" name="caseModuleList">
								  	<logic:equal name="module" value="1" property="alerttype">
										违反模型:<bean:write name="module" property="module_name"/>的分值 >= <bean:write name="module" property="sumscore"/>
								  	</logic:equal>
								  	<logic:equal name="module" value="2" property="alerttype">
										违反模型:<bean:write name="module" property="module_name"/>关键特征
								  	</logic:equal>
								  	<logic:equal name="module" value="3" property="alerttype">
										违反了网络条件,交易总金额 >= <bean:write name="module" property="trans_amt_disp"/>,交易次数 >= <bean:write name="module" property="trans_count"/>
								  	</logic:equal>
								  	</br>
								  </logic:iterate>
								</td>
							</tr>
							</logic:notEmpty>
						</table>
					</div>
		</html:form>
	</body>
</html>

