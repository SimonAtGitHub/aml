<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _chengeUrl(url){
       var backurl=document.forms[0].backurl.value;
	   var ifram=document.all.sysrule;
	   ifram.src=url+'&backurl='+backurl;
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/result/t37_result_gs_modify.do">
    <%
	String resulekey=(String)request.getAttribute("resulekey");
	if(resulekey.contains("#")){
		resulekey = resulekey.replace("#","%23");
	}
	%>
<input type="hidden" name="backurl" value="t37_party_result_list.do?post_id=<bean:write name="t37_party_resultActionForm" property="post_id" />&tempcategory=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>"/>
<div class="conditions">
<div id="bigTab">
	<dl class="tabm">
		<dd class="tabcur">
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/newrisk/result/t37_appr_bas_rsltList.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey" />&statistic_dt_disp=<bean:write name="t37_party_resultActionForm" property="statistic_dt_disp"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>')">积分</span>               
		</dd>
		<dd>
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/newrisk/result/t37_result_jf_modify.do?resulekey=<%=resulekey %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>')">评级结果</span>	                       
		</dd>	
	</dl>
</div>
<iframe src="<%=request.getContextPath()%>/newrisk/result/t37_appr_bas_rsltList.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey" />&statistic_dt_disp=<bean:write name="t37_party_resultActionForm" property="statistic_dt_disp"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&backurl=t37_party_result_list.do?post_id=<bean:write name="t37_party_resultActionForm" property="post_id" />&tempcategory=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
</div>
</html:form>
</body>
</html>
