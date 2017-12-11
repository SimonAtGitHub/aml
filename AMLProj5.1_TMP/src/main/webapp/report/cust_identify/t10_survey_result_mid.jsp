<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<BODY leftmargin="0" topmargin="0">
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script language="javascript">
window.parent.ymPrompt.close();
window.parent.location.href="<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_relist.do?newsearchflag=1";

</script>
</body>
</HTML>
