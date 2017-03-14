<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
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

function addcol(sourceName,aimName1,aimName2,sortstyle)
{
	//var str=document.forms[0].colenname.options[document.forms[0].colenname.selectedIndex].text;
	var sourceID=document.getElementsByName(sourceName);
	var textarea_str1 = document.getElementById(aimName1);
	var textarea_str2 = document.getElementById(aimName2);
	var sourceValue1 = sourceID[0].value.Trim();
	var sourceValue2 = document.forms[0].colinfo.options[document.forms[0].colinfo.selectedIndex].text;
	var sortID=document.getElementsByName(sortstyle);
	var sortValue=sortID[0].value.Trim();

	var aimValue1=textarea_str1.value.Trim();
	var aimValue2=textarea_str2.value.Trim();
	var lastchar=aimValue1.charAt(aimValue1.length-1);
	var last2=aimValue1.substring(aimValue1.length-3,aimValue1.length).Trim();
	var last3=aimValue1.substring(aimValue1.length-4,aimValue1.length).Trim();
	var str="";
	if(sortValue=="1"){
		str = " asc";
	}else if(sortValue=="2"){
		str = " desc";
	}
		if(textarea_str1.value==""){
			textarea_str1.value=aimValue1+" "+sourceValue1+str;
			textarea_str2.value=aimValue2+" "+sourceValue2+str;
		}else{
			textarea_str1.value=aimValue1+" ,"+sourceValue1+str;
			textarea_str2.value=aimValue2+" ,"+sourceValue2+str;
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
						<td width="2%"><span class="title_img"></span></td>
						<td width="23%" nowrap><span class="awp_title_td2">模型管理 - 模板排序条件</span></td>
						<td align="right">
							<input type=button value="保 存" name=Button52 class="input"
							onClick="dosubmit('tpla_order_cond_add_do.do','')">					                  </td>
					</tr>
				</table>
			</div>   
	
			<div class='awp_detail'>
		    		<table>
								<tr >
									<td >
										排序条件：
									</td>
									<td >
										<html:textarea readonly="true" property="pseuordercd"
											cols="80" rows="10" styleClass="text_white"></html:textarea>
										<html:textarea style="display:none" readonly="true"
											property="ordercd" cols="80" rows="10"
											styleClass="text_white"></html:textarea>
									</td>
								</tr>
								<tr>
									<td nowrap>
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
									<td nowrap>
										&nbsp;
									</td>
									<td > 
										排序方式：&nbsp;&nbsp;
										<html:select property="sortstyle" onchange="">
											<html:options collection="sortMap" property="label"
												labelProperty="value" />
										</html:select>

									</td>
								</tr>
								<tr>
									<td nowrap>
										&nbsp;
									</td>
									<td>
										选 择 列：&nbsp;&nbsp;
										<select name="colinfo"
											onchange="addcol('colinfo','ordercd','pseuordercd','sortstyle')">
											<option value="" selected>
												--请选择--
											</option>
										</select>
										<input type="button" name="Submit432" value="回 退"
											class="input" onClick="reback(ordercd,pseuordercd)">
									</td>
								</tr>


							</table>
						</div>
		</html:form>
	  </div>
	</BODY>
</HTML>
