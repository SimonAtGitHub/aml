<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<SCRIPT type="text/javascript"
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_article/t12_article_list.do">
			<html:hidden property="programakey" />
			<html:hidden property="categorykey" />


			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">发布文章 - 列 表</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<logic:notEmpty name="t12_articleActionForm" property="programakey">
							  <logic:equal value="1" name="t12_articleActionForm" property="iscontent">
								<html:button property="add" styleClass="input" value="我的未发布文章"
									onclick="awpDoSubmit('t12_article_norelease_list.do?newsearchflag=1','add')" />
								<html:button property="add" styleClass="input" value="新 建"
									onclick="awpDoSubmit('t12_article_add.do','add')" />
							  </logic:equal>
							</logic:notEmpty>
							<html:button property="modify" styleClass="input" value="修 改"
								onclick="awpDoSubmit('t12_article_modify.do','modi')" />
							<html:button property="delete" styleClass="input" value="删 除"
								onclick="awpDoSubmit('t12_article_delete_do.do','del')" />
							<!-- 
						<html:button property="delete" styleClass="input" value="申请发布"
						onclick="dosubmit('t12_article_depoly_do.do','add')" />
						 -->
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class='awp_cond' id="searchtable" style="display:none">
				<TABLE>

					<tr>
						<td>
							文章标题：
						</td>
						<td>
							<html:text property="articlename" size="30" />
						</td>
						<td>
							栏目名称：
						</td>
						<td>
							<html:text property="programaname" size="30"  />
						</td>
					</tr>
					<tr>
						<td>
							文章作者：
						</td>
						<td>
							<html:text property="realname" size="30"/>
						</td>
						<td>
							文章发表时间：
						</td>
						<td>
							<html:text property="createdate_min" size="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								style="cursor:hand;" width="16" height="16" border="0"
								alt="弹出日历下拉菜单" onclick="new Calendar().show(document.forms[0].createdate_min);" />
							-
							<html:text property="createdate_max" size="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								style="cursor:hand;" width="16" height="16" border="0"
								alt="弹出日历下拉菜单" onclick="new Calendar().show(document.forms[0].createdate_max);" />
						</td>
					</tr>

					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;

						</td>
						<td>
							<html:button property="button" styleClass="input" value="查 询"
								onclick="awpDoSubmit('t12_article_list.do?newsearchflag=1','search')" />
						</td>
					</tr>


				</TABLE>
			</div>

			<div class="awp_list">
				<TABLE>
					<TR align=center>
							<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
						<TD nowrap>
							文章标题
						</TD>
						<TD nowrap>
							栏目名称
						</TD>
						<TD nowrap>
							全文检索密级
						</TD>
						<TD nowrap>
							文章状态
						</TD>
						<TD nowrap>
							审核状态
						</TD>
						<TD nowrap>
							文章作者
						</TD>
						<TD nowrap>
							文章发表时间
						</TD>
					</TR>

					<logic:iterate id="t12_article" name="t12_articleList"
						type="com.ist.cms.dto.T12_article">
						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("articlekey", t12_article.getArticlekey());
								map.put("programakey", t12_article.getProgramakey());

								//map.put("rad",""+(new java.util.Date()).getTime() );
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR>
							<TD>
								<html:multibox property="selectedarticlekey">
									<bean:write name="t12_article" property="articlekey" />
								</html:multibox>
							</TD>
							<TD nowrap align="left">
								<a
									href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/businessmanager/t12_article/t12_article_disp.do?articlekey=<bean:write name="t12_article" property="articlekey" />&programakey=<bean:write name="t12_article" property="programakey" />')">
									<bean:write name="t12_article" property="articlename" scope="page" filter="false" />
								</a>
							</TD>
							<TD nowrap align="center">
								<bean:write name="t12_article" property="programaname"
									scope="page" />
							</TD>
							<TD nowrap align="center">
								<bean:write name="t12_article" property="seclevel_disp"
									scope="page" />
							</TD>
							<TD nowrap align="center">
								<bean:write name="t12_article" property="flag_disp" scope="page" />
							</TD>
							<TD nowrap align="center">
								<bean:write name="t12_article" property="auditstat_disp"
									scope="page" />
							</TD>
							<TD nowrap align="center">
								<bean:write name="t12_article" property="creator" scope="page" />
							</TD>
							<TD nowrap align="center">
								<bean:write name="t12_article" property="createdate_disp"
									scope="page" />
							</TD>
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
	
			<div class='awp_page_bottom'>
						<table>
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</div>
				</html:form>
			</div>

</BODY>

</html:html>

