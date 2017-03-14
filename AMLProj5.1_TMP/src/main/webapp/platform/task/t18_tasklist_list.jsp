<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.platform.dto.*"%>
<%@ page import="com.ist.bmp.hpom.dto.T18_datasource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
		function dosubmit(theUrl,type){
		     var errMsg = "";
		    if( errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        if(errMsg!='')
		            alert(errMsg);
		        return false;
		    }
		}
		function dosubmit1(theUrl,currdskey){
			document.forms[0].currdskey.value=currdskey;
			dosubmit(theUrl,"search");
		}
		function taskanalysis(theUrl){
			 document.forms[0].action=theUrl;
		     document.forms[0].submit();
		}
		</SCRIPT>
	</head>

	<body class="mainbg">
			<html:form action="/t18_tasklist/t18_tasklist_list.do" method="post">
				<div id='main'>
				<div class="conditions">
				 	<div class="cond_t">
						<span>任务依赖管理</span>
						<span class="buttons">
								<%
								String currdskey = (String)request.getAttribute("currdskey");
								//if(!currdskey.equalsIgnoreCase("")){
								%>
								<!--<input type="button" name="btsearch2" value="自动设置依赖关系"
									onclick="dosubmit('t18_tasklist_autoset.do','');" />
								<input type="button" name="btsearch3" value="自动设置依赖关系"
									onclick="dosubmit('t18_tasklist_autodel.do','');" />
								--><a href="#" onclick="dosubmit('t18_tasklist_autoset.do','')">
									<img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />自动设置依赖关系
								</a>
								<a href="#" onclick="dosubmit('t18_tasklist_autodel.do','')">
									<img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删除依赖关系
								</a>
								<%
								//	}
								%>
								<!--<input type="button" name="btsearch4" value="全部校验"
									onclick="dosubmit('t18_task_dep_check_all.do','checkall');" />-->
								<a href="#" onclick="dosubmit('t18_task_dep_check_all.do','checkall')">
									<img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />全部校验
								</a>
						</span>
					</div>
					
					<div class='cond_c'>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
						<%
						ArrayList dsList = (ArrayList)request.getAttribute("t18_datasourceList");
						Iterator dsIter = dsList.iterator();
						String disabled = "";
						while(dsIter.hasNext()){
							T18_datasource t18_datasource = (T18_datasource)dsIter.next();
							String key = t18_datasource.getDskey();
							String val = t18_datasource.getDsname();
							if(currdskey.equalsIgnoreCase(key))
								disabled = "disabled";
							else
								disabled = "";
						%>
						<!--<input type="button" class="input" name="btsearch_<%=key %>" <%=disabled %> value="<%="ETL:"+key+"_"+val %>" onclick="dosubmit1('t18_tasklist_list.do?newsearchflag=1','<%=key %>');"/>-->
						<html:radio property="currdskey" value="<%=key %>" onclick="dosubmit1('t18_tasklist_list.do?newsearchflag=1','<%=key %>');" disabled="aa"> <%="ETL:"+key+"_"+val %></html:radio>
						<%
						}
						if(currdskey.equalsIgnoreCase(""))
								disabled = "disabled";
						else 
								disabled = "";
						%>
						<!--<input type="button" class="input" name="btsearch_dm" value="DM:计算" <%=disabled %> onclick="dosubmit1('t18_tasklist_list.do?newsearchflag=1','dm');" />-->
						<html:radio property="currdskey" value="" onclick="dosubmit1('t18_tasklist_list.do?newsearchflag=1','dm');">DM:计算</html:radio>
						<input type="hidden" name="currdskey" value="<%=currdskey %>"/>
								</td>
							</tr>
						</table>
					</div>
					
					<div class='cond_c' id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td text-lign="left" width="60px">
									任务类别：
								</td>
								<td>
								<%
								LinkedHashMap tasktypeMap = (LinkedHashMap)request.getAttribute("tasktypeMap");
								String[] tasktypes = (String[]) request.getAttribute("tasktypes");
								
								//
								Iterator tasktypeIter = tasktypeMap.keySet().iterator();
								while(tasktypeIter.hasNext()){
									String key = (String)tasktypeIter.next();
									String val = (String)tasktypeMap.get(key);
									String checked = "";
									//System.out.println("key="+key);
									for(int i=0;i<tasktypes.length;i++){
										String ch_type = tasktypes[i];
										//System.out.println("ch_type="+ch_type);
										if(ch_type.equalsIgnoreCase(key)){
											checked = "checked";
											break;
										}
									}
								%>
									<input type="checkbox" name="selectedtasktypekey" <%=checked %> value="<%=key %>" onclick="dosubmit('t18_tasklist_list.do?newsearchflag=1', 'search');"><%=key+"-"+val %>			
								<%
								}
								%>
								</td>
							</tr>
							<tr>
								<td>
									任务粒度：
								</td>
								<td>
								<%
								LinkedHashMap granularityMap = (LinkedHashMap)request.getAttribute("granularityMap");
								String[] granularitys = (String[]) request.getAttribute("granularitys");
								
								//
								Iterator granuIter = granularityMap.keySet().iterator();
								while(granuIter.hasNext()){
									String key = (String)granuIter.next();
									String val = (String)granularityMap.get(key);
									String checked = "";
									//System.out.println("key="+key);
									for(int i=0;i<granularitys.length;i++){
										String ch_type = granularitys[i];
										//System.out.println("ch_type="+ch_type);
										if(ch_type.equalsIgnoreCase( key )){
											checked = "checked";
											break;
										}
									}
								%>
									<input type="checkbox" name="selectedgranularitykey" <%=checked %> value="<%=key %>" onclick="dosubmit('t18_tasklist_list.do?newsearchflag=1', 'search');"><%=val %>			
								<%
								}
								%>
								</td>
							</tr>
							<tr>
								<td>
									业务编码：
								</td>
								<td>
									<html:text property="s_businesskey" size="30" />
									<input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('t18_tasklist_list.do?newsearchflag=1', 'search');"/>
								</td>
							</tr>
						</table>
					</div>
					
					<div class='list'>
						<table>
							<tr align="center">
								<th width="2%" nowrap>
									序号
								</th>
								<th width="8%" nowrap>
									任务类别
								</th>
								<th width="8%" nowrap>
									业务编码
								</th>
								<th width="4%" nowrap>
									粒度
								</th>
								<th width="8%">
									依赖任务类别
								</th>
								<th width="8%" nowrap>
									依赖任务类别:编码:粒度
								</th>
								<th width="8%" nowrap>
									是否时间依赖
								</th>
								<th width="8%" nowrap>
									操 作
								</th>
							</tr>
							<%
							HashMap taskDepandMap = (HashMap)request.getAttribute("taskDepandMap");
							%>
							<logic:notEmpty name="t18_tasklistList">
								<logic:iterate id="dto" name="t18_tasklistList"
									type="com.ist.platform.dto.T18_tasklist" indexId="index">
									<TR align="center">
										<TD noWrap><%= index.intValue() + 1 %></TD>
										<TD noWrap align="left">
											<bean:write name="dto" property="tasktype" />-<bean:write name="dto" property="tasktype_disp" />
										</TD>
										<TD noWrap align="left">
											<bean:write name="dto" property="businesskey" />
										</TD>
										<TD noWrap>
											<bean:write name="dto" property="granularity_disp" />
										</TD>
										<td noWrap align="left">
											<bean:write name="dto" property="tasktype_d" />-<bean:write name="dto" property="depandontype_disp" />
										</td>
										<TD noWrap align="left">
										<%
										String outStr = "";
										String key = dto.getTasktype()+"-"+dto.getBusinesskey()+"-"+dto.getGranularity();
										if(taskDepandMap.containsKey( key )){
											ArrayList subList = (ArrayList)taskDepandMap.get(key);
											Iterator subIter = subList.iterator();
											while(subIter.hasNext()){
												T18_task_depandon _t18_task_depandon = (T18_task_depandon)subIter.next();
												outStr += "<br>" + _t18_task_depandon.getTasktype_d()+"-"+_t18_task_depandon.getTasktype_d_disp()+":"+_t18_task_depandon.getBusinesskey_d()+":"+_t18_task_depandon.getGranularity_d_disp();
											}
											if(outStr.length()>=4){
												outStr=outStr.substring(4);
											}
										}else{
											outStr="NA";
										}
										%>
											<%=outStr %>
										</TD>
										<TD noWrap>
											<logic:equal name="dto" property="timedepflag" value="0">
												--否--<input type="button" class="in_button1" name="btn1" value="设置" onclick="dosubmit('t18_task_time_dep_do.do?type=depend&tasktype=<bean:write name="dto" property="tasktype" />&businesskey=<bean:write name="dto" property="businesskey" />&granularity=<bean:write name="dto" property="granularity" />');"/> 
	                               			</logic:equal>
	                               			<logic:equal name="dto" property="timedepflag" value="1">
	                               				--是--<input type="button" class="in_button1" name="btn1" value="取消" onclick="dosubmit('t18_task_time_dep_do.do?type=notdepend&tasktype=<bean:write name="dto" property="tasktype" />&businesskey=<bean:write name="dto" property="businesskey" />&granularity=<bean:write name="dto" property="granularity" />');" />
	                               			</logic:equal>
										</TD>
										<TD noWrap>
										    <a href="#"
												onclick="taskanalysis('<%=request.getContextPath()%>/platform/t18_tasklist/t18_task_dep_check.do?selectedbuskey=<bean:write name="dto" property="tasktype" />-<bean:write name="dto" property="businesskey" />-<bean:write name="dto" property="granularity" />')">依赖校验</a>&nbsp;
											<%
											//if(currdskey.equalsIgnoreCase("")){
											 %>
											<a href="#"
												onclick="taskanalysis('<%=request.getContextPath()%>/platform/t18_tasklist/t18_task_dep.do?businesskey=<bean:write name="dto" property="businesskey"/>&tasktype=<bean:write name="dto" property="tasktype" />&granularity=<bean:write name="dto" property="granularity" />')">任务依赖</a>&nbsp;
											<%//} %>
										</TD>
									</TR>
								</logic:iterate>
							</logic:notEmpty>
						</table>
					</div>
						<!-- list_page --> 
					<div class="list_page">
						<table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</div>
			   </div>
			</html:form>
	</body>

</html>