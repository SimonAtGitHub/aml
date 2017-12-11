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
	
			String basefuncurl = url + "/js/basefunc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
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
</script>
</head>
<body leftmargin="0" topmargin="0"  class="mainbg" >
		<html:form action="/t31_def_temp/t31_def_temp_add.do" method="post">
			<div id="main">
				<!-- conditions -->
				<html:errors/>
				<!-- 大选项卡开始 -->
				
		
		<div id="bigTab">
			<dl class="tabm">
				<dd class="tabcur">
					<span><a  target="t21_rule" href="<%=request.getContextPath()%>/newrisk/t31_def_temp/t31_def_temp_modify.do?templatekey=<bean:write name="t31_def_tempActionForm" property="templatekey" />" class="bglink">基本属性</a></span>
				</dd>
				<dd class="tabcur">
					<span><a  target="t21_rule" href="<%=request.getContextPath()%>/newrisk/t31_def_temp/t31_def_temp_gran.do?templatekey=<bean:write name="t31_def_tempActionForm" property="templatekey" />" class="bglink">评级对象</a></span>
				</dd>
					<dd id="jf">
						<span><a  target="t21_rule" href="<%=request.getContextPath()%>/newrisk/t31_def_temp/temp_jf_disp.jsp?templatekey=<bean:write name="t31_def_tempActionForm" property="templatekey" />&temptype=1&templatename=<bean:write name='t31_def_tempActionForm' property='templatename'/>" class="">积分评级模板</a></span>
					</dd>
					<dd id="gs">
						<span><a target="t21_rule" href="<%=request.getContextPath()%>/newrisk/t31_def_gs/t31_def_gs_list.do?newsearchflag=1&templatekey=<bean:write name="t31_def_tempActionForm" property="templatekey" />&templatename=<bean:write name="t31_def_tempActionForm" property="templatename" />&party_class_cd=<bean:write name="t31_def_tempActionForm" property="party_class_cd"/>&granularity=<bean:write name="t31_def_tempActionForm" property="granularity"/>" class="">公式评级模板</a></span>
					</dd>
				    <dd style='background:none;float:right;'>
				     <a href="<%=request.getContextPath()%>/newrisk/t31_def_temp/t31_def_tempList.do?temptype=<bean:write name="t31_def_tempActionForm" property="temptype" />" ><img src="../../images/blue/b_back.png" />返 回&nbsp;</a>
				    </dd>
				
  			</dl>
		</div>
		
		
		<iframe src="<%=request.getContextPath()%>/newrisk/t31_def_temp/t31_def_temp_modify.do?templatekey=<bean:write name="t31_def_tempActionForm" property="templatekey" />" width="100%" height="450" scrolling="auto" frameborder="0" name="t21_rule" id="t21_rule"></iframe>
					 	 	
				
				
			</div>
		</html:form>
	</body>
</html>
