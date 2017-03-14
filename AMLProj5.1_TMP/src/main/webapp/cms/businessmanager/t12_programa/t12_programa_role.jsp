<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
String path = request.getContextPath();
%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<script src="<%=path%>/js/load_window.js"></script>

	<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/js/basefunc.js"></script>
	<script language="JavaScript">
/**
* 表单验证
*/
function checkForm(theUrl){
    var errMsg ="";
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

function locationrole(){
		locate_pop_window('<%=request.getContextPath()%>','t00_roleLocation','checkbox','forms[0]','rolekeys,rolenames','');
}

</script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="post"
			action="/businessmanager/t12_programa/t12_programa_busi_role.do">
			<html:hidden property="categorykey" />
			<html:hidden property="programakey" />
			<html:hidden property="programaname" />
			<input type=hidden value="1200101" name="upmodulekey" />

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">系统管理 - <bean:write
									name="t12_programaActionForm" property="categorykey_disp" /> -
								分配角色</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input"
								onclick="awpDoSubmit('t12_programa_busi_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>


			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class='awp_detail'>
				<table>

					<tr>
						<td>
							<font color="#FF0000">*</font>栏目名称：
						</td>
						<td>
							<bean:write property="programaname" name="t12_programaActionForm" />
						</td>
					</tr>

					<tr>
						<td>
							所属角色：
						</td>
						<td>
							<html:hidden property="rolekeys" />
							<html:text property="rolenames" styleClass="text_white" size="32"
								disabled="true" />
							<html:button property="Button52" styleClass="text_white"
								onclick="locationrole()">多 选</html:button><br/>
							<font color="red">注：此处只为角色追加操作，请在角色管理模块中维护角色。</font>
						</td>
					</tr>

					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<html:button property="button" styleClass="input" value="提 交"
								onclick="checkForm('t12_programa_busi_role_do.do')" />
							<html:reset styleClass="input" value="重 填" />
						</td>
					</tr>

				</TABLE>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>
