<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
    <%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script type="text/javascript">
    	function search(paramValue) {
    		parent.searchEngineTop.setDefaultParamValue(paramValue);
    	}
    	
    	function searchCrltSrch(crltSrchKey) {
    		var url = "user_crlt_srch_link.do";
    		var oForm = document.forms[0];
    		oForm.crltsrchkey.value = crltSrchKey;
    		oForm.action = url;
    		
    		var topForm = parent.searchEngineTop.document.forms[0];
    		for (var i=0; i < topForm.elements.length; i++) {
    			if (topForm.elements[i].name.indexOf("p_") == -1) {
    				continue;
    			}
    			var hideHtml = "<input type='hidden' name='"+ topForm.elements[i].name +"' value='" + topForm.elements[i].value + "'/>";
    			var oElement = document.createElement(hideHtml);
    			oForm.appendChild(oElement);
    		}
    		
    		oForm.submit();
    	}
    </script>
  </head>
  <body>
  	<!-- 系统总体框架，占页面宽度的98％ -->
  	<div id='content'>
   	  <html:form method="post" action="/search/user_crlt_srch_link">
   	  	<input type="hidden" name="newsearchflag" value="0" />
   	  	<input type="hidden" name="crltsrchkey" />
   	    <html:hidden property="srchengkey" />

	    <!-- 数据区 -->
	    <div align="left" style="margin-top:6px">
	    	<b>相关搜索：</b>
	   		<logic:iterate id="crltInfo" name="t02_crlt_srchList" type="com.ist.avp.search.dto.T02_crlt_srch">
	   	    	<a href="javascript:searchCrltSrch('<bean:write name="crltInfo" property="crltsrchkey" />')">
	   	          	<bean:write name="crltInfo" property="crltsrchname" />
	   	        </a>
	   	        &nbsp;&nbsp;
	 	    </logic:iterate>
          <table style="text-align:center;background-color:#ebf7ff;">
          	<c:out value="${crltSrchResultView}" escapeXml="false"/>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>