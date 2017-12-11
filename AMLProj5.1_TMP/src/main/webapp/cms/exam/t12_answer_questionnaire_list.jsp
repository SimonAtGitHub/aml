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
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/js/basefunc.js"></script>
	
	<script language="javascript" src="<%=path%>/js/load_window.js"></script>
	
	<SCRIPT LANGUAGE="JavaScript">
	var contextpath = '<%=path%>';
	function dosubmit(theUrl, type){
	    var errMsg = "";
	    var isSub = false;
	    if(type==='add'){
	        isSub = true;
	        
	    }else if(type==='search'){
	        isSub = true;
	        //检查创建时间
	        /*var createtime_begin = document.getElementsByName('createtime_begin')[0];
	        var createtime_end = document.getElementsByName('createtime_end')[0];
	        if(createtime_begin.value!='' && createtime_end.value!=''){
	        	if(createtime_begin.value > createtime_end.value){
	        		errMsg= '创建开始时间不能大于结束时间！';
	        		isSub = false;
	        	}
	        }*/
	    }else if(type==='publish'){
	    	 errMsg = CheckBoxMustChecked(document.forms[0]);
	        if(errMsg==''){
	            if(confirm('确定要发布？')){
	                isSub = true;
	            }
	        }
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
	
	function open_window(url){
		var whole_path = url;
		var	property = 'height=450, width=600,left=100,top=100,scrollbars=yes,resizable=yes';
    	window.open(whole_path,'',property); 
	}
	
	function reAnswer(url){
		if(confirm('确定要重答试题？')){
			document.forms[0].action = url;
			document.forms[0].submit();
		}
	}
	</SCRIPT>
  </head>
  
<body>
	<div id='content'>
  	<html:form action="/t12_answer_questionnaire_list.do" method="post">
  	
			<div class='awp_title'>

				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷答题情况 - 列表</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
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
  					<td noWrap>发布名称：</td>
  					<td noWrap><html:text property="publishTitle" size="30"/></td>
  					<td noWrap>答卷时间：</td>
  					<td noWrap><html:text property="starttime" readonly="true" size="10" styleClass="input"/>&nbsp;<img src="<%=path %>/images/calendar.gif" style="cursor:hand;"
								width="16" height="16" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].starttime);" /><%-- - 
								<html:text property="endtime" readonly="true" size="10" styleClass="input"/>&nbsp;<img src="<%=path %>/images/calendar.gif" style="cursor:hand;"
								width="16" height="16" alt="弹出日历下拉菜单"
								onClick="fPopUpCalendarDlg(endtime)" />
					--%></td>
  				</tr>
  				<tr>
  					<td noWrap>答题状态：</td>
  					<td noWrap>
  						<html:select property="state">
  							<html:options collection="stateMap" property="label" 
  								labelProperty="value"/>
  						</html:select>
  					</td>
  					<td noWrap>问卷类型：</td>
  					<td noWrap><html:select property="questiontype">
  						<html:options collection="quetionTypeMap" 
  							property="label" labelProperty="value" />
  					</html:select>
  						</td>
  				</tr>
  				<tr>
  					<td noWrap>排序：</td>
  					<td noWrap><html:select property="sort">
  							<html:options collection="sortMap" property="label" 
  								labelProperty="value"/>
  						</html:select>&nbsp;
  						<html:radio property="sort_type" value="ASC">升序</html:radio>
  						<html:radio property="sort_type" value="DESC">降序</html:radio>
  						<html:radio property="sort_type" value="">不排序</html:radio></td>
  					<td noWrap>答卷人：</td>
  					<td noWrap><html:text property="username_disp" readonly="true" size="30" styleClass="input"/>
  						<html:hidden property="username"/>	<html:button property="Button52" onclick="locate_pop_window(contextpath,'t00_userLocation','checkbox','forms[0]','username,username_disp','');">多 选</html:button>
					</td>
  				</tr>
  				<tr>
  					<td> </td>
  					<td> </td>
  					<td noWrap></td>
  					<td noWrap><html:button property="Button55" value="查  询" onclick="dosubmit('cms/t12_answer_questionnaire_list.do?newsearchflag=1','search')" styleClass="input" />
  				</tr>
  			</table>
  		</div>	
  		<div class="awp_list">
  			<TABLE>
				<TR align="center"><%--
					<TD width="%10" height="22" noWrap>
						<input type="checkbox" name="didaryselect" value="0"
							onClick="selectORClearBox(forms[0],this.checked)">
					</TD>
					--%><TD width="20%" nowrap>
						发布名称
					</TD>
					<TD width="20%" nowrap>
						答卷人
					</TD>
					<TD width="10%" nowrap>
						问卷类型
					</TD>
					<TD width="20%" nowrap>
						答卷开始时间
					</TD>
					<TD width="10%" nowrap>
						答卷结束时间
					</TD>
					<TD width="10%" nowrap>
						答卷状态
					</TD>
					<TD width="10%" nowrap>
						操作
					</TD>
				</TR>
				<c:forEach items="${t12_answer_questionnaireList}" var="dto" varStatus="status">
					<TR align="center">
						<TD nowrap><a href="javascript:open_window('t12_answer_questionnaire_disp2.do?publishkey=<c:out value="${dto.publishkey }"/>&username=<c:out value="${dto.username }"/>&questioninskey=<c:out value="${dto.questioninskey }"/>')"><c:out value="${dto.publishTitle}" /></a></TD>
						<TD nowrap><c:out value="${dto.username_disp}" /></TD>
						<TD nowrap><c:out value="${dto.questiontype_disp}" /></TD>
						<TD nowrap><c:out value="${dto.starttime}" /></TD>
						<TD nowrap><c:out value="${dto.endtime}" /></TD>
						<TD nowrap><c:out value="${dto.state_disp}" default="未开始答题" /></TD>
						<TD nowrap><c:if test="${dto.state eq '1' && dto.timeout eq '0' }"><a href="javascript:void(0)" onclick="reAnswer('<%=path %>/cms/t12_answer_questionnaire_reanswer.do?answerkey=<c:out value="${dto.answerkey}" />')">重 答</a></c:if>
						</TD>
					</TR>
				</c:forEach>
			</TABLE>
  		</div>
  
  	<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
  	</html:form>
  </BODY>
</html>
