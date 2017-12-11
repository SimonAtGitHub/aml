<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
 
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

<script LANGUAGE="JavaScript">


function dosubmit(theUrl){

   var obj = window.parent;
   obj.close();
   //obj.document.forms[0].action="<%=request.getContextPath() %>"+theUrl;
   //obj.document.forms[0].submit();
   obj.opener.document.forms[0].action="<%=request.getContextPath() %>"+theUrl;
   obj.opener.document.forms[0].submit();
}
</script>
</head>

<body leftmargin="0" topmargin="0">

    <html:form action="/person/person_selfinfo_color_do.do" method="post">

	 <div class="conditions">
	  <div class="cond3">
	    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <%-- <tr>
		     <td>
		        <logic:iterate id="col" name="colorList" indexId="number">
		           <bean:define id="colvalue">
		               <bean:write name="number"/>
		           </bean:define>
		           <html:radio property="color" value='<%=colvalue %>' styleId="<%=colvalue %>" onclick="dosubmit('person_selfinfo_color_do.do')"> 
		                <bean:write name="col"/>
		           </html:radio>
		        </logic:iterate>
		     </td>
		  </tr> --%>
		  <tr>
			<td height="50"><html:radio property="color" value="orange" onclick="dosubmit('/platform/person/person_selfinfo_color_do.do?color=orange')">灿烂橙色</html:radio></td>
			<td><html:radio property="color" value="blue" onclick="dosubmit('/platform/person/person_selfinfo_color_do.do?color=blue')">宝石蓝色</html:radio></td>
			<td><html:radio property="color"   value="green" onclick="dosubmit('/platform/person/person_selfinfo_color_do.do?color=green')">绿野仙踪</html:radio></td>
		  </tr>
		  <tr>
			<td><img src="../../images/orange.png" /></td>
			<td><img src="../../images/blue.png" /></td>
			<td><img src="../../images/green.png" /></td>
		  </tr>
	    </table>
	  </div>
	</div>
</html:form>
</body>
</html>
