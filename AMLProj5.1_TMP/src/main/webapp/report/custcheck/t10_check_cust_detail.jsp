<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% String id_flag=(String)request.getAttribute("id_flag");%>
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script type="text/javascript"> 
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}	
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main"> 
<html:form action="/custcheck/t10_check_cust_detail.do" method="post">
<%if("1".equals(id_flag)) {%>
<div class="conditions">

	<div class="cond_t">
	  <span>客户详情</span>
		<span class="buttons">
	 	   <a href="#" onclick="dosubmit('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_resultlist.do?newsearchflag=1')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>
	</div>
	<div class="cond_t2">
		 <span class="buttons" id="iframemenu">
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_custinfo.png" />客户信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_riskaccout.png" />账户信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_translist.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />交易信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" />案例信息</a><!--
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_cluelist.do?newsearchflag=1" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_sus.png" />可疑线索</a>
		  --><a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_survey_info.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_custbusiness.png" />客户调查</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_survey_result.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_result.png" />调查结论</a>  
		 </span>
	</div>
	  
       <iframe frameborder="0" width="100%" src="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" scrolling="no" id="iframe_cus" name="iframe_cus"/>
       </div>
     <%} %>
</html:form> 
</div>
</BODY>
</HTML>
