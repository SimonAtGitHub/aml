<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML>
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
		<html:form method="post" action="/system_manager/t12_ca_programa/t12_ca_programa_list.do">
					
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">栏目管理 - 类别管理</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:button property="button2" value="新  建" styleClass="input"
							onclick="awpDoSubmit('t12_ca_programa_add.do','add')" />
						<html:button property="button3" value="修  改" styleClass="input"
							onclick="awpDoSubmit('t12_ca_programa_modify.do','modi')" />
						<html:button property="button4" value="删  除" styleClass="input"
							onclick="awpDoSubmit('t12_ca_programa_delete_do.do','del')" />		
						</td>
					</tr>
				</table>
			</div>
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle"/>
			</html:messages>
			
			<div class='awp_cond' id="searchtable" style="display:none">
			<TABLE>
				
								<tr>
									<td>类别名称： 
									</td>
									<td>
										<html:text property="categoryname" styleClass="text_white" size="20" />
									</td>
									<td>
										状态
									</td>
									<td>
										<html:select property="flag">
					                      <html:options collection="flagMap" property="label" labelProperty="value"/>
					                  	</html:select>	
					                  
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>
									
									</td>
									<td>
										<input type="button" name="button" value="查 询"
											onClick="awpDoSubmit('t12_ca_programa_list.do?newsearchflag=1','search')"
											class="input">
									</td>
								</tr>
							</TABLE>
					</div>
			<div class="awp_list">
			<TABLE>
				<TR align=center>
					<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
					<TD  noWrap>
						类别名称
					</TD>
					<TD noWrap>
						状态
					</TD>
					<TD noWrap>
						显示顺序
					</TD>
					<TD  noWrap>
						创建人
					</TD>
					<TD  noWrap>
						创建时间
					</TD>
					<TD noWrap>
						修改人					
					</TD>
					<TD noWrap>
						修改时间
					</TD>					
				</TR>
				<logic:iterate id="t12_ca_programa" name="t12_ca_programaList"
					type="com.ist.cms.dto.T12_ca_programa">
					
					<TR align="center">
						<TD noWrap>						 
							<html:multibox property="selectcategorykey" disabled="false" onclick="changcol(this)">
								<bean:write name="t12_ca_programa" property="categorykey" />
							</html:multibox>						
						</TD>
						<TD noWrap>	
								<bean:write name="t12_ca_programa" property="categoryname" scope="page" />
						</TD>
						<TD noWrap>	
								<bean:write name="t12_ca_programa" property="flag_disp" scope="page" />
						</TD>
						<TD noWrap>	
								<bean:write name="t12_ca_programa" property="dispseq" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="creator" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="createdate" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="modifier" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="modifydate" scope="page" />
						</TD>						
					</TR>
				</logic:iterate>
			</TABLE></div>
			
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
</HTML>
