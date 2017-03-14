<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.bmp.hpom.dto.*"%>

<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
		function dosubmit(theUrl,type){
		     var errMsg = "";
		     if(type == 'del'){
				if(!confirm("确定删除依赖关系吗？")){
					 return false;
				}
			}
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

	<body>
		<div id='content'>
			<html:form action="/t18_tasklist/t18_tasklist_list.do" method="post">
				<div class='awp_title'>
					<table>
					<tr>
						<td>
							<span class="awp_title_td2">任务依赖管理</span>
						</td>
						<td width="84%" align="right">
							<%
							String currdskey = (String)request.getAttribute("currdskey");
							//if(!currdskey.equalsIgnoreCase("")){
							%>
							<input type="button" name="btsearch2" value="自动设置依赖关系"
								onclick="dosubmit('t18_tasklist_autoset.do','');" />
							<input type="button" name="btsearch3" value="删除依赖关系"
								onclick="dosubmit('t18_tasklist_autodel.do','del');" />	
							<%
							//	}
							%>
							<input type="button" name="btsearch4" value="全部校验"
								onclick="dosubmit('t18_task_dep_check_all.do','checkall');" />
						</td>
					</tr>
				</table>
				</div>
				<div class='awp_cond1'>
				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
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
				<input type="button" name="btsearch_<%=key %>" <%=disabled %> value="<%="ETL:"+key+"_"+val %>" onclick="dosubmit1('t18_tasklist_list.do?newsearchflag=1','<%=key %>');" />
				<%
				}
				if(currdskey.equalsIgnoreCase(""))
						disabled = "disabled";
				else 
						disabled = "";
				%>
				<input type="button" name="btsearch_dm" value="DM:计算" <%=disabled %> onclick="dosubmit1('t18_tasklist_list.do?newsearchflag=1','dm');" />
				<input type="hidden" name="currdskey" value="<%=currdskey %>"/>
						</td>
					</tr>
				</table>
				</div>		
				<div class='awp_cond' id="searchtable1">
				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
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
								if(ch_type.equalsIgnoreCase( key )){
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
							<input type="button" value="查 询"
								onclick="dosubmit('t18_tasklist_list.do?newsearchflag=1', 'search');"/>
						</td>
					</tr>
				</table></div>
				<div class='awp_dynamic_list'>
					<table>
						<tr align="center">
							<td width="2%" nowrap>
								序号
							</td>
							<td width="8%" nowrap>
								任务类别
							</td>
							<td width="8%" nowrap>
								业务编码
							</td>
							<td width="4%" nowrap>
								粒度
							</td>
							<td width="8%" nowrap>
								依赖任务类别:编码:粒度
							</td>
							<td width="8%" nowrap>
								是否时间依赖
							</td>
							<td width="8%" nowrap>
								操 作
							</td>
						</tr>
<%
HashMap taskDepandMap = (HashMap)request.getAttribute("taskDepandMap");
 %>
						<logic:notEmpty name="t18_tasklistList">
							<logic:iterate id="dto" name="t18_tasklistList"
								type="com.ist.bmp.hpom.dto.T18_tasklist" indexId="index">
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
											--否--<input type="button" name="btn1" value="设置" onclick="dosubmit('t18_task_time_dep_do.do?type=depend&tasktype=<bean:write name="dto" property="tasktype" />&businesskey=<bean:write name="dto" property="businesskey" />&granularity=<bean:write name="dto" property="granularity" />');"/> 
                               			</logic:equal>
                               			<logic:equal name="dto" property="timedepflag" value="1">
                               				--是--<input type="button" name="btn1" value="取消" onclick="dosubmit('t18_task_time_dep_do.do?type=notdepend&tasktype=<bean:write name="dto" property="tasktype" />&businesskey=<bean:write name="dto" property="businesskey" />&granularity=<bean:write name="dto" property="granularity" />');" />
                               			</logic:equal>
									</TD>
									<TD noWrap>
									    <a href="#"
											onclick="taskanalysis('<%=request.getContextPath()%>/bmp/t18_tasklist/t18_task_dep_check.do?selectedbuskey=<bean:write name="dto" property="tasktype" />-<bean:write name="dto" property="businesskey" />-<bean:write name="dto" property="granularity" />')">依赖校验</a>&nbsp;
										<%
										//if(currdskey.equalsIgnoreCase("")){
										 %>
										<a href="#"
											onclick="taskanalysis('<%=request.getContextPath()%>/bmp/t18_tasklist/t18_task_dep.do?businesskey=<bean:write name="dto" property="businesskey"/>&tasktype=<bean:write name="dto" property="tasktype" />&granularity=<bean:write name="dto" property="granularity" />')">任务依赖</a>&nbsp;
										<%//} %>
									</TD>
								</TR>
							</logic:iterate>
						</logic:notEmpty>
					</table>
				</div>
			</html:form>
		</div>
	</body>

</html>