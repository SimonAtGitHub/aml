<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	pageContext.setAttribute("ctx",request.getContextPath());
%>
<html>
	<head>
		<link id="skincss" href="<bean:write name="ctx"/>/css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<title>文件下载</title>
</head>
<body class="mainbg">
	<div class="conditions">
		<div class="awp_wrap">
		  <!-- 标题区域 -->
		    <div class="cond_t">
			  <span>文件下载说明</span>
			  <span class="buttons">
			    	<a href="#" onclick="window.close()"><img src="../images/<bean:write name="style" scope="session"/>/b_edit.png" />关闭窗口</a>
			  </span>
			</div>
		</div>
		<div class="sys_warning">
			<strong><img src="<bean:write name="ctx"/>/images/blue/warning.png" />系统提示：</strong>
			<br>
			 1、点击“保存”将文件下载到本地磁盘。<br>
             2、点击“取消”将取消本次下载操作。<br>
             3、点击“打开”系统将直接打开要下载的文件。<br>
		</div>
	</div>
	<script language="javascript">
	   setTimeout("window.close()",1*10000);
	</script>
</body>
</html>
		
