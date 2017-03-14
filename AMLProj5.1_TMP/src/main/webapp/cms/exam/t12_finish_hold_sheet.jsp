<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html>
<HEAD>
	<title>试卷答题情况</title>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></script>

	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/load_window.js"></script>

	<SCRIPT LANGUAGE="JavaScript"> 
		 function dosubmit(theUrl){
		        document.forms[0].action=theUrl;
			    document.forms[0].submit();
			    
			    
		    }
    
	 /** function valChange(){
			var  results=eval(document.forms[0].ispublic);
		    var index = results.selectedIndex;
			var selvalue=results.options[index].value;
		  	var trElement = document.getElementById("subject");
		  	var trElement1 = document.getElementById("user");
		    if(selvalue==1){//是
		    	trElement.style.display="";
		    	trElement1.style.display="";
	        }else{
		        trElement.style.display="none";
		        trElement1.style.display="none";
		    }
	     }*/
    function checkAnswer(theUrl){
        var	property = 'height=500, width=800,left=400,top=200,scrollbars=yes,resizable=yes';
	    window.open(theUrl,'',property); 
     
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
							<span class="awp_title_td2">试卷答题人列表</span>
						</td>
						<td align="right">
							<input type="button" class="button" onclick="window.close();"
							value="关 闭">
						</td>
					</tr>
				</table>
			</div>
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			
			<div class='awp_detail'>
				<table>

					<tr>
						<td>
							问卷发布名称：
						</td>
						<td>
							<bean:write name="t12_publish_questionnaire" property="title"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							问卷类型：
						</td>
						<td>
							<bean:write name="t12_publish_questionnaire"
								property="questiontype_disp" scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							开始时间：
						</td>
						<td>
							<bean:write name="t12_publish_questionnaire" property="starttime"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							结束时间：
						</td>
						<td>
							<bean:write name="t12_publish_questionnaire" property="endtime"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							是否公开：
						</td>
						<td>
							<bean:write name="t12_publish_questionnaire"
								property="ispublic_disp" scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							是否公布题目：
						</td>
						<td>
							<bean:write name="t12_publish_questionnaire"
								property="ispcsubject_disp" scope="request" />
						</td>
					</tr>
				</table>
			</div>
			

			<div class="awp_list">
				<TABLE>
					<TR align="center">

						<TD width="20%" nowrap>
							答卷人
						</TD>
						<TD width="20%" nowrap>
							开始时间
						</TD>
						<TD width="20%" nowrap>
							结束时间
						</TD>
						<TD width="10%" nowrap>
							状态
						</TD>
						<logic:equal value="1" name="t12_publish_questionnaire"
							property="questiontype">
							<TD width="10%" nowrap>
								得分
							</TD>
						</logic:equal>

						<TD width="20%" nowrap>
							操作
						</TD>
					</TR>

					<logic:iterate id="answer" name="answer_list"
						type="com.ist.cms.dto.T12_answer_questionnaire">
						<tr>

							<td align="center" noWrap>
								<bean:write name="answer" property="username" scope="page" />
							</td>
							<td align="center" noWrap>
								<bean:write name="answer" property="starttime" scope="page" />
							</td>
							<td align="center" noWrap>
								<bean:write name="answer" property="endtime" scope="page" />
							</td>
							<td align="center" noWrap>
								<bean:write name="answer" property="state_disp" scope="page" />
							</td>
							<logic:equal value="1" name="t12_publish_questionnaire"
								property="questiontype">
								<td align="center" noWrap>
									<bean:write name="answer" property="totalscore" scope="page" />
								</td>
								<td align="center" noWrap>
									<logic:notEqual name="answer" property="totalscore" value="0">
										<input type="button" value="查看试卷" name=Button2 class="input"
											onClick="checkAnswer('<%=request.getContextPath()%>/cms/t12_answer_finish_sheet.do?publishkey=<bean:write name="answer" property="publishkey" scope="page" />&answer_name=<bean:write name="answer" property="username" scope="page" />&questioninskey=<bean:write name="t12_publish_questionnaire" property="questioninskey" scope="request" />')">
									</logic:notEqual>
								</td>
							</logic:equal>
							<logic:equal value="2" name="t12_publish_questionnaire"
								property="questiontype">
								<td align="center" noWrap>
									 <logic:equal value="1" name="answer"  property="state">
										<input type="button" value="查看问卷" name=Button2 class="input"
										onClick="checkAnswer('<%=request.getContextPath()%>/cms/t12_answer_finish_sheet.do?publishkey=<bean:write name="answer" property="publishkey" scope="page" />&answer_name=<bean:write name="answer" property="username" scope="page" />&questioninskey=<bean:write name="t12_publish_questionnaire" property="questioninskey" scope="request" />')">
									</logic:equal>
								</td>
							</logic:equal>

						
						</tr>
					</logic:iterate>
				</TABLE>
			</div>

		</html:form>
	</div>
</body>
</html:html>
