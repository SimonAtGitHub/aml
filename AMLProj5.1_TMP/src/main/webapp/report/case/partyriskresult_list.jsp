<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
	
			String basefuncurl = url + "/js/basefunc.js";
	
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />

		<script language="JavaScript" src=<%=basefuncurl%>></script>


		<script language="JavaScript">
function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}
function dosubmit(theUrl) {
	document.forms[0].action = theUrl;
	document.forms[0].submit();
}

</script>
	</head>
	<body id="iframecontent" style="height:450px">
		<html:form method="post" action="/case/partyriskresult_list.do">
		<input type="hidden" name="backurl" value="<%=request.getContextPath()%>/report/case/partyriskresult_list.do"/>
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<th>
							客户号
						</th>
						<th>
							客户名称
						</th>
						<th>
						           客户类型
						</th>
						<th>
							所属机构
						</th>
						
						<th>
							状态
						</th>
						<th width="20%">
							操作
						</th>
					</tr>
					<logic:iterate id="party" name="t07_stcr_partyList"
						type="com.ist.aml.report.dto.T47_party" indexId="number">
					<% 
						java.util.HashMap map = new java.util.HashMap();
						map.put("party_id",party.getParty_id());
						map.put("party_class_cd",party.getParty_class_cd());
						map.put("backurl","../case/partyriskresult_list.do");
						pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
						<tr>
							<td>
							<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/risk_rate/result/t37_party_view_disp.do?party_id=<%=party.getParty_id() %>&party_class_cd=<%=party.getParty_class_cd() %>')">
							    <bean:write name="party" property="party_id" scope="page" />
						    </a>
							</td>
							<td>
								<bean:write name="party" property="party_chn_name" scope="page" />
							</td>
							<td>
								<bean:write name="party" property="party_class_cd_disp" scope="page" />
							</td>
							<td>
								<bean:write name="party" property="organ_name" scope="page" />
							</td>
							
						
							<td>
								<bean:write name="party" property="party_status_disp" scope="page" />
							</td>
							<td>
							<logic:equal name="add_atten_lib" value="1">
								 <a href="#" onClick="ymPrompt.win({message:'<%=request.getContextPath() %>/report/attention/add_attention_lib_form_case.do?party_id=<bean:write name="party" property="party_id" scope="page" />',width:550,height:330,title:'关注库',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_bull.png"  />加入关注库</a>
		                     </logic:equal>
		                         <a href="#" onClick="ymPrompt.win({message:'<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_re_add_fromcase.do?party_id=<bean:write name="party" property="party_id" scope="page" />',width:480,height:250,title:'客户调查',handler:handler,iframe:true,fixPosition:true,dragOut:false});" ><img src="../../images/blue/b_custbusiness.png" align="absmiddle" />发起客户调查</a>
							
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page" >
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
		</html:form>
	</body>
</html>