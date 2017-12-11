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
	
	<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, type){
	    var errMsg = "";
	    var isSub = false;
	    if(type==='add'){
	        isSub = true;
	        
	    }else if(type==='search'){
	        isSub = true;
	        //检查创建时间
	        var createtime_begin = document.getElementsByName('createtime_begin')[0];
	        var createtime_end = document.getElementsByName('createtime_end')[0];
	        if(createtime_begin.value!='' && createtime_end.value!=''){
	        	if(createtime_begin.value > createtime_end.value){
	        		errMsg= '创建开始时间不能大于结束时间！';
	        		isSub = false;
	        	}
	        }
	    }else if(type==='publish'){
	    	 errMsg = CheckBoxMustChecked(document.forms[0]);
	        if(errMsg==''){
	            if(confirm('确定要发布？')){
	                isSub = true;
	            }
	        }
	    }else if(type==='delete'){
	    	errMsg = CheckBoxMustChecked(document.forms[0]);
	        if(errMsg==''){
	            if(confirm('确定要删除？')){
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
		var	property = 'height=500, width=800,left=100,top=100,scrollbars=yes,resizable=yes';
		window.open(url,'',property);     
	}	
	</script>
  </head>
<body>
	<div id='content'>
  	<html:form action="/t12_publish_questionnaire_list.do" method="post">
  	
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">问卷发布管理 - 列表</span>
						</td>
						<td align="right">
						<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:button property="button2" value="发起考试" styleClass="input"
							onclick="dosubmit('cms/t12_publish_questionnaire_add.do?questiontype=1','add')" />	
							<html:button property="button2" value="发起调查" styleClass="input"
								onclick="dosubmit('cms/t12_publish_questionnaire_add.do?questiontype=2','add')" />	
							
							<html:button property="button2" value="发 布" styleClass="input"
								onclick="dosubmit('cms/t12_publish_questionnaire_publish_do.do','publish')" />
							
							<html:button property="button2" value="删 除" styleClass="input"
								onclick="dosubmit('cms/deleteT12_publish_questionnaire_do.do','delete')" />
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
  					<td noWrap><html:text property="title" /></td>
  					<td noWrap>发布时间：</td>
  					<td noWrap><html:text property="createtime_begin" readonly="true" size="10" styleClass="input"/>&nbsp;<img src="<%=path %>/images/calendar.gif" style="cursor:hand;"
								width="16" height="16" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].createtime_begin);" /> - 
								<html:text property="createtime_end" readonly="true" size="10" styleClass="input"/>&nbsp;<img src="<%=path %>/images/calendar.gif" style="cursor:hand;"
								width="16" height="16" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].createtime_end);" />
					</td>
  				</tr>
  				<tr>
  					<td noWrap>发布状态：</td>
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
  					<td noWrap></td>
  					<td noWrap><html:button property="Button55" value="查  询" onclick="dosubmit('cms/t12_publish_questionnaire_list.do?newsearchflag=1&type=search','search')" styleClass="input" />
					</td>
  				</tr>
  			</table>
  		</div>	
  		<div class="awp_list">
  			<TABLE>
				<TR align="center">
					<TD width="2%" height="22" noWrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>
						<%--<input type="checkbox" name="didaryselect" value="0"
							onClick="selectORClearBox(forms[0],this.checked)">
					--%>
					全部
					</TD>
					<TD width="20%">
						发布名称
					</TD>
					<TD width="20%">
						问卷名称
					</TD>
					<TD width="10%">
						问卷类型
					</TD>
					<TD width="20%">
						发布时间
					</TD>
					<TD width="10%">
						发布类型
					</TD>
					<TD width="10%">
						发布状态
					</TD>
					<TD width="5%">
						操作
					</TD>
				</TR>
				<c:forEach items="${t12_publish_questionnaireList}" var="dto" varStatus="status">
					<TR align="center">
						<TD><input type="checkbox" name="selectedPublishKey" value="<c:out value="${dto.publishkey}" />" <c:if test="${dto.state eq '2' or (t00_user.username ne dto.creator) }"><c:out value="disabled" /> </c:if> /> </TD>
						<TD><c:out value="${dto.title}" /></TD>
						<TD><a href="javascript:open_window('t12_questio_ins_disp.do?questioninskey=<c:out value="${dto.questioninskey}" />')"><c:out value="${dto.questionnaireTitle}" /></a></TD>
						<TD><c:out value="${dto.questiontype_disp}" /></TD>
						<TD><c:out value="${dto.createtime}" /></TD>
						<TD><c:out value="${dto.publishmode_disp}" /></TD>
						<TD><c:out value="${dto.state_disp}" /></TD>
						<TD><c:if test="${dto.state eq '1' and (t00_user.username eq dto.creator) }"><a href="<%=path %>/cms/t12_publish_questionnaire_modify.do?publishkey=<c:out value="${dto.publishkey}" />&questiontype=<c:out value="${dto.questiontype }"/>">修 改</a></c:if>
							<c:if test="${dto.state eq '2' and dto.timeout eq '0' and (t00_user.username eq dto.creator) and dto.archived eq '0'}"><a href="<%=path %>/cms/stop_t12_publish_questionnaire_do.do?publishkey=<c:out value="${dto.publishkey}" />">停止答卷</a></c:if>
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
