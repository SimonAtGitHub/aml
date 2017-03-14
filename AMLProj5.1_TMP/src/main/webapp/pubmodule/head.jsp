<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.ist.common.AuthBean" %>
<%@ page import="com.ist.common.Authorization" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
<!-- start add lixx 2011.10.09 添加换肤功能 -->
<!-- <link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />  -->
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<!-- end add lixx 2011.10.09 添加换肤功能 -->
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/aml.js"></script>
<!--[if lte IE 6]>

<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->

<script language="JavaScript"> 

    function _Commit(leftpara){
      parent.document.getElementById("leftFrame").src="<%=request.getContextPath()%>/pubmodule/left.jsp?systemkey="+leftpara;
     // alert("<%=request.getContextPath()%>/pubmodule/main.do");
      parent.document.getElementById("mainFrame").src="<%=request.getContextPath()%>/pubmodule/welcome.jsp";
     }
     function _Href(){
      parent.document.getElementById("mainFrame").src="<%=request.getContextPath()%>/pubmodule/main.do";
     }
    function _Open(url){
  
      window.open(url,'p','height=500, width=750,left=100,top=100,status=yes,scrollbars=yes,resizable=yes');
  
    }
    function doSubmit(theUrl){
	 
	   document.forms[0].action=theUrl;
       document.forms[0].submit();
     
    }



</script>
</head>
<body leftmargin="0" topmargin="0">
<div class="fix_hd">
	<div class="hd">
	 <div class="hd_logo"></div>
	
	 <div class="hd_smenu">
	    <a href="#" onclick="_Href()"><img src="../images/<%=session.getAttribute("style") %>/hd_smenu01.png" />首页</a>
	    
	    <a href="#" onclick="_Open('<%=request.getContextPath()%>/platform/person/person_selfinfo.do');"><img src="../images/<%=session.getAttribute("style") %>/hd_smenu02.png" />设置</a>
	   <a href="#" onclick="doSubmit('<%=request.getContextPath()%>/logout.do');"><img src="../images/<%=session.getAttribute("style") %>/hd_smenu03.png" />退出</a>
	 </div>
	 <div class="hd_smenubg"></div>
	 <%
	  AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");
	  Authorization auth = authBean.getAuthToken();
	  LinkedHashMap systemMap=(LinkedHashMap)auth.getSystemMap();
	  %>
	 <ul id="hd_menu">
	 <%
	  
	  Set set=systemMap.keySet();
		Iterator item=set.iterator();
		while(item.hasNext()){
			String systemKey=(String)item.next();
			String systemName=(String)systemMap.get(systemKey);
		%>
			  <li><a href="#" onclick="aml_headmenu(this);_Commit('<%=systemKey%>')"><%=systemName%></a></li>
	    <% 	
		}
	  %>
	 </ul>
	</div>
	<div class="hdshadow"></div>
</div>
</body>

<html:form  method="post" action="/logout.do" target="_top">
</html:form>

</html>
