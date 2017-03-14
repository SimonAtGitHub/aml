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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<%
				LinkedHashMap t07_case_model_strMap = (LinkedHashMap)request.getAttribute("t07_case_model_strMap");
				ArrayList modelList = (ArrayList)request.getAttribute("modelList");
				int size = modelList.size();
				int length = 1;
				if(size>0)
					length = 2;
			 %>
		<script language="JavaScript">
		var len=<%=length%>
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
	obj.style.cursor='';
	var tabnum = document.getElementById("alert_table").rows.length;
	//var stylems = obj.cells[1].childNodes[0].style.cursor;
	var rownum = obj.rowIndex;
	//if(stylems==''){
		for(var i=2;i<tabnum-1;i++){
		   if(i!=rownum){
			  document.getElementById("alert_table").rows(i).style.backgroundColor='#FFFFFF';
		   }
		}
	//}
	
	if(flag!=rownum){
		obj.cells[0].childNodes[0].checked = true;
		flag = rownum;
		Open(url);
	}	
}

function test(ftag){
 var objTR=document.getElementById("alert_table").rows(flag);
   var innerhtml = objTR.cells[objTR.cells.length-2].innerHTML;
  // alert(innerhtml);
   innerhtml = innerhtml.replace(" ","");
   if((innerhtml == '已排除' && (ftag == '处理中')) || (innerhtml != '已排除' && (ftag == '已排除'))){
	   document.getElementById("alert_table").rows(flag).cells[objTR.cells.length-2].innerHTML=ftag;
	  
	   var k = flag-1;  
	   if(len==2){
	     k=k-1;
	   }
	   if(ftag == '处理中'){ 
	       document.getElementById('a'+k).style.display='none';
	       document.getElementById('b'+k).style.display='';
	   }else{  
	       document.getElementById('a'+k).style.display='';
	       document.getElementById('b'+k).style.display='none';
	   }
	    
       var url = document.getElementById("alert_table").rows(flag).url;
	   var iframe1 = document.getElementById('down');
       iframe1.src = url;  alert("提交成功！");
       window.ymPrompt.close();
	   <%--var frame1 = document.getElementById('down').contentWindow.document;
	   var trantabnum = frame1.all.trans_table.rows.length;
	   for(var i=1;i<trantabnum;i++){
	       frame1.all.trans_table.rows(i).cells[11].innerHTML=ftag;
	       var j = i - 1; 
	       if(ftag == '处理中'){
	          if(frame1.getElementById('a'+j) != null){
	             frame1.getElementById('a'+j).style.display='';
	          }
	          if(frame1.getElementById('b'+j) != null){
	             frame1.getElementById('b'+j).style.display='';
	          }
	          //frame1.getElementById('a'+j).style.display='';
	          //frame1.getElementById('b'+j).style.display='none';
	          
	          frame1.getElementById('ind'+j).style.display='';
	       }else{
	          if(frame1.getElementById('a'+j) != null){
	             frame1.getElementById('a'+j).style.display='none';
	          }
	          if(frame1.getElementById('b'+j) != null){
	             frame1.getElementById('b'+j).style.display='none';
	          }
	          //frame1.getElementById('a'+j).style.display='none';
	          //frame1.getElementById('b'+j).style.display='';
	          
	          frame1.getElementById('ind'+j).style.display='none';
	       }
	   }--%>
   }
}
</script>
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/stcr_disp.do">
			<html:errors />
			<div class="cond_t2">
				<span class="buttons">
				   <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />特征信息</strong>
				   <logic:equal name="ctrl_trans" value="1">				  
				   <strong>
				           <logic:equal name="credittask" property="is_grey" scope="session" value="0"><a style="position:absolute;right:30px;cursor:hand;" href="<%=request.getContextPath() %>/report/case/control_trans.do?is_grey=<bean:write name="credittask" property="is_grey" scope="session"/>"><img src="../../images/blue/b_maintenance.png" />交易补录控制中</a></logic:equal>
				           <logic:equal name="credittask" property="is_grey" scope="session" value=""><a style="position:absolute;right:30px;cursor:hand;" href="<%=request.getContextPath() %>/report/case/control_trans.do?is_grey=<bean:write name="credittask" property="is_grey" scope="session"/>"><img src="../../images/blue/b_maintenance.png" />交易补录控制中</a></logic:equal>
				           <logic:equal name="credittask" property="is_grey" scope="session" value="1"><span style="position:absolute;right:30px;"><img src="../../images/blue/b_maintenance.png" />交易补录已放开</span></logic:equal>				           
				   </strong>
				 </logic:equal>
				
				</span>
			</div>
			
			
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" id="alert_table">
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
						<th rowspan="<%= length%>">
							操作
						</th>
					</tr>
					<logic:equal name="model_flag" value="1">
					<tr>
					<%
						Iterator iter1 = modelList.iterator();
						while (iter1.hasNext())
						{
							T07_case_stcr temp1 = (T07_case_stcr) iter1.next();
							String model_no = temp1.getModel_no();
							String model_name = temp1.getModel_name();
							String matching_disp = temp1.getMatching().toString();
							String aaa = request.getContextPath() + "/mfa/module/module_disp2.do?module_no=" + model_no;
					 %>
						<th title="<%=model_name%>">
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
						   	 url = url + "/report/case/stcr_main_list.do?stcr="
								  + stcr.getStcr() + "&application_num=" + stcr.getApplication_num() + "&newsearchflag=1";
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
								<logic:equal value="2" name="stcr" property="flag">
								（>=<bean:write name="stcr" property="rulevalue" scope="page" />）
								</logic:equal>
							</td>
							<logic:equal name="model_flag" value="1">
							<%
								LinkedHashMap temp = new LinkedHashMap();
								if(t07_case_model_strMap.size() > 0)
								{
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
								}
								else
								{
									for(int k = 0;k<size;k++)
									{
									%>
									<td></td>
							<%
									}
								}
							%>
							</logic:equal>
							<td>
								<bean:write name="stcr" property="status_disp" scope="page" />
							</td>
							<td>
								<logic:equal name="creditTask" property="post_id" value="P0102">
								<logic:notEmpty name="stcr" property="status">
									<!-- 
									<logic:equal name="creditTask" property="cast_type" value="2">
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/modifyT07_case_stcr.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&newsearchflag=1',width:580,height:380,title:'特征代码修改',handler:handler,iframe:true,fixPosition:true,dragOut:false});">特征代码修改</a>
									</logic:equal>
									 -->
									<logic:equal name="stcr" property="status" value="4">
									  <a href="#" id='a<bean:write name="number"/>' onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=2&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'恢复',handler:handler,iframe:true,fixPosition:true,dragOut:false});">恢复</a><a href="#" id='b<bean:write name="number"/>' style="display: none" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=1&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'排除',handler:handler,iframe:true,fixPosition:true,dragOut:false});">排除</a>
								    </logic:equal>
								    <logic:notEqual name="stcr" property="status" value="4">
									  <a href="#" id='a<bean:write name="number"/>' style="display: none" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=2&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'恢复',handler:handler,iframe:true,fixPosition:true,dragOut:false});">恢复</a><a href="#" id='b<bean:write name="number"/>'  onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=1&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'排除',handler:handler,iframe:true,fixPosition:true,dragOut:false});">排除</a>
								    </logic:notEqual>
								</logic:notEmpty>
								</logic:equal>
								<logic:equal name="creditTask" property="post_id" value="P0302">
								<logic:notEmpty name="stcr" property="status">
									<!-- 
									<logic:equal name="creditTask" property="cast_type" value="2">
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/modifyT07_case_stcr.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&newsearchflag=1',width:580,height:380,title:'特征代码修改',handler:handler,iframe:true,fixPosition:true,dragOut:false});">特征代码修改</a>
									</logic:equal>
									 -->
									<logic:equal name="stcr" property="status" value="4">
									  <a href="#" id='a<bean:write name="number"/>' onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=2&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'恢复',handler:handler,iframe:true,fixPosition:true,dragOut:false});">恢复</a><a href="#" id='b<bean:write name="number"/>' style="display: none" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=1&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'排除',handler:handler,iframe:true,fixPosition:true,dragOut:false});">排除</a>
								    </logic:equal>
								    <logic:notEqual name="stcr" property="status" value="4">
									  <a href="#" id='a<bean:write name="number"/>' style="display: none" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=2&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'恢复',handler:handler,iframe:true,fixPosition:true,dragOut:false});">恢复</a><a href="#" id='b<bean:write name="number"/>'  onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi_add.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&flag=1&objtype=1&rowtable=<bean:write name="number"/>',width:580,height:360,title:'排除',handler:handler,iframe:true,fixPosition:true,dragOut:false});">排除</a>
								    </logic:notEqual>
								</logic:notEmpty>
								</logic:equal>
								<logic:notEmpty name="stcr" property="status">
								<a href="#"   onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&objtype=1',width:580,height:360,title:'查看',handler:handler,iframe:true,fixPosition:true,dragOut:false});">查看</a>
								</logic:notEmpty>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
			<iframe id="down" src="#" scrolling="no" height="500" width="100%" name="test" frameborder="0"></iframe>
		</html:form>
	</body>
</html>
