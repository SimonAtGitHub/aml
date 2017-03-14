<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.aml.newrisk.dto.T31_def_element"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.ist.aml.newrisk.dto.T31_def_elementscore"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>

		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>


	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/t31_def_element/t31_def_element_disp.do"
			method="post">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
				  
					<!-- title -->
					<div class="cond_t">
						<span>积分评级模板 - 要点明细</span>
					
					<span class="buttons">
							 <a	href='t31_def_element_list.do'><img
									src="../../images/blue/b_back.png" />返回</a>
						</span>
					</div>
					
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" id="tab">
							<tr>
								<td>要点编码：</td>
								<td><bean:write name="t31_def_element"  property="elementkey"/></td>
								<td>要点名称：</td>
								<td><bean:write name="t31_def_element"  property="elementname"/></td>
							</tr>
							
							<tr>
								<td>要点类型：</td>
								<td><bean:write name="t31_def_element"  property="caltype_disp"/></td>
							   <logic:equal name="t31_def_element" property="js_type" value="1">
								<td>权重(%)：</td>
								<td><bean:write name="t31_def_element"  property="base_occ"/></td>
								</logic:equal>
								<logic:notEqual name="t31_def_element" property="js_type" value="1">
								<td></td>
								<td></td>
								</logic:notEqual>
							</tr>
							<tr>
								<td>所在树层次：</td>
								<td><bean:write name="t31_def_element"  property="treelaye"/></td>
								<td>是否最后一层：</td>
								<td>是</td>
							</tr>
							<logic:equal name="t31_def_element" property="caltype" value="1">
							<tr>
								<td>指标编码：</td>
								<td><bean:write name="t31_def_element"  property="indickey"/></td>
								<td>指标顺序：</td>
								<td><bean:write name="t31_def_element"  property="valnum"/></td>
							</tr>
							<tr>
								<td>基准分值：</td>
								<td><bean:write name="t31_def_element"  property="base_score"/></td>
								<td>累计方式：</td>
								<td><bean:write name="t31_def_element"  property="is_sum"/>									
								</td>
							</tr>
							<tr><td>子项分值：</td>
								<td><bean:write name="t31_def_element"  property="element_score"/></td>
								<td>描述：</td>
								<td><bean:write name="t31_def_element"  property="des"/></td>
								</tr>
							<tr><td>是否允许调整：</td>
								<td colspan="3"><bean:write name="t31_def_element"  property="is_audit_disp"/></td>
								</tr>	
							</logic:equal>
							
							<logic:equal name="t31_def_element" property="caltype" value="2">
							
							<tr>
								
								<td>风险事件算法：</td>
								<td> <logic:equal name="t31_def_element"  property="riskcaltype" value="MAX">最大值</logic:equal> 
									<logic:equal name="t31_def_element"  property="riskcaltype" value="MIN">最小值</logic:equal> 
									<logic:equal name="t31_def_element"  property="riskcaltype" value="AVG">平均值</logic:equal> 
								</td>
								<td>子项分值：</td>
								<td><bean:write name="t31_def_element"  property="element_score"/></td>
							</tr>
							<tr>
							    <td>是否允许调整：</td>
								<td><bean:write name="t31_def_element"  property="is_audit_disp"/></td>
								<td>描述：</td>
								<td><bean:write name="t31_def_element"  property="des"/></td>
							</tr>
							</logic:equal>
							
							<logic:equal name="t31_def_element" property="caltype" value="3">
							
							<tr><td>子项分值：</td>
								<td><bean:write name="t31_def_element"  property="element_score"/></td>
								<td>是否允许调整：</td>
								<td><bean:write name="t31_def_element"  property="is_audit_disp"/></td>
								
							</tr>
							<tr>
							    <td>描述：</td>
								<td colspan="3"><bean:write name="t31_def_element"  property="des"/></td>
							</tr>
							</logic:equal>
							<logic:equal name="t31_def_element" property="caltype" value="4">
							<tr>
								<td>指标编码：</td>
								<td><bean:write name="t31_def_element"  property="indickey"/></td>
								<td>指标顺序：</td>
								<td><bean:write name="t31_def_element"  property="valnum"/></td>
							</tr>
							<tr><td>子项分值：</td>
								<td><bean:write name="t31_def_element"  property="element_score"/></td>
								<td>累计方式：</td>
								<td><bean:write name="t31_def_element"  property="is_sum"/>									
								</td>								
							</tr>
							<tr>
							    <td>是否允许调整：</td>
								<td><bean:write name="t31_def_element"  property="is_audit_disp"/></td>
								<td>描述：</td>
								<td><bean:write name="t31_def_element"  property="des"/></td>
							</tr>
							</logic:equal>
							
							<logic:equal name="t31_def_element" property="caltype" value="5">
							<tr>
								<td>指标编码：</td>
								<td><bean:write name="t31_def_element"  property="indickey"/></td>
								<td>指标顺序：</td>
								<td><bean:write name="t31_def_element"  property="valnum"/></td>
							</tr>
							<tr><td>子项分值：</td>
								<td><bean:write name="t31_def_element"  property="element_score"/></td>
								<td>累计方式：</td>
								<td><bean:write name="t31_def_element"  property="is_sum"/>							
								</td>			
							</tr>
							
							<tr>
							    <td>是否允许调整：</td>
								<td><bean:write name="t31_def_element"  property="is_audit_disp"/></td>
								<td>描述：</td>
								<td><bean:write name="t31_def_element"  property="des"/></td>
							</tr>
							</logic:equal>
						
						</table>

					</div>
				<logic:equal name="t31_def_element" property="caltype" value="5">
					<% 
							Map map=(Map)session.getAttribute("t31_def_elementscoreMap");
					        T31_def_element temp=(T31_def_element)request.getAttribute("t31_def_element");
							String elementkey=temp.getElementkey();
							List list=(ArrayList)map.get(elementkey);
							if(list==null)
							{
								list= new ArrayList();
							}
							pageContext.setAttribute("list",list,pageContext.PAGE_SCOPE);
					%>
				<div class="cond_t2">
		  			 <span class="buttons">
		    				 <strong><img src="../../images/blue/titleicon02.gif" />要点区间</strong>
		  			</span>
				 </div>
				
					<div class="list">
						<table border="0" cellpadding="0" cellspacing="0" id="tab">
						<tr>
							<th>最小值</th>
							<th>最大值</th>
							<th>得分</th>
							<th>简述</th>						
						</tr>
						<logic:iterate id="t31_def_elementscore" name="list" type="com.ist.aml.newrisk.dto.T31_def_elementscore" scope="page">
						
						
							<tr>
								<td >									
									<bean:write name="t31_def_elementscore" property="min_score"/>
								</td>
								
								<td>
									<bean:write name="t31_def_elementscore" property="max_score"/>
								</td>							
							
								<td>
									<bean:write name="t31_def_elementscore" property="score"/>
								</td>
								<td>
									<bean:write name="t31_def_elementscore" property="des"/>
								</td>
								
							
							</tr>
						</logic:iterate>
						</table>

				</div>
				</logic:equal>
			</div>
		</html:form>
	</BODY>
</HTML>
