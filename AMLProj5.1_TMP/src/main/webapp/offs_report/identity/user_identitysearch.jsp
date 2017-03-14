<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>


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
			   	 errMsg = "开始时间不能大于结束时间！";		    
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
<%String status_cdFlag = (String) request.getSession().getAttribute(
					"status_cdFlagS");%>
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/identity/t07_user_identitySearch.do"
				method="post">
				<html:errors />
				<div class="conditions">
					<div class="cond_t">
						<span> <%
 	if (status_cdFlag.equals("c")) {
 			out.print("报表汇总");
 		} else {
 			out.print("报表填报");
 		}
 %> </span>
						<span class="buttons"> <%
 	if (status_cdFlag.equals("c")) {
 %> <a href="#" id="hdd_display" class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#"
							onclick="dosubmit('t07_user_identityDisp.do?searchtype=2&type=1','update');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_add.png" />选择汇总</a>
							<a href="#"
							onclick="dosubmit('t07_user_identityDisp.do?searchtype=2&type=2','search');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />全部汇总</a>
							<a href="#"
							onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=4','update');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />同意退回</a>
							<a href="#"
							onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=5','update');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />拒绝退回</a>
							<!-- <input type="button" name="button1" value="选择汇总" onclick="dosubmit('t07_user_identityDisp.do?searchtype=2&type=1','update')" class="input" />
          <input type="button" name="button1" value="全部汇总" onclick="dosubmit('t07_user_identityDisp.do?searchtype=2&type=2','search')" class="input" />
          <input type="button" name="button1" value="同意退回" onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=4','update')" class="input" />
          <input type="button" name="button1" value="拒绝退回" onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=5','update')" class="input" /> -->
							<%
								}
									if (status_cdFlag.equals("f")) {
							%> <a href="#" id="hdd_display" class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#"
							onclick="dosubmit('t07_user_identityToAdd.do?editflag=new','add');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_add.png" />添
								加</a> <a href="#"
							onclick="dosubmit('t07_user_identityAdd.do?editflag=edit','modi');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />修
								改</a> <a href="#"
							onclick="dosubmit('t07_user_identityDel_do.do','del');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删
								除</a> <a href="#"
							onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=1','update');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_submit.png" />完
								成</a> <a href="#"
							onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=3','update');"><img
									src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />请求退回</a>
							<!-- <input type="button" name="button3" value="添 加" onclick="dosubmit('t07_user_identityToAdd.do?editflag=new','add')" class="input" />
          <input type="button" name="button3" value="修 改" onclick="dosubmit('t07_user_identityAdd.do?editflag=edit','modi')" class="input" />
          <input type="button" name="button1" value="删 除" onclick="dosubmit('t07_user_identityDel_do.do','del')" class="input" />
          <input type="button" name="button1" value="完 成" onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=1','update')" class="input" />
          <input type="button" name="button1" value="请求退回" onclick="dosubmit('t07_user_identityUpdateStatus.do?changeStatus=3','update')" class="input" /> -->
							<%
								}
							%> </span>
					</div>
					<div class="cond_c">

						<table border="0" cellpadding="0" cellspacing="0" id="searchtable">
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
									季度 --
									<html:select property="endyear">
										<html:options collection="dataYmMap" property="label"
											labelProperty="value" />
									</html:select>
									年 第
									<html:select property="endseason">
										<html:options collection="seasonMap" property="label"
											labelProperty="value" />
									</html:select>
									季度
								</td>
							</tr>
							<tr>
								<td>
									机构名称：
								</td>
								<td>
									<bean:define id="organMultiSelHTMLStr"
										name="organMultiSelHTMLStr"></bean:define>
									<%=organMultiSelHTMLStr%>
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
								<td>
									报表状态：
								</td>
								<td>
									<html:select property="status_cd">
										<html:options collection="status_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="6">
									<%
										if (request.getAttribute("existerror") != null) {
									%><font color="red">&nbsp;&nbsp;<%=request.getAttribute("existerror")%></font>
									<%
										}
									%>
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('t07_user_identitySearch.do?newsearchflag=1','search')" />
									&nbsp;&nbsp;&nbsp;
									<%--        <input type="button" name="ok" value="汇 总" class="input"  onclick="dosubmit('t07_user_identityDisp.do?searchtype=2','search')" /> &nbsp;&nbsp;--%>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border=0 cellpadding="0" cellspacing="0">
						<tr>
							<th>
								选择
							</th>
							<th>
								报表序号
							</th>
							<th>
								统计时间
							</th>
							<th>
								报表类型
							</th>
							<th>
								统计机构
							</th>
							<th>
								更新时间
							</th>
							<th>
								状态
							</th>
						</tr>
						<logic:present name="t07_user_identityList">
							<logic:iterate id="user_identity" name="t07_user_identityList"
								type="com.ist.aml.offs_report.dto.T07_user_identity">
								<tr>
									<td>
										<html:multibox property="identitykeys">
											<bean:write name="user_identity" property="identitykey" /><bean:write name="user_identity" property="identitytype" scope="page" />
										</html:multibox>
									</td>
									<td>
										<a href='<%=request.getContextPath()%>/offs_report/identity/t07_user_identityDisp.do?identitykey=<bean:write name="user_identity" property="identitykey" scope="page"/>&identitytype=<bean:write name="user_identity" property="identitytype" scope="page"/>&searchtype=1'>
											<bean:write name="user_identity" property="identitykey" scope="page" /> </a>
									</td>
									<td>
										<bean:write name="user_identity" property="statisticdate_disp" scope="page" />
									</td>
									<td>
										<bean:write name="user_identity" property="identitytype_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="user_identity" property="organName"
											scope="page" />
									</td>
									<td>
										<bean:write name="user_identity" property="updatetime_disp"
											scope="page" />
									</td>
									<%--  显示数据库总存储的状态    --%>
									<%--  <td><bean:write name="user_identity" property="status_cd" scope="page"/></td>--%>
									<%--  显示汉字状态--%>
									<td>
										<%
											if ((user_identity.getStatus_cd()).equals("0")) {
										%>草&nbsp;&nbsp;稿<%
											}
										%>
										<%
											if ((user_identity.getStatus_cd()).equals("1")) {
										%>已完成<%
											}
										%>
										<%
											if ((user_identity.getStatus_cd()).equals("2")) {
										%>已汇总<%
											}
										%>
										<%
											if ((user_identity.getStatus_cd()).equals("3")) {
										%>请求退回<%
											}
										%>
										<%
											if ((user_identity.getStatus_cd()).equals("4")) {
										%>已退回<%
											}
										%>
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="list_page">
					<logic:present name="pageInfo">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
				</div>
			</html:form>
		</div>
	</body>
</html>