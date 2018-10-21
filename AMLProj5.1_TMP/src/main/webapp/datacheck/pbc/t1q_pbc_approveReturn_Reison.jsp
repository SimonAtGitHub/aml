<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //意见
    var return_advi=document.forms[0].return_advi.value;
    if(getLength(trim(return_advi))==0){
        errMsg+="退回原因不能为空！";
        document.forms[0].return_advi.focus();
    }
       
    if (!CheckStcrLeng(document.forms[0].return_advi,600) ){
        errMsg = "退回原因不能多于600个字符,300个汉字！";  
　　　　　document.forms[0].return_advi.focus();
    }
   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
    var url=theUrl+"?tb_id="+document.forms[0].tb_id.value;
        document.forms[0].action=url;
        document.forms[0].submit();
    }
}





</script>
	</head>
	<body class="mainbg">
	    <div id="main">
		    <html:form method="post" action="/pbc/getT1q_pbc_approveReturn.do">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>审批退回意见 </span>
						<span class="buttons"> 
						   <a href="#" onclick="checkForm('getT1q_pbc_approveReturn_save.do');">
							  <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存
						   </a> 
						   <a href="#" onclick="window.close();">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭
						   </a> 
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
								   <font color="red">*</font>处理意见：
								</td>
								<td>
									<html:textarea styleId="return_advi" property="return_advi" cols="70" rows="10" maxlength="124"></html:textarea>
									<font color="#FF0000">* </font>
									<html:hidden name="ta_pbc_apply" property="tb_id" />
								</td>
							</tr>
						
						</table>
					</div>
				</div>
		    </html:form>
		</div>
	</body>
</html>