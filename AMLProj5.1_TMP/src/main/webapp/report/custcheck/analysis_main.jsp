<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
        <script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/ymPrompt.js"></script>
<script>
jQuery.noConflict();
(function($){ 
  $(function(){
        $("#cusnew a:eq(0)").css({"color":"#ED0000"});
		$("#cusnew a").click(function(){
									 $("#cusnew a").removeAttr('style');
									 $(this).css({"color":"#ED0000"});
		});
		$(".newcontbuttons a:eq(0)").css({"font-weight":"bold","color":"#FF7200"});
		$(".newcontbuttons a").click(function(){
									 $(".newcontbuttons a").removeAttr('style');
									 $(this).css({"font-weight":"bold","color":"#FF7200"});
		});						
  });
})(jQuery);
</script> 
</HEAD>
<body id="iframecontent">
<html:form method="post" action="/custcheck/t10_trans_analysis_case_main.do">
	 <table cellpadding="0" cellspacing="0" border="0" width="100%">
	 	<tr>
		<td width="130" valign="top"> 
			<div class="cond_t2 newcontbuttons">
				 <span class="buttons">
				  <a target="iframe_cus02" href="<%=request.getContextPath() %>/report/custcheck/t10_trans_analysis_case.do?newsearchflag=1&analy_type_flag=0&analy_from=2"><img src="../../images/blue/b_custinfo.png">交易渠道</a><br/>
				  <a target="iframe_cus02" href="<%=request.getContextPath() %>/report/custcheck/t10_trans_analysis_case.do?analy_type_flag=1&analy_from=2"><img src="../../images/blue/b_riskaccout.png">按交易行</a><br/>
				  <a target="iframe_cus02" href="<%=request.getContextPath() %>/report/custcheck/t10_trans_analysis_case.do?analy_type_flag=2&analy_from=2"><img src="../../images/blue/b_risktranc.png">按交易去向地</a><br/>
				  <a target="iframe_cus02" href="<%=request.getContextPath() %>/report/custcheck/t10_trans_analysis_case.do?analy_type_flag=3&analy_from=2"><img src="../../images/blue/b_caseinfo.png">按结算方式</a><br/>
				  <a target="iframe_cus02" href="<%=request.getContextPath() %>/report/custcheck/t10_trans_analysis_case.do?analy_type_flag=4&analy_from=2"><img src="../../images/blue/b_custbusiness.png">按交易对手</a><br/>
				  <a target="iframe_cus02" href="<%=request.getContextPath() %>/report/custcheck/t10_cust_capital_chain.do?newsearchflag=1&analy_from=2"><img src="../../images/blue/b_result.png">资金链</a>
			 </span>
		  </div>
	   </td>
		<td valign="top">
			<iframe width="100%" scrolling="auto" frameborder="0" name="iframe_cus02" id="iframe_cus02" src="<%=request.getContextPath() %>/report/custcheck/t10_trans_analysis_case.do?newsearchflag=1&analy_type_flag=0&analy_from=2" style="height: 681px;"></iframe>			        </td>
	</tr>
	 </table>
</html:form>
</BODY>
</HTML>