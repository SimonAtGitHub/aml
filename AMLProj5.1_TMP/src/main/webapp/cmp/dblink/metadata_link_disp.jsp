<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/basefunc.js"></script>
	<script type="text/javascript" src="../../js/awp_base.js"></script>
	<script language="JavaScript">
	function dosubmit(theUrl){
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	}
	</script>
</head>

<body leftmargin="0" topmargin="0">
<div id='content'>
	<html:form action="/dblink/metadata_link_list.do" method="POST">
	
	
	   <div class="conditions">
	      <!-- title -->
		 <div class="cond_t">
		   <span>模型详细信息</span>
		   <span class="buttons">
		    <a href="javascript:void(0);" onclick="dosubmit('metadata_link_list.do');return false;"><img src="../../images/blue/b_back.png" />返回</a>
		   </span>
		 </div>
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
		<div class="cond_c2">
		<TABLE border="0" cellpadding="0" cellspacing="0">
						
							<tr >
								<td  >
									连接名称：
								</td>
								<td >
									<bean:write name="t01_db_link" property="dblinkname" />
								</td>
							</tr>

							<tr >
								<td  >
									数据库类型：
								</td>
								<td >
									<bean:write name="t01_db_link" property="dbtype_disp" />
								</td>
							</tr>

							<tr >
								<td  >
									URL：
								</td>
								<td >
									<bean:write name="t01_db_link" property="dburl" />
								</td>
							</tr>

							<%--<tr >
								<td  >
									用户名：
								</td>
								<td >
									<bean:write name="t01_db_link" property="dbuser" />

								</td>
							</tr>

							<tr >
								<td  >
									密码：
								</td>
								<td >
									<bean:write name="t01_db_link" property="dbpass" />

								</td>
							</tr>
							--%><tr >
								<td  >
									显示序号：
								</td>

								<td >
									<bean:write name="t01_db_link" property="dispseq" />

								</td>
							</tr>

							<tr >
								<td  >
									状态：
								</td>
								<td >
									<bean:write name="t01_db_link" property="flag_disp" />

								</td>
							</tr>
							<tr >
								<td  >
									表空间：
								</td>
								<td >
									<bean:write name="t01_db_link" property="itablespace" />

								</td>
							</tr>
							<tr >
								<td  >
									索引空间：
								</td>
								<td >
									<bean:write name="t01_db_link" property="indexname" />

								</td>
							</tr>
							<tr >
								<td  >
									创建人：
								</td>
								<td >
									<bean:write name="t01_db_link" property="creator" />
								</td>
							</tr>
							<tr >
								<td  >
									创建时间：
								</td>
								<td >
									<bean:write name="t01_db_link" property="createdate" />
								</td>
							</tr>


							<tr >
								<td  >
									修改人：
								</td>
								<td >
									<bean:write name="t01_db_link" property="modifier" />
								</td>
							</tr>
							<tr >
								<td  >
									修改时间：
								</td>
								<td >
									<bean:write name="t01_db_link" property="modifydate" />
								</td>
							</tr>


							<tr >
								<td  >
									描述：
								</td>
								<td >
									<bean:write name="t01_db_link" property="des" />
								</td>
							</tr>

						
		</TABLE>
		</div>
		</div>
	</html:form>
	</div>
</body>
</html:html>
