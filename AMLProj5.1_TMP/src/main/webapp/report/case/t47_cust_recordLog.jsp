<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.T47_transaction"%>
  <head>
  		<%String url = request.getContextPath();
     String basefuncurl=url+"/js/basefunc.js";
     String app_selecturl=url+"/js/App_Select.js";

     String valurl=url+"/js/validate.js";
     String  countryurl=url+"/js/country.js";
   %>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=valurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=app_selecturl%>></script>
		<script type='text/javascript' src=<%=countryurl%>></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		
		<script type="text/javascript" src="../../js/calendar.js"></script>
		
		
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/iepngfix.js"></script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
    <base href="<%=basePath%>">
    
    <title>客户信息补录日志</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script language="JavaScript">
	function dosubmit(theUrl,type){
    
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
	</script>

  </head>
  
  <body class="mainbg">
  <html:form action="/case/t47_cust_recordLog.do" method="post">
	<html:errors />
  	<div class="conditions">
			<div class="cond_t">
				<span> 客户信息补录日志管理 </span>
			</div>
			<!-- table content -->
			<div class="cond_c">
				<table border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td>
							修改人:
						</td>
						<td>
						 <html:text property="create_user"></html:text>
						</td>
						<td>客户号:</td>
						<td>
						<html:text property="party_id" size="12"/>    	
						</td>
						
					</tr>
					<tr>
						<td>
							修改日期:
						</td>
						<td colspan=3><html:text property="create_dt" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    	
							<input type="button" name="search" class="in_button1" value="查 询"
								onclick="dosubmit('<%=request.getContextPath()%>/report/case/t47_cust_recordLog.do?newsearchflag=1')" />
						</td>
					</tr>
				</table>
			</div>
		</div>
    <div class="list">
    	<table border="0" cellspacing="0" cellpadding="0">
    		<tr>
    			<th>客户号</th>
    			<th>客户名称</th>
    			<th>客户证件号</th>
    			<th>客户类型</th>
    			<th>修改日期</th>
    			<th>修改人</th>
    		</tr>
    		<logic:present name="t47_cust_recordLogList" scope="request">
			<logic:iterate id="cust_recordLogList" indexId="i"
				name="t47_cust_recordLogList"
				type="com.ist.aml.report.dto.T47_cust_recordLog">
			
				<tr>
					<td><bean:write name="cust_recordLogList" property="party_id" /></td>
					<td><bean:write name="cust_recordLogList" property="party_chn_name" /></td>
					<td><bean:write name="cust_recordLogList" property="card_no" /></td>
					<td><bean:write name="cust_recordLogList" property="card_type" /></td>
					<td><bean:write name="cust_recordLogList" property="create_dt" /></td>
					<td><bean:write name="cust_recordLogList" property="create_usr" /></td>
				</tr>
			</logic:iterate>
		</logic:present>
    	</table>
    </div>
    <logic:present name="t47_cust_recordLogList">
		<!-- list_page --> 
		  <div class="list_page">
			 <bean:write name="pageInfo" scope="request" filter="false" />
          </div>
	</logic:present>
	</html:form>
  </body>
</html>
