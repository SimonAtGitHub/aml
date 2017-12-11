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
function _changeUrl(url){
      // var backurl=document.forms[0].backurl.value;
	   var ifram=document.all.sysrule;
	  // ifram.src=url+'&backurl='+backurl;
	    ifram.src=url
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/result/t37_party_resultMain.do">
    <%
	String resulekey=(String)request.getAttribute("resulekey");
    String regulUrl=(String)request.getAttribute("regulUrl");
    String backurl=(String)request.getAttribute("backurl");
    String party_id=(String)request.getAttribute("party_id");
    if(party_id.contains("#")){
    	party_id = party_id.replace("#","%23");
    }
	if(resulekey.contains("#")){
		resulekey = resulekey.replace("#","%23");
	}
	%>

<div class="conditions">
<div id="bigTab">
	<dl class="tabm">
	     <dd class="tabcur">
		    <span><a target="sysrule" href="javascript:void(0);" onclick="_changeUrl('<%=request.getContextPath()%>/risk_rate/result/<%=regulUrl %>.do?resulekey=<%=resulekey %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source"/>&backurl=<%=backurl %>');return false;">评级结果</a></span>	                       
		</dd>
		<logic:equal name="t37_party_resultActionForm" property="temptype" value="1">
		<dd>
		    <span><a target="sysrule" href="javascript:void(0);" onclick="_changeUrl('<%=request.getContextPath()%>/risk_rate/result/t37_appr_bas_rsltList.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey" />&statistic_dt_disp=<bean:write name="t37_party_resultActionForm" property="statistic_dt_disp"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source"/>&backurl=<%=backurl %>');return false;">积分</a></span>               
		</dd>
		</logic:equal>
	 <dd>
		    <span><a target="sysrule" href="javascript:void(0);" onclick="_changeUrl('<%=request.getContextPath()%>/risk_rate/result/t37_party_viewAdjust.do?party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&tempcategory=<bean:write name="t37_party_resultActionForm" property="tempcategory" />&check_type=<bean:write name="t37_party_resultActionForm" property="check_type"/>');return false;">客户视图</a></span>               
		</dd>
		<dd style='background:none;float:right;'>
		    <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("backurl")%>')" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回&nbsp;&nbsp;</a>
		</dd>	
	</dl>
</div>
<iframe src="<%=request.getContextPath()%>/risk_rate/result/<%=regulUrl %>.do?resulekey=<%=resulekey %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source"/>&backurl=<%=backurl %>" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
</div>
</html:form>
</body>
</html>
