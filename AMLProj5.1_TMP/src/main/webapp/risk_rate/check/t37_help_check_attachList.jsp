<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
<script type="text/javascript">
	function dosubmit(theUrl,type){ 
		var errMsg="";
		if(type=="del"){
			if(checkRadio(document.forms[0].attachKey)<0){
				errMsg+="请选择要删除的附件信息！";
				alert(errMsg);
				return false;
			}
			if(errMsg==""&&confirm('确认要删除该附件吗？')){
				document.forms[0].action=theUrl;
				document.forms[0].submit();
			}else{
				return false;
			}
		}else{ 
			document.forms[0].action=theUrl;
	        document.forms[0].submit();
		}
	}
	function fPopUpCalendarDlg(ctrlobj)
	{
		showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
		showy = event.screenY - event.offsetY + 18; // + deltaY;
		newWINwidth = 210 + 4 + 18;
	 
		retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
		if( retval != null ){
			ctrlobj.value = retval;
		}else{
			//alert("canceled");
		}
	}
		
</script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/check/t37_help_check_attachList.do" method="post">
<div class="conditions">
	<!-- table content -->
	<logic:notEqual name="t37_help_check" property="status_cd" value="2">
		<div class="cond_t">
			<span>协查处理 - 上传附件</span>
	     	<span class="buttons">
	     		<a href="#" onclick="dosubmit('t37_helpcheck_attach_add.do','add');"><img src="../../images/blue/b_add.png" />添 加</a> 
	     		<a href="#" onclick="dosubmit('t37_helpcheck_attach_del.do','del');"><img src="../../images/blue/b_delete.png" />删 除</a>
				<a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/blue/b_shut.png" />关闭</a>
			</span>
		</div>
	</logic:notEqual>
	<div class="list">
		<table border="0" cellspacing="0" cellpadding="0">
			<html:hidden property="check_no"/>
			<tr>
				<logic:notEqual name="t37_help_check" property="status_cd" value="2">
					<th>选择</th>
				</logic:notEqual>
				<th>文件名称</th>
				<th>上传日期</th>
				<th>上传人</th>
			</tr>
			<logic:present name="t37_helpcheck_attachList">
				<logic:iterate id="result" name="t37_helpcheck_attachList" type="com.ist.aml.risk_rate.dto.T37_helpcheck_attach">
					<tr align="center" bgcolor="#FFFFFF">
						<logic:notEqual name="t37_help_check" property="status_cd" value="2">
							<td>
								<html:radio idName="result" property="attachKey" value="attachKey"></html:radio>
							</td>
						</logic:notEqual>
						<td>
							<a href="#" 
								onClick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode( result.getAttach_name() )%>','','height=160, width=300,left=100,top=100');">
								<bean:write name="result" property="attach_realName"/>
							</a>
						</td>
						<td>
							<bean:write name="result" property="load_date_disp" />
						</td>
						<td>
							<bean:write name="result" property="load_user"/>
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</table>
	</div>
</div>
<div class="list_page">
		<logic:present name="pageInfo">
			<table width="98%" align="center" border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
		</logic:present>
</div>
</html:form>
<!-- all end -->   
</div>
</form>
</body>
</html>
