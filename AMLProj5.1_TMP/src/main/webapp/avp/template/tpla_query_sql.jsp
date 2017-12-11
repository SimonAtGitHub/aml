<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>筛选条件</title>
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

function tmpOpen(){
    var tplakey=document.forms[0].tplakey.value;
    var url="<%=request.getContextPath()%>/avp/template/t01_mt_property_tmp_list.do?tplakey="+tplakey;
    //openFullWin(url,'tmpOpen');
    avpPopUp(url,'800','500');
}
</SCRIPT>
	</HEAD>
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_exec_qry_add_do.do">
			<html:hidden property="tplakey" />
		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模型管理 - 定义查询SQL</span></td>
						<td align="right">
						<%
						   String tplatype = (String)session.getAttribute("tplatype");
						   if(!"2".equals(tplatype)){
						 %>
							<input type=button value="新 建" onClick="dosubmit('t02_tp_exec_qry_add.do','add');">
							<input type=button value="修 改" onClick="dosubmit('t02_tp_exec_qry_modify.do','mod');"> 
							<input type=button value="删 除" onClick="dosubmit('t02_tp_exec_qry_delete_do.do','del');">
							<input type=button value="临时表管理" onClick="tmpOpen()">
							<!-- input type=button value="预览查询结果" onClick="dosubmit('tpla_cal_col.htm')" -->	
							<%} %>					                  </td>
					</tr>
				</table>
			</div>   
			
		
		<html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
		</html:messages>      
		<div class="awp_list">
			<TABLE>
				<TR>
					<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
					<TD width="68%"  nowrap>
						执行SQL
					</TD>
					<TD width="14%" nowrap>
						执行顺序
					</TD>
					<TD width="14%" nowrap>
						是否主查询
					</TD>
				</TR>
				<logic:iterate id="sqlinfo" name="t02_tp_exec_qryList"
					type="com.ist.avp.template.dto.T02_tp_exec_qry">
					<TR align="center">
						<TD height=22>
							<html:multibox property="execsqlkeys">
								<bean:write name="sqlinfo" property="execsqlkey" />
							</html:multibox>
						</TD>
						<TD align="left">
							<bean:write name="sqlinfo" property="execsql" scope="page" />
						</TD>
						<TD >
							<bean:write name="sqlinfo" property="execseq" scope="page" />
						</TD>
						<TD >
							<bean:write name="sqlinfo" property="ismainquery_disp"
								scope="page" />
						</TD>
					</TR>
				</logic:iterate>
			</TABLE>
			</div>
		</html:form>
		</div>
	</BODY>
</HTML>
