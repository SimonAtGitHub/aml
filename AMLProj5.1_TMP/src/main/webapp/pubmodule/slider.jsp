<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
var jq=jQuery.noConflict();
   jq(document).ready(function(){
	   var s = jq(".sliderbg div");
	   s.toggle(function(){
	     s.addClass("s_haddle2").attr("title","显示菜单");
		 parent.document.getElementsByTagName("frameset")[1].cols="0,18,*";
	   },function(){
	     s.removeClass().attr("title","隐藏菜单");
		 parent.document.getElementsByTagName("frameset")[1].cols="209,18,*";
	   });
    });
</script>
</head>
<body class="slider_bot">
<div class="sliderbg">
 <div title="隐藏菜单"></div>
</div>
<!--[if gte IE 8]><div class="slider_botie8"></div><![endif]-->
</body>
</html>

