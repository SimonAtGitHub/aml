<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>

	<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc.js"></script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form action="/system_manager/t12_programa/t12_programa_list.do"
			method="post">

			<html:hidden name="t12_programaActionForm" property="categorykey" />


			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">栏目管理 - 详细信息</span>
						</td>
						<td align="right">
							
							<html:button property="backbutton" value="返  回"
								styleClass="input" onclick="awpDoSubmit('t12_programa_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>
			<div class='awp_detail'>
				<TABLE>

					<tr>
						<td align="right">
							栏目名称：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="programaname"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							栏目类别：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="categorykey_disp" scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							发布类型：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="releasetype_disp" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							应用类型：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="applytype_disp" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							是否能维护结构：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="isstructure_disp" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							是否能发布内容：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="iscontent_disp" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							是否能查询内容：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="issearch_disp" scope="request" />
						</td>
					</tr>
					
					
						<tr>
						<td align="right">
							展现类型：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="showtype_disp" scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							状态：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="flag_disp"
								scope="request" />
						</td>
					</tr>
					<!-- 
                  <tr>
                    <td height="22" align="right" bgcolor="ECF3FF">栏目地址：</td>
                    <td bgcolor="F6F9FF"><bean:write name="t12_programaActionForm"  property="programaadd" scope="request"/></td>
                  </tr>
                  <tr>
                    <td height="20" align="right" bgcolor="ECF3FF">默认页的名称：</td>
                    <td bgcolor="F6F9FF"><bean:write name="t12_programaActionForm"  property="defaultname" scope="request"/></td>
                  </tr>
                   -->
					<tr>
						<td align="right">
							审核状态：
						</td>
						<td>
							<bean:write name="t12_programaActionForm"
								property="auditstat_disp" scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							创建人：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="creator"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							创建时间：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="createdate"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							修改人：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="modifier"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							修改时间：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="modifydate"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							备注：
						</td>
						<td>
							<bean:write name="t12_programaActionForm" property="des"
								scope="request" />
						</td>
					</tr>

				</TABLE>
			</div>
			<div class="awp_list">
				<TABLE>
					<TR align=center>
						<TD nowrap>
							列名称
						</TD>
						<TD nowrap>
							列类型
						</TD>
						<TD nowrap>
							字段长度
						</TD>
						<TD nowrap>
							是否默认字段
						</TD>
						<TD nowrap>
							标志
						</TD>
						<TD nowrap>
							是否查询条件
						</TD>
						<TD nowrap>
							是否列表显示
						</TD>
						<TD nowrap>
							是否用于排序
						</TD>
						<TD nowrap>
							是否应用
						</TD>

					</TR>
					<logic:iterate id="t12_programa_cols" name="t12_programa_colsList"
						type="com.ist.cms.dto.T12_programa_cols">
						<TR align="center">
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="colname"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="fieldtype"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="collength"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="isdefaultfield"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="flag"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="iscond"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="isshow"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="issort"
									scope="page" />
							</TD>
							<TD noWrap>
								<bean:write name="t12_programa_cols" property="isapply"
									scope="page" />
							</TD>

						</TR>
					</logic:iterate>
				</TABLE>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>
