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
	
	<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, action){
	    var errMsg = "";
	    var isSub = false; 
	    if(action==='back'){
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
	function delTimu(url,subjectkey)
	{ 
	    sForm = document.forms[0];
	    sForm.subjectkey.value = subjectkey;
	    if(window.confirm('确定要删除题目？')){
	    	sForm.action = url;   
	    	sForm.submit();
	    }
	    return;
	}
	function updTimu(url,subjectkey,typeId){	
	    sForm = document.forms[0];
	    sForm.subjectkey.value = subjectkey;
	    sForm.subjecttype.value = typeId;
	  	sForm.action = url;   
	    sForm.submit();
	}
	</script>
  </head>
<body>
	<div id='content'>
 
  	<html:form action="/t12_questionnaire_add_do.do" method="post">
  		<input type="hidden" name="questionkey" value="<c:out value="${t12_questionnaire.questionkey}" />"/>
  		<input type="hidden" name="questiontype" value="<c:out value="${t12_questionnaire.questiontype}" />"/>
  		<!-- 试题类型 -->
  		<input type="hidden" name="subjecttype" value="" />
  		<input type="hidden" name="subjectkey" />
  		<!-- 操作来源 E-代表来源是修改页面 N代表来源是添加页面-->
  		<input type="hidden" name="fromOpt" value="N"/>
  		<input type="hidden" name="backurl" value="cms/t12_test_question.do"/>
  	
			
			<div class='awp_title'>

				<table>
					<tr>
					
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷管理-问卷编制管理-创建试题</span>
						</td>
						<td align="right">
							<html:button property="Button55" value="创建单选题" onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','1')" styleClass="input" />
					<html:button property="Button55" value="创建多选题" onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','2')" styleClass="input" />
					<html:button property="Button55" value="创建填空题" onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','3')" styleClass="input" />
					<html:button property="Button55" value="创建问答题" onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','4')" styleClass="input" />
					<html:button property="Button55" value="返 回" onclick="dosubmit('cms/t12_questionnaire_list.do?newsearchflag=1','back')" styleClass="input" /></td>
				
					</tr>
				</table>
			</div>
			
			<logic:messagesPresent message="true">
			 	<html:messages id="msg" message="true">
			 		<bean:write name="msg" filter="false"/>
			 	</html:messages>
			 </logic:messagesPresent>
		
		<div class='awp_cond'>
  			<table>
  				<tr>
  					<td noWrap>问卷名称：</td>
  					<td noWrap><c:out value="${t12_questionnaire.title}" /></td>
  					<td noWrap>问卷类型：</td>
  					<td noWrap><c:out value="${t12_questionnaire.questiontype_disp}" /></td> 
  				</tr> 
  				<tr>
  					<c:if test="${t12_questionnaire.questiontype eq '1'}">
  					<td noWrap>问卷总分：</td>
  					<td noWrap><c:out value="${t12_questionnaire.totalscore}" /></td>
  					</c:if>
  					<c:if test="${t12_questionnaire.questiontype eq '2'}">
  					<td noWrap>&nbsp;</td>
  					<td noWrap>&nbsp;</td>
  					</c:if>
  					<td noWrap>&nbsp;</td>
  					<td noWrap>&nbsp;</td> 
  				</tr>
  			</table>
  		</div>
  	
			<div class='awp_list'>
  			<table> 
  			   <tr>
					<td align="left" colspan="3">问卷试题列表</td>
				</tr> 
  			<c:forEach items="${subjectList}" var="dto">
  				<tr align="center">
  					<td noWrap>
  						<c:forEach items="${subjectTypeMap}" var="entry">
  							<c:if test="${dto.subjecttype eq entry.key}">
  								<c:out value="${entry.value}" />
  							</c:if>
  						</c:forEach>
  					</td>
  					<td noWrap><c:out value="${dto.content}" /></td>
  					<td noWrap>
  						<a href="javaScript:updTimu('cms/t12_test_question_modify.do','<c:out value="${dto.subjectkey}" />','<c:out value="${dto.subjecttype}" />')" >修改</a>&nbsp;
	                    <a href="javaScript:delTimu('cms/t12_questions_subject_delete_do.do','<c:out value="${dto.subjectkey}" />')">删除</a>
  					</td>
  				</tr>
  					<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td  colspan="3">
	  					<c:forEach items="${dto.choiceList}" var="choice">
	  						<c:if test="${dto.subjecttype eq '1'}">
	  							<input type="radio" disabled <c:if test="${dto.solution eq choice.choicekey}"><c:out value="checked"/></c:if> />
	  						</c:if>
	  						
	  						<c:if test="${dto.subjecttype eq '2'}" >
	  							<c:set value="${dto.solution}" var="var_solution" scope="page"></c:set>
	  							<%
	  							String var_solution = (String)pageContext.getAttribute("var_solution");
	  							pageContext.setAttribute("solutions",var_solution.replace("|",","));
	  							 %>
	  							<input type="checkbox" disabled
	  								<c:forEach items="${solutions}" var="choicekey">
	  									<c:if test="${choicekey eq choice.choicekey }">
	  										<c:out value="checked" />
	  									</c:if>
	  								</c:forEach>
	  							 />
	  						</c:if>
	  						<c:out value="${choice.content}" /><c:out value="</br>" escapeXml="false"/>
	  					
	  					</c:forEach>
	  					</td>
  					</tr>
  					</c:if>
  			</c:forEach>
  			</table> </div>
  	</html:form></div>
  	
  </BODY>
</html>
