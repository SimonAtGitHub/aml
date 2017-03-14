<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/js/basefunc.js"></script>
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/js/load_window.js"></script>
	
	<script type="text/javascript">
		var contextpath = '<%=path%>';
		var currUsername = '<c:out value="${t00_user.username}" />';
		var condition_1=" flag='1'"; 

	function dosubmit(url){
		var errMsg = "";
		var isSub = true;
		
		var questionkey =document.getElementsByName('questionkey')[0];
		if(questionkey.value===''){
			errMsg="请选择问卷！";
		}
		var creator = document.getElementsByName('creator')[0];
		if(creator.value===''){
			errMsg+="请选择人员！";
		}
		if(isSub && errMsg ===''){
			document.forms[0].action=url;
			document.forms[0].submit();
		}else{
			if(errMsg!=''){
				alert(errMsg);
				return;
			}
		}
	
	}
	</script>
  </head>
  
<body>
	<div id='content'>
  
    <html:form action="/t12_questionnaire_transferDo.do" method="post">
    
  	
			<div class='awp_title'>

				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷管理-问卷移交</span>
						</td>
						<td align="right">
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
			
			<logic:messagesPresent message="true">
			 	<html:messages id="msg" message="true">
			 		<bean:write name="msg" filter="false"/>
			 	</html:messages>
			 </logic:messagesPresent>
			
     
     <div class='awp_detail'>
  			<table>
  				<tr>
	  				<td><font color="red">*</font>问卷名称：</td>
	  				<td><html:text property="title" readonly="true" />
	  					<html:hidden property="questionkey"/>&nbsp;<html:button property="Button52" onclick="locate_pop_window_noquery(contextpath,'t12_questionnairLocation','radio','forms[0]','questionkey,title',condition_1);">单 选</html:button> </td>
  				</tr>
  				<tr>
	  				<td><font color="red">*</font>移交人员：</td>
	  				<td><html:text property="creator_disp" readonly="true" /><html:hidden property="creator"/>&nbsp;
	  					<html:button property="Button52" onclick="locate_pop_window(contextpath,'t00_userLocation','radio','forms[0]','creator,creator_disp','');">单 选</html:button></td>
  				</tr>
  				<tr>
  					<td></td>
  					<td>
						<html:button property="button2" value="移交问卷" styleClass="input"
							onclick="dosubmit('cms/t12_questionnaire_transferDo.do')" /></td>
  				</tr>
  		  </table>
  		</div>
     </html:form>    
    </div>
  </body>
</html>
