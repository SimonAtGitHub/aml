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
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->

		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript">


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    if(document.forms[0].list2.options.length==0){
      errMsg = "协查机构不能为空！";
     }
     if (getLength(document.forms[0].reasons.value)==0) {
        errMsg = "协查原因不能为空！";
        document.forms[0].reasons.focus();
    }
       if (!CheckStcrLeng(document.forms[0].reasons,600) ){
        errMsg = "协查原因不能多于600个字符,300个汉字！";  
　　　　　document.forms[0].reasons.focus();
    }
   // alert(theUrl);
    if(errMsg==""){
        selectAllOptions(document.forms[0].list2);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

</script>
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/checkcase/addT07_case_Assis.do">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>发起协查 </span>
					<span class="buttons"> 
					    <a href="#" onclick="checkForm('addT07_case_AssisDo.do');return false;">
					        <img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />确定
					    </a> 
					    <a href="#" onclick="dosubmit('checkcase_list.do');return false;">
					        <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回
					    </a> 
					</span>
					<input type="hidden" name="application_num" value="<bean:write name="application_num"/>" />
					<input type="hidden" name="party_id" value="<bean:write name="party_id"/>" />
				</div>
				<html:errors />
				<!-- table content -->
				<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<font color="#FF0000">*</font>协查原因：
							</td>
							<td>
								<html:textarea property="reasons" cols="50" rows="3" styleClass="text_white" styleId="reasons"></html:textarea>
							</td>
						</tr>
						<tr>
							<td>
								<font color="#FF0000">*</font>协查机构：
							</td>
							<td>
								<bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
								<%=multiSeHTMLStr%>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</html:form>
	</body>
</html>
