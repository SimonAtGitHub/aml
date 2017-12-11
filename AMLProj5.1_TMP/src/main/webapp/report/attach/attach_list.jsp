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
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript">
function dosubmit(theUrl,type){ 
var errMsg="";
       if(type=="del"){
         if(checkRadio(document.forms[0].attachkey)<0){
           errMsg+="请选择要删除的附件信息！";
         }
         if(errMsg==""&&confirm('确认要删除上传的附件吗？')){
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
function aa(){
    window.parent.document.getElementById("maskLevel").style.zIndex="-20000";
    window.parent.document.getElementById("ym-window").style.zIndex="-10000";
    window.parent.ymPrompt.close();   
}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/t07_alert_attach/t07_alert_attach_list.do"
			method="post">
			<input type="hidden" name="application_num"
				value="<bean:write name="application_num"/>" />
			<div id="main">
				<div class="conditions">
					<div class="cond_t">
						<span><%=com.ist.util.Constans.CASE_NAME%>处理 - 上传附件</span>
						<span class="buttons"> 
						    <a href="#"
							    onclick="dosubmit('t07_alert_attach_add.do','add');">
							    <img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> 
							<a href="#"
							     onclick="dosubmit('t07_alert_attach_delete_do.do','del');">
							     <img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a> 
						   <a href="#"
							      onclick="aa();">
							     <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
					     </span>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								选择
							</th>
							<th>
								文件名称
							</th>
							<th>
								上传日期
							</th>
							<th>
								上传人
							</th>
						</tr>
						<logic:iterate id="attach" name="t07_alert_attachList"
							type="com.ist.aml.report.dto.T07_alert_attach">
							<tr>
								<td>
									<html:radio property="attachkey" idName="attach"
										value="attachkey"></html:radio>
								</td>
								<td>
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode(attach.getAttach_name())%>','','height=160, width=300,left=100,top=100');">
										<bean:write name="attach" property="attach_realname" scope="page" />
								    </a>
								</td>
								<td>
									<bean:write name="attach" property="load_date_disp" scope="page" />
								</td>
								<td>
									<bean:write name="attach" property="load_user" scope="page" />
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			</div>
		</html:form>
	</body>
</html>


