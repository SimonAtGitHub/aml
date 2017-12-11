<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
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
                alert("系统内发布不能做权限管理操作!");
                return false;
              }
           }
         }
	  }
	  //提交
	   document.forms[0].action=theUrl;
       document.forms[0].submit();
}
 function doSubmit(theUrl){
	  //提交
	   document.forms[0].action=theUrl;
       document.forms[0].submit();
}
function cmssubmit(theUrl){
	var num = CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("请至少选择一条记录！");
		return false;
	}else{
  		cmsdosubmit(theUrl);
	}
}
	</SCRIPT>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_programa/t12_programa_all_list.do">
			
				<div class='awp_title'>

				<table>
					<tr>					
						<td width="23%" nowrap>
							<span class="awp_title_td2">索引设置 </span>
						</td>
						<td align="right">
						&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<div class='awp_detail'>
				<table>
					<tr>					
						<td width="23%" nowrap>
						是否实时更新索引： 
						</td>
						<td align="right">
						<input type="radio" value="1" name="paramvalue" <c:if test="${paramvalue=='1'}">checked</c:if> >是
						<input type="radio" value="0" name="paramvalue" <c:if test="${paramvalue=='0'}">checked</c:if> >否
						</td>
					</tr>
					<tr>					
						<td width="23%" nowrap>
						</td>
						<td align="right">
						<input type="button" name="save" value="保 存" onclick="doSubmit('t12_programa_index_set.do');"/>
						</td>
					</tr>
				</table>
			</div>
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">栏目索引管理  </span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type="button" name="btsearch2" value="生成索引"
								onclick="cmssubmit('t12_programa_generate_index.do?type=program');" />
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
							栏目类型：
						</td>
						<td >
							<html:select property="categorykey">
								<html:options collection="t12_ca_programaMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							发布类型：
						</td>
						<td >
							<html:select property="releasetype">
								<html:options collection="releasetypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td><td></td>
						<td>
							<input type="button" name="button" value="查 询"
								onClick="awpDoSubmit('t12_programa_all_list.do?newsearchflag=1','search')"
								class="input">
						</td>
					</tr>
				</TABLE>
			</div>
			<div class="awp_dynamic_list">
				<TABLE>
					<TR>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
						<td align="center" nowrap>
							栏目名称
						</TD>
						<td align="center" nowrap>
							栏目类别
						</TD>
						<td align="center" nowrap>
							发布类型
						</TD>
						<td align="center" nowrap>
							生成时间
						</TD>
						<!-- <td align="center" nowrap>
							操作
						</TD> -->
					</TR>
					<logic:iterate id="t12_programa" name="t12_programaList"
						type="com.ist.cms.dto.T12_programa">
						<%
								java.util.HashMap dispMap = new java.util.HashMap();
								dispMap.put("programakey", t12_programa.getProgramakey());
								dispMap.put("auditstat", t12_programa.getAuditstat());
								dispMap.put("isstructure",t12_programa.getIsstructure());
								pageContext.setAttribute("dispMap", dispMap,
								PageContext.PAGE_SCOPE);
						%>
						<TR>
							<td align="center" nowrap>
								<html:multibox property="selectprogramakey" disabled="false"
									>
									<bean:write name="t12_programa" property="programakey" />
								</html:multibox>
							</TD>
							<td align="left" nowrap>
							    <bean:write name="t12_programa" property="programaname"
										scope="page" />
								<!--<html:link name="dispMap"
									page="/businessmanager/t12_programa/t12_programa_busi_disp.do">
									<bean:write name="t12_programa" property="programaname"
										scope="page" />
								</html:link>-->
							</TD>
							<td align="center" nowrap>
								<bean:write name="t12_programa" property="categorykey_disp"
									scope="page" />
							</TD>
							<td align="center" nowrap>
								<bean:write name="t12_programa" property="releasetype_disp"
									scope="page" />
							</TD>
							<td align="center" nowrap>
								<bean:write name="t12_programa" property="createdate"
									scope="page" />
							</TD>
							<!-- <td align="center" nowrap>
									<a href="#" onclick="cmsdosubmit('t12_programa_all_list.do');">生成索引</a>
							</TD> -->
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

