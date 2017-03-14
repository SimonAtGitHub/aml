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
		window.parent.location.href="<%=request.getContextPath()%>/risk_rate/check/t37_help_check_list.do?newsearchflag=0";
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/result/t37_help_case.do" method="post">
<div class="conditions">
	<!-- table content -->
	<div class="cond_c2" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<th colspan="4"><strong>详情
			<span class="buttons" style="float:right">
				<a href="javascript:history.go(-1);"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
			</span></strong></th>
			
        	<html:hidden name="t37_help_check" property="check_no"/>
        	<html:hidden name="t37_help_check" property="pageType"/>
        </tr>
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
			<td colspan="3">
				<bean:write name="t37_help_check" property="check_reason"/>
			</td>
		</tr>
		<tr>
			<td>协查情况反馈与结论：</td>
			<td colspan="3">
				<bean:write name="t37_help_check" property="check_result"/>
			</td>
		</tr>
		<tr>
			<td>协查机构</td>
			<td colspan="3">
				<bean:write name="t37_help_check" property="check_org_disp" />
			</td>
		</tr>
	  </table>
	</div>
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
	
  </div>
  </html:form>
<!-- all end -->   
</div>
</body>
</html>
