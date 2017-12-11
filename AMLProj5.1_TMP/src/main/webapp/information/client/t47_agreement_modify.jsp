<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.aml.report.dto.CreditTask"%>
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
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>

		<script type='text/javascript' src='./dwr/interface/CountryArea.js'></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="../../js/validate.js" language="javascript"></script>


		<%
			HashMap errorMap = (HashMap) request.getAttribute("errorHash");
		%>
		<style>
v\: * {
	behavior: url(#default#VML);
}

o\: * {
	behavior: url(#default#VML);
}

.link {
	text-decoration: none;
}
</style>

		<script language="javascript">	
	    var g_appid = "1";
		function validateDetail() {
			  g_changed = true;
	          validate($$('ctac',0), '', '');
		}

function _Confim(url){
	var errMsg ="";
      if(document.forms[0].aml_acct_type_cd.value==""){
        errMsg+=" 账户类型不能为空  ";
       }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
          
		   document.forms[0].action=url;
		   document.forms[0].submit();
		}
}
		
	</script>
		<style type="text/css">
.STYLE2 {
	color: #ff0000
}
</style>
		<script language="javascript">
			var c= new Array();
			c.push(0);c.push(0);c.push(0);c.push(0);
			function expand(idx, id) {
				/*c[idx]++; 
				var disp='none'; 
				if(c[idx]==1) 
					disp='none'; 
				else {
					disp=''; 
					c[idx]=0;
				} 
				document.getElementById(id).style.display=disp;*/
			}
			
function  _back(url){
            document.forms[0].action=url;
		   document.forms[0].submit();
}
	</script>
	</head>
	<body class="mainbg" onload="validateDetail();">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="main">
			<html:form action="/client/t47_agreement_list_modify.do" method="post">
				<%
					CreditTask credittask = (CreditTask) session
								.getAttribute("credittask");
						boolean notEdit = false;
						if (credittask != null) {
							if (credittask.getPost_id().equals("P0102")) { // 编辑岗
								notEdit = false;
							} else { // 审批岗
								notEdit = true;
							}
						}
				%>
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>账户信息修改 </span>
						<span class="buttons"> </span>
					</div>
					<html:errors />

					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<html:hidden property="acct_from" />
							<tr>
								<td>
									<!--CTAC-->
									账号：
								</td>
								<td>
									<html:text property="acct_num" readonly="true"
										onchange="change();" onblur="validateDetail('');" alt="账号" />
									<img src="../../images/lock.jpg" />

								</td>
							</tr>
							<tr>
								<td>
									账户类型：
								</td>
								<td>
									<html:select property="aml_acct_type_cd" onchange="change();"
										onblur="validateDetail('');">
										<html:options collection="catpMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							</tr>
							<tr>
								<td>
									开户日期：
								</td>
								<td>
									<html:text property="open_dt_disp" size="25"
										styleClass="calimg" onclick="calendar.show(this);" />
								</td>
							</tr>
							<tr>
								<td>
									销户日期：
								</td>
								<td>
									<html:text property="close_dt_disp" size="25"
										styleClass="calimg" onclick="calendar.show(this);" />
							</tr>
							<tr>
								<td colspan="2" class="in_button">
									<input type="button" name="save" value="保  存"
										onclick="_Confim('<%=request.getContextPath()%>/information/client/t47_agreement_list_modifyDo.do?newsearchflag=2')" />
									<input type="button" name="Submit4" value="返  回"
										onclick="_back('t47_agreement_list.do?newsearchflag=2')" />
								</td>
							</tr>
						</table>
					</div>
				</div>

				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>