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
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">

function checkForm(theUrl){
	 var jsonStr = '<%=request.getAttribute("jsonStr")%>';
	 var riskLevelList = eval(jsonStr); 
     var errMsg ="";
  	 var levelmaxValue = trim(document.forms[0].levelmax.value);
  	 var levelminValue = trim(document.forms[0].levelmin.value);
  	 var levelnameValue = trim(document.forms[0].levelname.value);
  	 
      if(len(levelnameValue) >32){ 
        errMsg="级别名称输入过长！"; 
        document.forms[0].levelname.focus();
      }
      else if(len(levelnameValue) == 0){ 
        errMsg="级别名称不能为空！"; 
        document.forms[0].levelname.focus();
      }
      else if(getLength(levelmaxValue) == 0){
        errMsg="级别上限不能为空！";
        document.forms[0].levelmax.focus();
      }
       else if(levelmaxValue >100){ 
        errMsg="级别上限不能大于100！"; 
        document.forms[0].levelmax.focus();
      }
      else if(levelmaxValue <0){ 
        errMsg="级别上限不能小于0！"; 
        document.forms[0].levelmax.focus();
      } 
      else if(checkDouble(levelmaxValue) == 0){ 
        errMsg="级别上限请输入正数且小数点后最多两位！"; 
        document.forms[0].levelmax.focus();
      }
     else if(getLength(levelminValue) == 0){
        errMsg="级别下限不能为空！";
        document.forms[0].levelmin.focus();
      }
      else if(checkDouble(levelminValue) == 0){ 
        errMsg="级别下限请输入正数且小数点后最多两位！"; 
        document.forms[0].levelmin.focus();
      }
      else if(levelminValue <0){ 
        errMsg="级别下限不能小于0！"; 
        document.forms[0].levelmin.focus();
      } 
       else if(levelminValue >levelmaxValue){
        errMsg="级别下限不能大于级别上限！";
        document.forms[0].levelmin.focus();
      }
       else if(levelminValue ==levelmaxValue){
       	if((document.forms[0].maxisclosed.value)!="1"){
       		errMsg="级别下限等于级别上限时区间选择不正确！";
       		document.forms[0].maxisclosed.focus();
       	}else if((document.forms[0].minisclosed.value)!="1"){
       		errMsg="级别下限等于级别上限时区间选择不正确！";
       		document.forms[0].minisclosed.focus();
       	}
        
      }
     else if(getLength(document.forms[0].maxisclosed.value) == 0){
        errMsg="请选择上限区间！";
       document.forms[0].maxisclosed.focus();
      }
     else if(getLength(document.forms[0].minisclosed.value) == 0){
        errMsg="请选择下限区间！";
        document.forms[0].minisclosed.focus();
      }
      if(errMsg==""){
	      for(var i=0;i<riskLevelList.length;i++){
	        if(errMsg!=""){
	        	break;
	        }
		 	if(getFloat(levelmaxValue)>(riskLevelList[i].levelmax)){
		 		if(getFloat(levelminValue)<(riskLevelList[i].levelmax)){
		 			errMsg="级别区间不能交叉！级别下限过小在交叉范围内！"; 
		 			 document.forms[0].levelmin.focus();
		 		}else if(getFloat(levelminValue)==(riskLevelList[i].levelmax)){
		 			if(riskLevelList[i].maxisclosed=="闭"){
		 				if((document.forms[0].minisclosed.value)=="1"){
		 					errMsg="级别区间不能交叉！下限区间需为开区间！";
		 					document.forms[0].minisclosed.focus();
		 				}
		 			}
		 		}
		 	}else if(getFloat(levelmaxValue)==(riskLevelList[i].levelmax)){
		 		if(riskLevelList[i].maxisclosed=="闭"){
		 				errMsg="级别区间不能交叉！级别上限过小在交叉范围内"; 
		 				document.forms[0].levelmax.focus();
		 		}else{
		 			if(getFloat(levelminValue)!=(riskLevelList[i].levelmax)){
		 				errMsg="级别区间不能交叉！级别下限需等于级别上限";
		 				 document.forms[0].levelmin.focus(); 
		 			}
		 		}
		 	}else if(getFloat(levelmaxValue)<(riskLevelList[i].levelmax)){
		 		if(getFloat(levelmaxValue)>(riskLevelList[i].levelmin)){
		 				errMsg="级别区间不能交叉！级别上限过大在交叉范围内"; 
		 				document.forms[0].levelmax.focus();
		 		}else if(getFloat(levelmaxValue)==(riskLevelList[i].levelmin)){
		 			if(riskLevelList[i].minisclosed=="闭"){
		 				if((document.forms[0].maxisclosed.value)=="1"){
		 					errMsg="级别区间不能交叉！上限区间需为开区间！";
		 					document.forms[0].maxisclosed.focus();
		 				}
		 			}
		 		}
		 	}
      
      }
     
      
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
		<html:form method="post" action="/t31_risk_level/t13_level_add.do">
		<html:hidden property="levelkey"/>
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>风险等级添加</span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t31_risk_levelList.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>返回</a> </span>
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
										<font color="#FF0000">*</font>级别名称：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="levelname" styleClass="text_white"
											size="20"/>
									</div>
								</TD>
								<td></td><td></td>
							</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
										<font color="#FF0000">*</font>级别上限：
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="levelmax" styleClass="text_white" size="20" />
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>级别下限：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
										<html:text property="levelmin" styleClass="text_white" size="20"  />
								</TD>
							</TR>

							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
										<font color="#FF0000">*</font>上限区间：
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="maxisclosed">
											<html:options collection="maxisclosedMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</div>
									
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>下限区间：
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
										<div align="left">
										<html:select property="minisclosed">
											<html:options collection="minisclosedMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</div>
								</TD>
							</TR>

							<tr>
								<td align="center" colspan="4">
									<input type="button" class="in_button1" value="提 交"
										onclick="checkForm('t13_level_add_do.do')" />
									<input type="reset" class="in_button1" value="重 置" />
								</td>
							</tr>
						</table>
					</div>
		</html:form>
	</BODY>
</HTML>
