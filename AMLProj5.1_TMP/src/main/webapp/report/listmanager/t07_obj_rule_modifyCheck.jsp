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
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>联网核查修改</title>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
function fPopUpCalendarDlg(ctrlobj)
{
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
function _Open(url){

    url=url+".do?newsearchflag=1&input_name=party_id&input_name_disp=obj_name";
  window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
  // window.open(url);
      
}
function changeType(){
	var type = document.forms[0].tl_objectkind;
	var tl_objectkind = "add";
	for (i=0;i<type.length;i++)
  {
  		
     if (type.item(i).checked)
        tl_objectkind = tl_objectkind + type.item(i).value;
   }  
   return tl_objectkind ;  
  
}
 function dosubmit(theUrl){     
            document.forms[0].action=theUrl;
            document.forms[0].submit();
    }
function  _Disp(){
     var index=document.forms[0].tl_listkind.selectedIndex; 
   var selvalue=document.forms[0].tl_listkind.value;
   if(selvalue=="1"){
    document.all.org.style.display="";
    document.all.tab.style.display="";
    document.all.red.style.display="";
   }else{
     document.all.org.style.display="none";
     document.all.tab.style.display="none";
     document.all.red.style.display="none";
   }
   if(selvalue=="0"){
   document.all.black.style.display="";
   }else{
      document.all.black.style.display="none";
   }
}
 function dosubmit(theUrl){     
            document.forms[0].action=theUrl;
            document.forms[0].submit();
    }
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" action="/listmanager/t07_obj_rule_modifyCheck.do">	
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>联网核查修改</span>
						<span class="buttons"> <a href="#" onclick="dosubmit('<%=request.getContextPath() %>/report/listmanager/t07_obj_rule_check.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返回</a> </span>
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
										<font color="#FF0000">*</font>联网核查日期：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="checkdate"  onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" size="12" />
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>核查机构：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">

									<div align="left">
										<html:text property="bank_code2" size="10" readonly="true"/>-<html:text property="bank_name" size="40" readonly="true"/>
										<html:img border="0" page="../../images/lock.jpg"
											align="absmiddle" alt="内容不允许修 改"></html:img>
									</div>

								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>联网核查时间：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="checktime" styleClass="text_white"
											size="20" readonly="true" />
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>核查结果：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="result">
											<html:options collection="checkresultMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</div>
								</TD>
							</TR>
                            <TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>公民姓名：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="name" styleClass="text_white"
											size="20" readonly="true" />
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>核查方式：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="checkmode" >
											<html:options collection="checkmethodMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>居民身份证件号码：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="id_no" styleClass="text_white"
											size="20" readonly="true" />
										<html:img border="0" page="../../images/lock.jpg"
											align="absmiddle" alt="内容不允许修 改"></html:img>
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>柜员号：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="counter_no" styleClass="text_white"
											size="20"/>
									</div>
								</TD>
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>业务条线：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="ope_line" styleClass="text_white"
											size="20"/>
									</div>
								</TD>
								<td height="22" align="right" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>摘要：
									</div>
								</td>
								<td colspan="3" bgcolor="F6F9FF" align="left">
									<html:textarea cols="29" rows="3" property="purpose"></html:textarea>
									<br>
								</td>
							</TR>
							<tr>	
								<td colspan="4" align="center">
									<input type="button" class="in_button1" value="提 交"
										onclick="checkForm('t07_obj_rule_modifyCheck_do.do')" />
									<input type="reset" class="in_button1" value="重 置" />
								</td>
							</tr>
						</table>
					</div>
		</html:form>
	</BODY>
</HTML>
