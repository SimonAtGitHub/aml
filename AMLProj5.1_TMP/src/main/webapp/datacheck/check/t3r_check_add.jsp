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
  	 var chk_org =  document.forms[0].chk_org.value ;
  	 var chk_dt_bt =  document.forms[0].chk_dt_bt.value ;
  	 var chk_dt_et =  document.forms[0].chk_dt_et.value ;
  	 var chk_des =  document.forms[0].chk_des.value ;
     var   errMsg="";
      if(len(chk_name) == 0){ 
        errMsg="检查名称不能为空！"; 
        document.forms[0].chk_name.focus();
      }else if(len(chk_name)>100 ){
    	errMsg="检查名称不能超过100字！"; 
        document.forms[0].chk_name.focus();
      }
      if(len(chk_org) == 0){ 
        errMsg="被检查机构不能为空！"; 
        document.forms[0].chk_org.focus();
      }
      if(len(chk_des) != 0&len(chk_des)>2000){ 
        errMsg="检查描述不能大于2000字！"; 
        document.forms[0].chk_des.focus();
      }
      if(getLength(chk_dt_bt)== 0||getLength(chk_dt_et) == 0){
		errMsg = "起始时间和结束时间不能为空！";
		document.forms[0].chk_dt_bt.focus();
	  }else if(!_compareTwoDateForString(chk_dt_bt, chk_dt_et)) {
		errMsg = "开始时间不能大于结束时间！";	
		document.forms[0].chk_dt_et.focus();
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
		<html:form method="post" action="/check/t3r_check_add.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>检查管理新增</span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t3r_checkList.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返回</a> </span>
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
										<html:text property="chk_name" styleClass="text_white" size="20"/>
									</div>
								</TD>
								</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>被检查机构：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<html:text property="chk_org" size="10"  readonly="true" />
											<html:text property="chk_org_disp" size="15" readonly="true" />&nbsp;
										<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=chk_org&input_name_disp=chk_org_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									</div>
								</TD>
							</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>检查时间段：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="chk_dt_bt"  readonly='true'/>
											<img src="../../images/calendar.gif" id="img1"
											style="cursor:hand;" width="16" height="16" border="0"
											align="absmiddle" alt="弹出日历下拉菜单"
											onclick="new Calendar().show(document.forms[0].chk_dt_bt);">
							--
										<html:text property="chk_dt_et"  readonly='true'/>
											<img src="../../images/calendar.gif" id="img1"
											style="cursor:hand;" width="16" height="16" border="0"
											align="absmiddle" alt="弹出日历下拉菜单"
											onclick="new Calendar().show(document.forms[0].chk_dt_et);">
									</div>
								</TD>
							</TR>

							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										描述：
									</div>
								</TD>
								<TD bgcolor="F6F9FF"  >
									 <html:textarea cols="80" rows="5" property="chk_des"></html:textarea>
								</TD>
							</TR>
						</table>
					</div>
				<jsp:include page="../../cmp/attachment/attach_include_n.jsp" /> 
				<div class="cond_c2">
					<table> 
						<tr>
							<td align="center" colspan="4">
										<input type="button" class="in_button1" value="提 交"
											onclick="checkForm('t3r_check_add_do.do')" />
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
