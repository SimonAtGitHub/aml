<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
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
        document.forms[0].action=theUrl;
        document.forms[0].submit();
       
    }
}
</SCRIPT>
	</HEAD>
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_exec_rst_list.do">
		  <html:hidden property="tplakey"/>
		  <div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2">模型管理 - 定义复杂列</span></td>
						<td align="right">
							<input type=button value="新 建" name=Button223 class="input"
								onClick="dosubmit('t02_tp_exec_rst_add.do','add')">
							<input type=button value="修 改" name=Button222 class="input"
								onClick="dosubmit('t02_tp_exec_rst_modify.do','mod')">
							<input type=button value="删 除" name=Button222 class="input"
								onClick="dosubmit('t02_tp_exec_rst_delete_do.do','del')">					                  </td>
					</tr>
				</table>
			</div>
			
		
			<div class="awp_list">
			<TABLE>
				<TR align=center>
					 <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
					<TD width="10%" align="center" nowrap>
						列别名代码
					</TD>
					<TD width="10%" align="center" nowrap>
						列名称
					</TD>
					<TD width="10%" noWrap>
						列类型
					</TD>
					<TD width="10%" noWrap>
						是否输出
					</TD>
					<TD width="26%" noWrap>
						表达式
					</TD>
				</TR>


				<logic:iterate id="binfo" name="t02_tp_exec_rstList"
					type="com.ist.avp.template.dto.T02_tp_exec_rst">
					<TR align="center" >
						<TD  nowrap>
							<html:multibox property="selectedOutcolkey">	
								<bean:write name="binfo" property="outcolkey" />
							</html:multibox>
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="colaliascd" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="outcolname" scope="page" />
						</TD>

						<TD nowrap>
							<bean:write name="binfo" property="coldatatype" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="isout" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="outcolcd" scope="page" />
						</TD>
					</TR>
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
