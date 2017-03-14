<%@ page contentType="text/html; charset=GBK"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.Map"%>
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
		<script src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >	
				  <table>
				    <logic:notEmpty name="chartMap">   
				    <%
				    int groupnum = 0;
				    try {
				        groupnum = Integer.parseInt((String)request.getAttribute("groupnum"));
				    }catch(Exception e){
				    }
				    Map temp = null;
				    int length = 0;
				    try {
				        temp = (Map)request.getAttribute("chartMap");
				        length = temp.size() -1 ;
				    }catch(Exception e){
				    }
				     %>
				    <logic:iterate id="map" name="chartMap" indexId="i" >
				        <%
				          int ind = i.intValue();
				         %>
				        <bean:define id="chart" name="map" property="value"></bean:define>
				        <logic:equal value="0" name="groupnum">
				            <bean:define id="result"  value="1"></bean:define>
				        </logic:equal>
				        <logic:notEqual value="0" name="groupnum">
				            <bean:define id="result"  value="<%=String.valueOf(ind%groupnum) %>"></bean:define>
				        </logic:notEqual>				        
				        
				        <logic:equal value="0" name="i">
				            <tr>
				        </logic:equal>
				        
				        <logic:notEqual value="0" name="i">
				            <logic:equal value="0" name="result">
				               </tr>
				               <tr>
				            </logic:equal>
				        </logic:notEqual>

				            <td>
				                <div align="center" id="chart_<bean:write name="map" property="key" /><bean:write name="i" />" style="border: 0px solid">
				                </div>
				                <script>
				                    var template = '<bean:write name="chart" property="chartTemplate"/>';
				                    var data = '<bean:write name="chart" property="chartData" filter="false"/>';
				                    var height = '<bean:write name="chart" property="heigth"/>';
				                    var width = '<bean:write name="chart" property="width"/>';
				                    var id = '<bean:write name="map" property="key"/>';
				                    var index = '<bean:write name="i" />';
				                    //alert("template:"+ template);
				                    //alert("data:"+ data);
				                    //alert("id:"+ id);
				                    
				                    var chart1 = new FusionCharts('../charts/'+template, id+index, width, height, '0', '0');
				                    chart1.setDataXML("'" + data + "'");
				                    chart1.render("chart_"+id+index);
				                </script>
				            </td>
				            
				            <logic:equal value="<%=String.valueOf(length) %>" name="i">
				                </tr>
				            </logic:equal>
				        
				    </logic:iterate>
				    </logic:notEmpty>
				  </table>			
	</BODY>
	
</HTML>
