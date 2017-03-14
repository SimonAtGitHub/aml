<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gbk">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
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
			if(confirm('你确定要删除吗?')) {
         		document.forms[0].action=theUrl;
         		document.forms[0].target='_self';
        		document.forms[0].submit();
        		event.srcElement.disabled = true;
        	}
       }else{
        	document.forms[0].action=theUrl;
        	document.forms[0].target='_self';
        	document.forms[0].submit();
        	event.srcElement.disabled = true;
        }
    }
}



function dosubmitChk(theUrl){
   var errMsg ="";
   
   errMsg = CheckBoxMustChecked(document.forms[0]);
   
      
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        	window.open('../../pub/blank.jsp', 'checktest', "scrollbars=yes,toolbar=no,status=yes,resizable=no,MenuBar=no,location=no,top=0,left=0,width= 600,height=400");
	    	document.forms[0].action=theUrl;
        	document.forms[0].target='checktest';
        	document.forms[0].submit();
    }
    
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
	<html:form method="post" action="/t10_report/t10_reportparm_list.do">
	<html:hidden property="reportkey"/>
	<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%">
							<span class="awp_title_td2">报表定义 - 查询参数
							</span>
						</td>
					<td align="right">
					<input type="button" value="脚 本" onclick="avpSubmitPopUp('', 't10_report_scriptcd_modify.do', 800, 600)" />
					<input type=button value="新 建"  onClick="dosubmit('t10_reportparm_add.do','add');">
					<input type=button value="修 改"   onClick="dosubmit('t10_reportparm_modify.do','mod');">
					<input type=button value="删 除"  onClick="dosubmit('t10_reportparm_delete_do.do','del');"> 
					<!--  
					<input type=button value="检 测"  onClick="dosubmitChk('t10_reportparm_check_do.do');">&nbsp;	
					-->				
					</td>
					</tr>
				</table>
			</div>
	
		
	
<div class="awp_list">
		<TABLE>
			<TR align=center bgcolor="A3C0EE">
				<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
				<TD width="18%" align="center" nowrap>
					参数代码
				</TD>
				<TD width="26%" noWrap>
					显示名称
				</TD>
				<TD width="17%" noWrap>
					输入参数类型
				</TD>
				<TD width="11%" noWrap>
					是否必输
				</TD>
				<TD width="9%" noWrap>
					显示序号
				</TD>
			</TR>

            <logic:iterate id="parinfo" name="t10_reportParmList"  type="com.ist.rpp.report.dto.T10_reportParm" >
			<TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="parinfo" property="parmkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="parinfo" property="parmkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="parinfo" property="parmkey" />')>
				<TD height=22 nowrap >
					 <html:multibox property="parmkeys">
								<bean:write name="parinfo" property="parmkey" />~,<bean:write name="parinfo" property="reportkey"/>
				     </html:multibox>
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="sysinparmcd" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispname" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="isness_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispseq" scope="page" />
				</TD>
			</TR>
			</logic:iterate>
		</TABLE>
		</div>
	</html:form>
	</div>
</BODY>
</html:html>
