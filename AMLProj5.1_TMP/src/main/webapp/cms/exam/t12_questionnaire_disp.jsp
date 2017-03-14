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
	    
	    if(action === 'modify'){
	    	//检查文件名称
	    	var title = document.getElementsByName('title')[0];
	    	if(trim(title.value)===''){
	    		errMsg+="请填写问卷名称！";
	    	}else if(getLength(title.value)>2000){
	    		errMsg+='问卷名称不能超过2000个字符！';
	    	}else{
	    		isSub = true;
	    	}
	    	//检查问卷类型
	    	if(document.getElementsByName('type')[0].value===''){
	    		errMsg+='请选择问卷类型！';
	    	}else{
	    		isSub = true;
	    	}
	    
	    }
	    if(action === 'back'){
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
	
	
	function newTimu(url,typeId){
	 	sForm = document.forms[0];
	    sForm.subjecttype.value = typeId;
	  	sForm.action = url;   
	    sForm.submit();
	}
	
	function delTimu(url,subjectid)
	{ 
	    sForm = document.forms[0];
	    sForm.subjectkey.value = subjectid;
	    if(window.confirm('确定要删除题目？')){
	    	sForm.action = url;   
	    	sForm.submit();
	    }
	    return;
	}
	function updTimu(url,subjectid,typeId){	
	    sForm = document.forms[0];
	    sForm.subjectkey.value = subjectid;
	    sForm.subjecttype.value = typeId;
	  	sForm.action = url;   
	    sForm.submit();
	}
	</script>
	</head>

	<body>
		<div id='content'>
			<html:form action="/t12_questionnaire_add_do.do" method="post">
				<html:hidden property="flag" />
				<html:hidden property="createtime" />
				<html:hidden property="creator" />
				<input type="hidden" name="questionkey"
					value="<c:out value="${t12_questionnaire.questionkey}" />" />
				<input type="hidden" name="questiontype"
					value="<c:out value="${t12_questionnaire.questiontype}" />" />
				<!-- 试题类型 -->
				<input type="hidden" name="subjecttype" value="" />
				<input type="hidden" name="subjectkey" value="" />
				<!-- 操作来源 E-代表来源是修改页面 N代表来源是添加页面-->
				<input type="hidden" name="fromOpt" value="E" />
				<input type="hidden" name="backurl"
					value="cms/t12_questionnaire_modify.do" />

				<div class='awp_title'>

					<table>
						<tr>
							
							<td width="23%" nowrap>
								<span class="awp_title_td2">问卷查看</span>
							</td>
							<td align="right">
								<html:button property="Button55" value="关 闭"
									onclick="window.close()" styleClass="input" />
							</td>
						</tr>
					</table>
				</div>

				<logic:messagesPresent message="true">
					<html:messages id="msg" message="true">
						<bean:write name="msg" filter="false" />
					</html:messages>
				</logic:messagesPresent>

				<div class='awp_detail'>
					<table>
						<tr>
							<td noWrap width="25%">
								问卷名称：
							</td>
							<td noWrap width="25%">
								<c:out value="${t12_questionnaire.title}" />
							</td>
							<td noWrap width="25%">
								问卷类型：
							</td>
							<td noWrap width="25%">
								<c:out value="${t12_questionnaire.questiontype_disp}" />
							</td>
						</tr>
						<tr>
							<td noWrap width="25%">
								问卷总分：
							</td>
							<td noWrap width="25%">
								<c:out value="${t12_questionnaire.totalscore}" />
							</td>
							<td noWrap width="25%"></td>
							<td noWrap width="25%">
								<%--<html:button property="Button52" styleClass="input" onclick="window.close()">关 闭</html:button>
					--%>
							</td>
						</tr>
					</table>
				</div>
				<br />


				<div class='awp_dynamic_list'>
					<table>
						<tr>

							<td align="left" colspan="3">
								问卷试题列表
							</td>
						</tr>
						<c:set value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"
							var="graphemes" scope="page"></c:set>
						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '1'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td align="center">
										<c:out value="${status}、" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="（${dto.score}分）" />
										</c:if>
									</td>
									
								</tr>
								<c:if test="${not empty dto.choiceList}">
									<tr>
										<td colspan="3">
											<c:forEach items="${dto.choiceList}" var="choice"
												varStatus="statusIndex">
												<%--<c:forEach items="${graphemes}" var="grapheme" varStatus="s">
	  						<c:if test="${s.index eq status.index}">
	  							<c:out value="${grapheme}"/>
	  						</c:if>
	  					</c:forEach>
	  					--%>
												<c:out value="${statusIndex.index+1}" />
												<input type="radio" disabled
													<c:if test="${dto.solution eq choice.choicekey}">checked</c:if> />
												<c:out value="${choice.content}" />
												<c:out value="</br>" escapeXml="false" />
											</c:forEach>
										</td>
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
						<c:set value="0" var="hasSet" scope="page" />

						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '2'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td align="center">
										<c:out value="${status}、" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="（${dto.score}分）" />
										</c:if>
									</td>
									
								</tr>
								<c:if test="${not empty dto.choiceList}">
									<tr>
										<td colspan="3">
											<c:forEach items="${dto.choiceList}" var="choice"
												varStatus="statusIndex">
												<c:out value="${statusIndex.index+1}" />
												<c:set value="${dto.solution}" var="var_solution"
													scope="page"></c:set>
												<%
															String var_solution = (String) pageContext
															.getAttribute("var_solution");
													pageContext.setAttribute("solutions", var_solution
															.replace("|", ","));
												%>
												<input type="checkbox" disabled
													<c:forEach items="${solutions}" var="choicekey">
	  									<c:if test="${choicekey eq choice.choicekey }">
	  										<c:out value="checked" />
	  									</c:if>
	  								</c:forEach> />
												<c:out value="${choice.content}" />
												<c:out value="</br>" escapeXml="false" />
											</c:forEach>
								</c:if>
							</c:if>

						</c:forEach>

						<c:set value="0" var="hasSet" scope="page" />
						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '3'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td align="center">
										<c:out value="${status}、" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="（${dto.score}分）" />
										</c:if>
										（
										<c:out value="${dto.solution}" />
										）
									</td>
								
								</tr>
							</c:if>
						</c:forEach>

						<c:set value="0" var="hasSet" scope="page" />
						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '4'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td align="center">
										<c:out value="${status}、" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="（${dto.score}分）" />
										</c:if>
										（
										<c:out value="${dto.solution}" />
										）
									</td>
									
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</html:form>
		</div>

	</BODY>
</html>
