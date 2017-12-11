<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
			com.ist.common.AuthBean authBean = (com.ist.common.AuthBean) session
			.getAttribute("authBean");
	com.ist.common.Authorization auth = authBean.getAuthToken();

	java.util.HashMap userrolekeyHash = auth.getUserRoleKeyHash();
	String grouplevel = ((com.ist.platform.dto.T00_group) auth
			.getGroupList().get(auth.getCurrGroupkey()))!=null?((com.ist.platform.dto.T00_group) auth
					.getGroupList().get(auth.getCurrGroupkey()))
			.getGrouplevel():"";
%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link  href="<%=request.getContextPath()%>/skin/<%=(String)session.getAttribute("style") %>/css/awp_base.css" rel="stylesheet" type="text/css">
    	<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>

		<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc_report.js"></script>
<SCRIPT LANGUAGE="JavaScript"> 
			
	/** 判断如果发布类型为系统 则不能做数据表管理***/
function checkReleasetype(theUrl){
	var num = CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("至少选择一条记录");
		return false;
	}else{
  		var checkbox = document.forms[0].selectprogramakey;
  		if (!checkbox.length) {
		  	checkbox = new Array(checkbox);
		}
       	for (var i=0; i < checkbox.length; i++) {
       		var oCheck = checkbox[i];
           	//如果被选中则处理
           	if (oCheck.checked) {
              var state = document.getElementsByName("releasetypes")[i].value;//下发状态
              if(state == '3'){//如果系统发布
                alert("系统内发布不能做数据表管理操作!");
                return false;
              }
              
              var isstructures = document.getElementsByName("isstructures")[i].value;//是否能维护结构
              if(isstructures != '1') {
                 alert("该栏目无需进行数据表管理操作!");
                 return false;
              }
           }
         }
	  }
	  //提交
	   document.forms[0].action=theUrl;
       document.forms[0].submit();
}
	</SCRIPT>
	</HEAD>
	<BODY>
		<div id='content'>
			<html:form method="post"
				action="/system_manager/t12_programa/t12_programa_list.do">
				<html:hidden property="categorykey" />


				<div class='awp_title'>

					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">系统管理 - <bean:write
										name="categoryname" ignore="true" /> - 栏目列表</span>
							</td>
							<td align="right">
								<input type="button" name="btsearch2" value="查 找"
									onclick="btnDisplayHidden(this, 'searchtable')" />
								<html:button property="button2" value="新 建" styleClass="input"
									onclick="awpDoSubmit('t12_programa_add.do','add')" />
								<html:button property="button3" value="修 改" styleClass="input"
									onclick="awpDoSubmit('t12_programa_modify.do','modi')" />
								<html:button property="button4" value="删 除" styleClass="input"
									onclick="awpDoSubmit('t12_programa_delete_do.do','del')" />
								<!-- 
									<html:button property="button4" value="分配角色" styleClass="input"
									onclick="dosubmit('t12_programa_role.do','modi')" />	
								 -->

								<html:button property="button4" value="数据表管理" styleClass="input"
									onclick="checkReleasetype('t12_programa_table.do')" />
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
							<td align="right">
								栏目名称：
							</td>
							<td>
								<html:text property="programaname" styleClass="text_white"
									size="30" />

							</td>
							<td align="right">
								审核状态：
							</td>
							<td>
								<html:select property="auditstat">
									<html:options collection="auditstatMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td width="15%">
								记录状态：
							</td>
							<td>
								<html:select property="flag">
									<html:options collection="flagMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td align="right">
								发布类型：
							</td>
							<td>
								<html:select property="releasetype">
									<html:options collection="releasetypeMap" property="label"
										labelProperty="value" />
								</html:select>
								
							</td>
							
						</tr>
						<tr>
							<td></td><td></td><td></td>
							<td><input type="button" name="button" value="查 询"
									onClick="awpDoSubmit('t12_programa_list.do?newsearchflag=1','search')"
									class="input">
							</td>
						</tr>
					</TABLE>
				</div>
				<div class="awp_list">
					<TABLE>
						<TR align=center noWrap>
							
								<!-- <td width="6%" nowrap nowrapbgcolor="A3C0EE">
								<input type="checkbox" name="guizbms" value="0"
									onClick="selectORClearBox(forms[0],this.checked)"> </td>-->
								<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
							
							
							<TD noWrap>
								栏目名称
							</TD>
							<TD noWrap>
								发布类型
							</TD>
							<TD noWrap>
								应用类型
							</TD>
							<TD noWrap>
								展现类型
							</TD>
							
							<TD noWrap>
								状态
							</TD>
							<TD noWrap>
								审核状态
							</TD>
							<TD noWrap>
								显示顺序
							</TD>
							<TD noWrap>
								创建人
							</TD>
							<TD noWrap>
								创建时间
							</TD>
							<!-- <TD noWrap>
								修改人
							</TD>
							<TD noWrap>
								修改时间
							</TD> -->
						</TR>
						<logic:iterate id="t12_programa" name="t12_programaList"
							type="com.ist.cms.dto.T12_programa">
							<%
									java.util.HashMap dispMap = new java.util.HashMap();
									dispMap.put("programakey", t12_programa.getProgramakey());
									pageContext.setAttribute("dispMap", dispMap,
									PageContext.PAGE_SCOPE);
							%>
							<TR align="center">
							 <TD noWrap>
									<logic:equal name="t12_programa" property="auditstat" value="1">
										<html:multibox property="selectprogramakey" disabled="true"
											onclick="changcol(this)">
											<bean:write name="t12_programa" property="programakey" />
										</html:multibox>
									</logic:equal>
									<logic:equal name="t12_programa" property="auditstat" value="0">
										<html:multibox property="selectprogramakey" disabled="false"
											onclick="changcol(this)">
											<bean:write name="t12_programa" property="programakey" />
										</html:multibox>
									</logic:equal>
								</TD>
									<input type="hidden" name="releasetypes" value="<bean:write name="t12_programa" property="releasetype" />"/>
									<input type="hidden" name="isstructures" value="<bean:write name="t12_programa" property="isstructure" />"/>
								<TD noWrap>
									<html:link name="dispMap"
										page="/system_manager/t12_programa/t12_programa_disp.do">
										<bean:write name="t12_programa" property="programaname"
											scope="page" />
									</html:link>
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="releasetype_disp"
										scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="applytype_disp"
										scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="showtype_disp"
										scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="flag_disp"
										scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="auditstat_disp"
										scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="dispseq" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="creator" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="createdate"
										scope="page" />
								</TD>
								<!--<TD noWrap>
									<bean:write name="t12_programa" property="modifier"
										scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="t12_programa" property="modifydate"
										scope="page" />
								</TD>-->
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
</HTML>
