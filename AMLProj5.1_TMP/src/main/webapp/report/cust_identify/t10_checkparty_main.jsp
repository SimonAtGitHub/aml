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
<html:form action="/cust_identify/t10_checkparty_main.do" method="post">
<div id="main">
<%
String party_id=(String)request.getAttribute("party_id");
if(party_id.contains("#")){
	party_id = party_id.replace("#","%23");
}
String resulekey =(String)request.getAttribute("resulekey");
if(resulekey.contains("#")){
	resulekey = resulekey.replace("#","%23");
}
%>
	<div id="bigTab">
		<!-- 大选项卡菜单 -->
		<dl class="tabm">
			<dd class="tabcur"><span>客户识别</span></dd>
			<dd><span>相关信息</span></dd>
			<dd><span>交易分析</span></dd>
		</dl>
		<dl class="tabc">
			<dd class="tabshow">
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
		 <span class="buttons" id="iframemenu" style="float:left" >
		 <a href="<%=request.getContextPath() %>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<%=party_id%>&party_class_cd=<%=(String)request.getAttribute("party_class_cd")%>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />客户信息维护</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/modifyT10_colu.do?newsearchflag=1&party_id=<%=party_id%>&party_class_cd=<%=(String)request.getAttribute("party_class_cd")%>" target="iframe_cus" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />客户调查</a>
		        <a href="<%=request.getContextPath() %>/report/cust_identify/t10_party_risklist_mod.do?newsearchflag=1&party_id=<%=party_id%>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_tradplace.png" />风险事件</a>
		        <a href="<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_reltdisp_mod.do?changeflag=<%=(String)request.getAttribute("changeflag")%>&check_type=<bean:write name="check_type"/>&party_id=<%=party_id%>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />调查结论</a>
		     </span>
	 <span style="float:right" >
      <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("url")%>')" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回&nbsp;&nbsp;</a>
		        	</span>
		   </div>
		   <iframe frameborder="0" width="100%"  height="1000" id="iframe_cus" scrolling="yes" name="iframe_cus" 
				src="<%=request.getContextPath() %>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<%=party_id%>&party_class_cd=<%=(String)request.getAttribute("party_class_cd")%>"></iframe>
		
				</dd>
			
			<dd>
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
				<span style="float:left" >
				<a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=party_id%>&party_class_cd=<bean:write name="party_class_cd"/>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_custinfo.png" />客户信息</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id%>&party_class_cd=<bean:write name="party_class_cd"/>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_riskaccout.png" />账户信息</a>
		  		<a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id%>&party_class_cd=<bean:write name="party_class_cd"/>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" />案例信息</a>
                  <logic:equal name="isnewrisk"  value="1">
					   <a href="<%=request.getContextPath() %>/newrisk/result/t37_party_gsjf_resultDisp.do?resulekey=<%=resulekey %>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />风险评级信息</a>
				  </logic:equal>
				  <logic:equal name="isnewrisk"  value="0">
		               <a href="<%=request.getContextPath() %>/report/case/result_disp1.do?newsearchflag=1&id_flag=1&party_id=<%=party_id%>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />风险评级信息</a>
		          </logic:equal>
		        <a href="<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_resultlist.do?newsearchflag=1&party_id=<%=party_id%>&party_class_cd=<bean:write name="party_class_cd"/>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />历史识别信息</a>
		        </span>
		        
		  		<span style="float:right" >
		        <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("url")%>')" target="sub_down2" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
				</span>
			</div>
			<iframe frameborder="0" width="100%" height="650"  id="sub_down2" scrolling="auto" name="sub_down2"
					src="#"></iframe>
			</dd>
			
			<dd>
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
				<span style="float:left" >
				<a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_trans_analysis.do?newsearchflag=1&analy_type_flag=0&analy_from=1&party_id=<%=party_id%>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />交易渠道</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_trans_analysis.do?newsearchflag=1&analy_type_flag=1&analy_from=1&party_id=<%=party_id%>" target="sub_down3" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />按交易行</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_trans_analysis.do?newsearchflag=1&analy_type_flag=2&analy_from=1&party_id=<%=party_id%>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_tradplace.png" />按交易去向地</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_trans_analysis.do?newsearchflag=1&analy_type_flag=3&analy_from=1&party_id=<%=party_id%>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_settlement.png" />按结算方式</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_trans_analysis.do?newsearchflag=1&analy_type_flag=4&analy_from=1&party_id=<%=party_id%>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_tradperson.png" />按交易对手</a>
		        <a href="<%=request.getContextPath() %>/report/custcheck/t10_cust_capital_chain.do?newsearchflag=1&analy_from=1&party_id=<%=party_id%>" target="sub_down3"><img src="../../images/<%=session.getAttribute("style") %>/b_bonuschain.png" />资金链</a>
		        </span>
		        <span style="float:right" >
		        <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("url")%>')" target="sub_down3" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
				</span>
			</div>
			<iframe frameborder="0" width="100%" height="650"  id="sub_down3" scrolling="no" name="sub_down3"
					src="#"></iframe>
			</dd>
		</dl>
	</div>
</div>
</html:form>
</body>
</head>
</html>