<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="javascript"> 
	function doSubmit(theUrl){
		document.forms[0].action=theUrl;
		document.forms[0].submit();
		window.parent.ymPrompt.close();
		window.parent.location.href="<%=request.getContextPath()%>/risk_rate/check/t37_help_check_list.do?newsearchflag=1";
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/check/t37_help_case.do" method="post">
<div class="conditions">
	<!-- table content -->
	<div class="cond_c2" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<logic:notEqual name="t37_help_check" property="pageType" value="1">
				<th colspan="4"><strong>协查信息</strong></th>
			</logic:notEqual>
			<logic:equal name="t37_help_check" property="pageType" value="1">
				<th colspan="4"><strong>详情</strong></th>
			</logic:equal>
        	<html:hidden name="t37_help_check" property="check_no"/>
        	<html:hidden name="t37_help_check" property="pageType"/>
        </tr>
        <logic:equal name="t37_help_check" property="pageType" value="1">
        	<tr>
        		<td>客户名称</td>
        		<td>
        			<bean:write name="t37_help_check" property="party_chn_name" />
        		</td>
        		<td>客户号</td>
        		<td>
        			<bean:write name="t37_help_check" property="party_id" />
        		</td>
        	</tr>
        </logic:equal>
        <tr>
			<td>发起协查机构：</td>
			<td>
	         	<bean:write name="t37_help_check" property="send_org_disp" />
			</td>
			<td>发起时间：</td>
			<td>
				<bean:write name="t37_help_check" property="send_date_disp" />
			</td>
		</tr>
		<tr>
			<td>发起人：</td>
			<td>
				<bean:write name="t37_help_check" property="send_user" />
			</td>
		</tr>
		<tr>
			<td>协查事由和内容：</td>
			<td colspan="3" style="white-space:normal;">
				<bean:write name="t37_help_check" property="check_reason"/>
			</td>
		</tr>
		<tr>
			<td>协查情况反馈与结论：</td>
			<td colspan="3">
				<logic:equal name="t37_help_check" property="status_cd" value="2">
					<bean:write name="t37_help_check" property="check_result"/>
				</logic:equal>
				<logic:notEqual name="t37_help_check" property="status_cd" value="2">
					<html:textarea styleId="check_result" name="t37_help_check" property="check_result" cols="50" rows="4"/>
				</logic:notEqual>
			</td>
		</tr>
		<logic:equal name="t37_help_check" property="pageType" value="1">
			<tr>
				<td>协查机构</td>
				<td colspan="3">
					<bean:write name="t37_help_check" property="check_org_disp" />
				</td>
			</tr>
		</logic:equal>
		<logic:notEqual name="t37_help_check" property="status_cd" value="2">
			<tr>
	        	<td>
	        		<input name="Button522" type="button" class="in_button1" value="提交"
						 onClick="doSubmit('t37_help_case_do.do?organkey=<bean:write name="t37_help_check" property="organkey"/>&data_source=<bean:write name="t37_help_check" property="data_source"/>&resultkey=<bean:write name="t37_help_check" property="resultkey"/>&check_no=<bean:write name="t37_help_check" property="check_no"/>')" />
				</td>
	        </tr>
        </logic:notEqual>
	  </table>
	</div>
	<logic:equal name="t37_help_check" property="status_cd" value="2">
		<logic:equal name="t37_help_check" property="pageType" value="1">
			<br/>
			<div class="list">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<th>序号</th>
						<th>文件名 </th>
	          			<th>上传时间 </th>
	          			<th>上传人 </th>
			        </tr>
			        <logic:present name="t37_helpcheck_attachList">
			        	<% int i = 1; %>
						<logic:iterate id="thca" name="t37_helpcheck_attachList" type="com.ist.aml.risk_rate.dto.T37_helpcheck_attach">
							<tr align="center" bgcolor="#FFFFFF">
								<td>
									<%=i++ %>
								</td>
								<td>
									<a href="#" 
										onClick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode( thca.getAttach_name() )%>','','height=160, width=300,left=100,top=100');">
										<bean:write name="thca" property="attach_realName"/>
									</a>
								</td>
								<td>
									<bean:write name="thca" property="load_date_disp" />
								</td>
								<td>
									<bean:write name="thca" property="load_user"/>
								</td>
							</tr>
						</logic:iterate>
					</logic:present>
				</table>
			</div>
		</logic:equal>
	</logic:equal>
	
  </div>
  </html:form>
<!-- all end -->   
</div>
</body>
</html>
