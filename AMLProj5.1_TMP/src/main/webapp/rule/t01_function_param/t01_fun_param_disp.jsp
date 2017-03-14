<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<jsp:useBean id="authBean" class="com.ist.common.AuthBean"
	scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link id="skincss"
			href="../../css/aml_<bean:write name="style" scope="session"/>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/jquery.validator.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body class="mainbg">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>公共参数详情</span>
						<span class="buttons"> <a href="t01_fun_param_list.do?newsearchflag=1"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返
								回</a> </span>
					</div>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>参数代码：
								</td>
								<td>
									<bean:write name="instance" property="paramcd"/>
								</td>
							</tr>
							<tr>	
								<td>
									<span style="color:#FF0000;">*</span>参数名称：
								</td>
								<td>
									<bean:write name="instance" property="paramname" />
								</td>
							</tr>
							<tr>
							<td>
								<span style="color:#FF0000;">*</span>返回类型：
							</td>
							<td>
							   		<logic:empty name="instance" property="rtntype" scope="request">
										&nbsp;
									</logic:empty>
									<logic:equal name="instance" property="rtntype" scope="request" value="1">
										文本
									</logic:equal>
									<logic:equal name="instance" property="rtntype" scope="request" value="2">
										数值
									</logic:equal>
									<logic:equal name="instance" property="rtntype" scope="request" value="3">
										日期
									</logic:equal>
							</td>
							</tr>
							<tr>
							<td>
								<span style="color:#FF0000;">*</span>参数类型：
							</td>
							<td>
									<logic:empty name="instance" property="parmtype" scope="request">
										&nbsp;
									</logic:empty>
									<logic:equal name="instance" property="parmtype" scope="request" value="1">
										正常
									</logic:equal>
									<logic:equal name="instance" property="parmtype" scope="request" value="2">
										自然日
									</logic:equal>
									<logic:equal name="instance" property="parmtype" scope="request" value="3">
										对公节假日
									</logic:equal>
									<logic:equal name="instance" property="parmtype" scope="request" value="4">
										对私节假日
									</logic:equal>
							</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>参数值：
								</td>
							
								<td>
									<bean:write name="instance" property="paramval" />
								</td>
								</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>基期类型：
								</td>
								<td>
									<logic:empty name="instance" property="basedt" scope="request">
										&nbsp;
									</logic:empty>
									<logic:equal name="instance" property="basedt" scope="request" value="1">
										数据日期
									</logic:equal>
									<logic:equal name="instance" property="basedt" scope="request" value="2">
										系统日期
									</logic:equal>
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">&nbsp;</span>显示序号：
								</td>
								<td>
									<bean:write name="instance" property="dispseq" />
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>创建人：
								</td>
								<td>
									<bean:write name="instance" property="creator" />
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>创建日期：
								</td>
								<td>
									<bean:write name="instance" property="createdate" />
								</td>
							</tr>
							<logic:notEmpty name="instance" property="modifier" scope="request">
							<tr>
								<td>
									修改人：
								</td>
								<td>
									<bean:write name="instance" property="modifier" />
								</td>
							</tr>
							</logic:notEmpty>
							<logic:notEmpty name="instance" property="modifydate" scope="request">
							<tr>
								<td>
									修改日期：
								</td>
								<td>
									<bean:write name="instance" property="modifydate" />
								</td>
							</tr>
							</logic:notEmpty>
						</table>
					</div>
				</div>
			</div>

	</body>
</html>