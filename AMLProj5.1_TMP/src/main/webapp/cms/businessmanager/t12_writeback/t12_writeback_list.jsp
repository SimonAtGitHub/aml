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
	   
	</script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_writeback/t12_writeback_list.do">
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章回复列表 - <logic:equal
									value="0" property="auditstat" name="t12_writebackActionForm">
					   无需审核
					</logic:equal> <logic:equal value="1" property="auditstat"
									name="t12_writebackActionForm">
					   待审核
					</logic:equal> <logic:equal value="2" property="auditstat"
									name="t12_writebackActionForm">
					   待审核
					</logic:equal> <logic:equal value="3" property="auditstat"
									name="t12_writebackActionForm">
					   通过审核
					</logic:equal>
							</span>
						</td>
						<td align="right">
							
							<html:hidden property="auditstat" />
							<html:hidden property="programakey" />
							<html:hidden property="articlekey" />
							<html:button property="wait" styleClass="input" value="待审核"
								onclick="dosubmit('t12_writeback_list.do?newsearchflag=1','1')" />
							<html:button property="fail" styleClass="input" value="未通过审核"
								onclick="dosubmit('t12_writeback_list.do?newsearchflag=1','2')" />
							<html:button property="already" styleClass="input" value="通过审核"
								onclick="dosubmit('t12_writeback_list.do?newsearchflag=1','3')" />
							<html:button property="notneed" styleClass="input" value="无需审核"
								onclick="dosubmit('t12_writeback_list.do?newsearchflag=1','0')" />
							<html:button property="back" styleClass="input" value="返  回"
								onclick="dosubmit('t12_writeback_article_list.do','0')" />
						</td>
					</tr>
				</table>
			</div>


			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<br />
			<table width="100%">
				<tr>
					<td>
						&nbsp;&nbsp;
						<FONT color="#ff0000">文章标题：</FONT>
						<a  onclick="pop_loader_cms('../../businessmanager/t12_article/t12_article_audit_disp.do?articlekey=<bean:write name="t12_article" property="articlekey"/>&programakey=<bean:write name="t12_article" property="programakey"/>')"
							href="javascript:void(0);" > 
							<bean:write name="t12_article" property="articlename" ignore="true" /> </a>


					</td>
				</tr>
			</table>

			<br />

			<div class="awp_list">
				<TABLE>
					<TR align="center">
						<TD nowrap>
							回复内容
						</TD>
						<TD nowrap>
							回复人
						</TD>

						<TD nowrap>
							回复时间
						</TD>

						<TD nowrap>
							操作
						</TD>
					</TR>

					<logic:iterate id="t12_writeback" name="t12_writebackList"
						type="com.ist.cms.dto.T12_writeback">
						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("programakey", t12_writeback.getProgramakey());
								map.put("articlekey", t12_writeback.getArticlekey());
								map.put("replykey", t12_writeback.getReplykey());
								map.put("auditstat", t12_writeback.getAuditstat());

								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR>
							<TD  align="left">
								<!--<html:link name="map"
									page="/businessmanager/t12_writeback/t12_writeback_disp.do"><bean:write name="t12_writeback" property="replycontent"
										scope="page" filter="false" />
								</html:link>-->
								<bean:write name="t12_writeback" property="replycontent"
										scope="page" filter="false" />

							</TD>

							<TD align="center" nowrap>
								<bean:write name="t12_writeback" property="realname"
									scope="page" />
							</TD>

							<TD align="center" nowrap>
								<bean:write name="t12_writeback" property="createdate"
									scope="page" />
							</TD>

							<TD align="center" nowrap>
								<logic:equal value="1" name="t12_writeback" property="auditstat">
									<html:link name="map"
										page="/businessmanager/t12_writeback/t12_writeback_auditstat.do">通过   </html:link>
								</logic:equal>
								<logic:equal value="2" name="t12_writeback" property="auditstat">
									<html:link name="map"
										page="/businessmanager/t12_writeback/t12_writeback_auditstat.do">通过   </html:link>
								</logic:equal>
								<logic:equal value="3" name="t12_writeback" property="auditstat">
									<html:link name="map"
										page="/businessmanager/t12_writeback/t12_writeback_auditstat.do">屏蔽   </html:link>
								</logic:equal>
								<html:link name="map"
									page="/businessmanager/t12_writeback/t12_writeback_modify.do">修改   </html:link>
								<html:link name="map"
									page="/businessmanager/t12_writeback/t12_writeback_delete_do.do">删除   </html:link>
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
<script language="javaScript">
onloadDo();
</script>
</html:html>

