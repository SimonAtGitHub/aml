<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>

</HEAD>

<BODY class="mainbg">
	<html:form method="post" action="/result/t37_party_gs_resultDisp.do">
    <!-- title -->

		<html:errors />
		
					<div class="list2">
					   <table border="0" cellpadding="0" cellspacing="1">
						<tr>
						 <th colspan="3">公式信息</th>
					    </tr>
					    <tr align="center">
						 <td class="st03">公式名称</td>
						 <td class="st03">指标名</td>
						 <td class="st03">指标值</td>
					    </tr>
						<logic:iterate id="t37_gs_indicVal" name="t37_gs_indicValList"
					          type="com.ist.aml.newrisk.dto.T37_party_result">		
					    <tr align="center">
						 <td><bean:write name="t37_gs_indicVal" property="gsname" /></td>
						 <td><bean:write name="t37_gs_indicVal" property="indicname" /></td>
						 <td><bean:write name="t37_gs_indicVal" property="indicval" /></td>
					    </tr>
					   </logic:iterate>
					   </table>
					</div>	
	<div class="list">
	<TABLE align=center border=0 cellPadding=0  
			cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="100%">
			<tr>
				<td height="22" align="left" colspan="8">
					<b>调整记录列表</b>
				</td>
			</tr>
			<tr>
				<th align="center" height="22">
					编号
				</th>
				<th align="center" >
					调整时间
				</th>
				<th align="center" >
					调整原因
				</th>
				<th align="center" >
					调整前风险等级
				</th>
				<th align="center" >
					调整后风险等级
				</th>
				<th align="center" >
					提交岗位
				</th>
				<th align="center" >
					接收岗位
				</th>
				<th align="center" >
					调整人
				</th>
			</tr>
			<logic:present name="t37_level_auditList">
			
				<logic:iterate id="result" name="t37_level_auditList"
					type="com.ist.aml.newrisk.dto.T37_level_audit">
					
					<tr align="center" bgcolor="#FFFFFF">
						<td align="center"  height="22">
							<bean:write name="result" property="audit_no" />
						</td>
						<td align="center" >
							<bean:write name="result" property="last_upd_dt_disp" />
						</td>
						<td align="center" >
							<bean:write name="result" property="adjust_reason" />
						</td>
						<td align="center" >
							<bean:write name="result" property="level_before_adjust" />
						</td>
						<td align="center" >
							<bean:write name="result" property="level_after_adjust" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="post_id" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="res_post_id" />
						</td>
						<td align="center"  >
							<bean:write name="result" property="last_upd_user" />
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</TABLE>
		
</div>
</html:form>
</BODY>
</html>

