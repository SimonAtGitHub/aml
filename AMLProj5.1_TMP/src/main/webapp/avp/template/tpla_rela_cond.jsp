<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
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
//String.prototype.trim = function()
//{
//	var reExtraSpace = /^\s*(.*?)\s+$/;
//	return this.replace(reExtraSpace,"$1");
//}
String.prototype.Trim = function()
　　{
　　 return this.replace(/(^\s*)|(\s*$)/g, "");
　　}
String.prototype.LTrim = function()
　　{
　　 return this.replace(/(^\s*)/g, "");
　　}
String.prototype.Rtrim = function()
　　{
　　 return this.replace(/(\s*$)/g, "");
　　}
function isDigit(s) {
 	var patrn=/^(0|[1-9][0-9]*)$/; 
 	if (!patrn.exec(s)){
 		return false ;
 	}
 	return true;
  }
//判断数字包括小数

function isNumeric(s) {
 	var patrn=/^(-|\+)?\d+(\.\d+)?$/ ; 
 	if (!patrn.exec(s)){
 		return false ;
 	}
 	return true;
  } 
function addsign(sourceName,aimName1,aimName2)
{
	
	 var sourceValue=sourceName.value.Trim();
	 var aimValue1=aimName1.value.Trim();
	 var aimValue2=aimName2.value.Trim();
	 var lastchar=aimValue1.charAt(aimValue1.length-1);
	 var last2=aimValue1.substring(aimValue1.length-2,aimValue1.length).Trim();
	 var last3=aimValue1.substring(aimValue1.length-3,aimValue1.length).Trim();
	 var last4=aimValue1.substring(aimValue1.length-4,aimValue1.length).Trim();
	 var last_3=aimValue1.charAt(aimValue1.length-3);
	 var last_4=aimValue1.charAt(aimValue1.length-4);
	// alert("last2="+last2);
	// alert("last3="+last3);
	 // alert("last="+lastchar);
	 if(sourceValue!="("&&(last4=="LIKE"||last3=="and"||last2=="or"||lastchar=="NOT_LIKE"||lastchar=="IN"||lastchar=="NOT_IN"||lastchar==">="||lastchar=="<="||lastchar=="="||lastchar=="<"||lastchar==">"))
	 {
	 	alert("逻辑符输入重复，请输入表达式！")
	 	return;
	 }
	  var j=0;
	 if(sourceValue=="and"||sourceValue=="or"){
	 
		 for (i=aimValue1.lastIndexOf(" ");i>0;i--){
		 //alert("i="+i+" aimValue1="+aimValue1);
		 	//alert(i);
	  		var str11=aimValue1.substring(i-1,i).Trim();
	  	 	var str12=aimValue1.substring(i-2,i-1);
	  	 	var last33=aimValue1.substring(i-3,i);
	  	  	var last22=aimValue1.substring(i-2,i);
	  	  	var last44=aimValue1.substring(i-4,i);
			//alert(last33);
		    //alert("str11="+str11+",str12="+str12+",LAST44="+last44+"last33="+last33);
		  	if(last44=="LIKE"){
		  		j=1;
		  		break;
		  	}
			if(trim(last33)=="IN"){
		  		j=1;
		  		break;
		  	}
		 	if(str11!="="&&str11!=">"&&str11!="<"&&str11.Trim()!=""&&str11.Trim().length!=0){
				if(last33=="and"||last22=="or"){
					break;
				}
				j=0;
		 	}else if(str12==" " ||last44=="LIKE" ||(str11=="="&&(str12=="!"||str12==">"||str12=="<"))){	
				j=1;
				break;
			} 
		 }
		 //alert(j);
		 if(j==0){
		 	alert("表达式输入不合法,请检查！");
		 	return;
		 }
	 }
	 if(sourceValue!="("&&(sourceValue==last2||sourceValue==last3||sourceValue==lastchar))
	 {
	 	alert("不能再输入操作符，请输入表达式！");
	 	return false;
	 }

	 if((lastchar=="<"||lastchar==">")&&sourceValue=="="){
	 	aimName1.value=aimValue1+" "+sourceValue;
	 	aimName2.value=aimValue2+" "+sourceValue;
	 	return true;
	 }
	 if(sourceValue==")"&&aimValue1.indexOf("(")==-1){
		 alert("不能再输入)，请输入其他值或符号！");
	 	return false;
	 }
	 if(sourceValue!="("&&aimValue1.length==0){
	    alert("不能再输入操作符，请输入表达式！");
	 	return false;
	 }
	 if(lastchar==">="||lastchar=="<="||lastchar=="*"||lastchar=="/"||lastchar=="<"||lastchar==">"||lastchar=="="){
	 	if(sourceValue=="("){
	 		aimName1.value=aimValue1+" "+sourceValue;
	 		aimName2.value=aimValue2+" "+sourceValue;
	 	}else{
	 		alert("不能再输入操作符，请输入表达式！");
	 		return false;
	 	}	
	 }
	 else if((lastchar=="("&&sourceValue==")")||(lastchar==")"&&sourceValue=="(")){
	 	alert("不能再输入操作符，请输入表达式！");
	 }else if(lastchar=="("&&(sourceValue=="+"||sourceValue=="-"||sourceValue=="*"||sourceValue=="/"||sourceValue=="<"||sourceValue==">"||sourceValue=="="||sourceValue=="!=")){
	 	alert("不能再输入操作符，请输入表达式！");
	 }else if(sourceValue=="("&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("&&lastchar!=""&&lastchar!="<"&&lastchar!=">"){
	 	alert("请输入操作符！！");
	 }
	 else{
	 	aimName1.value=aimValue1+" "+sourceValue;
	 	aimName2.value=aimValue2+" "+sourceValue;
	 }
}
function addnum(sourceName,aimName1,aimName2)
{
	var sourceValue=sourceName.value.Trim();
	var aimValue1=aimName1.value.Trim();
	var aimValue2=aimName2.value.Trim();
	var lastchar=aimValue1.charAt(aimValue1.length-1);
	
		 var last2=aimValue1.substring(aimValue1.length-2,aimValue1.length).Trim();
	 var last3=aimValue1.substring(aimValue1.length-3,aimValue1.length).Trim();
	//alert(last3);
	//if(isNumeric(sourceValue)){
	//	if(aimValue1.length!=0&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("&&lastchar!="="&&lastchar!=">"&&lastchar!="<"&&last3!="and"&&lastchar!="or"){
		
	//		alert("请输入符号！");
	//	}else{
			aimName1.value=aimValue1+" "+sourceValue;
			aimName2.value=aimValue2+" "+sourceValue;
	//	}
		
	//}else{
	//alert("您输入的数字不合法，请重新输入！");
	//}
}
function addcol(sourceName,aimName1,aimName2)
{
	//var str=document.forms[0].colenname.options[document.forms[0].colenname.selectedIndex].text;
	var sourceID=document.getElementsByName(sourceName);
	var textarea_str1 = document.getElementById(aimName1);
	var textarea_str2 = document.getElementById(aimName2);
	var sourceValue1 = sourceID[0].value.Trim();
	var sourceValue2 = document.forms[0].colinfo.options[document.forms[0].colinfo.selectedIndex].text;
	//alert("sourceValue1="+sourceID[0].value);
	//alert(sourceValue2);
	var aimValue1=textarea_str1.value.Trim();
	var aimValue2=textarea_str2.value.Trim();
	var lastchar=aimValue1.charAt(aimValue1.length-1);
	var last2=aimValue1.substring(aimValue1.length-3,aimValue1.length).Trim();
	var last3=aimValue1.substring(aimValue1.length-4,aimValue1.length).Trim();
	var last4=aimValue1.substring(aimValue1.length-5,aimValue1.length).Trim();
	if(aimValue1.length!=0&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("&&last2!="or"&&last3!="and"&&last4!="LIKE"&&lastchar!="="&&lastchar!=">"&&lastchar!="<"&&lastchar!="IN"){
			alert("请输入符号！");
	}else{
		textarea_str1.value=aimValue1+" "+sourceValue1;
		textarea_str2.value=aimValue2+" "+sourceValue2;
	}
}

function addparm(sourceName,aimName1,aimName2)
{
	//var str=document.forms[0].colenname.options[document.forms[0].colenname.selectedIndex].text;
	var sourceID=document.getElementsByName(sourceName);
	var textarea_str1 = document.getElementById(aimName1);
	var textarea_str2 = document.getElementById(aimName2);
	var sourceValue1 = sourceID[0].value.Trim();
	var sourceValue2 = document.forms[0].parmcd.options[document.forms[0].parmcd.selectedIndex].text;
	//alert(sourceValue1);
	//alert(sourceValue2);
	
	var aimValue1=textarea_str1.value.Trim();
	var aimValue2=textarea_str2.value.Trim();
	
	var parlength=getLength(sourceValue1);
	var parvalue=sourceValue1.substr(0, parlength-1);
	var partype=sourceValue1.substr(parlength-1, parlength-1);
	
	var lastchar=aimValue1.charAt(aimValue1.length-1);
	var last2=aimValue1.substring(aimValue1.length-3,aimValue1.length).Trim();
	var last3=aimValue1.substring(aimValue1.length-4,aimValue1.length).Trim();
	var last4=aimValue1.substring(aimValue1.length-5,aimValue1.length).Trim();
    //alert(sourceValue1);
	if(aimValue1.length!=0&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("&&last2!="or"&&last3!="and"&&last4!="LIKE"&&lastchar!="="&&lastchar!=">"&&lastchar!="<"&&last2!="IN"){
			alert("请输入符号！");
	}else{
	if(partype=="1"){
		if(last2=='IN'){
		textarea_str1.value=aimValue1+" "+'<%=I_SqlSingDef.STATIC_SING%>' +parvalue+':char'+ '<%=I_SqlSingDef.STATIC_SING%>';
		}else{
		textarea_str1.value=aimValue1+" "+'<%=I_SqlSingDef.STATIC_SING%>' +parvalue+ '<%=I_SqlSingDef.STATIC_SING%>';
		}
        
		textarea_str2.value=aimValue2+" "+'<%=I_SqlSingDef.STATIC_SING%>'+sourceValue2+ '<%=I_SqlSingDef.STATIC_SING%>';
        }
        else {  
        if(last2=='IN'){
		textarea_str1.value=aimValue1+" "+'<%=I_SqlSingDef.STATIC_SING%>' +parvalue+':char'+ '<%=I_SqlSingDef.STATIC_SING%>';
		}else{
		textarea_str1.value=aimValue1+" "+'<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>';
		}      
        
		textarea_str2.value=aimValue2+" "+'<%=I_SqlSingDef.DYNC_SING%>'+sourceValue2+ '<%=I_SqlSingDef.DYNC_SING%>';
        }
	}
}

function choosecol(sourceName,objSelect){
		objSelect.options.length = 0;  
	var sourceID=document.getElementsByName(sourceName);
	var sourceValue = sourceID[0].value.Trim();
	var arraycols=sourceValue.split(";");
		objSelect.options.add(new Option("--请选择--", ""));
	for(i=0;i<arraycols.length-1;i++){
		var cols=arraycols[i].split("@");
		var varItem = new Option(cols[0], cols[1]);      
        objSelect.options.add(varItem); 
	}
	
}
function reback(aimName1,aimName2){
	 var str1=aimName1.value.Trim();
	 var str2=aimName2.value.Trim();
	 //var arraystr=str.split(" ");
	 //for(i=0;i<=arraystr.length-1;i++){
		//alert(str1[i]);
	 //}
	 var str11=str1.substring(0,str1.lastIndexOf(" "));
	 var str22=str2.substring(0,str2.lastIndexOf(" "));
	 aimName1.value=str11;
	 aimName2.value=str22;
}

</SCRIPT>
	</HEAD>
	<BODY>
		<div id="content">
			<html:form method="post" action="/template/t02_tp_exec_rst_add.do">
				<html:hidden property="tplakey" />

				<div class='awp_title'>
					<table>
						<tr>
							
							<td width="23%" nowrap>
								<span class="awp_title_td2">模型管理 - 定义关联条件</span>
							</td>
							<td align="right">
								<input type=button value="保 存" name=Button52 class="input"
									onClick="dosubmit('t02_tp_rel_con_add_do.do','')">
							</td>
						</tr>
					</table>
				</div>

				<div class="awp_detail">
					<table>
						<tr >
							<td >
								关联条件：
							</td>
							<td >
								<html:textarea readonly="true" property="tplpseuarelacond"
									cols="80" rows="10" styleClass="text_white"></html:textarea>
								<html:textarea style="display:none" readonly="true"
									property="tplarelacond" cols="80" rows="10"
									styleClass="text_white"></html:textarea>
							</td>
						</tr>
						<tr>
							<td >
								&nbsp;
							</td>
							<td >
								选 择 表：&nbsp;&nbsp;
								<html:select property="tablenames"
									onchange="choosecol('tablenames',colinfo)">
									<html:options collection="tableMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>

						<tr>
							<td></td>
							<td >
								选 择 列：&nbsp;&nbsp;
								<select name="colinfo"
									onchange="addcol('colinfo','tplarelacond','tplpseuarelacond')">
									<option value="" selected>
										--请选择--
									</option>
								</select>
								选择参数：
								<html:select property="parmcd"
									onchange="addparm('parmcd','tplarelacond','tplpseuarelacond')">
									<html:options collection="parMap" property="label"
										labelProperty="value" />
								</html:select>

							</td>
						</tr>
						<tr>
							<td></td>
							<td nowrap>
								操 作 符：
								<input type="button" name="Submit_inequal" value="!="
									class="input"
									onClick="addsign(Submit_inequal,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_equal" value=" = "
									class="input"
									onClick="addsign(Submit_equal,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_more" value=" > "
									class="input"
									onClick="addsign(Submit_more,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_less" value=" < "
									class="input"
									onClick="addsign(Submit_less,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_more1" value=" >= "
									class="input"
									onClick="addsign(Submit_more1,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_less1" value=" <= "
									class="input"
									onClick="addsign(Submit_less1,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_like" value=" LIKE "
									class="input"
									onClick="addsign(Submit_like,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_nolike" value="NOT LIKE"
									class="input"
									onClick="addsign(Submit_nolike,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_in" value=" IN " class="input"
									onClick="addsign(Submit_in,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_noin" value="NOT IN"
									class="input"
									onClick="addsign(Submit_noin,tplarelacond,tplpseuarelacond)">

							</td>
						</tr>
						<tr>
							<td></td>
							<td >
								逻 辑 符：
								<input type="button" name="Submit_and" value=" and "
									class="input"
									onClick="addsign(Submit_and,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_or" value=" or " class="input"
									onClick="addsign(Submit_or,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_left" value=" ( "
									class="input"
									onClick="addsign(Submit_left,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit_right" value=" ) "
									class="input"
									onClick="addsign(Submit_right,tplarelacond,tplpseuarelacond)">
							</td>
						</tr>
						<tr>
						<td></td>
							<td  >
								请输入常量：
								<html:text property="numvalue" styleClass="text_white">
								</html:text>
								<input type="button" name="Submit432" value="添 加" class="input"
									onClick="addnum(numvalue,tplarelacond,tplpseuarelacond)">
								<input type="button" name="Submit432" value="回 退" class="input"
									onClick="reback(tplarelacond,tplpseuarelacond)">
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
