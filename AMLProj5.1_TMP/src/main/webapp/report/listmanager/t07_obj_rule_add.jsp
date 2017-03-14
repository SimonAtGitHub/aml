<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
	<title>白名单新建</title>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
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
//     _Date1 = document.forms[0].validate_dt_disp.value;
//     _Date2 = document.forms[0].invalidate_dt_disp.value;
     if(getLength(document.forms[0].party_id.value)==0){
        errMsg="客户号不能为空！";
        }  
     
     if(getLength(document.forms[0].party_id.value)>25){
     	errMsg="客户号不能超过25个字符！";
     	}
     if(checkString(document.forms[0].party_id.value)!=1){
     	errMsg="客户号不能含有汉字！";
     	}
      if(getLength(errMsg) == 0 && getLength(document.forms[0].obj_name.value) == 0){
	    errMsg="客户名称不能为空！";
	    }
	    
	 if(getLength(errMsg) == 0 && getLength(document.forms[0].party_class_cd.value) == 0){
	    errMsg="请选择客户类型！";
	    }
     if(getLength(errMsg) == 0 && getLength(document.forms[0].rule_type.value) == 0){
        errMsg="请选择免检测类型！";
        }   
<%--      if(getLength(errMsg) == 0 && getLength(document.forms[0].isuse.value) == 0){--%>
<%--	    errMsg="请选择是否启用！";--%>
<%--	    }--%>
//	  if(getLength(errMsg) == 0 && getLength(document.forms[0].validate_dt_disp.value) == 0){
//	    errMsg="请选择生效日期！";
//	    }
//	  if(getLength(errMsg) == 0 && getLength(document.forms[0].invalidate_dt_disp.value) == 0){
//	    errMsg="请选择失效日期！";
//	    } 
	   if(getLength(errMsg)==0 && getLength(document.forms[0].reason_create.value)>200){
	   		errMsg+="白名单建立原因不能大于200个字符！";
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
		<html:form method="post" action="/listmanager/t07_obj_rule_add_do.do">
			<input type="hidden" name="check" value='<bean:write name="check"/>' />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>名单新建</span>
						<span class="buttons">
						<a href="#"
							onClick="dosubmit('<%=request.getContextPath() %>/report/listmanager/t07_obj_rule_list.do');">
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
										<font color="#FF0000">*</font>客户号：
										</div>
								</TD>
								<TD bgcolor="F6F9FF" align="left">
									<html:text property="party_id" value="" maxlength="50"></html:text>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>客户名称：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">

										<html:text property="obj_name" styleClass="text_white" maxlength="50"
											size="20" value="" />
											<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list1.do?newsearchflag=1&input_name=party_id&input_name_disp=obj_name&type=party_class_cd','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
											<span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span>
											</a>

										
									</div>
								</TD>
							</TR>

							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>客户类型：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="party_class_cd">
											<html:options collection="clienttypeMap" property="label"
												labelProperty="value" />&nbsp;</html:select>
										<br>
									</div>
								</TD> 
								
								
								<!-- <TD bgcolor="F6F9FF">
									<div align="left">
										<logic:empty name="t07_obj_ruleActionForm" property="party_class_cd">
										<html:select property="party_class_cd">
											<html:options collection="clienttypeMap" property="label"
												labelProperty="value" />&nbsp;
										</html:select>
										<br>
										</logic:empty >
										
										<logic:notEmpty name="t07_obj_ruleActionForm" property="party_class_cd">
										
										<html:text property="party_class_cd" value="" maxlength="50"></html:text>
										
										</logic:notEmpty >
										
									</div>
								</TD>-->
								
								
								
								
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>免检测类型：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="rule_type">
											<html:options collection="rule_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									</div>
								</TD>
							</TR>

							<TR align="center">
<%--								<TD height="22" bgcolor="ECF3FF">--%>
<%--									<div align="right">--%>
<%--										<font color="#FF0000">*</font>是否启用：--%>
<%--									</div>--%>
<%----%>
<%--								</TD>--%>
<%----%>
<%--								<TD bgcolor="F6F9FF">--%>
<%--									<div align="left">--%>
<%--											<html:select property="isuse">--%>
<%--												<html:options collection="isuseMap" property="label"--%>
<%--													labelProperty="value" />--%>
<%--											</html:select>--%>
<%--									</div>--%>
<%--								</TD>--%>
								
								<td  height="22" align="right" bgcolor="ECF3FF">
									白名单建立原因：
								</td>
								<td colspan="3" bgcolor="F6F9FF" align="left">
									<html:textarea cols="29" rows="3" property="reason_create"></html:textarea>
									<br>
								</td>
								
							</tr>
<!-- 
							<TR>
								<TD height="22" bgcolor="ECF3FF" align="right">
									<font color="#FF0000">*</font>生效日期：
									<br>
								</TD>

								<TD bgcolor="F6F9FF" id="black" align="left">
								  <html:text property="validate_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
            
									<br>
								</TD>



								<TD height="22" bgcolor="ECF3FF" align="right">
									<font color="#FF0000">*</font>失效日期：
									<br>
								</TD>

								<TD bgcolor="F6F9FF" id="black" align="left">
								<html:text property="invalidate_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
            
								<br>
								</TD>

							</TR>
 -->
							<tr>
								
								<td colspan="4" align="center">
									<input type="button" name="button1" class="in_button1" value="提 交"
										onclick="checkForm('t07_obj_rule_add_do.do')" />
									<input type="reset" name="button1" class="in_button1" value="重 置" />
								</td>
								
							</tr>
						</table>
					</div>
				</div>
		</html:form>
	</BODY>
</HTML>
