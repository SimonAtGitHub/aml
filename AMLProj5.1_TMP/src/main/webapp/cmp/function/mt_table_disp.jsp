<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@page import="com.ist.common.metadata.dto.T01_mt_col_pro"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="JavaScript">
function dosubmit(theUrl,theType){
    var errMsg = "";
    if(theType=="export"){
      <logic:present name="list">
       <bean:size id="len" name="list" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据，请查询！');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
    }
    if(errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}

</script>
</head>
	<body class="mainbg">
	<html:form action="/function/mt_table_disp.do" method="post">
		<div id="main">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<html:hidden property="tableename" />
						<html:hidden property="tablekey" />
						<span> <bean:write name="T01_mt_propertyActionForm" property="tableename" />数据 </span>
						<span class="buttons">
						<a href="#" onclick="dosubmit('../function/t10_mt_property_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
						<a href="#" onclick="dosubmit('mt_table_disp.do?dispatcher=export&flag=1','export')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出</a>
						
						</span>			
					</div>
					<div class="cond_c" >
						<table border="0" cellspacing="0" cellpadding="0">
						<%LinkedHashMap map_qc = (LinkedHashMap) request.getAttribute("map_qc");
						  LinkedHashMap map_target = (LinkedHashMap) request.getAttribute("map_target");
						  int n = 1;
						  int size_qc = map_qc.size();
						  boolean is_even = true;
						  if(size_qc%2 != 0)
						  	is_even = false;
						  Iterator iter_qc = map_qc.keySet().iterator();
						  while(iter_qc.hasNext())
						  {
						  	String colkey = (String)iter_qc.next();
						  	List temp_qc = (List)map_qc.get(colkey);
						  	String key1 = (String)temp_qc.get(0) + "：";
						  	String key2 = (String)temp_qc.get(1);
						  	String qc_type = (String)temp_qc.get(3);
						  	String targetcd = (String)temp_qc.get(4);
						  	String time_start = (String)temp_qc.get(5);
						  	String time_end = (String)temp_qc.get(6);
						  	
						  	if(n%2==1)
						  	{
						  	%>
						  	<tr>
						  		<%if("2".equals(qc_type))
						  		{
						  		 %>
						 		<td><%=key1%></td>
						 		<td><input type="text" name="<%=key2%>"/></td>
						 		<%}
						 		  else if("1".equals(qc_type))
						 		  {
						 		 %>
						 		<td><%=key1%></td>
								<td>
								 <input type="text" name="<%=time_start%>" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
									-
								 <input type="text" name="<%=time_end%>" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
								</td>
								<%}
						 		  else if("0".equals(qc_type))
						 		  {
						 		  	LinkedHashMap map_hash=(LinkedHashMap)map_target.get(colkey);
						 		  	Iterator iter_hash = map_hash.keySet().iterator();
						 		 %>
						 		 <td><%=key1%></td>
								<td>
									<select name="<%=key2%>" style="width:116px;">
										<option value="" selected="selected">--请选择--</option>
										<% while(iter_hash.hasNext())
										{
		                                   String key_hash=(String)iter_hash.next();
		                                   String val_hash=(String)map_hash.get(key_hash);
	                                     %>
	                                    <option value="<%=key_hash%>"><%=val_hash%></option>
						                <%  } %>
									</select>
								</td>
						  	<%    }
						  		 else if("3".equals(qc_type))
						 		  {
						 		   %>
						 		<td><%=key1%></td>
								<td>
									<input type="text" name="<%=key2%>" size="10"/>
									<input type="text" name="<%=key2%>_disp" size="23" readonly="true"/>
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=<%=key2%>&input_name_disp=<%=key2%>_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
									<span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span>
									</a>
								</td>
								<%}
						  		if(!is_even && n==size_qc)
						  		{
						  	%>	
						  		<td></td>
						  		<td><html:button property="button" styleClass="in_button1" value="查  询" onclick="dosubmit('mt_table_disp.do?flag=1&newsearchflag=1&dispatcher=search')" /></td>
						  	<%	
						  		}
						  		n++;
						  	}
						  	else if(n%2==0)
						  	{
						  	 	if("2".equals(qc_type))
						  		{
						  		 %>
						 		<td><%=key1%></td>
						 		<td><input type="text" name="<%=key2%>"/></td>
						 		<%}
						 		  else if("1".equals(qc_type))
						 		  {
						 		 %>
						 		<td><%=key1%></td>
								<td>
								 <input type="text" name="<%=time_start%>" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
									-
								 <input type="text" name="<%=time_end%>" onclick="calendar.show(this);" readonly="true" class="calimg" size="12"/>
								</td>
								<%}
						 		 else if("0".equals(qc_type))
						 		  {
						 		  	LinkedHashMap map_hash=(LinkedHashMap)map_target.get(colkey);
						 		  	Iterator iter_hash = map_hash.keySet().iterator();
						 		 %>
						 		 <td><%=key1%></td>
								<td>
									<select name="<%=key2%>" style="width:116px;">
										<option value="" selected="selected">--请选择--</option>
										<% while(iter_hash.hasNext())
										{
		                                   String key_hash=(String)iter_hash.next();
		                                   String val_hash=(String)map_hash.get(key_hash);
	                                     %>
	                                    <option value="<%=key_hash%>"><%=val_hash%></option>
						                <%  } %>
									</select>
								</td>
						  	<%    }
						  		 else if("3".equals(qc_type))
						 		  {
						 		   %>
						 		<td><%=key1%></td>
								<td>
									<input type="text" name="<%=key2%>" size="10"/>
									<input type="text" name="<%=key2%>_disp" readonly="true" size="23" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=<%=key2%>&input_name_disp=<%=key2%>_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
									<span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span>
									</a>
								</td>
						  <%    } %>
						 	</tr>
						 	<%
						  		n++;
						  	}
						   }
						  if(is_even)
						  {
						 %>
							<tr>
								<td></td>
								<td>
								</td>
								<td></td>
								<td>
									<html:button property="button" styleClass="in_button1" value="查  询" onclick="dosubmit('mt_table_disp.do?flag=1&newsearchflag=1','search')" />
								</td>
							</tr>
						 <%}
						 %>
							
							
							
							
							
							
						</table>
					</div>
				</div>
				
				
				
				
				
				
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<%ArrayList export_list = (ArrayList)request.getAttribute("export_list");
							  int size = export_list.size();
							  Iterator iter = export_list.iterator();
							   while (iter.hasNext())
								  {
								  	T01_mt_col_pro t01_mt_col_pro = (T01_mt_col_pro) iter.next();
								  	String colcname = t01_mt_col_pro.getColcname();
							%>
							<th>
								<%=colcname%>
							</th>
							<%  } %>
						</tr>
					
					
					
					
						<% ArrayList list = (ArrayList)request.getAttribute("list");
						   Iterator iter_list = list.iterator();
						   while (iter_list.hasNext())
						   {
						   	T01_mt_col_pro t01_mt_col_pro1 = (T01_mt_col_pro) iter_list.next();
						   	String[] export_list1 = t01_mt_col_pro1.getExport_list1();
						 %>
							<TR align="left">
								<%
								  for (int i = 0; i < export_list1.length; i++)
								  {
								 %>
								<TD><%=export_list1[i]%></TD>
								<%  } %>
							</TR>
						<%  } %>
					
					
				</table>
			</div>
			<!-- list_page -->
			<div class="list_page">
				    <logic:present name="pageInfo">
					    <bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
			</div>	
		</div>			
		</html:form>
	</body>
</html>
