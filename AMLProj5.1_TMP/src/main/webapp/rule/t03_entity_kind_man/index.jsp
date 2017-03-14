<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script language="javascript" 	src="../../js/title.js"></script>
	</head>
<%
	String  str=request.getContextPath();
	String left=str+"/platform/pub/menu_left_tree.do?menu_id=t03_entity_kind_man_index_tree";
	String right=str+"/rule/entity/t03_entity_kind_man_list.do?newsearchflag=1";
%>
	<frameset rows="*" cols="166,*" framespacing="0" frameborder="no" border="0">
		<frame src="<%=left%>" name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame"/>
		<frame src="<%=right%>" name="mainFramex" id="mainFramex"
			scrolling="auto"  />			
	</frameset>	
</html>