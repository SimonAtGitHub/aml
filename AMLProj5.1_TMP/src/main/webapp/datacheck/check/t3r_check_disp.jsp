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
        errMsg="������Ʋ���Ϊ�գ�"; 
        document.forms[0].chk_name.focus();
      }else if(len(chk_name)>100 ){
    	errMsg="������Ʋ��ܳ���100�֣�"; 
        document.forms[0].chk_name.focus();
      }
      if(len(chk_org) == 0){ 
        errMsg="������������Ϊ�գ�"; 
        document.forms[0].chk_org.focus();
      }
      if(len(chk_des) != 0&len(chk_des)>2000){ 
        errMsg="����������ܴ���2000�֣�"; 
        document.forms[0].chk_des.focus();
      }
      if(getLength(chk_dt_bt)== 0||getLength(chk_dt_et) == 0){
		errMsg = "��ʼʱ��ͽ���ʱ�䲻��Ϊ�գ�";
		document.forms[0].chk_dt_bt.focus();
	  }else if(!_compareTwoDateForString(chk_dt_bt, chk_dt_et)) {
		errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	
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
		<html:form method="post" action="/check/t3r_checkDisp.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>������鿴</span>
						<span class="buttons"> <a href="#" onclick="window.close();" ><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png"/>�ر�</a> </span>
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
										<font color="#FF0000">*</font>������ƣ�
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<bean:write name="check" property="chk_name"/>
									</div>
								</TD>
								</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>����������
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<bean:write name="check" property="chk_org_disp"/>
									</div>
								</TD>
							</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>���ʱ��Σ�
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="check" property="chk_dt_bt"/>-<bean:write name="check" property="chk_dt_et"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										����״̬��
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="check" property="chk_status_disp"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										�����ˣ�
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="check" property="create_user_disp"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										����ʱ�䣺
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="check" property="create_dt"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										����������
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
											<bean:write name="check" property="create_org_disp"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										������
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									  <html:textarea cols="80" rows="5" name="check" property="chk_des" readonly="true"></html:textarea>
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
