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
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/cust_identify/t10_checkparty_riskRateMain.do" method="post">
<%
	String party_id =(String)request.getAttribute("party_id");
	if(party_id.contains("#")){
		party_id = party_id.replace("#","%23");
	}
	String party_class_cd = (String) request.getAttribute("party_class_cd");
	String resulekey =(String)request.getAttribute("resulekey");
	if(resulekey.contains("#")){
		resulekey = resulekey.replace("#","%23");
	}
	String check_type = (String) request.getAttribute("check_type");
	String url = (String) request.getAttribute("url");
	if(url.contains("#")){
		url = url.replace("#","%23");
	}
	String ischecked = (String) request.getAttribute("ischecked");
	String check_no = (String) request.getAttribute("check_no");
	String check_exist = (String) request.getAttribute("check_exist");
	String showCheckReason = (String) request.getAttribute("showCheckReason");
%>
<div class="conditions">
<div id="bigTab">
<dl class="tabm">
	<dd class="tabcur">
		<span>
			<a target="iframe_ss" href="<%=request.getContextPath() %>/report/cust_identify/new_client_investigation_view.do?showCheckReason=<%=showCheckReason %>&check_exist=<%=check_exist %>&table_name=0&check_no=<%=check_no %>&party_id=<%=party_id%>&party_class_cd=<%=party_class_cd %>&check_type=<%=check_type %>&ischecked=<%=ischecked %>&url=<%=url %>">
				客户调查
			</a>
		</span>
	</dd>
	<dd>
		<span>
			<a target="iframe_ss" href="<%=request.getContextPath()%>/risk_rate/result/t37_party_viewMain.do?showCheckReason=<%=showCheckReason %>&party_id=<%=party_id %>&party_class_cd=<%=party_class_cd %>&check_type=<%=check_type %>">
				客户视图
			</a> 
		</span>
	</dd>
	<dd style='background:none;float:right;'>
		<a href="#" onclick="dosubmit('<%=url %>')" ><img src="../../images/blue/b_back.png" />返回</a>&nbsp;&nbsp;
	</dd>
</dl>
</div>
<iframe src="<%=request.getContextPath() %>/report/cust_identify/new_client_investigation_view.do?showCheckReason=<%=showCheckReason %>&check_exist=<%=check_exist %>&table_name=0&check_no=<%=check_no %>&party_id=<%=party_id%>&party_class_cd=<%=party_class_cd %>&check_type=<%=check_type %>&ischecked=<%=ischecked %>&url=<%=url %>" 
	width="100%" height="450" scrolling="auto" frameborder="0" name="iframe_ss" id="iframe_ss"></iframe>
</div>
</html:form>
</body>
</html>