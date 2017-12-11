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
   
	function dosubmit(theUrl){
	   
	    var seconds = document.getElementById('seconds').value;
	    theUrl = theUrl+"&seconds="+seconds;
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	 
    }

</SCRIPT>
	
  </head>
<body>
	<div id='content'>
  	<html:form action="/t12_answer_subject_add_do.do" method="post">
  		
  		<input type="hidden" name="questionkey" value="<c:out value="${questionkey}" />"/>
  		<input type="hidden" name="answerkey" value="<c:out value="${answerkey}" />"/>
  		<input type="hidden" name="answerTime" value="<c:out value="${answerTime}" />">
  	
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷调查- 答 卷 </span>
						</td>
						<td align="right">
							 <input type="button" class="button" onclick="window.close();" value="关 闭">
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<table> 
			    <tr>
					<td height="8" align="center">
					      <c:out value="${t12_question_ins.title}" />
					</td>
				</tr>
				<tr>
					<td height="8"  align="center">
					<br/>
					 	答题人姓名：<c:out value="${username}" /> &nbsp;&nbsp; 答题人所属部门：<c:out value="${userorg}" />
					</td>
				</tr>
				 <tr>
					<td height="8"  align="right">
					     总分<font color="#ff0000"><c:out value="${t12_question_ins.totalscore}" /></font>分
					</td>
				</tr>
				 <tr>
					<td height="8"  align="center">
					     <font  color="red"><b><span id ="timer" ></span></b></font>
					</td>
				</tr>
				
			</table>
		<div class='awp_dynamic_list'>
  			<table>   		
  			 <tr>  						 
 					<td colspan="3" align="left"> 
 						问卷试题列表
 					</td>
		  	</tr>
  			<c:forEach items="${subjectList}" var="dto">
  				<c:if test="${dto.subjecttype eq '1'}">
  					<c:if test="${hasSet ne '1'}">
		  				<tr align="left">  						 
		  					<td colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" width="10%" align="center"><c:out value="${dto.sorder}" /></td>
  					<td class="light" width="90%" >&nbsp;<c:out value="${dto.content}" />&nbsp;(<c:out value="${dto.score}" />分)</td>
  					
  				</tr>
  					<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td colspan="3">
	  					<c:forEach items="${dto.choiceList}" var="choice" varStatus="statusIndex">
	  					 	<c:out value="${statusIndex.index+1}" />
	  						 <input type="radio"  disabled="true" name="radio<c:out value="${dto.subjectinskey}"/>" value="<c:out value="${choice.choicekey}"/>"  
		  						<c:forEach items="${dto.answerSubjectList }" var="answersubject">
		  							<c:if test="${answersubject.content eq choice.choicekey }">
		  								<c:out value="checked" />
		  							</c:if>
		  						</c:forEach> 
		  					/><c:out value="${choice.content}"/><c:out value="</br>" escapeXml="false"/>
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
		  					<td  colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" align="center"><c:out value="${dto.sorder}、" /> </td>
  					<td class="light">&nbsp;<c:out value="${dto.content}" />&nbsp;(<c:out value="${dto.score}" />分)</td>
  					
  				</tr>
  				<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td  colspan="3">
  						<c:if test="${not empty dto.answerSubjectList}">
  							<c:set value="${ dto.answerSubjectList[0].content}" var="var_solution" scope="page"></c:set>
  							 <%
	  						       String var_solution = (String)pageContext.getAttribute("var_solution");
	  							   pageContext.setAttribute("solutions",var_solution.replace("|",","));
	  							  
	  						 %>
  						</c:if>
  						<c:forEach items="${dto.choiceList}" var="choice">
  							<c:set var="Ischeked" value="0"></c:set>
	  						   
	  							 <c:forEach items="${solutions }" var="answersubject1">
	  								 <c:if test="${answersubject1 eq choice.choicekey }">
		  							   <c:set var="Ischeked" value="1"></c:set>
		  							 </c:if>
		  					    </c:forEach> 
	  						    <c:if test="${Ischeked eq '0'}">
	  						  		  <input type="checkbox" disabled="true" name="checkbox<c:out value="${dto.subjectinskey}"/>"  value="<c:out value="${choice.choicekey}"/>"/>
	  						    </c:if>
	  						     <c:if test="${Ischeked eq '1'}">
	  						    		<input type="checkbox" disabled="true" name="checkbox<c:out value="${dto.subjectinskey}"/>" <c:out value="checked" /> value="<c:out value="${choice.choicekey}"/>"/>
	  						    </c:if>
	  						 <c:out value="${choice.content}" /><c:out value="</br>" escapeXml="false"/>
	  						
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
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td  align="center"><c:out value="${dto.sorder}、" /> </td>
  					<td>&nbsp;
  					    <c:out value="${dto.content}" escapeXml="false"/>&nbsp;(<c:out value="${dto.score}" />分)					  
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
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td  align="center"><c:out value="${dto.sorder}" /> </td>
  					<td >&nbsp;<c:out value="${dto.content}" />&nbsp;(<c:out value="${dto.score}" />分)</td>
  					
  				</tr>
  				<tr>
	  				<td></td>
	  				<td>
	  				<textarea name="question<c:out value="${dto.subjectinskey}"/>" cols="60" rows="6" disabled="true"><c:forEach items="${dto.answerSubjectList }" var="answersubject"><c:out value="${answersubject.content}" /></c:forEach></textarea>
	  				</td>
  				</tr>
  			   </c:if>
  			</c:forEach>
  
	
  			</table> </div>
  	</html:form></div>
  </BODY>
 
</html>
