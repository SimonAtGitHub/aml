<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

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
	    function dosubmit1(theUrl){
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	     }
 	    function dosubmit(theUrl){
	        var	property = 'height=500, width=800,left=300,top=100,scrollbars=yes,resizable=yes';
		    window.open(theUrl,'',property); 
        }
</SCRIPT>
	</HEAD>
	<body>
		<div id='content'>
			<html:form method="post" action="/t12_judgment_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">判卷</span>
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
							<td>
								
							</td>
							<td>
								   <input type="button" name="button" value="查 询"
									onClick="dosubmit1('t12_judgment_list.do?newsearchflag=1','search')"
									class="input">
							</td>
						</tr>
					</table>
				</div>

				<div class='awp_list'>
					<table>
						<tr>
						    <td width="25%" align="center" nowrap>
								问卷发布名称
							</td>
							<td width="25%" align="center" nowrap>
							     答卷号
							</td>
							<td width="25%" align="center" nowrap>
								问卷的状态
							</td>
							<td width="25%" align="center" nowrap>
								操作
							</td>
							
						</tr>
						 
						<logic:iterate id="judgement" name="t12_judgment_questionnaireList"
							type="com.ist.cms.dto.T12_judgment_questionnaire" indexId="i">
							<tr>
							 
								<td align="center" noWrap>
									<bean:write name="judgement" property="title" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="judgement" property="answerkey" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="judgement" property="state_disp" scope="page" />
								</td>
							 	<td align="center" noWrap>
							 	 <logic:equal name="judgement" property="state" value="0">
							 	 	<input type="button" value="判 卷" name=Button2 class="input"  
								   	 onClick="dosubmit('<%=request.getContextPath() %>/cms/t12_judgment_sheet.do?type=1&publishkey=<bean:write name="judgement" property="publishkey" scope="page" />&answerkey=<bean:write name="judgement" property="answerkey" scope="page" />&questioninskey=<bean:write name="judgement" property="questioninskey" scope="page" />')">
								 </logic:equal>
								 <logic:equal name="judgement" property="state" value="1">
							 	 	<input type="button" value="判 卷" name=Button2 class="input"  
								   	 onClick="dosubmit('<%=request.getContextPath() %>/cms/t12_judgment_sheet.do?type=2&publishkey=<bean:write name="judgement" property="publishkey" scope="page" />&answerkey=<bean:write name="judgement" property="answerkey" scope="page" />&questioninskey=<bean:write name="judgement" property="questioninskey" scope="page" />')">
								 </logic:equal>
								 <logic:equal name="judgement" property="state" value="2">
							 	 	<input type="button" value="重新判卷" name=Button2 class="input"  
								   	 onClick="dosubmit('<%=request.getContextPath() %>/cms/t12_judgment_sheet.do?type=2&publishkey=<bean:write name="judgement" property="publishkey" scope="page" />&answerkey=<bean:write name="judgement" property="answerkey" scope="page" />&questioninskey=<bean:write name="judgement" property="questioninskey" scope="page" />')">
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