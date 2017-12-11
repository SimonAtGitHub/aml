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
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<SCRIPT LANGUAGE="JavaScript">
   
	function dosubmit(theUrl,type){
	   	var errMsg = '';
	    var seconds = document.getElementById('seconds').value;
	    theUrl = theUrl+"&seconds="+seconds;
	   
	    if(type == "finish"){
	    
	    	 errMsg = checkMusxAnswer();
	    }
	   
	    if(errMsg!=''){
	    	alert(errMsg);
	    }else{
	    	document.forms[0].action=theUrl;
	    	document.forms[0].submit();
	 	}
    }
	function setCookie(name,value)
	{
	/*
	 *--------------- setCookie(name,value) -----------------
	 * setCookie(name,value) 
	 * 功能:设置得变量name的值
	 * 参数:name,字符串;value,字符串.
	 * 实例:setCookie('username','baobao')
	 *--------------- setCookie(name,value) -----------------
	 */
	    var Days = 30; //此 cookie 将被保存 30 天
	    var exp  = new Date();
	    exp.setTime(exp.getTime() + Days*24*60*60*1000);
	    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();   
	}
	
	
	function getCookie(name)
	{
	/*
	 *--------------- getCookie(name) -----------------
	 * getCookie(name)
	 * 功能:取得变量name的值
	 * 参数:name,字符串.
	 * 实例:alert(getCookie("baobao"));
	 *--------------- getCookie(name) -----------------
	 */
	    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	    if(arr !=null) return unescape(arr[2]); return null;
	}
	
	 

</SCRIPT>
<script type="text/javascript">
function checkMusxAnswer(){
	var msg="";
	var inputs = null;
	var partten = /^(\d)+(_blank_){1}(\d)+$/g;
<c:forEach items="${subjectList}" var="dto">
	<c:if test="${ dto.subjecttype eq '1' and dto.mustanswer eq '1'}">
		 msg="请填写必答题！";
		 var radios<c:out value="${dto.subjectinskey}"/> = document.getElementsByName('radio<c:out value="${dto.subjectinskey}"/>');
		 if(radios<c:out value="${dto.subjectinskey}"/>!=null && typeof(radios<c:out value="${dto.subjectinskey}"/>)!='undefined'){
		 	for(var i=0;i<radios<c:out value="${dto.subjectinskey}"/>.length;i++){
		 		if(radios<c:out value="${dto.subjectinskey}"/>[i].checked){
		 			msg="";
		 			break;
		 		}
		 	}
		 }
	</c:if>
	<c:if test="${ dto.subjecttype eq '2' and dto.mustanswer eq '1'}">
		 msg="请填写必答题！";
		 var checkbox<c:out value="${dto.subjectinskey}"/> = document.getElementsByName('checkbox<c:out value="${dto.subjectinskey}"/>');
		 if(checkbox<c:out value="${dto.subjectinskey}"/>!=null && typeof(checkbox<c:out value="${dto.subjectinskey}"/>)!='undefined'){
		 	for(var i=0;i<checkbox<c:out value="${dto.subjectinskey}"/>.length;i++){
		 		if(checkbox<c:out value="${dto.subjectinskey}"/>[i].checked){
		 			msg="";	
		 			break;
		 		}
		 	}
		 }
	</c:if>
	
	<c:if test="${ dto.subjecttype eq '3' and dto.mustanswer eq '1'}">
		inputs = document.getElementsByTagName('input');
		errMsg="请填写必答题！";
		if(inputs!=null){
			for(var i=0;i<inputs.length;i++){
				if(partten.test(inputs[i].name)){
					if(trim(inputs[i].value)!=''){
						errMsg="";
						break;
					}
				}
			}
		}
	</c:if>
	<c:if test="${ dto.subjecttype eq '4' and dto.mustanswer eq '1'}">
		var question<c:out value="${dto.subjectinskey}"/> = document.getElementsByName('question<c:out value="${dto.subjectinskey}"/>')[0];
			errMsg="请填写必答题！";
		if(trim(question<c:out value="${dto.subjectinskey}"/>.value)!=''){
			errMsg="";
		}
	</c:if>
</c:forEach>
	return errMsg;
}



</script>
  </head>
<body>
		<div id='content'>
  	<html:form action="/t12_answer_subject_add_do.do" method="post">
  		<input type="hidden" name="minutes" value=""/>
  		<input type="hidden" name="seconds" value="">
  		<input type="hidden" name="questionkey" value="<c:out value="${questionkey}" />"/>
  		<input type="hidden" name="answerkey" value="<c:out value="${answerkey}" />"/>
  		<input type="hidden" name="answerTime" value="<c:out value="${answerTime}" />">
  		<input type="hidden" name="questioninskey" value="<c:out value="${t12_question_ins.questioninskey}" />">
  		<input type="hidden" name="publishkey" value="<c:out value="${param.publishkey}" />">
  		<input type="hidden" name="questiontype" value="<c:out value="${t12_question_ins.questiontype }" />" />
  		
			<div class='awp_title'>

					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">问卷调查-答卷</span>
							</td>
							<td align="right">
								 <input type="button" class="button" onclick="dosubmit('<%=request.getContextPath() %>/cms/t12_answer_subject_add_do.do?type=finish','finish')" value="交 卷"> 
								  <input type="button" class="button" onclick="dosubmit('<%=request.getContextPath() %>/cms/t12_answer_subject_add_do.do?type=save','save')" value="保 存"> 

							</td>
						</tr>
					</table>
				</div>
				
			<table align=center border=0 cellPadding=0 borderColor=333333 
				cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%"> 
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
				<c:if test="${t12_question_ins.questiontype eq '1'}">
				 <tr>
					<td height="8"  align="right">
					     总分<font color="#ff0000"><c:out value="${t12_question_ins.totalscore}" /></font>分
					</td>
				</tr>
				</c:if>
				 <tr>
					<td height="8"  align="center">
					     <font  color="red"><b><span id ="timer" ></span></b></font>
					</td>
				</tr>
				
			</table>
		
  			<table align=center border=1 cellPadding=0 borderColor=333333
				cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">   		 
  			<c:forEach items="${subjectList}" var="dto">
  				<c:if test="${dto.subjecttype eq '1'}">
  					<c:if test="${hasSet ne '1'}">
		  				<tr align="left">  						 
		  					<td class="deep" colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" width="10%" align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/></td>
  					<td class="light" width="90%" >&nbsp;<c:out value="${dto.content}" />&nbsp;<c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if>&nbsp;<c:if test="${dto.mustanswer eq '1'}">必答题</c:if></td>
  					
  				</tr>
  					<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td class="light" colspan="3">
	  					<c:forEach items="${dto.choiceList}" var="choice" varStatus="statusIndex">
	  					 	<c:out value="${statusIndex.index+1}" />
	  						 <input type="radio"  name="radio<c:out value="${dto.subjectinskey}"/>" value="<c:out value="${choice.choicekey}"/>"  
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
		  					<td class="deep" colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/></td>
  					<td class="light">&nbsp;<c:out value="${dto.content}" />&nbsp;<c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if> &nbsp;<c:if test="${dto.mustanswer eq '1'}">必答题</c:if> </td>
  					
  				</tr>
  				<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td class="light" colspan="3">
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
	  						  		  <input type="checkbox" name="checkbox<c:out value="${dto.subjectinskey}"/>"  value="<c:out value="${choice.choicekey}"/>"/>
	  						    </c:if>
	  						     <c:if test="${Ischeked eq '1'}">
	  						    		<input type="checkbox" name="checkbox<c:out value="${dto.subjectinskey}"/>" <c:out value="checked" /> value="<c:out value="${choice.choicekey}"/>"/>
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
		  					<td class="deep" colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/> </td>
  					<td class="light">&nbsp;
  					    <c:out value="${dto.content}" escapeXml="false"/>&nbsp;<c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if>&nbsp;<c:if test="${dto.mustanswer eq '1'}">必答题</c:if>					  
  					    </td>
  						
  				</tr>
  				</c:if>
  			</c:forEach>
  			
  			<c:set value="0" var="hasSet" scope="page" />
  			<c:forEach items="${subjectList}" var="dto">
  				<c:if test="${dto.subjecttype eq '4'}">
  					<c:if test="${hasSet ne '1'}">
		  				<tr align="left">  						 
		  					<td class="deep" colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>  					
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" width="10%" align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/></td>
  					<td class="light" width="90%">&nbsp;<c:out value="${dto.content}" />&nbsp;<c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if>&nbsp;<c:if test="${dto.mustanswer eq '1'}">必答题</c:if></td>
  					
  				</tr>
  				<tr>
	  				<td></td>
	  				<td>
	  				<textarea name="question<c:out value="${dto.subjectinskey}"/>" cols="60" rows="6"><c:forEach items="${dto.answerSubjectList }" var="answersubject"><c:out value="${answersubject.content}" /></c:forEach></textarea>
	  				</td>
  				</tr>
  			   </c:if>
  			</c:forEach>
  			
  			</table> 
  	</html:form></div>
  </BODY>
  <SCRIPT LANGUAGE="JavaScript">
	var maxtime = '<c:out value="${answerTime}"/>';
	function CountDown(){
	      
		 document.getElementById('seconds').value = maxtime;
		 if(maxtime==0){
		    var theUrl = '<%=request.getContextPath() %>/cms/t12_answer_subject_add_do.do?type=finish&seconds='+maxtime;
	        document.forms[0].action=theUrl;
		    document.forms[0].submit();
		 }
		 if(maxtime>0){
			 minutes = Math.floor(maxtime/60);
			 seconds = Math.floor(maxtime%60);
			 
			 msg = "距离结束还有"+minutes+"分"+seconds+"秒";
			 document.all["timer"].innerHTML=msg;
			 if(maxtime == 5*60){
			 		alert("答题时间剩余5分钟，时间结束后自动提交！");
			   }
			--maxtime;
		 }
		 else{
		        clearInterval(timer);
		 }
	}
	<c:if test="${t12_question_ins.questiontype eq '1'}">
	timer.innerHTML = setInterval("CountDown()",1000);
	</c:if>
  </SCRIPT>
</html>
