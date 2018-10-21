<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.util.DateUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
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
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript">
	function checkForm(theUrl){
	var party_id=document.getElementById("party_id").value.replace(/\s+/g,"");
	if(party_id==null||party_id==""){
		alert("请输入客户号");
		document.getElementById("party_id").focus();
	}else{
	  document.forms[0].action=theUrl;
        document.forms[0].submit();
	}

	}
	</script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	</head>
	<body class="mainbg">
     <form action="<%=request.getContextPath()%>/information/client/getT47_partyLogForBuLu.do" method="post">
	<div class="conditions">
	<div class="cond_c">
	<%String party_id=(String)request.getAttribute("party_id"); %>
	<table border="0" cellpadding="0" cellspacing="0">
	<tr><td>客户号：</td><td><input id="party_id" type="text" name="party_id" value='<%=party_id %>'/><font color="red">*</font></td>
	<td></td>
	<td>
         <input type="button" value="查  询" 
	onclick="checkForm('<%=request.getContextPath()%>/information/client/getT47_partyLogForBuLu.do?newsearchflag=1')"
				class="in_button1"></input>
				</td>
	</tr>
	</table>
	
	</div></div>
	</form>

	<div id="main">		
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th  nowrap>
								客户号
							</th>
							<th  nowrap>
								补录日期
							</th>
							<th  nowrap>
								补录用户
							</th>						
						</tr>
	<%ArrayList list=(ArrayList)request.getAttribute("t47_partyLogList");
	if(list!=null&&list.size()>0) {
	  %>
						<logic:present name="t47_partyLogList">
							<logic:iterate id="result" name="t47_partyLogList"
								type="com.ist.aml.report.dto.T47_party">
								<tr align="center" bgcolor="#FFFFFF">
									<td>
										<bean:write name="result" property="party_id" />
									</td>
									<td nowrap>
									<%java.util.Date last_upd_dt=result.getLast_upd_dt();
									   String last_upd_show=DateUtils.dateToString(last_upd_dt);
									    last_upd_dt=null;%>
										<%= last_upd_show%>
									</td>
									<td>
							             <bean:write name="result" property="last_upd_user" />
									</td>						
								</tr>
							</logic:iterate>
						</logic:present>
	              <%}%>	             
					</table>
				</div>
				<%String newsearch=(String)request.getAttribute("newsearch");
				if(list==null||list.size()==0){
				  if("1".equals(newsearch)){ %>
				<h1 style="position:relative;top:30px;text-align:center;">没有记录!</h1>
				<%}
				} %>
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
		</div>
	</body>
</html>
