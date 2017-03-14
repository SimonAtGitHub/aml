<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function fPopUpCalendarDlg(ctrlobj){
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
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
			<html:form method="post" action="/calinfo/dm_task_add_do.do">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> DM计算管理 - 添加计算任务 </span>
						<span class="buttons"> <a
							href="#" onclick="dosubmit('dm_server_list.do');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> </span>
					</div>
				</div>
				<!-- table content -->
				<div class="cond_c">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
								<td>
									数据时间：
								</td>
								<td>
								<html:text property="statisticdate_disp" 
									size="12" readonly="true" 
									onclick="calendar.show(this);" styleClass="calimg"/>
								</td>
						</tr>
						<tr>
								<td>
									计算SERVER：
								</td>
								<td>
									<html:select property="serverkey">
										<html:options collection="calserverMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
						</tr>
						<tr>
							
							<td align="right">
								<html:hidden property="organkey" value="0" />
								<html:button property="button" styleClass="in_button1"
									value="提 交" onclick="checkForm('dm_task_add_do.do')" />
								
							</td>
							<td align="left">
								<html:reset styleClass="in_button1" value="重 置" />
							</td>
							<!--<html:button property="button" styleClass="input" value="提 交" onclick="checkForm('dm_task_add_do.do')"/> -->
							<!--<html:reset styleClass="input" value="重 填"/> -->
						</tr>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
