<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<jsp:useBean id="dblinkkey" class="java.lang.String" scope="request"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/aml.js"></script>
		<script type="text/javascript" src="../js/basefunc.js"></script>
		<script type="text/javascript" src="../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, type) {
		var errMsg = "";
		var isSub = false;
		if (type == 'add') {
			isSub = true;
		}		
		var dskey=document.getElementById('dskey').value;
		if(dskey==null || dskey.length==0){
			alert('请选择业务数据源！');
			return;
		}
		if (isSub && errMsg == '') {
			document.forms[0].action = theUrl+"?dskey="+dskey;
			document.forms[0].submit();

		} else {
			if (errMsg != '')
				alert(errMsg);
			return false;
		}
	}
	
	function dbTabLocation(dskey,dblinkkey){		
		if(dskey==null || dskey.length==0){
			alert('请选择业务数据源！');
			return;
		}
		if(dblinkkey==null || dblinkkey.length==0){
			alert('连接失败，请联系管理员');
			return;
		}	
		document.forms[0].action = "ods_tab_location_do.do?dskey="+dskey+"&dblinkkey="+dblinkkey;
		document.forms[0].submit();	
  	}
  	//提交前，循环checkbox，被选中的重新赋值为 tableename||tablecname||des
	function checkForm(theUrl){
		var isSub = false;
		if(confirm('确定导入？')){
            isSub = true;
        }
        if(isSub){
			var select_tableename = document.getElementsByName('select_tableename');		
			for(var i=0; i<select_tableename.length; i++){
				var a = select_tableename[i];			
				if(a.checked){
					var b = a.parentNode.parentNode.lastChild.previousSibling.firstChild.value;   //表中文名value			
					var c = a.parentNode.parentNode.lastChild.firstChild.value;  //备注value
					//赋值给checkbox的value
					a.value = a.value +"||"+b+"||"+c;					
				}
			}
			document.forms[0].action = theUrl;
			document.forms[0].submit();
        }

		
	}
	var flag=true;
	function selectAllCheckBox(obj,fm){
		if(typeof(fm.tableename)=="undefined"){
			return false;
		}
		if(flag){
			for(var i=0;i<fm.tableename.length;i++){
				fm.tableename[i].checked=flag;
			}
			flag=false;
		}else{
			for(var i=0;i<fm.tableename.length;i++){
				fm.tableename[i].checked=flag;
			}
			flag=true;
		}
	}

</SCRIPT>
	</HEAD>
<body class="mainbg">
			<html:form action="/ods_tab_location_do.do" method="POST">
			<html:errors/>
			<input type="hidden" name="dblinkkey" value="<bean:write name="dblinkkey"/>"/>
			<div id="main">
				<!-- conditions --> 
					  <div class="conditions">
							<div class="awp_wrap">
							  <!-- 标题区域 -->
							    <div class="cond_t">
									<table>
										<tr>
											<td width="23%" nowrap="nowrap">
												<span class="awp_title_td2">ODS数据区 - 数据库表名列表 </span>
											</td>
											<td align="right">
												<html:button property="button2" value="确 定" styleClass="in_button1"
													onclick="dosubmit('t18_ods_table_add_do.do','add')" />
												<html:button property="button2" value="关 闭" styleClass="in_button1"
													onclick="window.close();" />
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="cond_c2">
				 	 			<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td noWrap>
											业务数据源名称：
										</td>
										<td>							
											<select id="dskey">
												<option value="">--请选择--</option>
												 <logic:iterate id="dto" name="t18_datasource_list"
														type="com.ist.bmp.hpom.dto.T18_datasource">
														<%
															String dskey = dto.getDskey();
														%>
														<logic:notEqual value="<%=dskey %>" name="dskey">																		
															<option value="<%=dskey %>">
																<bean:write name="dto" property="dskey"  /> - <bean:write name="dto" property="dsname"  />								
															</option>
														</logic:notEqual>
														<logic:equal value="<%=dskey %>" name="dskey">
															<option value="<%=dskey %>" selected="selected">											
																<bean:write name="dto" property="dskey"  /> - <bean:write name="dto" property="dsname"  />								
															</option>
														</logic:equal>
																												
												</logic:iterate>
											</select>
											<input type="button" value="查 询" onclick="dbTabLocation(document.getElementById('dskey').value,document.forms(0).dblinkkey.value)" class="in_button1"/>
										</td>						
									</tr>
								</table>
							</div>
							<div class="list">
	  	 						<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<th width="5%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>
											全部
										</th>
										<th width="5%">
											序号
										</th>
										<th width="10%">
											表英文名
										</th>
										<th width="30%">
											表中文名
										</th>
										<th>
											粒度
										</th>
										<th width="30%">
											备注
										</th>
									</TR>
					<% Map granularitymap = (Map)request.getAttribute("granularitymap"); %>
						<logic:notEmpty name="list">
							<logic:iterate id="dto" name="list" indexId="ind" offset="0"
								type="com.ist.common.metadata.dto.T01_mt_property">
								<TR align="center" bgcolor="#FFFFFF">
									<TD height=22>
										<input type="checkbox" name="tableename" value="<%=dto.getTableename() %>" />
									</TD>
			
									<TD height=22>
										<%=ind.intValue() + 1%>
									</TD>
			     
									<TD height=22 align="left">
										<bean:write name="dto" property="tableename" scope="page" />
									</TD>
									<TD height=22>							
										<input name="tablecname_<%=dto.getTableename() %>"  value="<%=dto.getTablecname() %>"size="25"/>
									</TD>
									<td>
										<select name="granularity_<%=dto.getTableename() %>">
											<%									
												if(granularitymap != null && !granularitymap.isEmpty()){
													Iterator it = granularitymap.keySet().iterator();
													while(it.hasNext()){
														String value = (String)it.next();
														String key = (String)granularitymap.get(value);
														%>
														<option value="<%=value%>"><%=key %></option>
													<%}
												}
											%>								
											
										</select>
									</td>
									<td>
										<input name="des_<%=dto.getTableename() %>"  size="25"/>
									</td>
								</TR>
							</logic:iterate>
							<input type="hidden" name="dskey" value="<bean:write name="dskey"/>"/>				
						</logic:notEmpty>
					</table>
				</div>
			</div>
			</div>
			</html:form>
		</div>
	</BODY>
</HTML>
