<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl,flag){
		var errMsg = "";
		var isSub= false;
		if(flag=="search"){
			if(document.forms[0].startyear.value==""){
			     errMsg="开始年限不能为空！";
			     document.forms[0].startyear.focus();
			  }else
				if(document.forms[0].endyear.value==""){
			     errMsg="结束年限不能为空！";
			     document.forms[0].endyear.focus();
			  }
			  else
				if(document.forms[0].startseason.value==""){
			     errMsg="开始季度不能为空！";
			     document.forms[0].endyear.focus();
			  }else
				if(document.forms[0].endseason.value==""){
			     errMsg="结束季度不能为空！";
			     document.forms[0].endyear.focus();
			  }
			  else 
			     if(!_compareTwoDateForString(document.forms[0].startyear.value, document.forms[0].endyear.value,document.forms[0].startseason.value,document.forms[0].endseason.value)) {
			     document.forms[0].startyear.focus();
			   	 errMsg = "开始时间不能大于结束时间";		    
			 }
			 isSub = true;
		}else if(flag=="modi"){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		        isSub = true;
		}else if(flag=="del"){
		        errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('你真的要删除选择的报表吗？')){
		                isSub = true;
		            }
		        }
		}else if(flag=="add"){
			isSub = true;
		}else if(flag=="update"){
			errMsg = CheckBoxMustChecked(document.forms[0]);
			if(errMsg==''){
				if(confirm('你确定要全部更新吗？')){
					isSub = true;
				}
			}
		}

    sel=allSelect(0,"list2","value","");
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
   
}
function  _Opendailog1(url,type){
 
     if(type=='option'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            
                isSub = true;
           
        }
    }
	 if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "请选择";
            }
			isSub = true;
    }
    if(isSub && errMsg==''){
       
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
	 var errMsg = "";
    var isSub = false;
	var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "ff","dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");

  
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }

function $getSelectedIds(){
	return $getSelectedValues("selectedid");
}	
function $getSelectedValues(fieldName){
   	var checks=document.getElementsByName(fieldName);
   	var ret=new Array();
   	var i;
   	for (i=0 ; i<checks.length; i++){   	
   		if (checks[i].checked)
   			ret =ret.concat(checks[i].value);
   	}
   	
   	return ret;
}

   function _compareTwoDateForString(year1, year2,season1,season2) {
   
     if (year1 > year2) {
	    return false
	 }
	 if ((year1 == year2) && (season1 > season2)) {
	    return false
	 }
	 return true
}
function  _Commit(url){
   
   document.forms[0].action=url;
   document.forms[0].submit();
}
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form
				action="/identity/t07_user_identityUrgeSearch.do?newsearchflag=1"
				method="post">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>监管报表督办</span>
					</div>
					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<font color="#FF0000">*</font>统计时间：
								</td>
								<td>
									<html:select property="startyear">
										<html:options collection="dataYmMap" property="label"
											labelProperty="value" />
									</html:select>
									年 第
									<html:select property="startseason">
										<html:options collection="seasonMap" property="label"
											labelProperty="value" />
									</html:select>
									季度
								</td>
							</tr>
							<tr>
								<td>
									<font color="#FF0000">*</font>报表类型：
								</td>
								<td>
									<html:select property="identitytype">
										<html:options collection="identitytypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="submit" name="ok" value="查 询" class="in_button1" />
									&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>
				<%
					String display = (String) request.getAttribute("display");
						if (display != null) {
						} else {
				%>
				<div class="list">
					<table style="display: ''" border=0 cellpadding="0" cellspacing="0">
						<tr>
							<th>
								汇总的所有机构数
							</th>
							<th>
								已填报完成机构数
							</th>
							<th>
								填报中机构数
							</th>
							<th>
								未填报机构数
							</th>
						</tr>
						<tr>
							<td>
							<logic:match value="0" name="allUnderOrgan" location="start">
							<bean:write name="allUnderOrgan" />
								
							</logic:match>
							<logic:notMatch value="0" name="allUnderOrgan" location="start">
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?newsearchflag=1&start_year=<bean:write name="t07_user_identityUrgeActionForm" property="startyear" />&start_season=<bean:write name="t07_user_identityUrgeActionForm" property="startseason" />&type=1&identitytype=<bean:write name="t07_user_identityUrgeActionForm" property="identitytype" />','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="allUnderOrgan" /></a>
							
							<!--
							<a href="#" onclick="_Commit('urgeSearchOrgan.do?type=1');"><bean:write name="allUnderOrgan" /></a>
							 -->
							 <!--
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?underOganList=<bean:write name="allUnderOrgankey" scope="request" filter="false" ignore="true"/>','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="allUnderOrgan" /></a>
							 -->
							</logic:notMatch>
							</td>
							
							
							<td>
							<logic:match value="0" name="underOrganComplete" location="start">
							<bean:write name="underOrganComplete" />
							</logic:match>
							<logic:notMatch value="0" name="underOrganComplete" location="start">
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?newsearchflag=1&start_year=<bean:write name="t07_user_identityUrgeActionForm" property="startyear" />&start_season=<bean:write name="t07_user_identityUrgeActionForm" property="startseason" />&type=2&identitytype=<bean:write name="t07_user_identityUrgeActionForm" property="identitytype" />','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="underOrganComplete" /></a>
							<!--
							<a href="#" onclick="_Commit('urgeSearchOrgan.do?type=2');"><bean:write name="underOrganComplete" /></a>
							 -->
							<!-- 
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?underOganList=<bean:write name="completeUnderOrgankey" scope="request" filter="false" ignore="true"/>','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="underOrganComplete" /></a>
							 -->			
							</logic:notMatch>
							</td>
							
							
							<td>
							<logic:match value="0" name="underOrganFill" location="start">
							<bean:write name="underOrganFill" />
							</logic:match>
							<logic:notMatch value="0" name="underOrganFill" location="start">
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?newsearchflag=1&start_year=<bean:write name="t07_user_identityUrgeActionForm" property="startyear" />&start_season=<bean:write name="t07_user_identityUrgeActionForm" property="startseason" />&type=3&identitytype=<bean:write name="t07_user_identityUrgeActionForm" property="identitytype" />','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="underOrganFill" /></a>
							<!-- 
							<a href="#" onclick="_Commit('urgeSearchOrgan.do?type=3');"><bean:write name="underOrganFill" /></a>
							-->
							<!-- 
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?underOganList=<bean:write name="fillUnderOrgankey" scope="request" filter="false" ignore="true"/>','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="underOrganFill" /></a>
							 -->	
							</logic:notMatch>
							</td>
							
							
							
							<td>
							<logic:match value="0" name="underOrganLeave" location="start">
							<bean:write name="underOrganLeave" />
								
							</logic:match>
							<logic:notMatch value="0" name="underOrganLeave" location="start">
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?newsearchflag=1&start_year=<bean:write name="t07_user_identityUrgeActionForm" property="startyear" />&start_season=<bean:write name="t07_user_identityUrgeActionForm" property="startseason" />&type=4&identitytype=<bean:write name="t07_user_identityUrgeActionForm" property="identitytype" />','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="underOrganLeave" /></a>
							<!--
							<a href="#" onclick="_Commit('urgeSearchOrgan.do?type=4');"><bean:write name="underOrganLeave" /></a>
							 -->
							<!-- 
							<a href="#" onclick="window.open('<%=request.getContextPath()%>/offs_report/identity/urgeSearchOrgan.do?underOganList=<bean:write name="leaveUnderOrgankey" scope="request" filter="false" ignore="true"/>','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="underOrganLeave" /></a>
							 -->		
							</logic:notMatch>
							</td>
						</tr>
					</table>
				</div>
				<%
					}
				%>

			</html:form>
		</div>
	</body>
</html>