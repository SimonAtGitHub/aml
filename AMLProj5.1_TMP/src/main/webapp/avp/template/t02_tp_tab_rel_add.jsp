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
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
   var errMsg ="";
    if(type=="del"){
     errMsg = CheckBoxMustChecked(document.forms[0]);
    }
    if(type=="add"){
         errMsg = CheckBoxMustChecked(document.forms[0]);
    }
    if(type=="search"){
         errMsg = "";
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
		<html:form method="post" action="/template/t02_tp_tab_rel_add.do">
		  <html:hidden property="tplakey"/>
		  <html:hidden property="busstypecd"/>
		  <div class='awp_title'>
				<table>
					<tr>
						<td width="2%">
							<span class="title_img"></span>
						</td>
						<td width="23%" nowrap>
							<span class="awp_title_td2">模型管理 - 添加数据表</span>
						</td>
						<td align="right">
							<input type=button value="添 加" name=Button223 class="input"
								onClick="dosubmit('t02_tp_tab_rel_add_do.do','add')">							
							<input type=button value="返 回" name=Button52 class="input"
								onClick="dosubmit('t02_tp_tab_rel_list.do?tplakey=<%=request.getParameter("tplakey") %>&busstypecd=<%=request.getParameter("busstypecd")%>','')">							
						</td>
					</tr>
				</table>
			</div>             
		 
		<div class="awp_cond">
			<table>
								<tr >
								    <td nowrap>
										表中文名称：
									</td>
									<td >
										<html:text property="tablecname" size="30" maxlength="128" styleClass="text_white"></html:text>
									</td>	
									<td nowrap>
										表英文名称：
									</td>
								
									<td>
										<html:text property="tableename" size="30" maxlength="128"  styleClass="text_white"></html:text>
									</td>
								</tr>
								<tr>	
									<td ></td>
									<td ></td>
									<td ></td>
									<td >
										<input type="button" value="查 询" onClick="dosubmit('t02_tp_tab_rel_add.do?newsearchflag=1','search')" class="input">
									</td>
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
					
				</TR>
				<logic:iterate id="mtinfo" name="t01_mt_propertyList"
					type="com.ist.bmp.metadata.dto.T01_mt_property">
				<TR align="center" >
					<TD  nowrap>
						<html:multibox property="selectedTablekey">
								<bean:write name="mtinfo" property="tablekey" />
						</html:multibox>
					</TD>
					<TD nowrap>
						<bean:write name="mtinfo" property="tablecname" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="mtinfo" property="tableename" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="mtinfo" property="categorykey_disp" scope="page" />
					</TD>					
				</logic:iterate>
			</TABLE>
		</div>
		<div class='awp_page_bottom'>
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
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
