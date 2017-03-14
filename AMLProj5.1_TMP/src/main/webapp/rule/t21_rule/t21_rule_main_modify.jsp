<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		
		<style>
		html{_overflow-y:scroll}
		</style>
		<script language="JavaScript">
function dosubmit(theUrl){  
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}

function opersubmit2(theUrl,obj){
   var j = obj.name;
   j = j.substring(0,j.length-1)+2;
   theUrl = theUrl + j;
   if(confirm("确认您的操作吗!")){
      dosubmit(theUrl);
   }
}

function tasksubmit(theUrl,task_id){  
  // form1.task_id.value=task_id; 
   dosubmit(theUrl);
}
function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}
function _changeUrl(url){
	var iframe = document.all.t21_rule;
	iframe.src = url;
}
</script>
</head>
<body leftmargin="0" topmargin="0"  class="mainbg" >
		<html:form action="/t21_rule/t21_rule_main_modify.do" method="post">
			<div id="main">
				<!-- conditions -->
				<html:errors/>
				<!-- 大选项卡开始 -->
				
		<div class="conditions">
		<div id="bigTab">
			<dl class="tabm">
				<dd class="tabcur">
					<span><a  target="t21_rule" href="javascript:void(0);" onclick="_changeUrl('<%=request.getContextPath()%>/rule/t21_rule/modify_rule_disp.do?tplakey=<bean:write name="t21_ruleActionForm" property="tplakey" />')" class="bglink">基本属性</a></span>
				</dd>
				
				<dd id="ruledef">
					<span ><a  target="t21_rule" href="javascript:void(0);" onclick="_changeUrl('<%=request.getContextPath()%>/rule/t21_rule/modify_rule_indic.do?rulekey=<bean:write name="t21_ruleActionForm" property="rulekey" />')" class="">规则定义</a></span>
				</dd>
				<dd id="sqldef">
					<span ><a target="t21_rule" href="javascript:void(0);" onclick="_changeUrl('<%=request.getContextPath()%>/rule/t21_rule/sql_rule_index.do?tplakey=<bean:write name="t21_ruleActionForm" property="tplakey" />')" class="">SQL定义</a></span>
				</dd>
				 <dd style='background:none;float:right;'>
				   <a href="<%=request.getContextPath()%>/rule/t21_rule/t21_rule_list.do" ><img src="../../images/blue/b_back.png" />返 回&nbsp;</a>
				 </dd>
				
  			</dl>
		</div>
		
		
		<iframe src="<%=request.getContextPath()%>/rule/t21_rule/modify_rule_disp.do?tplakey=<bean:write name="t21_ruleActionForm" property="tplakey" />" width="100%" height="450" scrolling="auto" frameborder="0" name="t21_rule" id="t21_rule"></iframe>
					
				
			</div>	
			</div>
		</html:form>
	</body>
</html>
