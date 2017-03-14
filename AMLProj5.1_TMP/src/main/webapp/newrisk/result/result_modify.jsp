<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.util.StringUtils"%>



<html:html>
<HEAD>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].reason.value)==0){
        errMsg+="请填写评级调整说明！";
        document.forms[0].reason.focus();
    }
    if(errMsg!=""){
     alert(errMsg);
     return false;
   }else{
     document.forms[0].action=theUrl;
     document.forms[0].submit();
   }
}
function _Open(url){
 url=url+"&resulekey="+document.forms[0].resulekey.value
  window.open(url,'enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
}

</script>
</HEAD>

<BODY leftmargin=0 topmargin=0>
	<html:form method="post" action="/result/t37_result_gs_modify.do">
	    <html:hidden property="curr_post"/>	
		<input type="hidden" name="backurl" value="<bean:write name="backurl"/>"/>
		<html:hidden property="resulekey" />
		<html:hidden property="templatekey" />
	    <html:hidden property="party_id" />
	    <html:hidden property="granularity" />
	    <html:hidden property="temptype"/>
	    <html:hidden property="statistic_dt_disp" />
	    <html:hidden property="organkey" />
		<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>风险评级－调整评级结果</span>
				<span class="buttons">
					&nbsp;
						<a href="#" onclick="_Open('<%=request.getContextPath()%>/newrisk/t37_risk_attach/t37_risk_attach_list.do?newsearchflag=1')" >  <img src="../../images/blue/b_addreport.png" />上传附件</a>
					   <a href="#" onclick='dosubmit("<bean:write name="backurl"/>")'><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>

					</span>
			</div>
		<html:errors />
		<div class="cond_c">
	 <table width="100%" border="0" cellpadding="1" cellspacing="1">
							<tr  >
								<td height="22" align="right" nowrap>
									客户名称：
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="party_chn_name" />
								</td>
							</tr>
							<tr>
								<td height="22" align="right" nowrap>
									系统评级时间：
								</td>
								<td bgcolor="F6F9FF">
									<bean:write name="t37_party_resultActionForm"
										property="statistic_dt_disp" />
								</td>
							</tr>
							<tr>
								<td height="22" align="right" bgcolor="ECF3FF" nowrap>
									客户类型：
								</td>
								<td bgcolor="F6F9FF">
									<bean:write name="t37_party_resultActionForm"
										property="party_class_cd" />
								</td>
							</tr>
							<tr>
								<td height="22" align="right" nowrap>
									评级公式名称：
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="gsname" />
								</td>
							</tr>
							<tr>
								<td height="22" align="right" nowrap>
									评级公式：
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="gsrm" />
								</td>
							</tr>
							<tr>
								<td height="22" align="right" bgcolor="ECF3FF" nowrap>
									系统评级结果：
								</td>
								<td bgcolor="F6F9FF">
									<bean:write name="t37_party_resultActionForm"
										property="fristappralevel_disp" />
									<html:hidden name="t37_party_resultActionForm"
										property="fristappralevel" />	
									<html:hidden name="t37_party_resultActionForm"
											property="level_before_adjust" />
								</td>
							</tr>
							<tr>
								<td height="22" align="right"  nowrap>
									调整等级：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="emendationlevel">
										<html:options collection="levelMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
						
							</tr>
							<logic:notEmpty name="t37_party_resultActionForm" property="return_reason">
							    <tr>
								<td height="22" align="right" nowrap>
									退回原因：
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="return_reason" />
								</td>
							</tr>
							</logic:notEmpty>
							<tr>
								<td height="22" align="right" nowrap>
									调整原因：
								</td>
								<td>
									<%
												if (request.getAttribute("reasonMap") != null
												&& ((ArrayList) request.getAttribute("reasonMap")).size() > 0) {
									%>
									<html:select property="reason">
										<html:options collection="reasonMap" property="label"
											labelProperty="value" />
									</html:select>
									<%
									} else {
									%>
									<html:textarea property="reason" styleClass="text_white"
										cols="55" rows="5"></html:textarea>
									<%
									}
									%>
								</td>
							</tr>
							<tr>

								<td height="22" align="center" >
									&nbsp;
								</td>
								<td>
								<%String curr_post=(String)request.getAttribute("curr_post");
							
			                     String node_id="";
		                        String oper_id="";
		                        String oper_id1="";
			                      	if(curr_post.equals("P2002")){
			   		                node_id="N2002"	;
			   		                oper_id="B20021";
			   		                 oper_id1="B20023";
			                        }	
			                        if(curr_post.equals("P2001")){
			   		                node_id="N2001"	;
			   		                  oper_id="B20011";
			   		                 oper_id1="B20013";
			                        }
			                        if(curr_post.equals("P2003")){
			   		                node_id="N2003"	;
			   		                  oper_id="B20031";
			   		                 oper_id1="B20033";
			                        }
			
								
								 %>

									<input type="button" class="in_button1" value="提交"
										onclick="checkForm('t37_result_modify_do.do?node_id=<%=node_id%>&oper_id=<%=oper_id%>')" />
										<% if(!curr_post.equals("P2001")){  %>
										<input type="button" class="in_button1" value="退回"
										onclick="checkForm('t37_result_modify_do.do?node_id=<%=node_id%>&oper_id=<%=oper_id1%>')" />
										<%} %>

								</td>
							</tr>
						</table>
					</div>
  </div>	
	<div class="list">
	<TABLE align=center border=0 cellPadding=0  
			cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
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
</div>
	</html:form>
</BODY>
</html:html>

