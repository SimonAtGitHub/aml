<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/ymPrompt.js"></script>
	<script language="javascript">
	function _chengeUrl(url,id){
	   var ifram=document.getElementById(id);
	   ifram.src=url;
	}
	function dosubmit(theUrl,type){
	    var errMsg = "";
	    var isSub = false;
	    if(type=='modi'){
	        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
	        isSub = true;
	    }else if(type=='pass'){
	        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
	        isSub = true;
	    }else if(type=='search' || type=='add'){
	        //location.href=theUrl+"&"+Math.random();
	        //location.href=theUrl;
	        isSub = true;
	    }
	    if(isSub && errMsg==''){
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }else{
	        if(errMsg!='')
	            alert(errMsg);
	        return false;
	    }
	}
   function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
   }
	function tipmsg(theUrl){
		if(confirm("当前账户涉及交易流水没有完全登记完，是否继续？")){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
	<div id="main"><!-- main start -->
	<html:form action="check/t37_help_checkDisp.do" method="post">
		<html:errors/>
	<!-- conditions --> 
	<div class="conditions">
		<!-- table content -->
		<%
			String check_no = (String) request.getParameter("check_no");
			String party_id = (String) request.getParameter("party_id");
			String party_class_cd = (String) request.getParameter("party_class_cd");
		%>
			<div class="cond_t">
				<logic:equal name="t37_help_check" property="status_cd" value="2"><span>KYC审查 - 评级协查复核 - 协查工作台</span></logic:equal>
				<logic:notEqual name="t37_help_check" property="status_cd" value="2"><span>KYC审查 - 评级协查 - 协查工作台</span></logic:notEqual>
				<span class="buttons">
					<logic:notEqual name="t37_help_check" property="status_cd" value="2">
						<a href="#" 
							onclick="ymPrompt.win({
								message:'<%=request.getContextPath() %>/risk_rate/check/t37_help_check_attachList.do?check_no=<%=check_no %>',width:650,height:350,title:'附件信息',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
							<img src="../../images/blue/b_addreport.png" />附件信息
						</a>
					</logic:notEqual>
					<logic:equal name="t37_help_check" property="status_cd" value="2">
						<a href="<%=request.getContextPath() %>/risk_rate/check/t37_help_recheck_list.do?newsearchflag=1" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					</logic:equal>
					<logic:notEqual name="t37_help_check" property="status_cd" value="2">
						<a href="<%=request.getContextPath() %>/risk_rate/check/t37_help_check_list.do?newsearchflag=1" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					</logic:notEqual>
				</span>
			</div>
		<div class="cond_t2">
			<span class="buttons" id="iframemenu">
				<a href="<%=request.getContextPath() %>/risk_rate/check/t37_help_case.do?check_no=<%=check_no %>&pageType=1" target="iframe_detail" title="协查信息">
					<img src="../../images/blue/b_caseinfo.png" />协查信息
				</a>
				<a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_show.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<%=party_class_cd %>" target="iframe_detail" title="客户信息">
					<img src="../../images/blue/b_risktranc.png" />客户信息
				</a>
				<a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<%=party_class_cd %>" target="iframe_detail" title="账户信息">
					<img src="../../images/blue/b_risktranc.png" />账户信息
				</a>
			</span>
		</div>
		<iframe frameborder="0" width="100%" height="500px" src="<%=request.getContextPath() %>/risk_rate/check/t37_help_case.do?check_no=<%=check_no %>&pageType=1" scrolling="no" id="iframe_detail" name="iframe_detail"></iframe>
	</div>
</html:form>
</div><!-- main end -->
</body>
</html>