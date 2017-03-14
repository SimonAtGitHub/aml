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
	
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/forum.css" type="text/css">
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
</HEAD>
<BODY><div id='content'>
	<html:form method="POST" action="/businessmanager/t12_writeback/t12_writeback_list_by_articlekey.do">
        <html:hidden property="articlekey" /> 
	    <html:hidden property="programakey" /> 
	
<div class='awp_title'>
	
		<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">文章<logic:notEmpty name="t12_article" property="articlename">
					   <font color="red">[<bean:write name="t12_article" property="articlename" ignore="true"/>]</font>
					</logic:notEmpty>
					回复列表</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="关 闭" styleClass="input"
								onclick="window.close();" />
						</td>
					</tr>
				</table>
    </div>
	
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
			
		
		<!-- 
		<TABLE align=center class="condition_outer" width="98%">
			<TBODY>
				<TR>
					<TD class="condition_outer">						
							<table width="100%" id="query_condition">
							
							<tr class="deep">
									<td width="15%" height="22" align="right" class="deep">栏目名称：  
									</td>
									<td width="35%" class="light">
										<html:text property="programaname" styleClass="text_white" size="15" />
									</td>
									<td align="right" class="deep">
										文章名称：
									</td>
									<td bgcolor="F6F9FF">
										<html:text property="programaname" styleClass="text_white" size="15" />
								
										<input type="button" name="button" value="查 询"
											onClick="dosubmit('t12_writeback_list_by_articlekey.do?newsearchflag=1','search')"
											class="input">
									</td>
								</tr>
							
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		 -->

		<TABLE align=center border=1 cellPadding=0 borderColor=333333
			cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
			<TBODY>
				<TR>
					<TD align="center" valign="top"
						style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
						
		<TABLE width="100%" border="0" cellpadding="1" cellspacing="1" id="query_table">		
			 <logic:iterate id="wirteback" name="t12_writebackList"
				                                    type="com.ist.cms.dto.T12_writeback" >
              <tr>
                   <td width="20%" align="center">
                       <strong>
                       <bean:write name="wirteback" property="realname"/></strong><br><br><bean:write name="wirteback" property="createdate"/>
                       
                   </td>
                   <td>
                       <bean:write name="wirteback" property="replycontent" filter="false"/>
                   </td>
               </tr>
                       
               <tr height="10px">
                 <td colspan="2">
                     &nbsp;
                 </td>
             </tr>
            </logic:iterate>
		
		</TABLE>	
		
		</TD>
				</TR>
			</TBODY>
		</TABLE>	

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

