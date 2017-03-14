<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<BODY leftmargin="0" topmargin="0">
<script language="javascript">
   <bean:write name="input_name" scope="request" filter="false"/>
   <bean:write name="input_name_disp" scope="request" filter="false"/>
   window.parent.ymPrompt.close();
</script>
</body>
</HTML>
