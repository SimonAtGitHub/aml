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
	    	}else if(content.value.indexOf("___")== -1){
	    		errMsg+="请添加填空项！";
	    		
	    	}
	    	var results = document.forms[0].solution.value;	
	    	var content_num = content.value.replace(/[^___]/g, '').length/3;
	    	var results_num = results.replace(/[^|]/g, '').length;
	    	
	    	if(content_num != results_num+1){
	    		errMsg+="填空项与答案个数不符！";
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
	    	if(getLength(trim(solution.value))==0){
	    		errMsg+="请填写答案！";	    	
	    	}
			</c:if>
		    //序号
		    var sorder = document.getElementsByName('sorder')[0];
		    if(getLength(sorder.value)>0){
		    	sorder.value=parseInt(sorder.value);
		    }
	    }else if(action ==='back'){
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
	
	function check_tiankong(){
		var errMsg = '';
		
		  
	return errMsg;
	}
	
	function newTimu(url,subjecttype)
	{
	    sForm = document.frm
	    sForm.subjecttype.value = subjecttype
	    sForm.action = url;   
	    sForm.submit();
	}
	function updTimu(subjectkey,subjecttype){	
	    sForm = document.frm   
	    sForm.subjectkey.value = subjectkey;
	    sForm.subjecttype.value = subjecttype;
	  	sForm.action = "<%= path %>/oa/assist/questionnaire/controller/QuestionEditServlet";   
	    sForm.submit();
	}
	</script>
	
	<script type="text/javascript">
	//新建填空题项
function _add(){
	sForm = document.forms[0];
	//alert(title.indexOf ("___") > 0);
	var title = sForm.content.value;	
	if(title.lastIndexOf("___") >= 0){		
		if(title.lastIndexOf("___")+3 ==  title.length){
			alert("已经有填空项");
			return false;
		}
	}
	var s = title + "___";
	sForm.content.value = s;
	sForm.content.focus();
}
//填空的答案分割符
function _result(){
	sForm = document.forms[0];
	var results = sForm.solution.value;	
	//判断已经添加了多少个答案 
	if(results.lastIndexOf("|")+1 ==  results.length){
		alert("请填写填空答案");
		return false;
	}
	
	var s = results + "|";
	sForm.solution.value = s;
	sForm.solution.focus();
}
	
	function getCount(str){
		var i=0;
		var s = str;
		if(str===''){
			return i;
		}else{
			while(s.indexOf('|')!=-1){
				i++;
				s = s.substring(s.indexOf('|')+1,s.length);
			}
		}
		return i;
	}
	</script>
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
							<span class="awp_title_td2">问卷管理-问卷编制管理-创建
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
  					<td noWrap><font color="red">*</font>题 目：</td>
  					<td noWrap><html:textarea property="content" rows="5" cols="40"></html:textarea>
  						&nbsp;&nbsp;&nbsp;&nbsp; <html:button property="Button52" onclick="_add()" styleClass="input">添加填空项</html:button> </td>
  				</tr> 
  				<c:choose>
  					<c:when test="${param.questiontype eq '1'}">
  					<tr>
	  					<td noWrap><font color="red">*</font>分 数：</td>
	  					<td noWrap><html:text property="score" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="2"/></td> 
  					</tr>
  					</c:when>
  					<c:otherwise>
  						<input type="hidden" name="score" value="0"/ >
  					</c:otherwise>
  				</c:choose> 
  				<tr>
	  				<td noWrap><c:if test="${param.questiontype eq '1'}"><font color="red">*</font></c:if>答 案：</td>
	  				<td noWrap><html:text property="solution" size="30"/>
	  					&nbsp;&nbsp;&nbsp;&nbsp;<html:button property="Button52" onclick="_result()" styleClass="input">答案分隔符</html:button>
	  				</td> 
  				</tr> 
  				<tr>
  					<td noWrap>是否必答：</td>
  					<td noWrap><html:select property="mustanswer">
  							<html:options collection="mustanswerMap" property="label" labelProperty="value" />
  						</html:select> </td> 
  				</tr>
  				<tr>
  					<td noWrap>显示序号</td>
  					<td noWrap><html:text property="sorder" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5" /></td> 
  				</tr>
  				<tr> 
  					<td></td>
  					<td noWrap  colspan="3"><html:button property="Button52" value="保 存" onclick="dosubmit('cms/t12_test_question_add_do.do','add')"/></td> 
  				</tr>
  			</table>
  		</div> 
  	</html:form></div>
  </BODY>
 </html>
