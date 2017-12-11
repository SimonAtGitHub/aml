<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<!--
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		
		<SCRIPT LANGUAGE="JavaScript">
		function dosubmit(theUrl){
		       var ifram=document.all.riskframe;
			   ifram.src=theUrl;
		}
     </SCRIPT>
	</HEAD>
	<BODY id="iframecontent">
		<html:form action="/result/t37_party_result_uhlist.do" method="post">
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								操作
							</th>
							<th >
								评定日期
							</th>
							<th>
								客户名称
							</th>
							
							<th>
								模板类型
							</th>
							<th>
								粒度
							</th>
							<th>
								系统评级结果
							</th>
							<th>
								人工调整结果
							</th>
							
							<th>
								最终风险等级
							</th>	
						</tr>
						<logic:present name="t37_party_result_uhList">
							<logic:iterate id="result" name="t37_party_result_uhList"
								type="com.ist.aml.risk_rate.dto.T37_party_result">
								<%
								  String resulekey = result.getResulekey();
									if(resulekey.contains("#")){
										resulekey = resulekey.replace("#","%23");
									}
								%>
								<tr align="center">
									<td >
									 <logic:equal name="result" property="temptype" value="1">
										<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/risk_rate/result/t37_party_jf_result_uhDisp.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="result" property="templatekey" />&organkey=<bean:write name="result" property="organkey" />&rate_source=uh')"><img src="../../images/<%=session.getAttribute("style")%>/b_caseinfo.png" title="评级信息" /></a>
									 </logic:equal>
								    <logic:equal name="result" property="temptype" value="2">
									    <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/risk_rate/result/t37_party_gs_result_uhDisp.do?resulekey=<%=resulekey %>&statistic_dt_disp=<bean:write name="result" property="statistic_dt_disp" />&organkey=<bean:write name="result" property="organkey" />')&rate_source=uh"><img src="../../images/<%=session.getAttribute("style")%>/b_caseinfo.png" title="评级信息" /></a>
									</logic:equal>
									</td>
									<td nowrap>
										<bean:write name="result" property="statistic_dt_disp" />
									</td>
									<td>
										<bean:write name="result" property="party_chn_name" />
									</td>
									<td>
							             <bean:write name="result" property="temptype_disp" />
									</td>
									<td>
										<bean:write name="result" property="granularity" />
									</td>
									<td>
										<bean:write name="result" property="fristappralevel" />
									</td>
									<td>
										<bean:write name="result" property="emendationlevel_disp" />
									</td>
									<td>
										<bean:write name="result" property="levelkey_disp" />
									</td>
						
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="list_page">
					<logic:present name="pageInfo">
						<table width="98%" align="center" border="0" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</logic:present>
				</div>
				<!-- all end -->
				<iframe frameborder="0" width="100%" height="550" src="#" scrolling="auto" id="riskframe" name="riskframe"></iframe>
		</html:form>
	</BODY>
</HTML>
