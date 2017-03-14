<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %>

<%HashMap errorMap=(HashMap)request.getAttribute("errorHash"); %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

		<meta http-equiv=Content-Type content="text/html; charset=GBK"/>
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR/>

		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>

		<script type='text/javascript' src='../../js/web_draw.js'></script>

		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script src="../../js/validate.js" language="javascript"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
		function card_inf_exp(type,value){
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='29'||agent_card_type_value=='19'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
				showValidateMsg($$(value,0),'4','');
				var validate_typeNode=document.getElementById(type);
				var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}
			}
		}else{
			var agent_card_type_value=document.forms[0].citp.value;
			var report_type_value = '<bean:write name="report_type"></bean:write>';		
			if(class_cd=='1' && report_type_value=='2'){
			var opp_card_type_value=document.forms[0].crit.value;
			}
			if(agent_card_type_value!='29'&& agent_card_type_value!='19'){
				document.forms[0].citp_inf.style.visibility='hidden';
				showValidateMsg($$('citp_inf',0),'4','');
			}else {
				document.forms[0].citp_inf.focus();
			}
			if(class_cd=='1'&& report_type_value=='2'){
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
				document.forms[0].crit_inf.style.visibility='hidden';
				 showValidateMsg($$('crit_inf',0),'4','');
			}else {
				document.forms[0].crit_inf.focus();
			}
			}
		}
		}
		function validate_type(value){
			var validate_type_value=eval('document.forms[0].'+value+'.value');		
			if(getLength(validate_type_value)>30||getLength(validate_type_value)<4
			||IndexSpaceLast(validate_type_value)>0){
				showValidateMsg($$(value,0),'2','请输入证件的详细信息，左右不能有空格，并且在4至30个字符之内!');
			}else{
			    showValidateMsg($$(value,0),'3','');
			}
		}
		function IndexSpaceLast(str2){
		   var str1 = " ";
           var str3 = "　";
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==str1)||(str2.substr(0,1)==str1)||(str2.substr(str2.length-1,1)==str3)||(str2.substr(0,1)==str3)){
         return(1);
         }
         }
       }	
		function _Confim(url, type){
		 if( document.forms[0].ctnt.value==""){
		   alert("国籍不能为空！");
		   return false;
		 }
			if(type=='save' && !checkAllValidate()) {
				//alert("存在未校正的数据，保存失败！");
				return false;
			}
		   document.forms[0].action=url;
		   document.forms[0].submit();
		}
		
		</SCRIPT>
		<%
		String saveflag = (String)request.getAttribute("savesucc");
		if(saveflag==null) saveflag="-1"; // 不是从保存后进入
		else if("1".equalsIgnoreCase(saveflag)) saveflag="1"; // 成功保存后进入
		else saveflag="0";
		 %>
		<script language="javascript">
		if("<%=saveflag%>"=="0") alert("保存失败");
		else if("<%=saveflag%>"=="1") alert("保存成功!");
		
		//var g_changed = false; // 是否修改
		var g_appid = "1";
		
		function validateDetail() {
			//while(g_ArrMsg.length > 0) // 验证提示框
			//	g_ArrMsg.pop();
			
			g_changed = true;
			validate($$('csnm', 0), '', '');
			g_changed = true;
		 //validate($$('ctnt', 0), 'country', '');
			g_changed = true;
            validate($$('citp',0), 'card_type', '');
			g_changed = true;
			validate($$('ctnm', 0), '', 'citp');
			//while(g_validating);
			g_changed = true;
			validate($$('ctid',0), 'citp', '');
			g_changed = true;	
			validate($$('csnm', 0), '', '');
			var report_type = '<bean:write name="report_type"></bean:write>';
			var class_cd = '<bean:write name="class_cd"></bean:write>';
			
			if(report_type=='1') {g_changed = false; return;}
			g_changed = true;
			validate($$('cctl',0), '', '');
			g_changed = true;
			validate($$('ctar',0), '', '');
			g_changed = true;
			validate($$('ccei',0), '', '');
			if (class_cd=='0') {g_changed = false; return;}
			g_changed = true;
				validate($$('rgcp',0), '', '');
				g_changed = true;
				validate($$('crnm',0), '', 'crit');
				g_changed = true;
				validate($$('crid',0), 'crit', '');
			   g_changed = false;
		}
		</script>


		<style type="text/css">
		<!--
		.STYLE2 {color: #ff0000}
		-->
		</style>
	</head>
	<body  class="mainbg"   onload="validateDetail();card_inf_exp('1','');">
		<html:form action="/validate/modifyValidatedCustDo" method="post">
			<input type="hidden" name="reportkey" value="<bean:write name="reportkey"/>"/>
			<input type="hidden" name="report_type" value="<bean:write name="report_type"/>"></input>
			<input type="hidden" name="fromcase" value="<bean:write name="fromcase"/>"/>
			<input type="hidden" name="validbackurl" value="<bean:write name="validbackurl"/>"></input>
			<input type="hidden" name="cati_seqno" value="<bean:write name="cati_seqno"/>"></input>
			<input type="hidden" name="saveString" value="<bean:write name="saveString"/>"></input>
			<logic:notEmpty name="pbc_msg_type_cd" scope='request'>
			<input type="hidden" name="pbc_msg_type_cd" value="<bean:write name="pbc_msg_type_cd"/>"></input>
			</logic:notEmpty>
			<%
		  
				boolean notEdit = false;
		
			%>
	<div id="main">
	<!-- conditions --> 
	  <div class="conditions">
	    <!-- title -->
		<div class="cond_t">
		  <span>客户信息补录</span>
		  <html:hidden property="party_class_cd"></html:hidden>
		  <span class="buttons">
  	          	<input type="checkbox" name="tosource" checked="true" value="1"/>保存回原数据&nbsp;&nbsp;&nbsp;
					<a href="#"
							onClick="_Confim('<%=request.getContextPath()%>/pbcreport/validate/modifyValidatedCustDo.do?cati_seqno=<bean:write name='cati_seqno'/>&class_cd=<bean:write name='class_cd'/>', 'save')">
								<img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a> 
								<a href="#" onClick="_Confim('<bean:write name="validbackurl"/>','')"> 
								<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> 
		  </span>
		</div>
		<!-- table content -->
		<div class="cond_c2">
		  <table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="20%" height="18" align="right" bgcolor="ECF3FF">
										 客户号：
									</td>
									<td width="58%" bgcolor="F6F9FF">
									  <logic:equal name="fromcase" value="1">
										<html:text property="csnm" readonly="true" onchange="change();" onblur="validate(this, '', '')"></html:text>
										<img src="../../images/lock.jpg"/>
										</logic:equal>
										<logic:notEqual name="fromcase" value="1">
										<html:text property="csnm" onchange="change();" onblur="validate(this, '', '')"></html:text>
										</logic:notEqual>
										<font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CSNM")) out.print("["+errorMap.get("CSNM")+"]");%>
											</strong>
											</font>
									</td>
								</tr>
								<tr>
									<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CTNT-->
										
										 客户国籍：
									</td>
									<td width="58%" bgcolor="F6F9FF">
										<html:select property="ctnt" disabled="<%=notEdit %>"
											>
											<html:options collection="nationalityMap" property="label"
												labelProperty="value" />
										</html:select>
										<font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CTNT")) out.print("["+errorMap.get("CTNT")+"]");%>
											</strong>
											</font>
									</td>
								</tr>
								<tr>
									<td width="20%" height="18" align="right" bgcolor="ECF3FF">
										 客户名称：
									</td>
									<td width="58%" bgcolor="F6F9FF">
									 	<script language="javascript">
									 		var class_cd = '<bean:write name="class_cd"></bean:write>';									 		
									 	</script>
										<html:text property="ctnm" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, '', 'citp')"></html:text>
                                      <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CTNM")) out.print("["+errorMap.get("CTNM")+"]");%>
											</strong>
											</font>
									</td>
								</tr>
								<tr>
									<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!-- id=CITP -->
										

										 客户身份证件类型：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="citp" style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" disabled="<%=notEdit %>" onchange="card_inf_exp('citp','citp_inf');change();validate($$('citp',0), 'card_type', '');validate($$('ctnm',0), '', 'citp');change();validate($$('ctid',0), 'citp', '');">
											<html:options collection="legal_card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									 <html:text  property="citp_inf" size="30" maxlength="30"  onblur="validate_type('citp_inf');"/> 
									   <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CITP")) out.print("["+errorMap.get("CITP")+"]");%>
											</strong>
											</font>	
									</td>
								</tr>
								<tr>
									<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CTID-->
										

										 客户证件号码：
									</td>
									<td width="58%" bgcolor="F6F9FF">
										<html:text property="ctid" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, 'citp', '')"></html:text>
                                            <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CTID")) out.print("["+errorMap.get("CTID")+"]");%>
											</strong>
											</font>	
									</td>
								</tr>
								<logic:equal value="2" name="report_type">
									<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CTTP-->
											
											 客户类型：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:select property="cttp" disabled="<%=notEdit %>" onchange="">
											<html:options collection="cttpMap" property="label" labelProperty="value" />
										</html:select>
										 <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CTTP")) out.print("["+errorMap.get("CTTP")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<tr>

										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CCTL-->
											
											 客户联系电话：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:text property="cctl" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, '', '');"></html:text>
										 <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CCTL")) out.print("["+errorMap.get("CCTL")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CTAR-->
											
											 客户住址：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:text property="ctar" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, '', '');"></html:text>
										<font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CTAR")) out.print("["+errorMap.get("CTAR")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CCEI-->
											 客户其他联系方式：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:text property="ccei" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, '', '');"></html:text>
										<font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CCEI")) out.print("["+errorMap.get("CCEI")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<tr>
										<!-- 根据对公 对私 传递参考参数 pbc_ctvc_i pbc_ctvc_c -->
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CTVC-->
											 <logic:equal value="0" name="class_cd">对私客户职业：</logic:equal>
											 <logic:equal value="1" name="class_cd">对公客户的行业类别：</logic:equal>
										</td><td width="58%" bgcolor="F6F9FF">
											<script language="javascript"></script>
											<html:select disabled="<%=notEdit %>" property="ctvc">
						                      <html:options collection="industrykeyMap"
						                                    property="key"
						                                   labelProperty="value" />
						                    </html:select>
						                    <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CTVC")) out.print("["+errorMap.get("CTVC")+"]");%>
											</strong>
											</font>	
											
										</td>
									</tr>
									<logic:equal value="1" name="class_cd">
									<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--RGCP-->
											
											 注册资金：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:text property="rgcp" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, '', '');"></html:text>
										 <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("RGCP")) out.print("["+errorMap.get("RGCP")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<%--<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CTNT-->
											 法定代表人国籍(未定)：
										</td>
										 <td width="58%" bgcolor="F6F9FF">
											<html:select property="ctnt" onchange="change(); validate($$('crnm', 0), 'ctnt', '0');"><!--   onchange="change();" onblur="validate(this, '', '');" -->
						                      <html:options collection="legal_country_cdMap"
						                                    property="label"
						                                   labelProperty="value" />
						                    </html:select>
										</td>
									</tr> --%>
									<tr>
										<!-- 需要参考国籍 公私类型 0 私 1 公 -->
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CRNM-->											
											 法定代表人姓名：
										</td><td width="58%" bgcolor="F6F9FF">
											<html:text property="crnm" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, '', 'crit');"></html:text>
										 <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CRNM")) out.print("["+errorMap.get("CRNM")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CRIT-->
											
											 法定代表人身份证件类型：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:select property="crit" disabled="<%=notEdit %>" onchange="card_inf_exp('crit','crit_inf');change();validate($$('crnm',0), '', 'crit'); g_changed = true;validate($$('crid',0), 'crit', '');"><!--   onchange="change();" onblur="validate(this, '', '');" -->
						                      <html:options collection="bitpMap"
						                                    property="label"
						                                   labelProperty="value" />
						                    </html:select>
						                    <html:text  property="crit_inf" size="30" maxlength="30"  onblur="validate_type('crit_inf');"/>
										 <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CRIT")) out.print("["+errorMap.get("CRIT")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
									<tr>
										<td width="20%" height="18" align="right" bgcolor="ECF3FF"><!--CRID-->
											
											 法定代表人身份证件号码：
										</td>
										<td width="58%" bgcolor="F6F9FF">
											<html:text property="crid" readonly="<%=notEdit %>" onchange="change();" onblur="validate(this, 'crit', '');"></html:text>
											 <font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("CRID")) out.print("["+errorMap.get("CRID")+"]");%>
											</strong>
											</font>	
										</td>
									</tr>
								</logic:equal>
								</logic:equal>
							</table>
						</div>
		</html:form>
		<!--提示块-->
	<div id=div_hint style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
	
	</body>
</html>