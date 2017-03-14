<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js">
	<script language="JavaScript" src="../../js/title.js"></script>
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    if(type=='sub'){
    	if(getLength(document.forms[0].filename.value)==0){
            errMsg+="请选择需要上传的文件！";
            document.forms[0].filename.focus();
        }
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
</HEAD>
<BODY leftmargin=0 topmargin=0>
	<html:form method="post"
		action="/t37_risk_attach/t37_risk_attach_add.do"
		enctype="multipart/form-data">
		<html:hidden property="resulekey"/>
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>评级意见附件管理</span>
					<span class="buttons">
					 <a href="#" onclick="dosubmit('t37_risk_attach_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					</span>
	  
					
				</div>
				<html:errors />
				<div class="cond_c">
					<table width="100%" height="71" border="0" cellpadding="1"
						cellspacing="1">
						<TR>
							<TD>
								<table width="100%" border="0" cellpadding="1" cellspacing="1">
									<tr bgcolor="ECF3FF">
										<td height="22" align="right" nowrap>
											上传文件：
										</td>
										<td>
											<html:file property="filename" />
										</td>
										<td>
											&nbsp;
										</td>
									</tr>


									<tr>
										<td height="22" align="center" bgcolor="ECF3FF"></td>
										<td align="right" bgcolor="ECF3FF">
											&nbsp;
										</td>
										<td align="right" bgcolor="ECF3FF">
											<input type=button value="上  传" name=Button23222
												class="in_button1"
												onClick="dosubmit('t37_risk_attach_add_do.do','sub');">
										</td>
									</tr>
								</table>
							</TD>
						</TR>
					</TABLE>
				</div>
			</div>
		</div>
	</html:form>
</BODY>
</html:html>
