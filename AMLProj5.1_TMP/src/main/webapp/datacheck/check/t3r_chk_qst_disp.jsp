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
		<html:form method="post" action="/check/t3r_chk_qstDisp.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>问题查看</span>
						<span class="buttons"> <a href="#" onclick="window.close();" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>关 闭</a> </span>
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
										<font color="#FF0000">*</font>问题编号：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									   <bean:write name="qst" property="qstkey"/>
									</div>
								</TD>
								</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>问题所属机构：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<bean:write name="qst" property="qst_org_disp"/>
							</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>问题描述：
									</div>
								</TD>
								<TD bgcolor="F6F9FF"  >
									 <html:textarea cols="80" rows="5"  name="qst"  property="qst_des" readonly="true"></html:textarea>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>问题状态：
									</div>
								</TD>
								<TD bgcolor="F6F9FF"  >
								<bean:write name="qst" property="qst_status_disp"/>
								</TD>
							</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										问题解决方案：
									</div>
								</TD>
								<TD bgcolor="F6F9FF"  >
									 <html:textarea cols="80" rows="5"  name="qst"  property="solution" readonly="true"></html:textarea>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										创建人：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="qst" property="create_user_disp"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										创建时间：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="qst" property="create_dt"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										创建机构：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="qst" property="create_org_disp"/>
									</div>
								</TD>
							</TR>
							 
							
						</table>
					</div>
				<jsp:include page="../../cmp/attachment/attach_include_n.jsp" /> 
				 
				</div>
		</div>
		</html:form>
	</BODY>
</HTML>
