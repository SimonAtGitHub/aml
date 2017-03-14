<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, action){
	    var errMsg = "";
	    var isSub = false;
	    if(action==='add'){
	        var title = document.getElementsByName('title')[0];
	        var type = document.getElementsByName('questiontype')[0];
	        if(getLength(trim(title.value)) == 0 ){
	        	errMsg="请填写问卷名称";
	        	isSub = false;
	        }else if(getLength(trim(title.value)) > 2000){
	        	errMsg="问卷名称不能超过2000个字符";
	        	isSub = false;
	        }else{
	        	isSub = true;
	        }
	        if(isSub){
	        	if(trim(type.value)===''){
	        		errMsg="请选择问卷类型！";
	        		isSub = false;
	        	}else{
	        		isSub = true;
	        	}
	        } 
	  }else if(action==='back'){
	  	isSub = true;
	  }
	    if(isSub && errMsg==''){
	       document.forms[0].action=theUrl;
	       document.forms[0].submit();
	    }else{
	        if(errMsg!='')
	            alert(errMsg);
	        return false;
	    }
	}
	</SCRIPT>
	</head>
	<body>
		<div id='content'>
			<html:form action="/t12_questionnaire_add_do.do" method="post">

				<div class='awp_title'>

					<table>
						<tr>
							
							<td width="23%" nowrap>
								<span class="awp_title_td2">问卷管理-问卷编制管理-创建问卷</span>
							</td>
							<td align="right">
								<html:button property="Button55" value="返 回"
									onclick="dosubmit('cms/t12_questionnaire_list.do?newsearchflag=1','back')"
									styleClass="input" />
							</td>
						</tr>
					</table>
				</div>
				<logic:messagesPresent message="true">
					<html:messages id="msg" message="true">
						<bean:write name="msg" filter="false" />
					</html:messages>
				</logic:messagesPresent>

				<div class='awp_cond'>
					<table>
						<tr>
							<td noWrap>
								<font color="red">*</font>问卷名称：
							</td>
							<td noWrap>
								<html:text property="title" />
							</td>
							<td noWrap>
								问卷类型
							</td>
							<td noWrap>
								<html:select property="questiontype">
									<html:options collection="q_typeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td noWrap></td>
							<td noWrap></td>
							<td noWrap></td>
							<td noWrap>
								<html:button property="Button55" value="提 交"
									onclick="dosubmit('cms/t12_questionnaire_add_do.do','add')"
									styleClass="input" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>
	</BODY>
</html>
