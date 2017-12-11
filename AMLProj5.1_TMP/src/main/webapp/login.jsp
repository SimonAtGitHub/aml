<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<!--[if lte IE 6]>
		<script type="text/javascript" src="js/unitpngfix.js"></script>
		<![endif]--> 
		<script language="javascript">
		   var loginctrl = '<bean:write name="loginctrl"/>';
		   function init() {
		     if(loginctrl == '1') {
			     var status = '<bean:write name="status"/>'; // 0 后台批量过程，只允许特殊用户登录（通过将“登录”按钮不可用阻止） 1 正常
			     if(status == '0') {
			    	 document.getElementById("loginbt").disabled = true;
			     }
			 }
		   }
		   // 当系统状态status='0'时，用户输入用户名后判断是否特殊用户。如果是则允许登录，否则不允许
		   function checkUser(obj) {
		     if(loginctrl == '1') {   
			     var status = '<bean:write name="status"/>'; // 0 后台批量过程，只允许特殊用户登录（通过将“登录”按钮不可用阻止） 1 正常
			     var users = '<bean:write name="specusers"/>'+',';
			     if(status == '0') {
			        if(obj.value!='' && users.indexOf(obj.value+',')>=0) {
				        document.getElementById("loginbt").disabled = false;
			     	} else {
			     		document.getElementById("loginbt").disabled = true;
			      	}
			     }
			 }
		   }
		   function submit(){
			   	if(event.keyCode==13){
			   		document.forms[0].submit();
			   	}
		   }
		</script>
	</head>
	<body class="loginbody" onload="javascript:document.forms[0].username.focus()" onkeydown="submit();">
		<html:form action="authuser.do" method="post">
		<input type="hidden" name="status" value="<bean:write name="status"/>"/>
		    <div class="loginarea_small">
				<div class="loglogo"></div>
				<div class="logtext">
					<div class="logtips"><html:errors/></div> 
					<div class="loginput">
						<html:text property="username" onchange="checkUser(this)" value=""></html:text><br/>
			 			<html:password property="password"  onfocus="checkUser(username)" value=""></html:password><br/>
			 			<input type="button" id="loginbt" onclick="document.forms[0].submit()" class="loginbt" style="width:105px; height:28px; margin:-10px 0 6px 0; cursor:pointer; "/>
					</div>
				</div>
			</div>
		</html:form>
	</body>
	<script language="javascript">
	   init();
	</script>
</html>
