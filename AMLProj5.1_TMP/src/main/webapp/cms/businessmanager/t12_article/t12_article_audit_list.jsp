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
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>

	<script type="text/javascript">
	   function onloadDo() {//页面加载时调用
	 
	       var auditstat = document.forms[0].auditstat.value;
	       //alert("auditstat:"+auditstat);
	       
	       if(auditstat == '0') {//无需审核
	           document.forms[0].notneed.disabled = "true";
	       }
	       else if(auditstat == '1') {//待审核
	    	   document.forms[0].wait.disabled = "true";
	       }
	       else if(auditstat == '2') {//审核不通过
	    	   document.forms[0].fail.disabled = "true";
	       }
	       else if(auditstat == '3') {//已审核
	    	   document.forms[0].already.disabled = "true";
	       }
	   }
	   
	   function dosubmit(url, value) {
		   document.forms[0].auditstat.value = value;
	      document.forms[0].action=url;
		  document.forms[0].submit();
	   }
	   
	   function searchOrBack(url) {
	      document.forms[0].action=url;
		  document.forms[0].submit();
	   }
	   function deleconfirm(url){
               if(confirm('你真的要删除吗？')){
                  document.forms[0].action=url;
	  			  document.forms[0].submit();
               }
        }
	   
	</script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_article/t12_article_audit_list.do">
			<html:hidden property="programakey" />
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2"> 文章列表 - <logic:equal value="0"
									property="auditstat" name="t12_articleActionForm">
					   无需审核
					</logic:equal> <logic:equal value="1" property="auditstat"
									name="t12_articleActionForm">
					   待审核
					</logic:equal> <logic:equal value="2" property="auditstat"
									name="t12_articleActionForm">
					   审核未通过
					</logic:equal> <logic:equal value="3" property="auditstat"
									name="t12_articleActionForm">
					   通过审核
					</logic:equal> </span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:hidden property="auditstat" />
							<html:button property="wait" styleClass="input" value="待审核"
								onclick="dosubmit('t12_article_audit_list.do?newsearchflag=1','1')" />
							<html:button property="fail" styleClass="input" value="审核未通过"
								onclick="dosubmit('t12_article_audit_list.do?newsearchflag=1','2')" />
							<html:button property="already" styleClass="input" value="通过审核"
								onclick="dosubmit('t12_article_audit_list.do?newsearchflag=1','3')" />
							<html:button property="notneed" styleClass="input" value="无需审核"
								onclick="dosubmit('t12_article_audit_list.do?newsearchflag=1','0')" />
							<html:button property="search" styleClass="input" value="返  回"
								onclick="searchOrBack('t12_article_audit_sum_list.do?newsearchflag=1&back=yes')" />
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
							<FONT color="#ff0000"> <bean:write name="programa"
									property="programaname" ignore="true" /> </FONT>
						</td>
						<td>
							文章标题：
						</td>
						<td>
							<html:text property="articlename" styleClass="text_white"
								size="30" />
						</td>
					</tr>

					<tr>
						<td>
							文章作者：
						</td>
						<td>
							<FONT color="#ff0000"> <html:text property="realname"
									styleClass="text_white" size="30" />
						</td>
						<td>
							文章发表时间：
						</td>
						<td>
							<html:text property="createdate_min" maxlength="10" size="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img1" style="cursor:hand;" width="16" height="16" border="0"
								align="middle" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].createdate_min);">
							-
							<html:text property="createdate_max" maxlength="10" size="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img1" style="cursor:hand;" width="16" height="16" border="0"
								align="middle" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].createdate_max);">
						</td>
					</tr>
					<tr>
					<td></td><td></td><td></td>
					<td>
						<input type="button" name="button" value="查 询"
								onClick="searchOrBack('t12_article_audit_list.do?newsearchflag=1');"
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
							文章标题
						</TD>

						<TD nowrap>
							文章作者
						</TD>

						<TD nowrap>
							文章发表时间
						</TD>

						<TD nowrap>
							管理员是否修改
						</TD>

						<TD nowrap>
							操作
						</TD>
					</TR>

					<logic:iterate id="t12_article" name="t12_articleList"
						type="com.ist.cms.dto.T12_article">
						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("programakey", t12_article.getProgramakey());
								map.put("articlekey", t12_article.getArticlekey());
								map.put("auditstat", t12_article.getAuditstat());
								map.put("categorykey",request.getAttribute("categorykey"));
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR>
							<TD align="left" nowrap>
									<a
										href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/knowledgemanager/t12_knowledge_disp.do?articlekey=<bean:write name="t12_article" property="articlekey"/>&programakey=<bean:write name="t12_article" property="programakey"/>')">
										<bean:write name="t12_article" property="articlename" scope="page" filter="false" /> 
								   </a>
							</TD>

							<TD align="center" nowrap>
								<bean:write name="t12_article" property="realname" scope="page" />
							</TD>

							<TD align="center" nowrap>
								<bean:write name="t12_article" property="createdate"
									scope="page" />
							</TD>

							<TD nowrap align="center">
								<logic:equal value="1" name="t12_article"
									property="isadminmodify">
									<FONT color="#ff0000"><bean:write name="t12_article"
											property="isadminmodify_disp" scope="page" /> </FONT>
								</logic:equal>
								<logic:notEqual value="1" name="t12_article"
									property="isadminmodify">
									<bean:write name="t12_article" property="isadminmodify_disp"
										scope="page" />
								</logic:notEqual>
							</TD>

							<TD nowrap align="center">
								<logic:equal value="1" name="t12_article" property="auditstat">
									<html:link name="map"
										page="/businessmanager/t12_article/t12_article_audit_auditstat.do">通过   </html:link>
								</logic:equal>
								<logic:equal value="2" name="t12_article" property="auditstat">
									<html:link name="map"
										page="/businessmanager/t12_article/t12_article_audit_auditstat.do">通过   </html:link>
								</logic:equal>
								<logic:equal value="3" name="t12_article" property="auditstat">
									<html:link name="map"
										page="/businessmanager/t12_article/t12_article_audit_auditstat.do">撤销   </html:link>
								</logic:equal>
								<html:link name="map"
									page="/businessmanager/t12_article/t12_article_audit_modify.do">修改   </html:link>
								<a href="javascript:void(0);" onclick="return deleconfirm('t12_article_audit_delete_do.do?articlekey=<%=map.get("articlekey")%>&auditstat=<%=map.get("auditstat")%>programakey=<%=map.get("programakey")%>');">删除</a>
								
							</TD>

						</TR>
					</logic:iterate>
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

<script language="javaScript">
onloadDo();
</script>
</html:html>
