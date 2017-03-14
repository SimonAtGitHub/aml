<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/mainchangeskin.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
var jq=jQuery.noConflict();
   jq(document).ready(function(){
	   var n = jq(".navbg div");
	   n.toggle(function(){
	     n.addClass("n_haddle2").attr("title","显示菜单");
		 parent.document.getElementsByTagName("frameset")[0].rows="0,6,*";
	   },function(){
	     n.removeClass().attr("title","隐藏菜单");
		 parent.document.getElementsByTagName("frameset")[0].rows="67,6,*";
	   });
    });
</script>
</head>
<body leftmargin="0" topmargin="0" class="hdshadow">
<div class="navbg">
<div title="隐藏菜单"></div>
</div>
</body>
</html>


