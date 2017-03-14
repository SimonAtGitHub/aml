<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>

		<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
        document.forms[0].action=theUrl;
		document.forms[0].submit();
		
        var left_value=window.parent.leftFrame.location+"";
        var p_url="<%=request.getContextPath()%>/avp/template/tpla_maint_list.do?newsearchflag=1&busstypecd=<%=request.getParameter("busstypecd")%>";
        //alert(left_value.indexOf("tpla_add_left"));
        if(left_value.indexOf("tpla_add_left") != -1 || left_value.indexOf("tpla_bz_add_left") != -1){ 
            //window.parent.opener.location=p_url;
            var _parentWin = window.parent ;
		    _parentWin.close();
        }else{
        	parent.location.href=p_url;
            event.srcElement.disabled = true;
        }
        
}
function dosubmit(theUrl,type){
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
}
	function parentpage(theUrl){
	 // window.parent.opener.refresh();
	  //parent.window.close();
	  parent.location=theUrl;
	}
</SCRIPT>
	</HEAD>
	<BODY>
		
			<html:form method="post" action="/t21_rule/t03_rule_all_info_do.do">
			<div id="main">
				<html:hidden property="tplakey" />
                <div class="conditions">
				<div class="cond_t">
							<span> 规则管理 - 规则信息汇总 </span>
							
				</div>
				

				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="15%">
								所属规则：
							</td>
							<td width="35%">
								<bean:write name="t21_rule" property="pbc_des" scope="request" />
							</td>
							<td width="15%">
								计算方式：
							</td>
							<td width="35%">
								<bean:write name="t21_rule" property="gs_type_disp" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								类型：
							</td>
							<td>
								<bean:write name="t21_rule" property="interfacekey_disp" scope="request" />
							</td>
							<td>
								币种：
							</td>
							<td>
								<bean:write name="t21_rule" property="curr_cd_disp" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								规则编号：
							</td>
							<td>
								<bean:write name="t21_rule" property="rulekey" scope="request" />
							</td>
							<td>
								规则名称：
							</td>
							<td>
								<bean:write name="t21_rule" property="rule_des" scope="request" />
							</td>
						</tr>

						<tr>
							<td>
								预警主体：
							</td>
							<td>
								<bean:write name="t21_rule" property="party_acct_cd_disp" scope="request" />
							</td>
							<td>
								主体描述：
							</td>
							<td>
								<bean:write name="t21_rule" property="type_des" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								粒度：
							</td>
							<td>
								<bean:write name="t21_rule" property="granulairty_disp" scope="request" />
							</td>
							<td>
								状态：
							</td>
							<td>
								<bean:write name="t21_rule" property="flag_disp" scope="request" />
							</td>
						</tr>
						

						<tr>
							<td>
								执行sql：
							</td>
							<td colspan="3" style="white-space:normal;">
									<c:out value="${sql}" escapeXml="false"/>
							</td>
						</tr>
					</table>
				</div>
                </div>
				<div class="list">
					<TABLE border="0" cellspacing="0" cellpadding="0">
						<TR align=center>
							<TH width="10%" align="center" nowrap>
								序号
							</TH>
							<TH width="15%" align="center" nowrap>
								参数代码
							</TH>
							<TH width="35%" noWrap>
								显示名称
							</TH>
							<TH width="20%" noWrap>
								输入参数类型
							</TH>
							<TH width="10%" noWrap>
								是否必输
							</TH>
							<TH width="10%" noWrap>
								显示序号
							</TH>
						</TR>

						<logic:iterate id="parinfo" name="t03_page_in_parmList"
							type="com.ist.aml.rule.dto.T03_page_in_parm" indexId="id"
							offset="0">
							<TR align="center" >
								<TD nowrap>
									<bean:write name="id" />
								</TD>
								<TD nowrap>
									<bean:write name="parinfo" property="sysinparmcd" scope="page" />
								</TD>
								<TD nowrap>
									<bean:write name="parinfo" property="dispname" scope="page" />
								</TD>
								<TD nowrap>
									<bean:write name="parinfo" property="parmtype_disp"
										scope="page" />
								</TD>
								<TD nowrap>
									<bean:write name="parinfo" property="isness_disp" scope="page" />
								</TD>
								<TD nowrap>
									<bean:write name="parinfo" property="dispseq" scope="page" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>

             </div>
             
			</html:form>
		
	</BODY>
</HTML>
