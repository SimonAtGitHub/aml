<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script type="text/javascript"> 

function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function load0(num){
		
		}
</script>
<body class="mainbg">
<html:form action="/result/t10_checkparty_main.do" method="post">
<%
String party_id=(String)request.getAttribute("party_id");
String viewRegulUrl=(String)request.getAttribute("viewRegulUrl");
String rate_source=(String)request.getAttribute("rate_source");
String currviewRegulUrl=(String)request.getAttribute("currviewRegulUrl");
if(party_id.contains("#")){
	party_id = party_id.replace("#","%23");
}
String resulekey=(String)request.getAttribute("resulekey");
if(resulekey.contains("#")){
	resulekey = resulekey.replace("#","%23");
}
String currresulekey=(String)request.getAttribute("currresulekey");
if(currresulekey.contains("#")){
	currresulekey = currresulekey.replace("#","%23");
}
%>
<div id="main">
	<div id="bigTab">
		<!-- 大选项卡菜单 -->
		<dl class="tabm">
			<dd class="tabcur"><span>评级信息</span></dd>
			<dd><span>其他信息</span></dd>
			<dd style='background:none;float:right;'>
		    <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("backurl")%>')" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回&nbsp;&nbsp;</a>
		   </dd>
		</dl>
		<dl class="tabc">
		<dd class="tabshow">
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
				<span style="float:left" >
			    <a href="<%=request.getContextPath() %>/risk_rate/result/<%=viewRegulUrl %>.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<%=rate_source%> " target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />系统评级信息</a>
			    <a href="<%=request.getContextPath() %>/risk_rate/result/<%=viewRegulUrl %>.do?resulekey=<%=resulekey%>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=curr" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />评级信息</a>
		        <a href="<%=request.getContextPath() %>/risk_rate/result/t37_party_result_uhlist.do?party_id=<%=party_id %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&newsearchflag=1" target="sub_down2" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />历史评级信息</a>
		        </span>
			</div>
			<iframe frameborder="0" width="100%" height="450"  id="sub_down2" scrolling="auto" name="sub_down2"
					src="<%=request.getContextPath() %>/risk_rate/result/<%=viewRegulUrl %>.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<%=rate_source%>  "></iframe>
			</dd>
			
			<dd>
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
				<span style="float:left" >
				   <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />客户信息</a>
				   <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down3" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />账户信息</a>
			       <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_tradplace.png" />案例信息</a>
			       <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_translist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />交易信息</a>
			       <a href="<%=request.getContextPath() %>/report/cust_identify/t10_party_risklist.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down3" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />风险事件</a>
				   <a href="<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_result_viewlist.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down3" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />调查结论</a>
		        </span>
			</div>
			<iframe frameborder="0" width="100%" height="450"  id="sub_down3" scrolling="auto" name="sub_down3"
					src="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />"></iframe>
			</dd>
		</dl>
	</div>
</div>
</html:form>
</body>
</head>
</html>