<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>
		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>		

		<script language="JavaScript">
		function dosubmit(theUrl){
			 
		    　　  document.forms[0].action=theUrl;
		      document.forms[0].submit();
		}
		function _Commit(){
			
				var elementkeys=document.getElementsByName("ekey");				
				var elementnames=document.getElementsByName("ename");				
			    if(checkRadio(elementkeys)<0){
			           alert("请选择！");
			           return false;
			    }else{
				    
				    for (i=0;i<elementkeys.length;i++){ 
					       	if(elementkeys[i].checked)
					       	{				         	
					       		window.parent.document.forms[0].elementkey.value=elementkeys[i].value;
					       		window.parent.document.forms[0].elementname.value = elementnames[i].value;
					       		window.parent.ymPrompt.close();
					         }
				     	}
			    }
			}
		</script>

</HEAD>
<body>
	<div id="main">
	<html:form action="/t31_def_element/t31_def_element_locate.do" method="post">
	
			<!-- conditions -->
			<div class="conditions">
			<!-- title -->
				<div class="cond_t">
					<span>积分评级模板 - 风险事件要点列表</span>
						
					<span class="buttons">
						<a href="#" onclick="javascript:_Commit();"/><img src="../../images/blue/b_choose.png" />选定</a>
						<a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/blue/b_shut.png" />关闭</a>
					</span>
				</div>
			</div>
			<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									要点编码：
								</td>
								<td>
									<html:text property="elementkey" />
								</td>
								<td>
									要点名称：
								</td>
								<td>
									<html:text property="elementname"/>
								</td>
								<td>
									<input type="button" name="button3" value="查 询" onclick="dosubmit('<%=request.getContextPath()%>/newrisk/t31_def_element/t31_def_element_locate.do?newsearchflag=1')" class="in_button1">
									
									</td>
								</tr>
						</table>
					
				</div>
					
				
				
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								  <th>选择</th>
								  <th>要点编码</th>
							      <th>要点名称</th>
							      <th>权重(%)</th>
							      <th>所在树层次</th>
							      <th>子项分值</th>
							      <th>风险事件算法</th>
							      <th>描述</th>
						
							</tr>
							<logic:present name="t31_def_elementList">
								<logic:iterate id="t31_def_element" name="t31_def_elementList"
									type="com.ist.aml.newrisk.dto.T31_def_element">
									<tr>
										<td>
											<input type="radio" name="ekey" value="<bean:write name='t31_def_element' property='elementkey' />"/>
											<input type="hidden" name="ename" value="<bean:write name='t31_def_element' property='elementname' />"/>
											
										</td>
										<td>
										
											<bean:write name="t31_def_element" property="elementkey" />
		
										</td>
										<td>
										
											<bean:write name="t31_def_element" property="elementname" />
		
										</td>
										<td>
											<bean:write name="t31_def_element" property="treelaye" />
										</td>
										<td>
											<bean:write name="t31_def_element" property="base_occ" />
										</td>
										<td>
											<bean:write name="t31_def_element" property="element_score" />
										</td>
										<td>
											<bean:write name="t31_def_element" property="riskcaltype" />
										</td>
										<td>
											<bean:write name="t31_def_element" property="des" />
										</td>
										
									</tr>
								</logic:iterate>
							</logic:present>
						</table>
					</div>
					<div class="list_page">
						<logic:present name="pageInfo" scope="request">
							<table width="98%" align="center" border="0" cellpadding="3"
								cellspacing="3">
								<tr>
									<td align="center">									
										<bean:write name="pageInfo" scope="request" filter="false" />								
									</td>
								</tr>
							</table>
						</logic:present>
					</div>
				
				
	</html:form>
	</div>
</BODY>
</HTML>
