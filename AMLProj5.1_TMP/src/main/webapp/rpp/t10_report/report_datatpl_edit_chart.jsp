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
				
				$('.report_table_t div.btndelete').click(function(){
				      $(this).parent().parent().remove();
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
    
	function checkForm(theUrl){
	    var errMsg ="";
	    var oForm = document.forms[0];
	    var table = document.getElementById('dyn_table');
	    var els = oForm.elements;
	    if(table.rows.length < 2){
	       errMsg = "请新建图表！";
	    }else{
	    	for(var i=0;i<els.length;i++){
		    	var sType = els[i].type;
		    	var sName = els[i].name;
		    	if(sType == 'text' && sName.indexOf('series_') == -1 && els[i].value == '' ){
					if(els[i].id.indexOf('sy_') == 0 || els[i].id.indexOf('sytitle_') == 0){
						var category = document.getElementsByName('category_' + sName.split('_')[1])[0].value;
						if('MSColumn2DLineDY' == category || 'MSColumn3DLineDY' == category){
							errMsg = "请填写！";
					    	els[i].focus();
						} 
					}else{
						errMsg = "请填写！";
				    	els[i].focus();
					}			    	
		    	   
		    	}
		    }
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        oForm.action=theUrl;
	        oForm.submit();
	        parent.xmlFrame.dosubmit();
	    }
	}

	function setMSColumuTd(MSValue,sn){
		var tr = document.getElementById("tr_" + sn);

		var inputs = tr.getElementsByTagName('input');
		for(var i=0; i<inputs.length; i++){
			var input = inputs[i];
			if(input.id == 'sy_' + sn || input.id == 'sytitle_' + sn) {
				//设置sy与sytitle的制灰状态
				if(MSValue == 'MSColumn2DLineDY' || MSValue == 'MSColumn3DLineDY'){
					input.disabled = "";			
				} else {
					input.disabled = "disabled";
					input.value = "";
				}
			}
		}
		
	}
	
	</SCRIPT>
	</HEAD>
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
							<td>
								<font color="red">*</font>groupnum:
							</td>
							<td>
								<html:text property="groupnum" size="10" />
							</td>
							<td>
								<font color="red">*</font>location:
							</td>
							<td>
								<html:select property="location">
									<html:options collection="locationMap" property="label"
										labelProperty="value" />
								</html:select>	
							</td>							
						</tr>
					</table>
				</div>	
				<div class='report_table'>	
					 <div class="report_table_t">
					  <span>新建图表</span>
					  <span align="right"><input type="button" name="add" value="新建图表" onClick="dosubmit('editreportdatatpl_chart.do?actiontype=chart_add','add')" class="input"></span>
					</div>		
					
				

<%
Chart[] charts = (Chart[])request.getAttribute("charts");
HashMap chartMap = (HashMap)request.getAttribute("chartMap");
%>
				
					<table id="dyn_table">
						<tr>
							<td>
								category
							</td>
							<td>
								series
							</td>
							<td>
								x
							</td>
							<td>
								y
							</td>
							<td >
								sy
							</td>
							<td>
								caption
							</td>
							<td>
								xtitle
							</td>
							<td>
								ytitle
							</td>
							<td >
								sytitle
							</td>
							<td>
								width
							</td>
							<td>
								height
							</td>
							<td>
								操作				
							</td>
						</tr>					
<%

for(int i=0;charts!=null && i<charts.length;i++){
	Chart chart = charts[i];
%>					
						<tr id="tr_<%=i %>">
							<td>
							<select name="category_<%=i %>" onchange="setMSColumuTd(this.value,<%=i %>);">
							<%
							Iterator tIter = chartMap.keySet().iterator();
							while(tIter.hasNext()){
								String chartName = (String)tIter.next();
								String selected = "";
								if(chartName.equalsIgnoreCase(chart.getCategory())) selected = "selected";
							%>
								<option value="<%=chartName %>" <%=selected %>><%=chartName %></option>
							<%} %>
							<%
								String selected2 = "";
								String selected3 = "";
								boolean isDis = false;
								if("MSColumn2DLineDY".equals(chart.getCategory())){
									selected2 = "selected";
									isDis = true;
								} else if("MSColumn3DLineDY".equals(chart.getCategory())){
									selected3 = "selected";
									isDis = true;
								} 							
							%>		
							<option value="MSColumn2DLineDY" <%=selected2 %>>MSColumn2DLineDY</option>
							<option value="MSColumn3DLineDY" <%=selected3 %>>MSColumn3DLineDY</option>					
							</select>	
							</td>
							<td>
								<input type="text" name="series_<%=i %>" value="<%=chart.getSeries() %>" size="10"/>
							</td>
							<td>
								<input type="text" name="x_<%=i %>" value="<%=chart.getX() %>" size="10"/>
							</td>
							<td>
								<input type="text" name="y_<%=i %>" value="<%=chart.getY() %>" size="10"/>
							</td>
							<td >
								<%
									if(isDis){
										%>
										<input type="text" name="sy_<%=i %>" value="<%=chart.getSy() %>" size="10" id="sy_<%=i %>"/>
										<%
									}else{
										%>
										<input type="text" name="sy_<%=i %>" value="<%=chart.getSy() %>" size="10" disabled="disabled" id="sy_<%=i %>"/>
										<%
									}
								%>								
							</td>
							<td>
								<input type="text" name="caption_<%=i %>" value="<%=chart.getCaption() %>"   size="10"/>
							</td>
							<td>
								<input type="text" name="xtitle_<%=i %>" value="<%=chart.getXtitle() %>" size="10"/>
							</td>
							<td>
								<input type="text" name="ytitle_<%=i %>" value="<%=chart.getYtitle() %>" size="10"/>
							</td>
							<td >
								<%
									if(isDis){
										%>
										<input type="text" name="sytitle_<%=i %>" value="<%=chart.getSyTitle() %>" size="10" id="sytitle_<%=i %>"/>
										<%
									}else{
										%>
										<input type="text" name="sytitle_<%=i %>" value="<%=chart.getSyTitle() %>" size="10" disabled="disabled" id="sytitle_<%=i %>"/>
										<%
									}
								%>								
							</td>
							<td>
								<input type="text" name="width_<%=i %>" value="<%=chart.getWidth() %>"  class="awp_number" size="6"/>
							</td>
							<td>
								<input type="text" name="height_<%=i %>" value="<%=chart.getHeight() %>"  class="awp_number" size="5"/>
							</td>
							<td>
								<input type="button" name="add" value="删除" onClick="dosubmit('editreportdatatpl_chart.do?lineID=<%=i %>&actiontype=chart_del','add')" class="input">
							</td>
						</tr>
<%} %>		
						</tr>
					</table>
				</div>	
				<div >
					<table>						
						<tr>
							
							<td colspan="9">
								<html:hidden property="actiontype" value="chart_edit" />	
							    <html:hidden property="p_reportkey" />
								<input type="button" value="提 交"
									OnClick="checkForm('editreportdatatpl_chart.do')">
								<html:reset styleClass="input" value="重 填" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
				</div>
		</body>

</html>
