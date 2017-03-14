<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
             <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script type="text/javascript" src="../../js/jquery.js"></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
             <script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl){
	var reason=document.forms[0].apply_reason.value;
	if(getLength(reason)>500){
		alert("原因不能超过500字符！");
		return false;
		}
   document.forms[0].action=theUrl;
   document.forms[0].submit();
   window.parent.ymPrompt.close();
}

</script>
	</head>
	<body class="mainbg">
	    <div id="main">
		    <html:form method="post" action="/apply/t07_cd_apply_reason.do">
				<input type="hidden" name="reportkey" value="<bean:write name="t07_cd_applyActionForm" property="reportkey"/>"/>
				<input type="hidden" name="msg_type" value="<bean:write name="t07_cd_applyActionForm" property="msg_type"/>"/>
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>填写逾期原因 </span>
						<span class="buttons"> 
						   <a href="#" onclick="dosubmit('t07_cd_apply_reason_save.do');">
							  <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存
						   </a> 
						   <a href="#" onclick="window.parent.ymPrompt.close();">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭
						   </a> 
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
								   原因：
								</td>
								<td>
									<html:textarea property="apply_reason" cols="70" rows="6"></html:textarea>
									<font color="#FF0000">* </font>
								</td>
							</tr>
						</table>
					</div>
				</div>
		    </html:form>
		</div>
	</body>
</html>