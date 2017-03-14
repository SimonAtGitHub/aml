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
	    var isSub = true; 
	    if(action === 'add'){
	    	//检查题目
	    	var content = document.getElementsByName('content')[1];
	    	if(trim(content.value)===''){
	    		errMsg+="请填写题目！";
	    	}else if(getLength(content.value)>1000){
	    		errMsg+="题目名称不能超过1000个字符";
	    	}
	    	//检查分数
	    	if(document.getElementsByName('questiontype')[0].value==='1'){
	    		//检查是否填写
	    		var score = document.getElementsByName('score')[0];
	    		if(score.value===''){
	    			errMsg+="请填写分数！";
	    			score.focus();
	    		}else if(!checkNum(score.value)||parseInt(score.value)==0){
	    			errMsg+="分数应为正数！";
	    			score.focus();
	    		}else{
	    			score.value = parseInt(score.value);
	    		}
	    	}
	    	//检查是否选择了是否必填
	    	var mustanswer = document.getElementsByName('mustanswer')[0];
	    	if(mustanswer.value===''){
	    		errMsg+='请选择是否必填！';
	    		mustanswer.focus();
	    	}
	    	<c:if test="${param.questiontype eq '1'}">
	    	//检查答案
	    	var solution = document.getElementsByName('solution')[0];
	    	if(trim(solution.value)===''){
	    		errMsg+="请填写答案！";
	    	}else if(getLength(solution.value)>500){
	    		errMsg+='答案不能超过500个字符！';
	    	}
	    	</c:if>
	    }else if(action ==='back'){
	    	isSub = true;
	    }
		    //序号
		    var sorder = document.getElementsByName('sorder')[0];
		    if(getLength(sorder.value)>0){
		    	sorder.value=parseInt(sorder.value);
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
	<script type="text/javascript">
		var backurl = '<c:out value="${param.backurl}" />'; 
	</script>
  </head>
  
<body>
	<div id='content'>
  	<html:form action="/t12_test_question_add_do.do" method="post">
  		<input type="hidden" name="questionkey" value="<c:out value="${param.questionkey}" />"/>
  		<input type="hidden" name="questiontype" value="<c:out value="${param.questiontype}" />"/>
  		<!-- 试题类型 -->
  		<input type="hidden" name="subjecttype" value="<c:out value="${param.subjecttype}" />"/>
  		<!-- 操作来源 E-代表来源是修改页面 N代表来源是添加页面-->
  		<input type="hidden" name="fromOpt" value="<c:out value="${param.fromOpt}" />"/>
 
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">
								问卷管理-问卷编制管理-创建
								<c:forEach items="${subjectTypeMap}" var="entry">
									<c:if test="${param.subjecttype eq entry.key}">
										<c:out value="${entry.value}"></c:out>
									</c:if>
								</c:forEach>
							
							</span>
						</td>
						<td align="right">
							<html:button property="Button55" value="返 回" onclick="dosubmit(backurl,'back')" styleClass="input" />
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
  			<table id="subjectTable">
  				<tr>
  					<td><font color="red">*</font>题 目：</td>
  					<td noWrap width="85%"><html:textarea property="content" rows="5" cols="40"></html:textarea></td>
  				</tr> 
  				<c:choose>
  					<c:when test="${param.questiontype eq '1'}">
  					<tr>
	  					<td><font color="red">*</font>分 数：</td>
	  					<td><html:text property="score" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="3"/></td> 
  					</tr>
  					</c:when>
  					<c:otherwise>
  						<input type="hidden" name="score" value="0"/ >
  					</c:otherwise>
  				</c:choose>
  				<tr>
	  				<td><c:if test="${param.questiontype eq '1'}"><font color="red">*</font></c:if>答 案：</td>
	  				<td><html:text property="solution" size="30"/></td> 
  				</tr> 
  				<tr>
  					<td>是否必答：</td>
  					<td><html:select property="mustanswer">
  							<html:options collection="mustanswerMap" property="label" labelProperty="value" />
  						</html:select> </td> 
  				</tr>
  				<tr>
  					<td>显示序号</td>
  					<td><html:text property="sorder" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5" /></td> 
  				</tr>
  				<tr> 
  				<td></td>
  					<td noWrap colspan="3"><html:button property="Button52" value="保 存" onclick="dosubmit('cms/t12_test_question_add_do.do','add')"/></td> 
  				</tr>
  			</table>
  		</div> 
  	</html:form></div>
  </BODY>

</html>
