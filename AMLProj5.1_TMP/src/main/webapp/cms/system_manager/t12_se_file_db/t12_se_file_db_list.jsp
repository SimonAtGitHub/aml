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
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
			
<SCRIPT LANGUAGE="JavaScript"> 
function doSubmit(theUrl){
	var num = CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("请至少选择一条记录！");
		return false;
	}else{
  		cmsdosubmit(theUrl);
	}
}
function awpDoSubmit(theUrl,type){
	var errMsg = "";
	var isSub = false;
	if(type=='modi'){
		errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		isSub = true;
	 }
	 else if(type=='del'){
		errMsg = CheckBoxMustChecked(document.forms[0]);
		if(errMsg==''){
			if(confirm('你真的要删除吗？')){
			isSub = true;
		}
		}
	}
	else if(type=='search' || type=='add' || type=='save' || type =='' || type == null){
		isSub = true;
	}
	if(isSub && errMsg==''){
	    var url = '<%=request.getContextPath()%>/cms/system_manager/t12_se_file_db/'+theUrl;
		document.forms[0].action = url;
		document.forms[0].submit();
	}else{
		if(errMsg!='')
		alert(errMsg);
		return false;
	}
 } 
	</SCRIPT>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/system_manager/t12_se_file_db/t12_se_file_db_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">数据库搜索定义 - 列 表</span>
						</td>
						<td align="right">

							<html:button property="add" styleClass="input" value="新 建"
								onclick="awpDoSubmit('t12_se_file_db_add.do','add')" />
							<html:button property="modify" styleClass="input" value="修 改"
								onclick="awpDoSubmit('t12_se_file_db_modify.do','modi')" />
							<html:button property="delete" styleClass="input" value="删 除"
								onclick="awpDoSubmit('t12_se_file_db_delete_do.do','del')" />
							<input type="button" name="btsearch2" value="生成索引"
								onclick="doSubmit('<%=request.getContextPath()%>/cms/businessmanager/t12_programa/t12_programa_generate_index.do?type=db');" />
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
							
							<tr>
								<td width="15%" align="right">
									所属栏目：
								</td>
								<td width="45%">
									
								</td>
								<td width="15%" align="right">
									文章标题：
								</td>
								<td width="25%">
									<html:text property="articlename" size="30" value="" />
								</td>
							</tr>
							
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
        -->
			<div class="awp_dynamic_list">
				<TABLE>
					<TR align=center>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
						
						
						<TD nowrap="nowrap" width="10%">
							索引块名称
						</TD>
						<TD nowrap="nowrap" width="10%">
							索引类型
						</TD>
						<!-- <TD nowrap="nowrap" width="10%">
							处理HTML标签
						</TD>
						<TD nowrap="nowrap" width="10%">
							上级索引块
						</TD> -->

						<TD nowrap="nowrap" width="25%">
							SQL定义
						</TD>
						<!--<TD nowrap="nowrap" width="20%">
							字段集合
						</TD>
						-->
						<TD nowrap="nowrap" width="20%">
							访问URL
						</TD>
						<TD nowrap="nowrap" width="10%">
							生成时间
						</TD>
					</TR>

					<logic:iterate id="t12_se_file_db" name="t12_se_file_dbList"
						type="com.ist.cms.dto.T12_se_file_db">
						<%
								java.util.HashMap map = new java.util.HashMap();

								map.put("id", t12_se_file_db.getId());
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR align="center">
							<TD>
								<html:multibox property="selectedid">
									<bean:write name="t12_se_file_db" property="id" />
								</html:multibox>
							</TD>
							<TD align="left" nowrap>
								<html:link name="map"
									page="/system_manager/t12_se_file_db/t12_se_file_db_disp.do">
									<bean:write name="t12_se_file_db" property="des" scope="page" />
								</html:link>
							</TD>

							<TD>
								<bean:write name="t12_se_file_db" property="setype_disp"
									scope="page" />
							</TD>
							<!--<TD>
								<bean:write name="t12_se_file_db" property="ishtml_disp"
									scope="page" />
							</TD>
							<TD nowrap>
								<bean:write name="t12_se_file_db" property="block_disp"
									scope="page" />
							</TD>-->
							<TD  align="left">
								<bean:write name="t12_se_file_db" property="sql" scope="page" />
							</TD>
							<!--<TD>
								<bean:write name="t12_se_file_db" property="fields" scope="page" />
							</TD>-->
							<TD  align="left">
								<bean:write name="t12_se_file_db" property="url" scope="page" />
							</TD>
							<TD nowrap>
								<bean:write name="t12_se_file_db" property="processdate" scope="page" />
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

