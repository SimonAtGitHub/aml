<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
			<script language="JavaScript" src="../../js/basefunc.js"></script>	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>

<script language="JavaScript">


	var refresh='<%=request.getAttribute("refresh")%>';

	
	if(refresh=='1')
	{
		//dialogArguments
		opener.opener.location.href='<%=request.getContextPath()%>/mfa/t13_mfa_info/t13_mfa_info_search.do';		
		window.close();
	}

	function check_pro()
	{
		var _pro = document.forms[0].net_status.value;
		if(_pro == ''){
			document.getElementById("sub_down3").style.display='none';
		}
		if(_pro == 2)
		{
			document.getElementById("sub_down3").style.display='';
		}
		if(_pro == 3)
		{
			document.getElementById("sub_down3").style.display='none';
		}
	}
function dosubmit(theUrl)
{
	document.forms[0].action=theUrl; 
	document.forms[0].submit();
}	
</script>
</head>

<body>
<div id="main">
<html:form action="/t13_mfa_deal/t13_mfa_info_deal.do" method="post">
<html:errors />
<html:hidden property="net_id" name="t13_mfa_info"/>
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>处理</span>
	   <span class="buttons">
		<a href="#" onclick="dosubmit('t13_mfa_info_save.do?')"><img src="../../images/blue/b_save.png" />保存</a>	
<%--	 	<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/mfa/t13_mfa_info/t13_mfa_info_search.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>--%>
		<a href="#" onclick="window.close()"><img src="../../images/blue/b_edit.png" />关 闭</a>
	   </span>
	   
					
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	    <tr>
         <td>处理操作：</td>
         <td > 
         <html:select property="net_status" name="t13_mfa_info" onchange="check_pro();">
			<html:options collection="net_statusMap" property="label" labelProperty="value" />
		</html:select>
         </td>
       </tr> 
     <tr>
        <td>原因：</td>
         <td>
           <html:textarea name="t13_mfa_info" property="conclusion" cols="40" rows="6"/><br/>
         </td>
       </tr>
	 </table>
	</div>
	<logic:equal name="t13_mfa_info" property="net_status" value="2">
	   <iframe frameborder="0" width="100%"  height="700" id="sub_down3" scrolling="no" name="sub_down3"
					src="<%=request.getContextPath()%>/mfa/t13_mfa_deal/t13_mfa_stcr_deal.do?newsearchflag=1&net_id=<bean:write name="t13_mfa_info" property="net_id"/>"></iframe>
	</logic:equal>
	<iframe frameborder="0" width="100%"  height="700" id="sub_down3" scrolling="no" name="sub_down3" style="display:none"
					src="<%=request.getContextPath()%>/mfa/t13_mfa_deal/t13_mfa_stcr_deal.do?newsearchflag=1&net_id=<bean:write name="t13_mfa_info" property="net_id"/>"></iframe>
  </div>
</html:form>
</div>
</BODY>
</HTML>