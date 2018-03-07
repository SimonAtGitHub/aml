<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">

function checkForm(theUrl){
  	 var chk_name =  document.forms[0].chk_name.value ;
  	 var logdt =  document.forms[0].logdt.value ;
  	 var log_des =  document.forms[0].log_des.value ;
     var   errMsg="";
      if(len(chk_name) == 0){ 
        errMsg="检查名称不能为空！"; 
        document.forms[0].chk_name.focus();
      } 
      if(len(logdt) == 0){ 
        errMsg="日志日期不能为空！"; 
        document.forms[0].logdt.focus();
      }
      if(len(log_des) != 0&len(log_des)>2000){ 
        errMsg="日志描述不能大于2000字！"; 
        document.forms[0].log_des.focus();
      }
     if(errMsg!=""){
        alert(errMsg);
        return false;
     }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

 function dosubmit(theUrl){     
            document.forms[0].action=theUrl;
            document.forms[0].submit();
    }

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" action="/check/t3r_chk_log_add.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>检查日志新增</span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t3r_chk_logList.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返回</a> </span>
					</div>
					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td></td>
							<td height="8"></td>
						</tr>
					</table>
					<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>检查名称：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="chk_name" readonly="true" value="" />
							 			<html:hidden property="chk_no" />
						               <input type="button" name="locate" value="单 选" onclick="locate_pop_window('<%= request.getContextPath() %>','t3r_checkLocation','radio','forms[0]','chk_no,chk_name','chk_status=\'1\'');return false;"/>
         
									</div>
								</TD>
								</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>日志日期：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<html:text property="logdt"  readonly='true'/>
											<img src="../../images/calendar.gif" id="img1"
											style="cursor:hand;" width="16" height="16" border="0"
											align="absmiddle" alt="弹出日历下拉菜单"
											onclick="new Calendar().show(document.forms[0].logdt);">
							</div>
								</TD>
							</TR>
							
							 
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										日志描述：
									</div>
								</TD>
								<TD bgcolor="F6F9FF"  >
									 <html:textarea cols="80" rows="5" property="log_des"></html:textarea>
								</TD>
							</TR>
						</table>
					</div>
				<jsp:include page="../../cmp/attachment/attach_include_n.jsp" /> 
				<div class="cond_c2">
					<table> 
						<tr>
							<td align="center">
										<input type="button" class="in_button1" value="提 交"
											onclick="checkForm('t3r_chk_log_add_do.do')" />
										<input type="reset" class="in_button1" value="重 置" />
							</td>
						</tr>
					</table>
					</div>
				</div>
		</div>
		</html:form>
	</BODY>
</HTML>
