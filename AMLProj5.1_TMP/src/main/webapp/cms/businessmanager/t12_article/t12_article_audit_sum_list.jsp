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

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>

	<script type="text/javascript">
	   
	   function search(url) {
	      document.forms[0].action=url;
		  document.forms[0].submit();
	   }
	   
	</script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_article/t12_article_audit_sum_list.do">
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">审核文章 - 审核状态统计列表</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />

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
							栏目名称：
						</td>
						<td>
							<html:text property="programaname" styleClass="text_white"
								size="30" />
						</td>
						<td>
							排序：
						</td>

						<td>
							<html:select property="sort_column">
								<html:option value="sum_notneed">无需审核文章数</html:option>
								<html:option value="sum_wait">待审核文章数</html:option>
								<html:option value="sum_fail">未通过审核文章数</html:option>
								<html:option value="sum_already">通过审核文章数</html:option>
							</html:select>

							<html:radio property="sort_type" value="asc">升序</html:radio>
							<html:radio property="sort_type" value="desc">降序</html:radio>
							<html:radio property="sort_type" value="">不排序</html:radio>

						</td>
					</tr>
					<tr>
						
						<td></td><td></td>
						<td></td>
						<td>
							<input type="button" name="button" value="查 询"
								onClick="search('t12_article_audit_sum_list.do?newsearchflag=1')"
								class="input">
						</td>
						
					</tr>
				</TABLE>
			</div>
			<input type="hidden" name="categorykey" value="<%=request.getAttribute("categorykey") %>"/>
			<div class="awp_list">
				<TABLE>
					<TR align=center>
						<TD nowrap>
							栏目名称
						</TD>

						<TD nowrap>
							无需审核文章数
						</TD>

						<TD nowrap>
							待审核文章数
						</TD>

						<TD nowrap>
							未通过审核文章数
						</TD>

						<TD nowrap>
							通过审核文章数
						</TD>

						<TD nowrap>
							总文章数
						</TD>
					</TR>

					<logic:iterate id="t12_article" name="t12_article_sumList"
						type="com.ist.cms.dto.T12_article">
						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("programakey", t12_article.getProgramakey());
								//map.put("articlekey", t12_article.getArticlekey());
								map.put("auditstat", t12_article.getAuditstat());

								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR align="center">
							<TD nowrap>
								<bean:write name="t12_article" property="programaname"
									scope="page" />
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_article/t12_article_audit_list.do?newsearchflag=1&auditstat=0&programakey=<bean:write name="t12_article" property="programakey"/>&categorykey=<%=request.getAttribute("categorykey") %>">
									<strong> <FONT color="#000000"><bean:write
												name="t12_article" property="sum_notneed" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_article/t12_article_audit_list.do?newsearchflag=1&auditstat=1&programakey=<bean:write name="t12_article" property="programakey"/>&categorykey=<%=request.getAttribute("categorykey") %>">
									<strong><FONT color="#0000FF"><bean:write
												name="t12_article" property="sum_wait" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_article/t12_article_audit_list.do?newsearchflag=1&auditstat=2&programakey=<bean:write name="t12_article" property="programakey"/>&categorykey=<%=request.getAttribute("categorykey") %>">
									<strong><FONT color="#ff0000"><bean:write
												name="t12_article" property="sum_fail" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_article/t12_article_audit_list.do?newsearchflag=1&auditstat=3&programakey=<bean:write name="t12_article" property="programakey"/>&categorykey=<%=request.getAttribute("categorykey") %>">
									<strong><FONT color="#7FFF00"><bean:write
												name="t12_article" property="sum_already" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<strong><FONT color="#000000"><bean:write
											name="t12_article" property="sum_all" scope="page" /></FONT></strong>
							</TD>

						</TR>
					</logic:iterate>

					<tr>
						<TD colspan="14">
							&nbsp;
						</TD>
					</tr>

					<TR align=center height="28" bgcolor="">
						<TD>
							汇总
						</TD>

						<TD>
							<strong> <FONT color="#000000"><bean:write
										name="t12_article_total" property="sum_notneed" ignore="true" />
							</FONT>
							</strong>
						</TD>

						<TD>
							<strong> <FONT color="#000000"><bean:write
										name="t12_article_total" property="sum_wait" ignore="true" />
							</FONT>
							</strong>
						</TD>

						<TD>
							<strong> <FONT color="#000000"><bean:write
										name="t12_article_total" property="sum_fail" ignore="true" />
							</FONT>
							</strong>
						</TD>

						<TD>
							<strong> <FONT color="#000000"><bean:write
										name="t12_article_total" property="sum_already" ignore="true" />
							</FONT>
							</strong>
						</TD>

						<TD>
							<strong> <FONT color="#000000"><bean:write
										name="t12_article_total" property="sum_all" ignore="true" />
							</FONT>
							</strong>
						</TD>
					</TR>
				</TABLE>
			</div>

			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<!--<bean:write name="pageInfo" scope="request" filter="false" />-->
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
</BODY>
</html:html>