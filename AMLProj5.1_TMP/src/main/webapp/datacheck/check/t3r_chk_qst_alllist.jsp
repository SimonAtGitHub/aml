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
	<html:form action="/check/t3r_chk_qstAllList.do" method="post">
	<html:hidden property="logkey"/>
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>检查问题管理 </span>
					<span class="buttons">
				  </span>
				</div>
			</div>
			<div class="cond_c" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
         <td>检查名称：</td>
         <td>
         	<html:text property="chk_name"  styleClass="text_white" size="15" maxlength="64"/>
         </td>
         <td>问题所属机构：</td>
			<td>
			<html:text property="qst_org" size="10"  readonly="true" />
			<html:text property="qst_org_disp" size="15" readonly="true" />&nbsp;
			<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=qst_org&input_name_disp=qst_org_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			</td>
		</tr>
        <tr>
        <td>问题状态：</td>
			<td>
			<html:select  property="qst_status" >
				<html:options collection="statusMap" property="label" labelProperty="value"/>
			</html:select>
			</td>
		<td><input name="Button522" type="button" class="in_button1" value="查询"
					 onClick="dosubmit('t3r_chk_qstAllList.do?newsearchflag=1','mod')" />
		</td><td>&nbsp;&nbsp;</td>
		</tr>
	  </table>
	</div>
			<html:errors />
			<div class="list">
				<TABLE border="0" cellspacing="0" cellpadding="0">
					<TR>
					    <th width="15%">
							检查名称
						</th>
						 <th width="15%">
							检查时间段
						</th>
						 <th width="15%">
							被检查机构
						</th>
						 <th width="15%">
							检查日志日期
						</th>
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
								<bean:write name="qst" property="chk_name"></bean:write> 
							</TD>
							<TD>
								<bean:write name="qst" property="chk_dt_bt"/>-<bean:write name="qst" property="chk_dt_et"/>
							</TD>
							<TD>
								<bean:write name="qst" property="chk_org_disp"></bean:write> 
							</TD>
							<TD>
								<bean:write name="qst" property="logdt"></bean:write> 
							</TD>
							<TD>
								<bean:write name="qst" property="qstkey"></bean:write> 
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
										<a href="<%=request.getContextPath()%>/datacheck/check/t3r_chk_qst_mod.do?qstkey=<bean:write name="qst" property="qstkey" />"><img src='../../images/blue/b_edit.png' title="问题跟踪"/></a>&nbsp;&nbsp;
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
