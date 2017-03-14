<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
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
       if(type=="del"){
        if(confirm('确认删除此信息！')) {
         document.forms[0].action=theUrl;
        document.forms[0].submit();
        event.srcElement.disabled = true;
        }
       }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
        event.srcElement.disabled = true;
        }
    }
}
</SCRIPT>
	</HEAD>
	<BODY>
	  <div id="content">
		<html:form method="post" action="/template/t02_jump_tp_list.do">
		  <html:hidden property="tplakey"/>
		  		<input type="hidden" name="busstypecd" value="<%=request.getParameter("busstypecd") %>"/>
			
		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模型管理 - 定义跳转模型</span></td>
						<td align="right">
						<%
						  // String tplatype = (String)session.getAttribute("tplatype");
						   //if(!"2".equals(tplatype)){
						 %>
							<input type=button value="新 建" name=Button223 class="input"
								onClick="dosubmit('t02_jump_tp_add.do','add')">
							<input type=button value="修 改" name=Button2232 class="input"
								onClick="dosubmit('t02_jump_tp_modify.do','mod')">
							<input type=button value="删 除" name=Button222 class="input"
								onClick="dosubmit('t02_jump_tp_delete_do.do?tplakey=<%=request.getParameter("tplakey")%>','del')">
					    <%//} %>
					     </td>
					</tr>
				</table>
			</div>   
			
			
		<div class="awp_list">
			<TABLE>
				<TR align=center>
					<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
					<TD nowrap="nowrap">
						跳转列名称
					</TD>
					<TD nowrap="nowrap" >
						跳转模型
					</TD>
					<TD nowrap="nowrap" >
						跳转条件
					</TD>
					<TD nowrap="nowrap">
						跳转参数
					</TD>
					<TD nowrap="nowrap">
						条件及参数维护
					</TD>
				</TR>

				<logic:iterate id="binfo" name="t02_jump_tpList"
					type="com.ist.avp.template.dto.T02_jump_tp">
				<TR align="center" >
					<TD height=22 >
						<html:multibox property="jumpkey">
								<bean:write name="binfo" property="jumpkey" />
							</html:multibox>
					</TD>
					<TD align="left">
						<bean:write name="binfo" property="dispname" scope="page" />
					</TD>
					<TD  align="left">
						<bean:write name="binfo" property="jumptplaname" scope="page" />
					</TD>
					<TD  align="left">
						 
						<% 
						   String dispjumpcond_temp = binfo.getDispjumpcond();
						%>
						<%=dispjumpcond_temp == null ? "" : dispjumpcond_temp %>
						
					</TD>
					<TD  align="left">
						<bean:write name="binfo" property="dispjumpparm" scope="page" />
					</TD>
					<TD  align="left">
					    <a href="<%=request.getContextPath() %>/avp/template/modT02_cond_subDo.do?tplakey=<bean:write name="binfo" property="tplakey" />&jumpkey=<bean:write name="binfo" property="jumpkey" />&jumptplakey=<bean:write name="binfo" property="jumptplakey" />&busstypecd=<%=request.getParameter("busstypecd")%>">跳转条件</a>
					<logic:notEqual name="binfo" property="jumpmode" value="3">
						<a href="<%=request.getContextPath() %>/avp/template/t02_parm_sub_add.do?tplakey=<bean:write name="binfo" property="tplakey" />&jumpkey=<bean:write name="binfo" property="jumpkey" />&jumptplakey=<bean:write name="binfo" property="jumptplakey" />&busstypecd=<%=request.getParameter("busstypecd")%>">跳转参数</a>
					</logic:notEqual>						
					</TD>
				</TR>
				</logic:iterate>
			</TABLE>
			</div>
		</html:form>
	</div>
	</BODY>
</HTML>
