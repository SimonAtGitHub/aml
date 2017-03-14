<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<HTML>
<BODY leftmargin="0" topmargin="0">
<script language="javascript">
        window.close();
        opener.location.href='<%=(String)request.getAttribute("url")%>';
</script>
</body>
</HTML>
