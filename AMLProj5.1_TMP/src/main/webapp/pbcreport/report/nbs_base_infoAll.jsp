
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">

function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/report/nbs_base_infoAll.do" method="post">
				<html:errors />
                
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<input type="hidden" name="reportkey"
							value="<bean:write name="reportkey" />" />
						 <html:hidden property="report_time_cd"/>	
						<span><%=com.ist.util.Constans.CASE_NAME%>处理 - <%=com.ist.util.Constans.CASE_NAME%>验证
							- 账号列表 验证通过：
						<html:select property="validate_ind" style="width:60px"
							onchange="dosubmit('nbs_base_infoAll.do?newsearchflag=1')">
							<html:options collection="statusMap" property="label"
								labelProperty="value" />
						</html:select></span>
						<span class="buttons">
					<a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关闭</a>
				</span>
						
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<th>
								账号
							</th>
							<th>
								账号类型
							</th>
							<th>
								状态
							</th>
						</tr>
						<logic:present name="t07_atifList">
							<logic:iterate id="t07_nbs_atif" name="t07_atifList"
								type="com.ist.aml.pbcreport.dto.T07_nbs_atif">

								<tr>
									<td>
										<bean:write name="t07_nbs_atif" property="ctac" />
									</td>
									<td>
										<bean:write name="t07_nbs_atif" property="catp_disp" />
									</td>
									<td>
										<logic:equal name="t07_nbs_atif" property="validate_ind"
											value="1">
											<bean:write name="t07_nbs_atif" property="validate_ind_disp" />
										</logic:equal>
										<logic:equal name="t07_nbs_atif" property="validate_ind"
											value="0">
											<font color="#FF0000"> <bean:write name="t07_nbs_atif"
													property="validate_ind_disp" scope="page" /> </font>
										</logic:equal>
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>

			</html:form>
		</div>
	</body>
</html>
