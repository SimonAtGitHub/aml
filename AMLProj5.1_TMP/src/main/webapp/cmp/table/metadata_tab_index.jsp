<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>元数据管理－表管理</title>
	</head>

	<frameset rows="*" cols="166,*" framespacing="0" frameborder="no" border="0">
		<frame src="<%=request.getContextPath()%>/platform/pub/menu_left_tree.do?menu_id=mt_property_tree&categorytype=G00001&temp_seq_ram=<%=System.currentTimeMillis()%>"
			name="leftFrame" scrolling="yes" noresize="noresize"   id="leftFrame"
			title="leftFrame" />
		<frame
			src="<%=request.getContextPath()%>/cmp/table/metadata_tab_list.do?isroot=1&newsearchflag=1&temp_seq_ram=<%=System.currentTimeMillis()%>"
			name="mainFrame1" id="mainFrame1" scrolling="auto" title="mainFrame" />
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>
</html>
