<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
   var errMsg ="";
    if(type=="del"){
     errMsg = CheckBoxMustChecked(document.forms[0]);
    }
    if(type=="mod"){
    if(checkRadio(document.forms[0].jumpkey)<0){
        errMsg+="请选择您要修改的信息！";
    }
    errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
    }
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
        event.srcElement.disabled = true;
    }
}
</SCRIPT>
	</HEAD>
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_tab_rel_list.do">
		  <html:hidden property="tplakey"/>
		<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">模型管理 - 选择数据表</span>
						</td>
						<td align="right">
							<td width="*" align="right">
                              <input type=button value="新 建" name=Button223 class="input"
								onClick="dosubmit('t02_tp_tab_rel_add.do?newsearchflag=1','add')">
							<input type=button value="删 除" name=Button222 class="input"
								onClick="dosubmit('t02_tp_tab_rel_delete_do.do','del')"></td>
					</tr>
				</table>
			</div> 
		
  			<div class="awp_list">
			<TABLE>
				<TR align=center >
					<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
					<TD width="28%" noWrap>
						表中文名称
					</TD>
					<TD width="20%" noWrap>
						表英文名称
					</TD>
					<TD width="26%" noWrap>
						类别代码
					</TD>
					<TD  noWrap >
						描述
					</TD>
				</TR>

				<logic:iterate id="binfo" name="t02_tp_tab_relList"
					type="com.ist.avp.template.dto.T02_tp_tab_rel">
				<TR align="center">
					<TD  nowrap>
						<html:multibox property="selectedTabrealkey">
								<bean:write name="binfo" property="tabrealkey" />
							</html:multibox>
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="tabcnname" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="tabenname" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="catecd_disp" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="des" scope="page" />
					</TD>
				</TR>
				</logic:iterate>
			</TABLE>
			</div>
		</html:form>
		</div>
	</BODY>
</HTML>
