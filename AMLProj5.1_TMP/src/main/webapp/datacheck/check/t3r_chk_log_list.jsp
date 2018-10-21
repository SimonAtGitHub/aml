<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<title>检查日志管理</title>
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
            if(confirm('你真的要删除此日志吗？')){
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
	<html:form action="/check/t3r_chk_logList.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>检查日志管理 </span>
					<span class="buttons">
					<a id="hdd_display" class="bt_hidden"></a> 
					<a href="#" onClick="dosubmit('t3r_chk_log_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />新 增</a>
				  </span>
				</div>
				<!-- table content -->
<div class="cond_c" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
         <td>检查名称：</td>
         <td>
         	<html:text property="chk_name_s"  styleClass="text_white" size="15" maxlength="64"/>
         </td>
         <td>日志时间：</td>
			<td>
			 <html:text property="logdt_bt"  readonly='true'/>
											<img src="../../images/calendar.gif" id="img1"
											style="cursor:hand;" width="16" height="16" border="0"
											align="absmiddle" alt="弹出日历下拉菜单"
											onclick="new Calendar().show(document.forms[0].logdt_bt);">
							-
										<html:text property="logdt_et"  readonly='true'/>
											<img src="../../images/calendar.gif" id="img1"
											style="cursor:hand;" width="16" height="16" border="0"
											align="absmiddle" alt="弹出日历下拉菜单"
											onclick="new Calendar().show(document.forms[0].logdt_et);">
			</td>
		</tr>
        <tr>
        
        <td>&nbsp;&nbsp;</td>
         <td>&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;
		</td><td align="left"><input name="Button522" type="button" class="in_button1" value="查询"
					 onClick="dosubmit('t3r_chk_logList.do?newsearchflag=1','mod')" /></td>
		</tr>
	  </table>
	</div>
			</div>

			
			<html:errors />
			<div class="list">
				<TABLE border="0" cellspacing="0" cellpadding="0">
					<TR>
						<th width="15%">
							日志编号
						</th>
						<th width="15%">
							检查名称
						</th>
						<th width="10%">
						           日志日期
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
					
					<logic:iterate id="log" name="t3r_chk_logList"
						type="com.ist.bmp.pbc.dto.T3r_chk_log">

						<TR>
							<TD>
							<a href="#" onclick="window.open('t3r_chk_logDisp.do?logkey=<bean:write name="log" property="logkey" />','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
								<bean:write name="log" property="logkey"></bean:write></a>
							</TD>
							<TD>
								<bean:write name="log" property="chk_name"/>
							</TD>
							<TD>
								<bean:write name="log" property="logdt"></bean:write>
							</TD>
							<TD>
								<bean:write name="log" property="create_user_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="log" property="create_org_disp"></bean:write>
							</TD>
							<TD>
								<bean:write name="log" property="create_dt"></bean:write>
							</TD>
							<TD>
										<a href="<%=request.getContextPath()%>/datacheck/check/t3r_chk_log_modify.do?logkey=<bean:write name="log" property="logkey" />"><img src='../../images/blue/b_edit.png' title="修 改"/></a>&nbsp;&nbsp;
								<logic:equal value="0" property="qstcount" name="log">
										<a href="<%=request.getContextPath()%>/datacheck/check/t3r_chk_log_delete_do.do?logkey=<bean:write name="log" property="logkey" />"><img src='../../images/blue/b_delete.png' title="删 除"/></a>&nbsp;&nbsp;
								</logic:equal>
								<a href="<%=request.getContextPath()%>/datacheck/check/t3r_chk_qstList.do?newsearchflag=1&logkey=<bean:write name="log" property="logkey" />"><img src='../../images/blue/b_add2.png' title="问题管理"/></a>
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
