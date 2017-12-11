<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/awp_base.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<SCRIPT LANGUAGE="JavaScript">
		function dosubmit(theUrl)
		{
		   document.forms[0].action=theUrl;
		   document.forms[0].submit();
		}
</SCRIPT>
	</HEAD>
	<body class="mainbg">
		<html:form method="post" action="/group/group_list.do">
			<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
			  <!-- 标题区域 -->
			  	<div class="awp_wrap">
				  <!-- 标题区域 -->
				     <div class="cond_t">
					  <span>权限 - 详情</span>
					  <span class="buttons">
					   <a href="group_list.do?newsearchflag=1"><img src="../../images/blue/b_back.png" />返回</a>
					  </span>
					</div>
				</div>
			</div>
			<div class="cond_c2">
	  			<table border="0" cellpadding="0" cellspacing="0">
						<tr>
									<td width="100"  align="right" >
										组名：
									</td>
									<td >
										<bean:write name="t00_group" property="groupname" />
									</td>
								</tr>
								
								<tr>
									<td width="100"  align="right" >
										上级组：
									</td>
									<td >
										<bean:write name="t00_group" property="upgroupname" />
									</td>
								</tr>
								<tr>
									<td align="right">
										状态：
									</td>
									<td >
										<bean:write name="t00_group" property="flag_disp" />
									</td>
								</tr>
								<tr>
									<td align="right">
										简短描述：
									</td>
									<td >
										<bean:write name="t00_group" property="des" />
									</td>
								</tr>
								<tr>
									<td align="right">
										组内用户：
									</td>
									<td >
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td  align="left" width="25%" height=20>
													<b>用户名</b>
												</td>
												<td  width="25%" height=20>
													<b>真实姓名</b>
												</td>
												<td align="left" width="25%" height=20>
													<b>角色ID</b>
												</td>
												<td  width="25%" height=20>
													<b>角色名</b>
												</td>
											</tr>
											<logic:iterate id="t00_com_auth" name="t00_com_authList"
												type="com.ist.platform.dto.T00_com_auth">
												<tr>
													<td align="left" width="25%" height=20>
														<bean:write name="t00_com_auth" property="username" />
													</td>
													<td width="25%" height=20>
														<bean:write name="t00_com_auth" property="realname" />
													</td>
													<td align="left" width="25%" height=20>
														<bean:write name="t00_com_auth" property="rolekey" />
													</td>
													<td width="25%" height=20>
														<bean:write name="t00_com_auth" property="rolekey_disp" />
													</td>
												</tr>
											</logic:iterate>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										数据组：
									</td>
									<td >
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<td align="left" width="25%" height=20>
												<b>数据组ID</b>
											</td>
											<td width="25%" height=20>
												<b>数据组名</b>
											</td>
											<logic:iterate id="t00_group_entity" name="t00_group_entityList"
												type="com.ist.platform.dto.T00_group_organ">
												<tr>
													<td  height=20 align="left">
														<bean:write name="t00_group_entity" property="organkey" />
													</td>
													<td  height=20 align="left">
														<bean:write name="t00_group_entity" property="organname" />
													</td>
												</tr>
											</logic:iterate>
										</table>
									</td>
								</tr>
							</table>
							</div>
				</div>
				
				<div class="list_page">
				<table width="98%" border="0" align="center" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
	    	</div>
		</div>
		</html:form>
	</BODY>
</HTML>
