<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html>
	<HEAD>
		<title>已答卷列表</title>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript"> 
	   function dosubmit(theUrl){
	        var	property = 'height=500, width=800,left=300,top=100,scrollbars=yes,resizable=yes';
		    window.open(theUrl,'',property); 
	     
	    }
	
	   function dosubmit1(theUrl){
	        document.forms[0].action=theUrl;
		    document.forms[0].submit();
		    
		    
	    }
	  
	
	</SCRIPT>
	</HEAD>
	<body>
		<div id='content'>
			<html:form method="post" action="/t12_answer_sheet_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">已答卷 - 列 表</span>
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
								问卷发布名称：
							</td>
							<td>
								<html:text property="question_name" styleClass="text_white"
									size="30" />
							</td>
							<td width="15%" height="22" align="right" class="deep">
								
							</td>
							<td>
								   <input type="button" name="button" value="查 询"
									onClick="dosubmit1('t12_answer_finish_list.do?newsearchflag=1','search')"
									class="input">
							</td>
						</tr>
					
						
					</table>
				</div>

	     
				<div class='awp_list'>
					<table>
						<tr>
						    <td width="20%" nowrap>
								问卷发布名称
							</td>
							<td width="15%" nowrap>
							     开始时间
							</td>
							<td width="15%" nowrap>
								结束时间
							</td>
							
							<td width="15%" nowrap>
								是否公布题目
							</td>
							<td width="10%" nowrap>
								状态
							</td>
							<td width="10%" nowrap>
								得分
							</td>
							<td width="15%">
								操作
							</td>
							
						</tr>
						 
						<logic:iterate id="publish" name="t12_publish_questionnaireList"
							type="com.ist.cms.dto.T12_publish_questionnaire" indexId="i">
							<tr>
							 
								<td align="center" noWrap>
									<bean:write name="publish" property="question_name" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="publish" property="starttime" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="publish" property="endtime" scope="page" />
								</td>
								
								<td align="center" noWrap>
									<bean:write name="publish" property="ispcsubject_disp" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="publish" property="state_disp" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="publish" property="totalscore" scope="page" />
								</td>
							 	<td align="center" noWrap>
							 	 <logic:equal value="1" name="publish" property="ispcsubject">
							 	    <input type="button" value="查看试卷" name=Button2 class="input"  
								   	 onClick="dosubmit('<%=request.getContextPath() %>/cms/t12_answer_finish_sheet.do?questioninskey=<bean:write name="publish" property="questioninskey" scope="page" />&publishkey=<bean:write name="publish" property="publishkey" scope="page" />')">
								 </logic:equal>
								 </td>
							
							</tr>
						</logic:iterate>
					</table>
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
		</div>
	</body>
	
	</html:html>