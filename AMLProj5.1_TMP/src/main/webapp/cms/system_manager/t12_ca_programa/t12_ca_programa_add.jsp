<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>

	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></script>

	<script language="JavaScript">
/**
* 表单验证
*/
function checkForm(theUrl){
    var errMsg ="";
    //类别名称
    if(getLength(trim(document.forms[0].categoryname.value))==0){
    	document.forms[0].categoryname.value = trim(document.forms[0].categoryname.value);
        errMsg+="类别名称不能为空！";
        document.forms[0].categoryname.focus();
    }else if(getLength(document.forms[0].categoryname.value)>64){
        errMsg+="类别名称不能大于64个字符！";
        document.forms[0].categoryname.focus();
    }else if(getLength(trim(document.forms[0].dispseq.value))==0){
    	document.forms[0].dispseq.value = trim(document.forms[0].dispseq.value)
        errMsg+="显示顺序不能为空！";
        document.forms[0].dispseq.focus();
    }else if(getLength(document.forms[0].dispseq.value)>10){
        errMsg+="显示顺序不能多于10个字符！";
        document.forms[0].dispseq.focus();
    }
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
			action="/system_manager/t12_ca_programa/t12_ca_programa_add_do.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">栏目管理 - 新 建 </span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="返  回"
								styleClass="input" onclick="awpDoSubmit('t12_ca_programa_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class='awp_detail'>
				<TABLE>

					<tr>
						<td>
							<font color="#FF0000">*</font>类别名称：
						</td>
						<td>
							<html:text property="categoryname" styleClass="text_white"
								size="40" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>状态：
						</td>
						<td>
							<html:select property="flag">
								<html:options collection="flagMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>显示顺序：
						</td>
						<td>
							<html:text property="dispseq" styleClass="awp_intnumber" size="10" />
						</td>
					</tr>
					<!--           
          <tr>
              <td bgcolor="ECF3FF" align="right" height="24">所属角色：</td>
              <td>
                   <html:text property="rolenames" styleClass="text_white" size="32" disabled="true" /> 
                   <html:hidden property="rolekeys"/>
                   <html:button property="Button52" styleClass="text_white" onclick="locationrole()" >多 选</html:button>
              </td>
            </tr>
            -->
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<html:button property="button" styleClass="input" value="提 交"
								onclick="checkForm('t12_ca_programa_add_do.do')" />
							<html:reset styleClass="input" value="重 填" />
						</td>
					</tr>
				</TABLE>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>
