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

	function export1(theUrl){
		 document.forms[0].action=theUrl;
		 document.forms[0].submit();
	}
</script>
 </head>
<body>
	<div id='content'>
 
  	<html:form action="/t12_questio_ins_disp.do" method="post">
  	<html:hidden property="questioninskey"/>
  	
			<div class='awp_title'>

				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷查看</span>
						</td>
						<td align="right">
							<html:button property="Button55" value="导 出" onclick="export1('cms/t12_questio_ins_dispExport.do')" styleClass="input" />&nbsp;
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
			
		<div class='awp_detail'>
  			<table>
  				<tr>
  					<td noWrap>问卷名称：</td>
  					<td noWrap><c:out value="${t12_question_ins.title}" /></td>
  					<td noWrap>问卷类型：</td>
  					<td noWrap><c:out value="${t12_question_ins.questiontype_disp}" /></td> 
  				</tr> 
  				<c:if test="${t12_question_ins.questiontype eq '1'}">
  				<tr>
  					<td noWrap>问卷总分：</td>
  					<td noWrap><c:out value="${t12_question_ins.totalscore}" /></td>
  					<td noWrap></td>
  					<td noWrap><%--<html:button property="Button52" styleClass="input" onclick="window.close()">关 闭</html:button>
					--%></td> 
  				</tr> 
  				</c:if>
  			</table>
  		</div>
  		
			<div class='awp_list'>
  			<table>  
  			  <tr>
					<td align="left" colspan="3" >问卷试题列表</td>
				</tr>
				<c:set value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" var="graphemes" scope="page"></c:set> 		 
  			<c:forEach items="${subjectList}" var="dto" >
  				<c:if test="${dto.subjecttype eq '1'}">
  					<c:if test="${hasSet ne '1'}">
		  				<tr align="left">  						 
		  					<td colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td  align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/></td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if></td>
  				</tr>
  					<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td  colspan="3">
	  					<c:forEach items="${dto.choiceList}" var="choice" varStatus="statusIndex">
	  					<%--<c:forEach items="${graphemes}" var="grapheme" varStatus="s">
	  						<c:if test="${s.index eq status.index}">
	  							<c:out value="${grapheme}"/>
	  						</c:if>
	  					</c:forEach>
	  					--%><c:out value="${statusIndex.index+1}" />
	  					<input type="radio" disabled 
	  					<c:if test="${dto.solution eq choice.choicekey}">checked</c:if>
	  					/><c:out value="${choice.content}" />	<c:out value="</br>" escapeXml="false"/>
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
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td align="center"><c:out value="${status}、" /> <c:set value="${status+1}" var="status" scope="page"/></td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if></td>
  				</tr>
  				<c:if test="${not empty dto.choiceList}">
  					<tr>
  						<td colspan="3">
  						<c:forEach items="${dto.choiceList}" var="choice" varStatus="statusIndex">
  						 <c:out value="${statusIndex.index+1}" />
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
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/> </td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if><c:if test="${not empty dto.solution}">（<c:out value="${dto.solution}" />）</c:if></td>
  				</tr>
  				</c:if>
  			</c:forEach>
  			
  			<c:set value="0" var="hasSet" scope="page" />
  			<c:forEach items="${subjectList}" var="dto" >
  				<c:if test="${dto.subjecttype eq '4'}">
  					<c:if test="${hasSet ne '1'}">
		  				<tr align="left">  						 
		  					<td colspan="3"> 
		  						<c:out value="${subjectTypeMap[dto.subjecttype]}" />
		  					</td>
		  				</tr>
		  				<c:set value="1" var="status" scope="page"/>
  					</c:if>
  				<c:set value="1" var="hasSet" scope="page" />
  				<tr>
  					<td  align="center"><c:out value="${status}、" /><c:set value="${status+1}" var="status" scope="page"/> </td>
  					<td>&nbsp;<c:out value="${dto.content}" /><c:if test="${t12_question_ins.questiontype eq '1'}"><c:out value="（${dto.score}分）"/></c:if><c:if test="${not empty dto.solution}">（<c:out value="${dto.solution}" />）</c:if></td>
  				</tr>
  				</c:if>
  			</c:forEach>
  			</table> 
  	</html:form>
  	</div>
  </BODY>
</html>
