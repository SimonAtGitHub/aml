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
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
		
function checkForm(theUrl){
     var errMsg =""; 
    // _Date1 = document.forms[0].validate_dt_disp.value;
   //  _Date2 = document.forms[0].invalidate_dt_disp.value;
      if(getLength(document.forms[0].isuse.value) == 0){
	    errMsg="请选择是否启用！";
	    }
      else if(getLength(document.forms[0].m_list_type.value)==0){
        errMsg="请选择黑名单类型！";
        } 
	 // if(getLength(errMsg) == 0 && getLength(document.forms[0].validate_dt_disp.value) == 0){
	 //   errMsg="请选择生效日期！";
	 //   }
	 // if(getLength(errMsg) == 0 && getLength(document.forms[0].invalidate_dt_disp.value) == 0){
	  //  errMsg="请选择失效日期！";
	  //  } 
	//  if(getLength(document.forms[0].card_type.value)==0){
    ////    errMsg="请选择证件类型！";
        //}
    // if(getLength(document.forms[0].card_no.value)==0){
     //   errMsg="请填写证件号码！";
     //   }
	//   if(getLength(errMsg) == 0 )
	  // {
		//if(_Date1!="" && !formatDateAlert(_Date1))
       //     return false;       
        // else if(_Date2!="" && !formatDateAlert(_Date2))
	    //    return false;	   
       //  else if(!_compareTwoDateForString(_Date1, _Date2) )
  		//	errMsg += "开始时间不能大于结束时间！";		    
	   // }                 
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
	<div id="main">
		<html:form method="post" action="/listmanager/t07_blacklist_add_do.do">
			<input type="hidden" name="list_type" value="<bean:write name="list_type"/>"/>
			<input type="hidden" name="check" value="<bean:write name="check"/>"/>
			<html:hidden property="ischeck"/>
		
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 黑名单修改
							
						</span>
						<span class="buttons"> 
						<a href="#"
								onClick="dosubmit('<%=request.getContextPath()%>/report/listmanager/t07_blacklist_list.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
						</span>
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
											<font color="#FF0000">*</font>客户号：
										</div>
									</TD>
									<TD bgcolor="F6F9FF">

										<div align="left">
											<html:text property="party_id" styleClass="text_white"
												size="20" readonly="true" />
											<html:img border="0" page="../../images/lock.jpg"
												align="absmiddle" alt="内容不允许修改"></html:img>
										</div>

									</TD>
								</TR>
								<TR align="center">
									<TD height="22" bgcolor="ECF3FF">
										<div align="right">
											<font color="#FF0000">*</font>客户名称：
										</div>
									</TD>
									<TD bgcolor="F6F9FF">

										<div align="left">
											<html:text property="obj_name" styleClass="text_white"
												size="20" readonly="true" />
											<html:img border="0" page="../../images/lock.jpg"
												align="absmiddle" alt="内容不允许修改"></html:img>
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
											<html:text property="party_class_cd" styleClass="text_white"
												size="20" readonly="true" />
											<html:img border="0" page="../../images/lock.jpg"
												align="absmiddle" alt="内容不允许修改"></html:img>
										</div>
									</TD>
								</TR>
								<TR align="center">
										<TD height="22" bgcolor="ECF3FF">
											<div align="right">
												<font color="#FF0000">*</font>证件类型：
											</div>
										</TD>
										<TD bgcolor="F6F9FF">
											<div align="left">
												<html:select property="card_type">
													<html:options collection="card_typeMap" property="label"
														labelProperty="value" />&nbsp;</html:select>
												<br>
											</div>
										</TD>
									</TR>
									<TR align="center">
										<TD height="22" bgcolor="ECF3FF">
											<div align="right">
												<font color="#FF0000">*</font>证件号码：
											</div>
										</TD>
										<TD bgcolor="F6F9FF" align="left">
											<html:text property="card_no" ></html:text>
										</TD>
									</TR>
								<TR align="center">
									<TD height="22" bgcolor="ECF3FF">
										<div align="right">
											
												<font color="#FF0000">*</font>名单类型：
						
										</div>
									</TD>
									<td bgcolor="F6F9FF">
										<div align="left">
											<html:select property="m_list_type" style="width:550"
												onmouseover="selMouseOver(this,$('div_hint'))"
												onmouseout="selMouseOut(this,$('div_hint'))">
												<html:options collection="m_list_typeMap" property="label"
													labelProperty="value" />
											</html:select>
											<html:hidden  property="isuse"/>
										</div>
									</td>
								</TR>
								
								<!--  <TR align="center">
									<TD height="22" bgcolor="ECF3FF">
										<div align="right">
											<font color="#FF0000">*</font>是否启用：
										</div>

									</TD>

									<TD bgcolor="F6F9FF">
										<div align="left">
											<html:select property="isuse">
												<html:options collection="isuseMap" property="label"
													labelProperty="value" />
											</html:select>
										</div>
									</TD>
								</TR>-->
								<tr>
									<td height="22" align="right" bgcolor="ECF3FF">
										修改原因：
									</td>
									<td bgcolor="F6F9FF">
										<html:textarea cols="29" rows="3" property="reason_create"></html:textarea>
										<br>
									</td>
								</tr>

								<!-- <TR>
									<TD height="22" bgcolor="ECF3FF" align="right">
										<font color="#FF0000">*</font>生效日期：
										<br>
									</TD>

									<TD bgcolor="F6F9FF" id="black" align="left">
									 <html:text property="validate_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
 
										<br>
									</TD>



								</TR>
								<TR align="center">
									<TD height="22" bgcolor="ECF3FF" align="right">
										<font color="#FF0000">*</font>失效日期：
										<br>
									</TD>

									<TD bgcolor="F6F9FF" id="black" align="left">
										<html:text property="invalidate_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
 
										
									</TD>

								</TR>-->

								<tr>
									<td>
									</td>
									<td align="right">
										<input type="button" class="in_button1" value="提 交"
											onclick="checkForm('t07_blacklist_modify_do.do')" />
										<input type="reset" class="in_button1" value="重 置" />
									</td>
								</tr>
							</table>
						</div>
		</html:form>
		</div>
		<!-- 提示块 -->
		<div id=div_hint
			style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div>

	</BODY>
</HTML>
