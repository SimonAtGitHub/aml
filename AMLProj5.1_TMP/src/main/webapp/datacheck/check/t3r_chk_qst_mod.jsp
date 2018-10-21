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
  	 var solution =  document.forms[0].solution.value ;
  	  var qst_status =  document.forms[0].qst_status.value ;
     var   errMsg="";
        
      if(len(qst_status) == 0){ 
        errMsg="问题状态不能为空！"; 
      } 
      if(len(solution) == 0){ 
        errMsg="问题解决方案不能为空！"; 
        document.forms[0].qst_des.focus();
      }
      if(len(solution) != 0&len(solution)>2000){ 
        errMsg="问题解决方案不能大于2000字！"; 
        document.forms[0].solution.focus();
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
		<html:form method="post" action="/check/t3r_chk_qst_mod.do">
		<html:hidden property="logkey"/>
		<html:hidden property="qstkey"/>
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>问题修改</span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t3r_chk_qstAllList.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返回</a> </span>
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
										问题所属机构：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<bean:write name="t3r_checkActionForm" property="qst_org_disp"/>
									</div>
								</TD>
								</TR>
							 
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										问题描述：
									</div>
								</TD>
								<TD bgcolor="F6F9FF"  >
									 <html:textarea cols="80" rows="5"  name="qst"  name="t3r_checkActionForm"  property="qst_des" readonly="true"></html:textarea>
								</TD>
							</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>问题状态：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									 <html:select  property="qst_status" >
										<html:options collection="statusMap" property="label" labelProperty="value"/>
									</html:select>
							</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>问题解决方案：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									  <html:textarea cols="80" rows="5" property="solution"></html:textarea>
									</div>
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
											onclick="checkForm('t3r_chk_qst_mod_do.do')" />
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
