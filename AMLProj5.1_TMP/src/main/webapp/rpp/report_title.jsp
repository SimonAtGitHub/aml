<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../bmp/platform/common/style_include.jsp" %>
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" type="text/css">
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >
	      
			
				<logic:notEqual value="" name="labelStr">
				    <div class='awp_title'>
					<table>
						<tr>
							<td width="23%">
								<span class="awp_title_td2"><c:out value="${labelStr}"/></span>
							</td>
							<td align="right">
								<logic:equal value="1" property="isexport" name="t10_reportActionForm">
									<input type="button" name="backbutton" value="导  出" onClick="dosubmit('downloadReport.do','')" class="input">
								</logic:equal>
								<logic:equal value="1" name="isout">
								<input type="button" value="关  闭" onclick="window.close();" class="input">
								</logic:equal>
								<logic:notEqual value="1" name="isout">
								<input type="button" value="返  回" onclick="history.back();" class="input">
								</logic:notEqual>
							</td>
						</tr>					
					</table>
				</div>
				</logic:notEqual>
				
			
	</BODY>
	
</HTML>
