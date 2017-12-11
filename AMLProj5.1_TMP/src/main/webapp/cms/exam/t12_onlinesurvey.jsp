<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html>
	<HEAD>
		<title>分数查看</title>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript"> 
    function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('您真的要删除操作符吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        //location.href=theUrl+"&"+Math.random();
        //location.href=theUrl;
        var eleId = document.getElementsByName('publishkey')[0];
        if(eleId.value==='' || eleId.value==='0'){
        	errMsg='请选择发布名称！';
        	isSub = false;
        }else{
        	isSub = true;
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

   function local_result_col(){
		<%--
		//var user_id = '<bean:write name="user_id"/>';
        //var para= "b.username = '"+user_id+"'";
        --%>
        var para = "B.QUESTIONTYPE = '2'";
      	locate_pop_window_noquery('<%= request.getContextPath() %>','t12_publish_questionnaire','radio','forms[0]','publishkey,id_disp',' '+para);
	}
	function open_window(url){
		var whole_path = url;
		var	property = 'height=450, width=600,left=100,top=100,scrollbars=yes,resizable=yes';
    	window.open(whole_path,'',property); 
	}
</SCRIPT>
	</HEAD>
	<body>
		<div id='content'>
			<html:form method="post" action="/t12_publish_questionnaire_list.do">

			
			  <div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">在线调查统计</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							
						</td>
					</tr>
				</table>
			</div>
		
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
	
				<div class='awp_cond' id="searchtable" style="display:none">
					<table>
					  
						<tr>
							<td>
								<font color="red">*</font>发布名称：
							</td>
							<td>
								<html:hidden property="publishkey"/>
							    <html:text property="id_disp" styleClass="text_white" size="30" readonly="true"/>
								<input type="button" name="organkey_location" value="单 选"
											class="text_white" onclick="local_result_col();"/>
							</td>
							<td>
								
							</td>
							<td>
								<input type="button" name="button" value="查 询"
									onClick="dosubmit('t12_publish_onlinesurvey.do?newsearchflag=1','search')"
									class="input">
							</td>
						</tr>
					
					</table>
				</div>

			   <div class='awp_detail'>
			    <table>
			       <tr>
					<td align="right">
						应答人数：
					</td>
					<td>
						<c:out value="${answer_sum}" />
					</td>
			
					<td align="right">
						实答人数：
					</td>
					<td>
						<c:out value="${real_answer_sum}" />
					</td>
					<td width="160" align="right">
						答题人员比例：
					</td>
					<td>
						<c:out value="${fPercent}" />
					</td>
				</tr>
				   
				<tr>
					<td align="right">
						男：
					</td>
					<td>
						<c:out value="${answer_manNum}" >0</c:out> 人
					</td>
			
					<td align="right">
						比例：
					</td>
					<td>
						<c:out value="${answer_manNum_precent}" >0%</c:out> 
					</td>
					<td align="right">
						女：
					</td>
					<td>
						<c:out value="${b_answer_womanNum}" >0</c:out> 人
					</td>
				</tr>
				<tr>
					<td align="right">
						比例：
					</td>
					<td>
						<c:out value="${answer_wommanNum_precent}" >0%</c:out> 
					</td>
			
					<td  align="right">
						 
					</td>
					<td>
						 
					</td>
					<td align="right">
					 
					</td>
					<td>
						 
					</td>
				</tr>
				</table>
		</div>
		
				<div class='awp_list'>
					<table>
						<tr>
						    <td width="25%" nowrap>
								答卷人姓名
							</td>
							<td width="25%" nowrap>
							    答卷人部门
							</td>
							 
							<td width="25%" nowrap>
								操作
							</td>
							
						</tr>
						 
						<logic:iterate id="publish" name="t12_publish_questionnaireList"
							type="com.ist.cms.dto.T12_publish_questionnaire" indexId="i">
							<tr>
							 
								<td align="center" noWrap>
									<bean:write name="publish" property="user_name" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="publish" property="user_org" scope="page" />
								</td>
							 	<td align="center" noWrap>
								    <a href="javascript:void(0)" onclick="javascript:open_window('t12_answer_questionnaire_disp3.do?answerkey=<bean:write name="publish" property="answerkey" scope="page" />&questioninskey=<bean:write name="publish" property="questioninskey" scope="page" />')">查 看</a>
								 </td>
							
							</tr>
						</logic:iterate>
					</table>
				</div>

			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							
						<br></td>
					</tr>
				</table>
			</div>
			</html:form>
		</div>
	</body>
	
	</html:html>