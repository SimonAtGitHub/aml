<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>

		<SCRIPT LANGUAGE="JavaScript">

function checkForm(theUrl){

     var errMsg ="";
    // _Date1 = document.forms[0].validate_dt_disp.value;
    //_Date2 = document.forms[0].invalidate_dt_disp.value; 
      
         //if(getLength(document.forms[0].party_id.value)==0 ){
         //    errMsg="客户号不能为空！";
         //  } 
         //else 
         if(getLength(document.forms[0].party_id.value)>25){
	     	errMsg="客户号不能超过25个字符！";
	     	}
	    else if(checkString(document.forms[0].party_id.value)!=1){
     		errMsg="客户号不能含有汉字！";
     	}
         else if(getLength(errMsg) == 0 && getLength(document.forms[0].obj_name.value) == 0){
	         errMsg="客户名称不能为空！";
	       }
	//     else if(getLength(errMsg) == 0 && getLength(document.forms[0].party_class_cd.value) == 0){
	//	    errMsg="请选择客户类型！";
	//	    }
	//	else  if(getLength(document.forms[0].card_type.value)==0){
	   //     errMsg="请选择证件类型！";
	   //     }
	  //  else if(getLength(document.forms[0].card_no.value)==0 ){
	  //      errMsg="请填写证件号码！";
	   //  }else if(document.forms[0].card_no.length <= 18){
    	//	errMsg="证件号码必须小于18位";
    	// } 
	   //  else if(!getLength(document.forms[0].card_no.value)==0 && checkNum(document.forms[0].card_no.value)==0){
	   //  	errMsg="证件号码只能是数字！"
	   //  }
<%--	    else if ((document.forms[0].card_type.value =="19"||document.forms[0].card_type.value =="29")&&(getLength(document.forms[0].card_type_inf.value)>30||getLength(document.forms[0].card_type_inf.value)<=0)) {--%>
<%--	        errMsg = "请输入证件的详细信息，并且在30个字符之内！";--%>
<%--	   		 }--%>
   		 else if (document.forms[0].card_type.value=="11"&&(getLength(document.forms[0].card_no.value)!=15&&getLength(document.forms[0].card_no.value)!=18)){
		    errMsg = "身份证应为15或18位！";
		        document.forms[0].card_no.focus();
		    }
	     else if(!getLength(document.forms[0].card_no.value)==0 && getLength(document.forms[0].card_no.value)>18){
	     	errMsg="请填写正确的证件号码！"
	     }
         else if(getLength(document.forms[0].m_list_type.value)==0 ){
            errMsg="名单类型不能为空！";
           }  
		 else if(getLength(errMsg)==0 && getLength(document.forms[0].reason_create.value)>200){
		   	errMsg="名单建立原因不能大于200个字符！";
		   }
    // if(getLength(errMsg) == 0 && getLength(document.forms[0].isuse.value) == 0){
	 //   errMsg="请选择是否启用！";
	  //  }
	 // if(getLength(errMsg) == 0 && getLength(document.forms[0].validate_dt_disp.value) == 0){
	 //   errMsg="请选择生效日期！";
	  //  }
	 // if(getLength(errMsg) == 0 && getLength(document.forms[0].invalidate_dt_disp.value) == 0){
	 //   errMsg="请选择失效日期！";
	 //   } 

	  // if(getLength(errMsg) == 0 )
	  //  {
		 //if(_Date1!="" && !formatDateAlert(_Date1))
         //    return false;       
        //  else if(_Date2!="" && !formatDateAlert(_Date2))
	     //    return false;	   
         // else if(!_compareTwoDateForString(_Date1, _Date2) )
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

    url=url+".do?input_name=party_id&input_name_disp=obj_name&input_name_type=party_class_cd&input_card_no=card_no&input_card_type=card_type";
  window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
  // window.open(url);
      
}


 function dosubmit(theUrl){     
            document.forms[0].action=theUrl;
            document.forms[0].submit();
    }


</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		
		<html:form method="post" action="/listmanager/t07_blacklist_add_do.do">
			<input type="hidden" name="list_type" value="<bean:write name="list_type"/>"/>
			<input type="hidden" name="check" value="<bean:write name="check"/>"/>
				<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>黑名单添加</span>
							
						<span class="buttons"> <a href="#"
							onClick="dosubmit('<%=request.getContextPath() %>/report/listmanager/t07_blacklist_list.do');">
								<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> </span>
			
						<html:errors />
					</div>
						<div class="cond_c2">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<TD height="22" bgcolor="ECF3FF">
										<div align="right">
											<logic:equal value="B" name="listtype">
												<font color="#FF0000">*</font>
											</logic:equal>
											 客户号：
										</div>
									</TD>
									<TD bgcolor="F6F9FF" align="left">
										<html:text property="party_id" value=""></html:text>
									</TD>
								</TR>
								<TR align="center">
									<TD height="22" bgcolor="ECF3FF">
										<div align="right">
											<logic:equal value="B" name="listtype">
												<font color="#FF0000">*</font>
											</logic:equal>
											<font color="#FF0000">*</font>客户名称：
										</div>
									</TD>
									<TD bgcolor="F6F9FF">
										<div align="left">
											<html:text property="obj_name" styleClass="text_white"
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
											客户类型：
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
								</TR>
							
									<TR align="center">
										<TD height="22" bgcolor="ECF3FF">
											<div align="right">
												证件类型：
											</div>
										</TD>
										<TD bgcolor="F6F9FF">
											<div align="left">
											<html:select property="card_type" style="width:250" 
												onmouseover="selMouseOver(this,$('div_hint'))"
												onmouseout="selMouseOut(this,$('div_hint'))">
												<html:options collection="card_typeMap" property="label"
													labelProperty="value" />
											</html:select>
											</div> 
										</TD>
									</TR>
									<TR align="center">
										<TD height="22" bgcolor="ECF3FF">
											<div align="right">
												证件号码：
											</div>
										</TD>
										<TD bgcolor="F6F9FF" align="left">
											<html:text property="card_no" value=""></html:text>
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
											<html:hidden property="isuse" value="0"/>
										</div>
									</td>
								</TR>
								
<%--							<TR align="center">--%>
<%--									<TD height="22" bgcolor="ECF3FF">--%>
<%--										<div align="right">--%>
<%--											<font color="#FF0000">*</font>是否启用：--%>
<%--										</div>--%>
<%----%>
<%--									</TD>--%>
<%----%>
<%--									<TD bgcolor="F6F9FF">--%>
<%--										<div align="left">--%>
<%--													<html:select property="isuse">--%>
<%--														<html:options collection="isuseMap" property="label"--%>
<%--															labelProperty="value" />--%>
<%--													</html:select>--%>
<%--										</div>--%>
<%--									</TD>--%>
<%--								</TR>--%>
								<tr>
									<td height="22" align="right" bgcolor="ECF3FF">
									名单建立原因：
										
									</td>
									<td bgcolor="F6F9FF"  align="left">
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
 
									
										<br>
									</TD>
								</TR>-->
								<tr>
									<td>
									</td>
									<td align="left">
										<input type="button" class="in_button1" value="提 交"
											onclick="checkForm('t07_blacklist_add_do.do')" />
										<input type="reset" class="in_button1" value="重 置" />
									</td>
								</tr>
							</table>
						</div>
						</div>
						</div>
		</html:form>
		
		<!-- 提示块 -->
		<div id=div_hint
			style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div>
	</BODY>
</HTML>
