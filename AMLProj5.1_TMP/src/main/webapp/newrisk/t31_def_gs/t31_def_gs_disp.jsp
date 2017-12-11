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
<html:form method="post" action="t31_def_gs/t31_def_gs_disp.do">
		
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  	<span>评级公式明细</span>
		<span class="buttons">
			<a href="#" onClick="dosubmit('t31_def_gs_list.do')" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
		</span>
	</div>
			
	<html:errors /> 
	</div>
		<div class="cond_c2">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  	<html:hidden  property="gskey" />
	  	<html:hidden  property="templatekey" />
	  	<html:hidden property="templatename" />
       		<tr>
				<td>公式名称：</td>
				<td>
					<bean:write name="t31_def_gs" property="gsname" />
				</td>
				<td></td><td></td>
			</tr>
			<tr>
				<td>公式说明:</td>
				<td><bean:write name="t31_def_gs" property="des" /></td>
				<td></td><td></td>
			</tr>
			<tr>
				<td>客户类型：</td>
				<td><bean:write name="t31_def_gs" property="party_class_cd_disp" /></td>
				<td>计算顺序：</td>
				<td><bean:write name="t31_def_gs" property="calseq" /></td>
			</tr>
			<tr>
				<td>等级：</td>
				<td><bean:write name="t31_def_gs" property="level_disp" /></td>
				<td>粒度：</td>
				<td><bean:write name="t31_def_gs" property="granularity_disp" /></td>
			</tr>
			<tr>
				<td>计算公式：</td>
				<td colspan="3">
				<textarea rows="3" cols="80" readonly="readonly"><bean:write name="t31_def_gs" property="gsrm" /></textarea>
				</td>
			</tr>
			<tr>
				<td>是否启用：</td>
				<td><bean:write name="t31_def_gs" property="flag_disp" /></td>
				<td>值编号：</td>
				<td><bean:write name="t31_def_gs" property="valnum" /></td>
			</tr>
			<tr>
				<td>创建日期：</td>
				<td><bean:write name="t31_def_gs" property="create_dt" /></td>
				<td>创建人：</td>
				<td><bean:write name="t31_def_gs" property="create_user" /></td>
			</tr>
		</TABLE>
		</div>
		</html:form>
		</div>
	</BODY>
</HTML>