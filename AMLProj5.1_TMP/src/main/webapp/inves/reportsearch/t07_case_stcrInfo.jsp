<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.lang.String"%>
<%@ page import="java.lang.Double"%>
<%@page import="com.ist.aml.report.dto.T07_case_stcr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<%
			String url = request.getContextPath();
		String cssurl=url+"/css/aml_"+session.getAttribute("style")+".css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<!-- <link rel="stylesheet" href=<%=cssurl%> type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript">
		function _Open(url){
			   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
			}
function Open(url){
   var iframe1 = document.getElementById('down');
   iframe1.src = url;
      
}
var flag = -1;
function checkonMouseOver(obj){
	var rownum = obj.rowIndex;
	if(flag!=rownum){
		obj.style.cursor='hand';
	}
	obj.style.backgroundColor='#ECF3FF'
}
function checkonmouseout(obj){
	var rownum = obj.rowIndex;
	obj.style.cursor='';
	if(flag!=rownum){
		obj.style.backgroundColor='#FFFFFF';
	}
}
function onclicktr(obj,url){
if(url != "")
{
var case_type=document.forms[0].case_type.value;
url=url+"&case_type="+case_type;
	obj.style.cursor='';
	var tabnum = document.getElementById("alert_table").rows.length;
	var rownum = obj.rowIndex;
		for(var i=2;i<tabnum-1;i++){
		   if(i!=rownum){
			  document.getElementById("alert_table").rows(i).style.backgroundColor='#FFFFFF';
		   }
		}
	if(flag!=rownum){
		obj.cells[0].childNodes[0].checked = true;
		flag = rownum;
		Open(url);
	}	
}
}
</script>
	</head>
	<body id="iframecontent">
			<html:form method="post" action="/case/caseStcrInfo.do">
			<input type="hidden" name="case_type" value="<bean:write  name="cast_type"  />"/>
			<input type="hidden" name="casesearchtime" value="<bean:write  name="casesearchtime"  />"/>
				<html:errors />
				<div class="cond_t2">
					<span class="buttons"> 
					   <strong><img src="../../images/blue/titleicon02.png" />特征信息</strong> 
					</span>
				</div>
				<%
				LinkedHashMap t07_case_model_strMap = (LinkedHashMap)request.getAttribute("t07_case_model_strMap");
				ArrayList modelList = (ArrayList)request.getAttribute("modelList");
				int size = modelList.size();
				int length = 1;
				if(size>0)
					length = 2;
			    %>
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0" id='alert_table'>
						<tr class="listrowspan">
						
							<th rowspan="<%= length%>">
							选择
						</th>
						<th rowspan="<%= length%>">
							特征代码
						</th>
						<th rowspan="<%= length%>">
							特征描述
						</th>
						<logic:equal name="model_flag" value="1">
						<th colspan="<%= size%>">
							模型（匹配度）
						</th>
						</logic:equal>
						<th rowspan="<%= length%>">
							处理状态
						</th>
						<%--<th rowspan="<%= length%>">
								操作
							</th>
						--%></tr>
				<logic:equal name="model_flag" value="1">
					<tr>
					<%
						Iterator iter1 = modelList.iterator();
						while (iter1.hasNext())
						{
							T07_case_stcr temp1 = (T07_case_stcr) iter1.next();
							String model_no = temp1.getModel_no();
							String matching_disp = temp1.getMatching().toString();
							String aaa = request.getContextPath() + "/mfa/module/module_disp2.do?module_no=" + model_no;
					 %>
						<th>
						<a href="#" onClick="ymPrompt.win({message:'<%=aaa %>',width:600,height:330,title:'定位',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
							<%=model_no%>(<%=matching_disp %>%)</a>
						</th>
					<%
						}
					%>
				  </tr>
				</logic:equal>
						<logic:iterate id="stcr" name="t07_stcrList"
							type="com.ist.aml.report.dto.T07_case_stcr" indexId="number">
							<%
								java.util.HashMap map = new java.util.HashMap();
												map.put("stcr", stcr.getStcr());
											
												pageContext.setAttribute("map", map,
														PageContext.PAGE_SCOPE);
							%>
							<%
								url = request.getContextPath();
								String bb = stcr.getStatus();
								if(!"".equals(bb))
						   	 		url = url + "/inves/case/t07_stcr_main.do?stcr="
									  + stcr.getStcr() + "&application_num=" + stcr.getApplication_num() +"&case_type=" + request.getAttribute("cast_type") + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
								else
									url = "";
								String aa = stcr.getStcr();
							%>
							<tr onclick="onclicktr(this,'<%=url%>')" url="<%=url%>">
	
								<td>
									<input type="radio" name="rad1" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr" scope="page" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr_disp" scope="page" />
								</td>
								<logic:equal name="model_flag" value="1">
							<%
								LinkedHashMap temp = new LinkedHashMap();
								temp = (LinkedHashMap) t07_case_model_strMap.get(aa);
								Iterator iter2 = modelList.iterator();
								while (iter2.hasNext())
								{
									T07_case_stcr temp2 = (T07_case_stcr) iter2.next();
									String model_no2 = temp2.getModel_no();
							%>
									<td>
							<%
									if(temp.containsKey(model_no2))
									{
					 		%>
									<img src="../../images/blue/b_submit.png" />
							<%
									}
							%>
									</td>
							<%
							}
							%>
							</logic:equal>
								<td>
									<bean:write name="stcr" property="status_disp" scope="page" />
								</td>
								<%--<td>
								<logic:notEmpty name="stcr" property="status">
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&party_id=<bean:write name="stcr" property="party_id"/>',width:580,height:360,title:'查看',handler:handler,iframe:true,fixPosition:true,dragOut:false});">查看</a>
								</logic:notEmpty>
								</td>
							--%></tr>
						</logic:iterate>
					</table>
				</div>
				
				<iframe id="down" src="#" scrolling="no" height="500" width="100%" name="test" frameborder="0"></iframe>
			</html:form>
	</body>
</html>