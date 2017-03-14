<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<BODY leftmargin="0" topmargin="0">
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script language="javascript">
   
		//alert("AHOLA!");
		var val1 = '<bean:write name="t21_indic" property="indickey" scope="request" filter="false"/>';
		var val2 = '<bean:write name="t21_indic" property="indicname" scope="request" filter="false"/>';
		var val3 = '<bean:write name="t21_indic" property="indic_attr" scope="request" filter="false"/>';
     window.parent.document.forms[0].hid_indickey.value=val1;
     window.parent.document.forms[0].hid_indicname.value=val2;
     window.parent.document.forms[0].hid_indic_attr.value=val3;
     window.parent.addrow();
     
   	 window.parent.ymPrompt.close();

</script>
</body>
</HTML>
