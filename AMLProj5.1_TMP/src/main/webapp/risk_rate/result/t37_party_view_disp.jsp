<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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

<html:form action="/result/t37_party_viewMain.do" method="post">
<div class="conditions">

	<% 
	String party_id = (String)request.getParameter("party_id");
	String viewRegulUrl=(String)request.getAttribute("viewRegulUrl");
	if(party_id.contains("#")){
		party_id = party_id.replace("#","%23");
	}
//	String resulekey =(String)request.getAttribute("resulekey");
	//if(resulekey.contains("#")){
	//	resulekey = resulekey.replace("#","%23");
	//}	
	%>
	<div class="cond_t2">
		 <span class="buttons" id="iframemenu">
		       <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_custinfo.png" />�ͻ���Ϣ</a>
		       <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="iframe_cus_child" ><img src="../../images/<%=session.getAttribute("style") %>/b_riskaccout.png" />�˻���Ϣ</a>
		       <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" />������Ϣ</a>
		       <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_translist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />������Ϣ</a>
			   <a href="<%=request.getContextPath() %>/risk_rate/result/<%=viewRegulUrl %>.do?resulekey=<bean:write name="t37_party_resultActionForm" property="resulekey"/>&party_id=<%=party_id %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=curr&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey"/>" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />������Ϣ</a>
			   <a href="<%=request.getContextPath() %>/risk_rate/result/t37_party_result_uhlist.do?party_id=<%=party_id %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&newsearchflag=1" target="iframe_cus_child" ><img src="../../images/<%=session.getAttribute("style") %>/b_result.png" />��ʷ������Ϣ</a>
		       <a href="<%=request.getContextPath() %>/report/cust_identify/t10_party_risklist.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="iframe_cus_child" ><img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" />�����¼�</a>
			   <a href="<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_result_viewlist.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="iframe_cus_child" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />�������</a>
			   <a href="<%=request.getContextPath() %>/report/attention/t07_attention_lib_list.do?newsearchflag=1&atten_post=P5&party_id=<%=party_id %>&is_his=all" target="iframe_cus_child"><img src="../../images/<%=session.getAttribute("style") %>/b_analysis.png" />��ע��Ϣ</a>&nbsp;
			   <a href="<%=request.getContextPath() %>/risk_rate/result/getT37_level_auditList_not.do?newsearchflag=1&party_id=<%=party_id %>" <img src="../../images/<%=session.getAttribute("style") %>/b_risktranc.png" /> <font color='red'>�˹�δ������¼</font></a>
		 </span>           
		<% String backurl=(String)request.getAttribute("backurl");
		     if(backurl!=null && !backurl.equals("")){
		 %>  
		 <span style='background:none;float:right;'>
		    <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("backurl")%>')" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>&nbsp;
		</span>	
		<%} %>
	</div>
		<iframe frameborder="0" width="100%" height="450px" src="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" scrolling="auto" id="iframe_cus_child" name="iframe_cus_child"/>
		
       </div>
      
</html:form> 
</BODY>
</HTML>
