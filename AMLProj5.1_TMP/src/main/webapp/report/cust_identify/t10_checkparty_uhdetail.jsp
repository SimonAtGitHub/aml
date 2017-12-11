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
<body leftmargin="0" topmargin="0" class="mainbg" id="iframecontent">

<html:form action="/cust_identify/t10_checkparty_uh_main.do" method="post">
<div class="conditions">

	<div class="cond_t">
	  <span>客户详情</span>
		<span class="buttons">
	 	   <a href="#" onclick="dosubmit('<%=request.getAttribute("backurl")%>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>
	</div>
	<% 
	String id = (String)request.getParameter("party_id");
	if(id.contains("#")){
		id = id.replace("#","%23");
	}
	String resulekey =(String)request.getAttribute("resulekey");
	if(resulekey.contains("#")){
		resulekey = resulekey.replace("#","%23");
	}	
	%>
	<div class="cond_t2">
		 <span class="buttons" id="iframemenu">
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_custinfo.png" />客户信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_riskaccout.png" />账户信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<%=id %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" />案例信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_translist.do?newsearchflag=0&id_flag=1&party_id=<%=id %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />交易信息</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_survey_info.do?newsearchflag=1&id_flag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_custbusiness.png" />客户调查</a>
		  <!-- <a href="<%=request.getContextPath() %>/report/case/result_disp1.do?newsearchflag=1&id_flag=1&party_id=<%=id %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />风险评级信息</a> -->
		  <logic:equal name="isnewrisk"  value="1">
			  <a href="<%=request.getContextPath() %>/newrisk/result/t37_party_gsjf_resultDisp.do?resulekey=<%=resulekey %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />风险评级信息</a>
		  </logic:equal>
		  <logic:equal name="isnewrisk"  value="0">
		     <a href="<%=request.getContextPath() %>/report/case/result_disp1.do?newsearchflag=1&id_flag=1&party_id=<%=id %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />风险评级信息</a>
		  </logic:equal>
		  <a href="<%=request.getContextPath() %>/report/cust_identify/t10_party_risklist.do?newsearchflag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />风险事件</a>
		  <a href="<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_resultlist.do?newsearchflag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_result.png" />历史识别信息</a>
		  <a href="<%=request.getContextPath() %>/report/attention/t07_attention_lib_list.do?newsearchflag=1&atten_post=P5&party_id=<%=id %>&is_his=all" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_analysis.png" />关注信息</a>  
		 
		 </span>
	</div>
	  
       <iframe frameborder="0" width="100%" height="450px" src="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=id %>&party_class_cd=<bean:write name="party_class_cd"/>" scrolling="auto" id="iframe_cus_child" name="iframe_cus_child"/>
       </div>
</html:form> 
<SCRIPT LANGUAGE="JavaScript">
      parent.document.all("sub_down2").style.height=document.body.scrollHeight+5;  
		</script>

</BODY>
</HTML>
