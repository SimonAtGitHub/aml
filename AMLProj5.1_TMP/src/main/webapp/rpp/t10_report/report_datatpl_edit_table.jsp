<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.ist.rpp.common.report.*"%>
<%@ page import="java.util.*"%>

<html>
	<head>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" rel="stylesheet" type="text/css">

		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript">
		jQuery.noConflict();
		(function($){ 
		  $(function(){
			$(document).ready(function(){	
			    $('.report_title span a:first').css('background','none');
				$('.report_table_t div[name=slide]').toggle(function(){
				      $(this).removeClass().addClass('btndown').parent().next().slideUp();
				   },
				   function(){
				      $(this).removeClass().addClass('btnup').parent().next().slideDown();
				});
			});
			
		// All End
		  });
		})(jQuery);
		</script>
		<SCRIPT LANGUAGE="JavaScript"> 
    function dosubmit(theUrl){
        document.forms[0].actiontype.value="";
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
    }
    
	function checkForm(theUrl,act){
	    var errMsg ="";
	    if(act=='del'){
	    	var question = confirm("确实要删除此表格吗?")  
			if (question !="0"){
				document.forms[0].actiontype.value="table_del"
			}else{
				return;
			}
	    }
	    else if(act=='edit'){
		    /**
		    if(getLength(document.forms[0].report_des.value)==0){
		        errMsg="报表描述不能为空！";
		        document.forms[0].report_des.focus();
		    }**/
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	        parent.xmlFrame.dosubmit();
	    }
	}
	
	function changeChkbox(eleName){
		
		if (true == document.getElementById("define_"+eleName).checked){
			document.getElementById(eleName).style.display = "";
			document.getElementById("define_"+eleName).value = "tempchecked";
		}else{
			document.getElementById(eleName).style.display = "none";
			document.getElementById("define_"+eleName).value = "";
		}
	}
	
	function changeDynamci(){
		if ("normal" == document.getElementById("type").value){
			document.getElementById("dynamic").style.display = "none";
		}else{
		
			document.getElementById("dynamic").style.display = "";
		}
	}
	
	function selchange(obj){
	    emptyval(obj.value);
	    if(obj.value != selval){
	    	var array = new Array();  
			if(obj.value == "awp_head"){
			   array = ['table_width','title_end','title_start'];
		    }else if(obj.value == "awp_foot"){
		       array = ['table_width','foot_start','foot_end'];
			}else{
			   array = ['table_width','list_maxrow','head_start','head_end','body_start','body_end'];
			}
			for(var i=0;i<array.length;i++){
			  document.getElementById("define_"+array[i]).checked = true;
			  if(document.getElementById("define_"+array[i]).value == ''){
			    document.getElementById("define_"+array[i]).value = "tempchecked";
			  }
			  document.getElementById(array[i]).style.display = "";
			  var value = document.getElementById(array[i]).value;
			  if(value == ''){
			   document.getElementById(array[i]).value = "1";
			  }
			}
	    }
	}
	function emptyval(val){
	    var inputs = document.getElementsByTagName("input");
		var checkboxArray = [];
		for(var i=0;i<inputs.length;i++){
		  var obj = inputs[i];
		  if(obj.type=='checkbox'){
		      var eleName = obj.name.substring(obj.name.indexOf('_')+1,obj.name.length);
		     if(val == selval && obj.value == 'checked'){
		        obj.checked = true;
		        document.getElementById(eleName).style.display = "";
		     }else{
		        obj.checked = false;
		        document.getElementById(eleName).style.display = "none";
		     }
		  }
		}
	}
	</SCRIPT>
	</HEAD>
	<%
	Table tableObj = (Table)request.getAttribute("tableObj");	
	ArrayList allDefineList = (ArrayList)request.getAttribute("allDefineList");
	ArrayList dynamicDefineList = (ArrayList)request.getAttribute("dynamicDefineList");
	//out.print(tableObj.getType());dynamicDefineList
	 %>
	<body class="report_body_bg">
		<div id="report_wrap">
			<html:form method="post"
				action="/t10_report/editreportdatatpl.do">
				<!--大标题区域-->
			    <div class="report_title">
				  <strong>属性</strong>
				  <span>
				     <a href="#" onClick="dosubmit('editreportdatatpl_des.do','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />报表描述</a>
					 <a href="#" onClick="dosubmit('editreportdatatpl_page.do','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />报表参数</a>
					 <a href="#" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_add','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />建数报表</a>
					 <a href="#" onClick="dosubmit('editreportdatatpl_chart.do','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />报表图形</a>
				  </span>
				</div>
				
				<div class='report_btn'>
				
				<%
				String[] tableids =  (String[])request.getAttribute("dataTpl_tableids");
				for(int i=0;tableids!=null&&i<tableids.length;i++){
							String id = (String)tableids[i];
				%>
				<input type="button" name="mdi" value="<%=id %>" onClick="dosubmit('editreportdatatpl_table.do?actiontype=&tableid=<%=id %>','modi')" class="input">
				<%			
				}
				 %>								
							
				</div>
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<div class='report_cond'>
					<table>
						<tr>
							<td align="right">
								<font color="red">*</font>id：
							</td>
							<td align="left">
								<input type="text" name="id" value="<%=tableObj.getId() %>" size="20"/>
							</td>
							<td align="right">
								<font color="red">*</font>classtype：
							</td>
							<td align="left">
								<html:select property="classtype" onchange="selchange(this)">
									<html:options collection="classtypeMap" property="label"
										labelProperty="value" />
								</html:select>		
							</td>						
					  </tr>													
						<tr>							
							<td align="right">
								<font color="red">*</font>type：
							</td>
							<td align="left"> 
							<html:select property="type" onchange="changeDynamci()">
								<html:options collection="typeMap" property="label"
									labelProperty="value" />
							</html:select>
							</td>
						    <td>&nbsp;</td>
							<td> &nbsp;</td>
						</tr>													
					</table>
				</div>
				<div class='report_table'>
				<div class="report_table_t">
				  <span></span>
				  <div name="slide" class="btnup"></div>
				</div>
					<table>
						<%
						LinkedHashMap defineMap = tableObj.getDefine().getDefineMap();
						Iterator alldefineIter = allDefineList.iterator();
						while(alldefineIter.hasNext()){
							String name = (String)alldefineIter.next();
							String vale="";
							String isChecked = "";
							String isDisplay = "";
							if(defineMap.containsKey(name)){
							 	vale = (String)defineMap.get(name);
							 	isChecked="checked";
							 	isDisplay = "";
							}else{
								isDisplay = "display:none;";
								isChecked = "";
							}
						 %>					
						<tr>
							<td   align="right" nowrap><%=name %>:</td>
							<td align="left" >	
								<input type="checkbox" name="define_<%=name %>" id="define_<%=name %>" <%=isChecked %>  value="<%=isChecked %>" onclick="changeChkbox('<%=name %>')">
							</td>
							<td nowrap align="left">
								<input type="text" name="<%=name %>" id="<%=name %>" value="<%=vale %>" size="5" style="<%=isDisplay %>"/>
							</td>
							<%
								if(alldefineIter.hasNext()){
									name = (String)alldefineIter.next();
									if(defineMap.containsKey(name)){
								 		vale = (String)defineMap.get(name);
								 		isChecked="checked";
								 		isDisplay = "";
									}else{
										isDisplay = "display:none;";
										isChecked="";
										vale = "";
									}
								}else{
									name = "";
									vale = "";
									isChecked="";
									isDisplay = "";
								}
							%>
							<td nowrap align="right"><%=name %>:</td>
							<td nowrap align="left">
							<input type="checkbox" name="define_<%=name %>" <%=isChecked %> value="<%=isChecked %>" onclick="changeChkbox('<%=name %>')">
							</td>
							<td nowrap align="left">
								<input type="text" name="<%=name %>" value="<%=vale %>" size="5" style="<%=isDisplay %>"/>
							</td>
						</tr>
					<%	
					}
					%>
					</table>
				</div>	
				
				<div class='report_table' id="dynamic" >
					<div class="report_table_t" >
					  <span></span>
					 
					</div>
					<table >
						<tr>
							<td>
								dynamic_cols：
							</td>
							<td>
								<input type="text" name="dynamic_cols" value="<%=tableObj.getDynamic_cols() %>" size="10"/>
							</td>					
							<td>
								dynamic_indic_cols：
							</td>
							<td>
								<input type="text" name="dynamic_indic_cols" value="<%=tableObj.getDynamic_indic_cols() %>" size="10"/>
							</td>
						</tr>					
<%
defineMap = tableObj.getDefine().getDefineMap();
Iterator dynamicdefineIter = dynamicDefineList.iterator();
while(dynamicdefineIter.hasNext()){
	String name = (String)dynamicdefineIter.next();
	String vale="";
	String isChecked = "";
	if(defineMap.containsKey(name)){
	 	vale = (String)defineMap.get(name);
	 	isChecked = "checked";
	}else{
		isChecked = "";
	}
 %>					
						<tr>
							<td nowrap>
								<%=name %><input type="checkbox" name="define_<%=name %>" <%=isChecked %> value="<%=isChecked %>" onclick="changeChkbox('<%=name %>')">
							</td>
							<td>
								<input type="text" name="<%=name %>" value="<%=vale %>" size="5"/>
							</td>
<%
	if(dynamicdefineIter.hasNext()){
		name = (String)dynamicdefineIter.next();
		if(defineMap.containsKey(name)){
	 		vale = (String)defineMap.get(name);
	 		isChecked = "checked";
		}else{
			vale = "";
			isChecked = "";
		}
	}else{
		name = "";
		vale = "";
		isChecked = "";
	}
%>
							<td nowrap>
								<%=name %><input type="checkbox" name="define_<%=name %>" <%=isChecked %> value="<%=isChecked %>" onclick="changeChkbox('<%=name %>')">
							</td>
							<td>
								<input type="text" name="<%=name %>" value="<%=vale %>" size="5"/>
							</td>
						</tr>
<%	
}
%>
					</table>
				</div>					
				
				<div class='report_btn'>			
				
								<input type="button" name="add" value="Static" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_static','add')" class="input">
								<input type="button" name="add" value="Func" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_function','add')" class="input">
								<input type="button" name="add" value="List" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_list','add')" class="input">
								<input type="button" name="add" value="Dynamic" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_dynamic','add')" class="input">
								<input type="button" name="add" value="ParamList" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_param_list','add')" class="input">
								<input type="button" name="add" value="SplitList" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_split_list','add')" class="input">
								<input type="button" name="add" value="AdditList" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_data_add_additional_list','add')" class="input">
						
				</div>				
<%
Data[] datas = (Data[])request.getAttribute("datas");
//HashMap dataMap = (HashMap)request.getAttribute("dataMap");
HashMap functionMap = (HashMap)request.getAttribute("functionMap");
HashMap truefalseMap = (HashMap)request.getAttribute("truefalseMap");

for(int i=0;datas!=null && i<datas.length;i++){
	Data _data = datas[i];
	String type = _data.getType();
	int iColspan=6;
%>					
				<div class='report_table'>
					 <div class="report_table_t" >
					  <span>TYPE: <%=type %></span>
					  <div class="btndelete" onClick="dosubmit('editreportdatatpl_table.do?lineID=<%=i %>&actiontype=table_data_del','add')"></div>
					</div>
					<table>
						<tr>
							
							<input type="hidden" name="type_<%=i %>" value="<%=type %>"/>
							
							<td width="15%" align="right">name:</td>
							<td align="left">
							<%
							if(type.equals("function")){
							%>
								<select name="name_<%=i %>">
								<%
								Iterator fIter = functionMap.keySet().iterator();
								while(fIter.hasNext()){
									String selected = "";
									String funcname = (String)fIter.next();
									if(funcname.equalsIgnoreCase( _data.getName() )){
										selected = "selected";
									}
								 %>
									<option value="<%=funcname %>" <%=selected %>><%=(String)functionMap.get(funcname) %></option>
								<%} %>	
								</select>
							<%
							}else{
							 %>
								<input type="text" name="name_<%=i %>" value="<%=_data.getName() %>" size="15"/>
							<%} %>	
							</td>
							<%
							if(type.equals("list") || type.equals("split_list")){
							iColspan = iColspan+2;
							%>
							<td align="right">beused:</td>
							<td align="left">
								<input type="text" name="beused_<%=i %>" value="<%=_data.getBeused() %>" size="15"/>
							</td>
							<%
							}
							if(type.equals("split_list")){
							iColspan = iColspan+2;
							 %>
							 <tr>
							 <td align="right">pk:</td>
							<td align="left">
								<input type="text" name="pk_<%=i %>" value="<%=_data.getPk() %>" size="15"/>
							</td>
							<%
							}
							if(type.equals("additional_list")){
							iColspan = iColspan+2;
							 %>
							 <td align="right">rel:</td>
							<td align="left">
								<input type="text" name="rel_<%=i %>" value="<%=_data.getRel() %>" size="15"/>
							</td>
							<%
							}
							if(type.equals("split_list")){
							iColspan = iColspan+2;
							 %>
							<td align="right">isSplitLast:</td>
							<td align="left">
								<select name="isSplitLast_<%=i %>">
								<%
								Iterator trIter = truefalseMap.keySet().iterator();
								while(trIter.hasNext()){
									String selected = "";
									String key = (String)trIter.next();
									if(key.equalsIgnoreCase( _data.getIsSplitLast() )){
										selected = "selected";
									}
								 %>
									<option value="<%=key %>" <%=selected %>><%=(String)truefalseMap.get(key) %></option>
								<%} %>	
								</select>
							</td>
							</tr>
							<%
							}
							if(type.equals("static")){
							 %>
						    <td align="right">val:</td>
							<td align="left">
							    <input type="text" name="val_<%=i %>" value="<%=_data.getVal() %>" size="15"/>
							</td>							 
							 <%} %>
							
						</tr>
							<%
							if(!type.equals("static") && !type.equals("function")){
							 %>						
						<tr>
						    
							<td colspan="<%=iColspan %>">
							    <textarea name="val_<%=i %>" cols="50" rows="3"><%=_data.getVal() %></textarea>
							</td>
						</tr>	
						    <%
							}
							%>							
					</table>
					</div>				
<%} %>	

				<div >
					<table>
						<tr>
							
							<td>
							    <html:hidden property="actiontype" value="table_edit" />	
							    <html:hidden property="p_reportkey" />
							    <html:hidden property="tableid" />
								<input type="button" value="提 交"
									OnClick="checkForm('editreportdatatpl_table.do','edit')">
								<html:reset styleClass="input" value="重 填" />
								<input type="button" value="删 除"
									OnClick="checkForm('editreportdatatpl_table.do','del')">
							</td>
							
						</tr>
					</table>
				</div>	
			</html:form>
			</div>
		</body>
	
	<script language="javascript">
	changeDynamci();
	var sel = document.getElementById("classtype");
	var selval = sel.options[sel.selectedIndex].value;
	selchange(sel);
	</script>
</html>
