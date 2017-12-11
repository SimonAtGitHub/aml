<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg"> 
		<div id="main">
		<html:form method="post" action="listmanager/t07_blacklist_list.do">
		
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>名单详细信息</span>
					 <span class="buttons">
						   <a href="#" onClick="dosubmit('<bean:write name="url"/>');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					
					</span>
					</div>
			
			<html:errors />
		</div>
			<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	  <html:hidden name="t07_blacklist" property="list_type" />
       <tr>
									<td width="160" height="22" align="right" bgcolor="ECF3FF">
										客户号：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_blacklist" property="party_id" />
									</td>
									<td height="22" align="right" bgcolor="ECF3FF">
										客户名称：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_blacklist" property="obj_name" />
									</td>
									</tr>
								
								<tr>
									<td height="22" align="right" bgcolor="ECF3FF">
										创建机构号：
									</td>
									<td bgcolor="F6F9FF">
										<bean:write name="t07_blacklist" property="organkey" />
									</td>
									<td height="22" align="right" bgcolor="ECF3FF">
										客户类型：
									</td>

									<td bgcolor="F6F9FF">
										<bean:write name="t07_blacklist" property="party_class_cd" />
									</td>
									</tr>
								<tr>
									<td >
										是否启用：
									</td>
									<td >
										<bean:write name="t07_blacklist" property="isuse" />
									</td>
									<td>
										建立原因：
									</td>
									<td >
										<bean:write name="t07_blacklist" property="reason_create" />
									</td>
								</tr>
								<tr>
								    <td>
										名单类型：
									</td>
								  <td>
								      <bean:write name="t07_blacklist" property="m_list_type" />
								  </td>
								  <td >
										创建用户：
									</td>
									<td >
										<bean:write name="t07_blacklist" property="create_user" />
									</td>
								</tr>
								<tr>
									<td height="22" align="right" bgcolor="ECF3FF">
										创建日期：
									</td>
									<td>
										<bean:write name="t07_blacklist" property="create_dt_disp" />
									</td>
									<td >
										最后修改用户：
									</td>
									<td>
										<bean:write name="t07_blacklist" property="modify_user" />
									</td>
								</tr>
								<tr>
									<td >
										最后修改日期：
									</td>
									<td colspan="3">
										<bean:write name="t07_blacklist" property="modify_dt_disp" />
									</td>
								</tr>
								
								
							</TABLE>
					</div>
		</html:form>
		</div>
	</BODY>
</HTML>