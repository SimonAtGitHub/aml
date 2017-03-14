<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	    <script language="JavaScript" src="../../js/basefunc.js"></script>
	    <script type="text/javascript" src="../../js/jquery.js"></script>
	    <script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/avpfunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>	
		
		
		<script language="JavaScript"><!--
		
		function onLoadPage() {
            var tableId = document.getElementById("tbl");
			var i = 0;
			if(tableId == null) {
                return;
            }
		    for (var row in tableId.rows) {
			    if(tableId.rows[row].className == "hiddenRow") {
				    i = i + 1;
			    }
		    }
		    if(i == 0){
		    	var oButton = document.getElementById("viewCondId");
		    	if (oButton) {
		    		oButton.style.display = "none";;
		    	}
		    }
		}
		function dosubmit(theUrl){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		}
function avpCondSubmit(theUrl) {
	oForm = document.forms[0];
	var els = oForm.elements;
	var isNotChkOk = false;
	var i = 0;
    //遍历所有表元素
	
	//验证不通过,弹出提示warning,同时该表单元素取得焦点
	if (isNotChkOk) {
		alert(els[i].warning);
		goBack(els[i]);
		return false;
	}else{
		oForm.action=theUrl;
		oForm.submit();
		event.srcElement.disabled = true; 
	}
}
        --></script>
	</head>

	<body leftmargin="0" topmargin="0">
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div id='content'>
		<html:form method="post" action="/t21_rule/get_rule_param_list.do">
		<html:hidden property="tplakey" name="rule"/>
		<html:hidden property="deployflag" name="rule"/>
		  
			<!-- 标题区域 -->
			<div class="conditions">
			<!-- 标题区域 -->
			<div class='cond_t'>
			    <span><c:out value="${labelStr}"></c:out></span>
			    <span class="buttons">
			        <c:out value="${cmdHtmlStr}" escapeXml="false"></c:out>
			        <a href="javascript:void(0);" onClick="avpCondSubmit('<%=request.getContextPath()%>/rule/t21_rule/get_rule_param_list_in_do.do?tplakey=<bean:write name="rule" property="tplakey" scope="request" />');"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
	    			<a href="#" onclick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
			    </span>
			</div>

			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="cond_c2">
			<!-- 查询条件区 -->
			   <c:out value="${condHtmlStr}" escapeXml="false"></c:out>	
            </div>
			<div id='loading' class='cond_c2'>
				<font color='#FF0000'>正在加载数据，请稍候...</font>
			</div>
			
			
		</html:form>
	</div>
	</body>
	<script language="JavaScript">onLoadPage();</script>
</html>
		
			
