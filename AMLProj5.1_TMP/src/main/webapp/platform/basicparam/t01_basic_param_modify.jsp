<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			function checkForm(theUrl){
				document.forms[0].action = theUrl;
				document.forms[0].submit();
			}
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/sysconfig/set_t00_system_param.do" method="POST">
			<div id="main">
			<!-- conditions --> 
			  <div class="conditions">
			    <!-- title -->
				<div class="cond_t">
					<span>运维参数设置</span>
				</div>
				</div>
				<div id='content'>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
				</div>
				<div class="cond_c2">
				 	<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td nowrap>
								ODS临时数据区数据库连接方式：
							</td>
							<td>
								<html:select property="ods"  >
									<html:options collection="dblinkMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							</tr>
							<tr>
								<td nowrap>
									DM数据区数据库连接方式：
								</td>
								<td>
									<html:select property="dm"  >
										<html:options collection="dblinkMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td nowrap>
									服务器类型：
								</td>
								<td>								
									<html:select property="server"  >
										<html:options collection="dbserverMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
							<td>
							</td>
							<td>
								<html:button property="button2" value="确 定" styleClass="in_button1"
									onclick="checkForm('set_t00_system_param_do.do')" />
							</td>
						</tr>
					</TABLE>	
				</div>
			</div>				
		</html:form>
	</BODY>
</HTML>
