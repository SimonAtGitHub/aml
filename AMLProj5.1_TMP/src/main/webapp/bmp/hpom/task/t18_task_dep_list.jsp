<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
    <html:base />
    <META http-equiv=Content-Type content="text/html; charset=GBK">
    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
       document.forms[0].action=theUrl;
       document.forms[0].submit();
	}
	function selectTask(){
	// var aaEle = listfrm.document.getElementById('aa');
	
	   var val;
	   var busval = "";
	   var displayval = "";
	   var typeval = "";
	   var granudiplayEleval = "";
	   var granuEleval = "";
	   var buskeyEle = parent.document.getElementById('businesskey_d');
	   var diplayEle = parent.document.getElementById('tasktype_diplay');
	   var typeEle = parent.document.getElementById('tasktype_d');
	   var granudiplayEle = parent.document.getElementById('granularity_diplay');
	   var granuEle = parent.document.getElementById('granularity_d');
	   //alert(buskeyEle);
	   var elements = document.getElementsByName('selectbuskey');
	   //alert(elements.length);
	   for(var i=0;i<elements.length;i++){
		//   alert("D----"+elements[i].value);
   		if(elements[i].checked){
   			val = elements[i].value.split("-");
   			
   			if(busval!=""){
   				busval+=","+val[0];
   				displayval+=","+val[1];
   				typeval+=","+val[2];
   				granudiplayEleval+=","+val[3];
   				granuEleval+=","+val[4];
   			}else{
   			   busval=val[0];
   			   displayval=val[1];
   			   typeval=val[2];
   			   granudiplayEleval=val[3];
   			   granuEleval=val[4];
   			}
   		}
   		
   		buskeyEle.value =  busval;
   		diplayEle.value = displayval;
   		typeEle.value = typeval;
   		granudiplayEle.value = granudiplayEleval;
   		granuEle.value = granuEleval;
	}
	    
  }
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
    <div>
        <html:form method="POST" action="/t18_tasklist/t18_task_time_dep.do" >
              <div class='awp_title'>
                <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0" style="display: none">
                    <tr>
                        <td>
                            <span class="awp_title_td2">任务依赖列表</span>
                        </td>
                        <td align="right">
                          <input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
                        </td>
                    </tr>
                </table>
                </div>
                <div class='awp_cond' id="searchtable" style="display: none">
				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
							任务类别：
						</td>
						<td>
							<html:select property="tasktype">
								<html:options collection="tasktypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
						<td>
							数据源编码：
						</td>
						<td>
							<html:select property="dskey">
								<html:options collection="dsMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							粒度：
						</td>
						<td>
							<html:select property="granularity">
								<html:options collection="granMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
						<td>
							业务编码：
						</td>
						<td>
							  <html:text property="businesskey" size="30" />
							  <input type="button" value="查 询"
								onclick="dosubmit('<%=request.getContextPath()%>/bmp/t18_tasklist/t18_task_dep_list.do?selfbusinesskey=<%=request.getAttribute("selfbusinesskey")%>&selftasktype=<%=request.getAttribute("selftasktype")%>&selfgranularity=<%=request.getAttribute("selfgranularity")%>');"/>
						</td>
					</tr>
				</table></div>
				<div class='awp_list'>
					<table>
						<tr align="center">
						<td width="5%" noWrap
							onclick='selectAllCheckBox(this,document.forms[0]);selectTask();'
							style='cursor: hand;'>
							全部
						</td>
							<td width="15%" nowrap>
								业务编码
							</td>
							<td width="15%" nowrap>
								任务类别
							</td>
							<td width="15%" nowrap>
								粒度
							</td>
							<td width="15%" nowrap>
								数据源编码
							</td>
							<!-- 
							<td width="8%" nowrap>
								是否时间依赖
							</td>
							<td width="8%" nowrap>
								是否任务依赖
							</td>
							 -->
						</tr>
						<logic:iterate id="dto" name="list"
							type="com.ist.bmp.hpom.dto.T18_tasklist">
							<TR align="center">
								<TD noWrap>
								<%
								  String taskval = dto.getBusinesskey()+"-"+dto.getTasktype_disp()+"-"+dto.getTasktype()+"-"+dto.getGranularity_disp()+"-"+dto.getGranularity();
								   if("1".equals(dto.getDepflag())){
								 %>
									<input type="checkbox" checked name="selectbuskey" value="<%=taskval %>" onclick="selectTask()">
								<%}else{ %>
									<input type="checkbox"  name="selectbuskey" value="<%=taskval %>" onclick="selectTask()">
								<%} %>
								</TD>
								<TD noWrap align="left">
										<bean:write name="dto" property="businesskey" />
									</TD>
									<TD noWrap align="left">
										<bean:write name="dto" property="tasktype" /> - <bean:write name="dto" property="tasktype_disp" />
									</TD>
									<TD noWrap>
										<bean:write name="dto" property="granularity_disp" />
									</TD>
									<TD noWrap align="left">
										<bean:write name="dto" property="dskey" />
									</TD>
									<!-- 
									<TD noWrap>
										<logic:equal name="dto" property="timedepflag" value="0">
											否 
                               			</logic:equal>
                               			<logic:equal name="dto" property="timedepflag" value="1">
                               				是
                               			</logic:equal>									
									</TD>
									<TD noWrap>
										<bean:write name="dto" property="taskdepflag" />
									</TD>
									 -->
							</TR>
						</logic:iterate>
					</table>
				</div>
        </html:form>
    </div>
     <SCRIPT LANGUAGE="JavaScript"> 
     selectTask();
     </SCRIPT>
</body>
</html:html>
