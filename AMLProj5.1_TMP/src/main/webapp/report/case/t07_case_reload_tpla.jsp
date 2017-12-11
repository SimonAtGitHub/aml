<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
	<%String url=(String)request.getAttribute("loadurl") ;
	  url=request.getContextPath()+"/"+url;
	%>

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
        window.open("", "_self");
		window.close();
		window.opener.location.reload();

		//opener.location.href='<%=url%>';
		
		//window.opener.parent.document.all.trans.src='<%=url%>';
</SCRIPT>
</HEAD>

</HTML>
