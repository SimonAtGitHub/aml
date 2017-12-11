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
	
	
	
	<!-- 日期插件-->
	function fPopUpCalendarDlg(ctrlobj)
	{
		showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
		showy = event.screenY - event.offsetY + 18; // + deltaY;
		newWINwidth = 210 + 4 + 18;          
	
		retval = window.showModalDialog("<%=path%>/js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
		if( retval != null ){
			ctrlobj.value = retval;
		}else{
			//alert("canceled");
		}
	}

	function newTimu(url,typeId){
	 	sForm = document.forms[0];
	    sForm.subject_type.value = typeId;
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
	    sForm.subject_type.value = typeId;
	  	sForm.action = url;   
	    sForm.submit();
	}
	</script>
  </head>
  
  <BODY>
  <div id="content">
  	<html:form action="/t12_answer_questionnaire_disp2.do" method="post">
  		
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷查看</span>
						</td>
						<td align="right">
							<html:button property="Button55" value="关 闭" onclick="window.close()" styleClass="input" />
						</td>
					</tr>
				</table>
			</div>
			
			<logic:messagesPresent message="true">
			 	<html:messages id="msg" message="true">
			 		<bean:write name="msg" filter="false"/>
			 	</html:messages>
			 </logic:messagesPresent>
			
			<div class='awp_cond' id="searchtable" style="display:none">
  			<table>
  				<tr>
  					<td noWrap>问卷名称：</td>
  					<td noWrap><c:out value="${t12_question_ins.title}" /></td>
  					<td noWrap>问卷类型：</td>
  					<td noWrap><c:out value="${t12_question_ins.questiontype_disp}" /></td> 
  				</tr> 
  				<tr>
  					<td noWrap>问卷总分：</td>
  					<td noWrap><c:out value="${t12_question_ins.totalscore}" /></td>
  					<td noWrap></td>
  					<td noWrap><%--<html:button property="Button52" styleClass="input" onclick="window.close()">关 闭</html:button>
					--%></td> 
  				</tr> 
  			</table>
  		</div>
  	
			<div class='awp_list'>
  			<table>   
  				<tr>
					<td align="left" colspan="3">问卷试题列表</td>
				</tr>		 
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
  					<td align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page" />	</td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if></td>
  					<td>&nbsp;</td>
  				</tr>
  					<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td  colspan="3">
	  					<c:forEach items="${dto.choiceList}" var="choice" varStatus="statusIndex">
	  						<c:out value="${statusIndex.index+1}" />
	  						<input type="radio" disabled 
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
		  					<td colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  			<c:set value="1" var="status" scope="page" />	
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td  align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page" />	</td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if></td>
  					<td>&nbsp;
  					</td>
  				</tr>
  				<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td colspan="3">
  						<c:forEach items="${dto.choiceList}" var="choice" varStatus="statusIndex">
  						<c:out value="${statusIndex.index+1}" />
		  					<input type="checkbox" disabled 
			  						<c:forEach items="${dto.answerSubjectList }" var="answersubject">
			  							<c:set value="${answersubject.content}" var="var_solution" scope="page" ></c:set>
			  							<%
				  						   String var_solution = (String)pageContext.getAttribute("var_solution");
				  						   if(var_solution != null){
				  						   	pageContext.setAttribute("solutions",var_solution.replaceAll("\\|",","));
				  						   }
	  							 		%>
	  							 		<c:forEach  items="${solutions}" var="answer_subjectkey">
	  							 			<c:if test="${answer_subjectkey eq choice.choicekey }" >checked</c:if>
	  							 		</c:forEach> 
			  						</c:forEach> 
			  						/>
		  						
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
		  					<td  colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  			<c:set value="1" var="status" scope="page" />
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page" />	</td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if>
  							<c:forEach items="${dto.answerSubjectList }" var="answersubject">
		  						（填写的答案：	<c:out value="${answersubject.content}" />）
		  						</c:forEach> 
		  			</td>
  					<td class="light">&nbsp;</td>
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
		  			<c:set value="1" var="status" scope="page" />
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td class="light" align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page" /></td>
  					<td class="light">&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if>
  						<c:forEach items="${dto.answerSubjectList }" var="answersubject">
		  						（填写的答案：	<c:out value="${answersubject.content}" />）
		  						</c:forEach>
  					</td>
  					<td class="light"></td>
  				</tr>
  				</c:if>
  			</c:forEach>
  			</table> </div>
  	</html:form>
  	</div>
  </BODY>
</html>
