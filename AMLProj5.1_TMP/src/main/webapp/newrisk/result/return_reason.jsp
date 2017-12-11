<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	    <script type="text/javascript" src="../../js/jquery.js"></script>
	    <script type="text/javascript" src="../../js/aml.js"></script>
	
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //意见
    if(getLength(document.forms[0].return_reason.value)==0){
        errMsg+="退回原因不能为空！";
        document.forms[0].return_reason.focus();
    }
    if (getLength(document.forms[0].return_reason.value)>300) {
        errMsg = "退回原因不能多于500个字符,250个汉字！";  
　　　　　document.forms[0].return_reason.focus();
    }

   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</script>
	</head>
	<body class="mainbg">
	    <div id="main">
		    <html:form method="post" action="/result/t37_party_resultReturn.do">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>退回编辑岗 </span>
						<span class="buttons"> 
						   <a href="#" onclick="checkForm('t37_party_resultReturnDo.do');">
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
						    <html:hidden property="resulekey"/>
						    <html:hidden property="organkey_s"/>
						    <html:hidden property="status_cd"/>
						    <html:hidden property="curr_post"/>
							<tr>
								<td>
								  退回原因 ：
								</td>
								<td>
									<html:textarea property="return_reason" cols="50" rows="10"></html:textarea>
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