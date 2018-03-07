<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<title>问题管理</title>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 	
	function dosubmit(theUrl,type){
		var errMsg = "";
	     if(type=='del'){
            if(confirm('你真的要删除此问题吗？')){
                document.forms[0].action=theUrl;
        		document.forms[0].submit();
            }
        }else if(type=='add'){
       		document.forms[0].action=theUrl;
            document.forms[0].submit();
        } if(type=='mod'){
                document.forms[0].action=theUrl;
        		document.forms[0].submit();
        }
	}
</SCRIPT>

</HEAD>
<body leftmargin="0" topmargin="0">
	<html:form action="/check/t3r_chk_qstList.do" method="post">
	<html:hidden property="logkey"/>
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>问题管理 </span>
					<span class="buttons">
					<a href="#" onClick="dosubmit('t3r_chk_qst_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />新 增</a>&nbsp;
					<a href="#" onClick="dosubmit('t3r_chk_logList.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
				  </span>
				</div>
			</div>
			<html:errors />
			<div class="list">
				<TABLE border="0" cellspacing="0" cellpadding="0">
					<TR>
						<th width="15%">
							问题编号
						</th>
						<th width="15%">
							问题所属机构
						</th>
						<th width="10%">
						           问题状态
						</th >
						<th width="15%">
							创建人
						</th>
						<th width="15%">
							创建机构
						</th>
						<th width="15%">
							创建时间
						</th>
						<th width="15%">
							操作
						</th>
					</TR>
					
					<logic:iterate id="qst" name="t3r_chk_qstList"
						type="com.ist.bmp.pbc.dto.T3r_chk_qst">

						<TR>
							<TD>
							<a href="#" onclick="window.open('t3r_chk_qstDisp.do?qstkey=<bean:write name="qst" property="qstkey" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
								<bean:write name="qst" property="qstkey"></bean:write></a>
							</TD>
							<TD>
								<bean:write name="qst" property="qst_org_disp"/>
							</TD>
							<TD>
								<bean:write name="qst" property="qst_status_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="qst" property="create_user_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="qst" property="create_org_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="qst" property="create_dt"></bean:write>
							</TD>
							<TD>
										<a href="<%=request.getContextPath()%>/datacheck/check/t3r_chk_qst_modify.do?qstkey=<bean:write name="qst" property="qstkey" />"><img src='../../images/blue/b_edit.png' title="修 改"/></a>&nbsp;&nbsp;
										<a href="<%=request.getContextPath()%>/datacheck/check/t3r_chk_qst_delete_do.do?qstkey=<bean:write name="qst" property="qstkey" />"><img src='../../images/blue/b_delete.png' title="删 除"/></a>&nbsp;&nbsp;
							</TD>
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
			 <div class="list_page">
						<logic:present name="pageInfo" scope="request">
							<table width="98%" align="center" border="0" cellpadding="3"
								cellspacing="3">
								<tr>
									<td align="center">									
										<bean:write name="pageInfo" scope="request" filter="false" />								
									</td>
								</tr>
							</table>
						</logic:present>
					</div>
		</div>
	</html:form>
</body>
</html:html>
