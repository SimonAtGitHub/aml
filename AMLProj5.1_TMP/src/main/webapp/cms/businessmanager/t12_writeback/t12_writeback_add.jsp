<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/css_all.css" type="text/css">
	<script src="<%=request.getContextPath()%>/js/title.js"></script>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
	<html:form method="POST" action="/businessmanager/t12_writeback/t12_writeback_add.do">
	    <html:hidden property="articlekey" /> 
	    <html:hidden property="programakey" /> 
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="0" id="title_table">
			<tr>
				<td>
					<span class="css014"> <strong><font color="0072BC">文章回复</font> </strong> </span>
				</td>
				<td align="right">
					<html:button property="backbutton" value="关 闭" styleClass="input"
						onclick="window.close();" />
				</td>
			</tr>
		</table>
		
		<table class="split" width="100%">
			<tr>
				<td height="8">
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
				</td>
			</tr>
		</table>
		
		<table width="100" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="8"></td>
			</tr>
		</table>


		<TABLE align=center border=1 cellPadding=0 borderColor=333333
			cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
			<TBODY>
				<TR>
					<TD align="center" valign="top"
						style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
						<table width="100%" border="0" cellpadding="1" cellspacing="1" id="query_table">
							<tr>
								<td width="160" align="right">
									文章标题：
								</td>
								<td>
								    <bean:write property="articlename" name="t12_article" ignore="true"/>
								</td>
							</tr>
							
							<tr>
								<td align="right">
									<FONT color="#ff0000">*</FONT>回复内容：
								</td>
								<td>
									<html:textarea property="replycontent" cols="60" rows="18" />
								</td>
							</tr>
														

							<tr>
								<td align="right">
									
								</td>
								<td align="left">
								   <html:button property="button" value="提  交" styleClass="input"
										onclick="awpDoSubmit('t12_writeback_add_do.do','add')" />
									<html:reset styleClass="input" value="重  填" />
								</td>
							</tr>
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</html:form>
</body>
<script>
	setTableStyle("title_table","title");
	setTableStyle("query_table","condition");
</script>
</html:html>
