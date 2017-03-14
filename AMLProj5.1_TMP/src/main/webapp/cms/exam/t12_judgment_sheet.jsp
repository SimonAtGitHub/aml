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
  
	function dosubmit(theUrl){
	   var errMsg ="";
	   var pre = 'score_';
       <c:forEach items="${subjectList}" var="dto">
         var name = pre + '<c:out value="${dto.subjectinskey}"/>';
         var value = document.getElementsByName(name)[0].value;
         if(errMsg == ""){
         	if( value == ""){
       			errMsg+="题目"+<c:out value="${dto.sorder}"/>+" 得分不能为空！"
	        }else if(parseInt(value) > parseInt(<c:out value="${dto.score}" />)){
	          	errMsg+="题目"+<c:out value="${dto.sorder}"/>+" 得分不能超过总分！"
	        }
         
         }
        </c:forEach>
        if(errMsg == ""){
       	   document.forms[0].action=theUrl;
    	   document.forms[0].submit();
        }else{
           alert(errMsg);
           return false;
        }
       
	  // window.close();
    }
	

</SCRIPT>

	</head>

	<body>
		<div id='content'>
			<html:form action="/t12_judgment_questionnaire_add_do.do"
				method="post">

				<input type="hidden" name="judgmentkey"
					value="<c:out value="${judgmentkey}" />" />
				<input type="hidden" name="questioninskey"
					value="<c:out value="${param.questioninskey}" />" />
				<input type="hidden" name="answerkey"
					value="<c:out value="${param.answerkey}" />" />

				<div class='awp_title'>

					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">判卷</span>
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
				</div>
				<div class='awp_detail'>
					<table>

						<c:forEach items="${subjectList}" var="dto">

							<tr align="left">
								<td  colspan="3">
									简答：
								</td>
							</tr>

							<c:set value="1" var="hasSet" scope="page" />
							<tr>
								<input type="hidden"
									name="subject_<c:out value="${dto.subjectinskey}"/>"
									value="<c:out value="${dto.score}" />" />
								<td align="center">
									<c:out value="${dto.sorder}" />
								</td>
								<td>
									&nbsp;
									<c:out value="${dto.question}" />
									&nbsp;&nbsp;(
									<c:out value="${dto.score}" />
									分)
								</td>

							</tr>

							<tr>
								<td></td>
								<td>
									<textarea name="question" readonly="true" cols="60" rows="6"><c:out value="${dto.answer}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									参考答案：
								</td>
								<td>
									<textarea name="question" readonly="true" cols="60" rows="6"><c:out value="${dto.solution}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									得分：
								</td>
								<td>
									<input type="text"
										name="score_<c:out value="${dto.subjectinskey}"/>" value=""
										onkeyup="this.value=this.value.replace(/\D/g,'');" />
								</td>
							</tr>

						</c:forEach>

						<tr>
							<td></td>
							<td>
								<input type="button" class="button"
									onclick="dosubmit('<%=request.getContextPath()%>/cms/t12_judgment_questionnaire_add_do.do')"
									value="完 成">
								<input type="button" class="button" onclick="window.close();"
									value="关 闭">
							</td>
						</tr>



					</table>
				</div>

			</html:form>
		</div>
	</BODY>
</html>
