<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!-- 
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		 -->
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
	<BODY class="mainbg">
		<html:form method="post" action="/listmanager/t07_obj_rule_dispCheck.do">
			<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>��ϸ��Ϣ</span>
	  <span class="buttons">
	  <a href="#" onClick="dosubmit('<bean:write name="url"/>');"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<html:errors />
			<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				�˲�������ƣ�
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="bank_name" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				�˲����������룺
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="bank_code2" />
			</td>
		</tr>
		
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				�����˲����ڣ�
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="checkdate" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				�����˲�ʱ�䣺
			</td>
	
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="checktime" />
			</td>
			</tr>
	
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				����������
			</td>
			<td bgcolor="F6F9FF" style='word-break:break-all'>
			  
				<bean:write name="t07_obj_rule" property="name" filter="false"/>
			  
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				�������֤�����룺
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="id_no"/>
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				�˲�����
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="result" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				��Ա�ţ�
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="counter_no" />
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				ҵ�����ߣ�
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="ope_line" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				�˲鷽ʽ��
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="checkmode" />
			</td>
		</tr>
		<tr>
			<td height="22" align="right" bgcolor="ECF3FF">
				ժҪ��
			</td>
			<td bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="purpose" />
			</td>
			<td height="22" align="right" bgcolor="ECF3FF">
				�Ƿ�ϵͳ��¼��
			</td>
			<td colspan="4" bgcolor="F6F9FF">
				<bean:write name="t07_obj_rule" property="is_inst" />
			</td>
		</tr>
		</TABLE>
		</div>
		</div>
		</html:form>
		
	</BODY>
</HTML>