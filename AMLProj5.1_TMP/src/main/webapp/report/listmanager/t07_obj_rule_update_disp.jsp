<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

</SCRIPT>
	</HEAD>
	<body leftmargin="0" topmargin="0" class="mainbg">
	
		<html:form method="post" action="/listmanager/t07_obj_rule_list.do">
		<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>详细信息</span>
	  <span class="buttons">
					 <a href="#"
							onclick="dosubmit('t07_obj_rule_list.do')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> 
									 </span>
	</div>
	<!-- table content -->
	<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										客户号：
									</td>
									<td >
										<bean:write name="t07_obj_rule" property="party_id" />
									</td>
									<td >
										客户名称：
									</td>
									<td >
										<bean:write name="t07_obj_rule" property="obj_name" />
									</td>
								</tr>
								
								<tr>
									<td >
										创建机构号：
									</td>
									<td >
										<bean:write name="t07_obj_rule" property="organkey" />
									</td>
									<td >
										客户类型：
									</td>

									<td >
										<bean:write name="t07_obj_rule" property="party_class_cd" />
									</td>
								</tr>
								
								<tr>
									<td>
										是否启用：
									</td>
									<td >
										<bean:write name="t07_obj_rule" property="isuse" />
										<span style="color:red">
										[<bean:write name="t07_obj_rule" property="isuse_new" />]
										</span>
									</td>
									<td>
										建立原因：
									</td>
									<td >
										<bean:write name="t07_obj_rule" property="reason_create" />
										<span style="color:red">
										[<bean:write name="t07_obj_rule" property="reason_create_new" />]
										</span>
									</td>
								</tr>
								
								<tr>
									<td>
										取消原因：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="reason_cancel" />
									</td>
									<td>
										免检测类型：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="rule_type" />
										<span style="color:red">
										[<bean:write name="t07_obj_rule" property="rule_type_new" />]
										</span>
									</td>
								</tr>
								
								<tr>
									<td>
										生效日期：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="validate_dt_disp" />
										<span style="color:red">
										[<bean:write name="t07_obj_rule" property="validate_dt_new_disp" />]
										</span>
									</td>
									<td>
										失效日期：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="invalidate_dt_disp" />
										<span style="color:red">
										[<bean:write name="t07_obj_rule" property="invalidate_dt_new_disp" />]
										</span>
									</td>
								</tr>
							
								<tr>
									<td>
										创建用户：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="create_user" />
									</td>
									<td>
										创建日期：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="create_dt_disp" />
									</td>
								</tr>
							
								<tr>
									<td>
										最后修改用户：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="modify_user" />
									</td>
									<td>
										最后修改时间：
									</td>
									<td>
										<bean:write name="t07_obj_rule" property="modify_dt_disp" />
									</td>
								</tr>	
			</table>
	</div>
 </div>
</div>
		</html:form>
	</BODY>
</HTML>