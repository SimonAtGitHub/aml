<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
	<%String url=(String)request.getAttribute("loadurl") ;
	  String check_flag=(String)request.getAttribute("check_flag");
	  url=request.getContextPath()+"/"+url;
	%>

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">

		window.close();
		//opener.location.href='<%=url%>';
		
		<%if("uncheck".equals(check_flag)){	%>  //非查证时调用
		window.opener.parent.document.all.trans.src='<%=url%>';
		<%}%>
</SCRIPT>
</HEAD>

</HTML>
