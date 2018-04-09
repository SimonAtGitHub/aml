<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
	<title>联网核查新建</title>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
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
     if(getLength(errMsg) == 0 && getLength(document.forms[0].bank_code2.value) == 0){
	    errMsg="核查机构不能为空！";
	    }  
      if(getLength(errMsg) == 0 && getLength(document.forms[0].id_no.value) == 0){
	    errMsg="居民身份证件号码不能为空！";
	    }
	    
	 if(getLength(errMsg) == 0 && getLength(document.forms[0].result.value) == 0){
	    errMsg="请选择核查结果！";
	    }
     if(getLength(errMsg) == 0 && getLength(document.forms[0].checkmode.value) == 0){
        errmsg="请选择核查方式！";
        }   
	   if(getLength(errMsg)==0 && getLength(document.forms[0].purpose.value)>200){
	   		errMsg+="摘要不能大于120个字符！";
	   }        
     if(errMsg!=""){
        alert(errMsg);
        return false;
     }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function _Open(url){
    url=url+".do?input_name=party_id&input_name_disp=obj_name&input_name_type=party_class_cd";
  window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
  // window.open(url);
      
}
function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
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
		<html:form method="post" action="/listmanager/t07_obj_rule_add_doCheck.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>联网核查新建</span>
						<span class="buttons">
						<a href="#"
							onClick="dosubmit('<%=request.getContextPath() %>/report/listmanager/t07_obj_rule_check.do');">
							<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
						</span>
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
								<TD>
								<div align="right">
										联网核查日期：
										</div>
								</TD>
								<TD bgcolor="F6F9FF" align="left">
									 <html:text property="checkdate" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>核查机构：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="bank_code2" size="10" require="false" datatype="number|limit_max" max="12" msg="请输入数字|不能超过12个数字"/>
									<html:text property="bank_name" styleClass="text_white"
										size="23" readonly="true" maxlength="10" />
<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=bank_code2&input_name_disp=bank_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									<br>		
									</div>
								</TD>
							</TR>

							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										联网核查时间：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="checktime" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
										<br>
									</div>
								</TD> 
							    <TD height="22" bgcolor="ECF3FF">
									<div align="right">
										公民姓名：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="name" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
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
										<html:text property="id_no" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
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
									</div>
								</TD>
							</tr>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										柜员号：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="counter_no" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
										<br>
									</div>
								</TD> 
							    <TD height="22" bgcolor="ECF3FF">
									<div align="right">
										业务条线：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="ope_line" require="false" datatype="limit_max" max="256" msg="不能超过256个字符"/>
										<br>
									</div>
								</TD> 
							</TR>
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>核查方式：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="checkmode">
											<html:options collection="checkmethodMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>
								</TD>
							    <td  height="22" align="right" bgcolor="ECF3FF">
									摘要：
								</td>
								<td colspan="3" bgcolor="F6F9FF" align="left">
									<html:textarea cols="29" rows="3" property="purpose"></html:textarea>
									<br>
								</td>
							</TR>
							<tr>
								
								<td colspan="4" align="center">
									<input type="button" name="button1" class="in_button1" value="提 交"
										onclick="checkForm('t07_obj_rule_add_doCheck.do')" />
									<input type="reset" name="button1" class="in_button1" value="重 置" />
								</td>
								
							</tr>
						</table>
					</div>
				</div>
		</html:form>
	</BODY>
</HTML>
