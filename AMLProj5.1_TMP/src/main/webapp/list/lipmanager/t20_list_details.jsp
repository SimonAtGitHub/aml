<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
  </HEAD>
<BODY>
<div id="main">
	<html:form method="POST"
			action="/lipmanager/t20_list_details.do">
			<html:hidden property="tablecode"/>
		
			
			<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>详细信息</span>
						<span class="buttons">
						    <a href="#" onclick="window.close();"><img src="../../images/blue/b_shut.png"></img>关 闭</a>							
						</span>
						
					</div>
			</div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="false"/>
			</html:messages>
			
			<div class="cond_c2">
			<table>
			<%
				Map disp=(Map)request.getAttribute("dispMap");
				int length=disp.size();
				
			 	String flag="";//奇偶标志
			    if (length%2==0)
			    {
					flag="even";//偶数				    
			    }else
			    {
			    	flag="odd";//奇数
			    }
				
				
			 %>
			 <bean:define id="colflag" value="<%=flag%>"/>
			
			<logic:iterate id="col" name="dispMap" indexId="i">
			
			<% 
				String my_i=i.intValue()%2+"";
			%>
			<bean:define id="index" value="<%=my_i%>"/>
			
			<logic:equal value ="0" name="index" >
            		
             <tr>
            </logic:equal>
			<td valign="top" style="width:15%;">
				<bean:write name="col" property="key"/>	：
			</td>
			<td valign="top"  style="white-space:normal;width:35%;word-break:break-all;table-layout:fixed;" nowrap>
				<bean:write name="col" property="value"/>	
					
			</td>
						
			<logic:equal value ="1" name="index" >
             </tr>
            </logic:equal>
            
			</logic:iterate>
			<logic:equal value="odd" name="colflag">
			<td></td>	
			<td></td>			
			</logic:equal>
			
			<logic:equal value="even" name="colflag">
			</tr>			
			</logic:equal>
			
			
			
			</table>
			
			</div>
		</html:form>
	
</BODY>
</div>
</HTML>

