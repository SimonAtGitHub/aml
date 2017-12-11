<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
	

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">

window.parent.ymPrompt.close()
//window.parent.location.href='<%=(String)request.getAttribute("url")%>';
window.parent.location.href='<%=request.getContextPath()%>/mfa/module/module_stcr_modify.do?module_no=<%=request.getParameter("module_no")%>';
		
</SCRIPT>
</HEAD>

</HTML>
