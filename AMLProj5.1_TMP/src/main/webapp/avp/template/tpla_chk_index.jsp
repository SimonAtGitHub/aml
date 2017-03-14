<%@ page contentType="text/html; charset=GBK"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script language="javascript" 	src="../../js/title.js"></script>
	</head>

	<frameset rows="*" cols="166,*" framespacing="0" frameborder="no" border="0" name="tpla" >
		<frame src='<c:out value="${pageContext.request.contextPath}" />/pub/menu_left_tree.do?menu_id=avp_tpla_tree&busstypecd=<c:out value="${param.busstypecd}" />' name="leftFrame"
			scrolling="yes"  id="leftFrame" title="leftFrame" />
		<frame src="../public_main.jsp" name="mainFrameAvp" id="mainFrameAvp"
			scrolling="auto"  />
			
	</frameset>
	
</html>
