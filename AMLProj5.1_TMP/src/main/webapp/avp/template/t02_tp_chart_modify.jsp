<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=GBK">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
    <script language="JavaScript" src="<%=contextPath%>/js/selectbox.js"></script>
	<script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
</head>
<script language="JavaScript">

	
	/** 查看图形函数  **/
	function showChart(load_page_path) {
		var dataField = document.forms[0].disp_cond;
	    if (dataField.length == 0){
	    	alert("Y轴数值不能为空!");
	    	return false;
	    }
	    var result = checkform();//先校验查询条件
		var result1 = checkxyNot();//检查xy是否重复
		if(result1 == false){
			return false ;
		}
		if(result1 && result){
			var theUrl = load_page_path + "/avp/template/show_image_analysis.do";
			var colAreaSelect = document.getElementById("colAreaSelect");
			avpSubmitPopUpSameNameWindow("", "selectField", theUrl, "800", "600");
	    }
	}

	/* 校验x y轴坐标不能重复**/
	function checkxyNot(){
		var data_begin = parseInt(document.forms[0].data_begin.value , 10);
		var data_end = parseInt(document.forms[0].data_end.value , 10);
		var rowAreaSelect = document.forms[0].row_cond.value;//x轴必须单选 
		var colAreaSelect =  document.forms[0].disp_cond.value//y轴
		var picType = getRadioValue();
		if(data_begin > data_end){
			alert("起止数大于终止数!");
			return false;
		}
		if (rowAreaSelect.length == 0){
			alert("X轴不能为空!");
			return false ;
		}
		
		if (picType.indexOf("MS") != -1) {
			if (colAreaSelect.length == 0){
				alert("Y轴不能为空!");
				return false ;
			}
			if(colAreaSelect.split(",")[0] == rowAreaSelect.split(",")[0]){
        		alert("Y轴的数据在X轴上已经存在!");
           		return false;
        	}
		}
		return true;
	}

	/**得到单选框的值*/
	function getRadioValue(){ 
		var temp = document.forms[0].charType;
		var value = "";
	 	for (var i = 0 ; i < temp.length ; i++){ 
			//遍历Radio    
			if(temp[i].checked){
				return temp[i].value;
			}     
		}
	}
	
	/** 校验最大值不能大于1000 或者不能为空*/
	function  maxValue(){
	var data_begin = parseInt(document.forms[0].data_begin.value , 10 );
	if(data_begin < 1){
		alert("数据范围起止最大值不能小于1!");
		return ;
	}
	return true;
}

	/** 校验最大值不能大于2000 或者不能为空*/
	function  data_endMaxValue(){
		var data_end = parseInt(document.forms[0].data_end.value , 10 );
		if(data_end > 2000){
			alert("数据范围终止最大值不能超过2000!");
			return ;
		}
		if(data_end < 1){
			alert("数据范围终止最大值不能小于1!");
			return ;
		}
		return true;
	}
	
	/** 图片宽度最大1500 最小100*/
	function widthMaxValue(){
		var width = parseInt(document.forms[0].width.value , 10);
		if (width > 1500){
			alert("宽度最大为:1500!");
			return false;
		}
		if (width < 100 ){
			alert("宽度不能小于100!");
			return false;
		}
		return true;
	}
	
	/** 图片高度最大1500 最小100*/
	function heightMaxValue(){
		var height = parseInt(document.forms[0].height.value , 10);
		if (height > 1500){
			alert("高度最大为:1500!");
			return false;
		}
		if (height < 100 ){
			alert("高度不能小于100!");
			return false;
		}
		return true;
	}
      
	//单击饼图 y轴变成单选 否则是多选
	function yNomal(type, typeName){
      	var labelStr = '<c:out value="${labelStr}"></c:out>';
      	document.forms[0].title.value = labelStr + "-" + typeName;
      	
      	if (type.indexOf("MS") != -1) {
      		document.getElementById("yzhou").style.display = "";
      	} else {
      		document.getElementById("yzhou").style.display = "none";
      	}
	}

	function dosubmit(theUrl,type){
		
	    var errMsg = "";
	    var isSub = false;
	    if(type == 'save'){
	    	var dataField = document.forms[0].disp_cond;
		    if (dataField.length == 0){
		    	alert("Y轴数值不能为空!");
		    	return false;
		    }
		    var result = checkform();//先校验查询条件
			var result1 = checkxyNot();//检查xy是否重复
			if(result1 == false){
				return false ;
			}
			if(result1 && result){
	    		isSub = true;
			}
	    }
	    if(type == 'back'){
	    	isSub = true;
		}
	    if(isSub && errMsg==''){
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }else{
	        if(errMsg!='')
	            alert(errMsg);
	        return false;
	    }
	}
</script>
 
     
<body>
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div id='content'>
		<html:form method="post" action="/template/t02_tp_chart_modify.do">
			<html:hidden property="tplakey"/>
			<html:hidden property="chartkey"/>
			<!-- 标题区域 -->
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out> - 修改图形条件</span></td>
						<td align="right">
							<input type=button value="返 回" name=Button52 class="input"	onClick="dosubmit('t02_tp_manager_list.do','back')" />
						</td>
					</tr>
					
				</table>
			</div> 
			
			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<!-- 查询条件区 -->
			<div class='awp_detail'>
				<table>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>图形类型：
						</td>
						<td colspan="3" >
							<logic:iterate id="type" name="chartTypes">
								<c:if test="${t02_tp_chartActionForm.charType == type.key}">
									<input type="radio" name="charType" value="<bean:write name="type" property="key"/>" checked="checked"
										onclick="yNomal('<bean:write name="type" property="key"/>', '<bean:write name="type" property="value"/>')"/>
								</c:if>
								<c:if test="${t02_tp_chartActionForm.charType != type.key}">
									<input type="radio" name="charType" value="<bean:write name="type" property="key"/>" 
										onclick="yNomal('<bean:write name="type" property="key"/>', '<bean:write name="type" property="value"/>')"/>
								</c:if>
								<bean:write name="type" property="value"/>
							</logic:iterate>
							<input type="hidden" value="<bean:write name="t02_tp_chartActionForm" property="charType"/>" name="type"/>
							<input type="hidden" value="<bean:write name="t02_tp_chartActionForm" property="charType_disp"/>" name="typeName"/>
						</td>
						</tr>
						<tr>
						<td width="380">
							<font color="#FF3300">*</font>数据范围：
						</td>
						<td colspan="3" >
							<html:text property="data_begin" style="{width:95px}" checkfunc="maxValue()" styleClass="awp_number" minlength="1" maxlength="3" warning="数据范围起始" /> - <html:text property="data_end" style="{width:95px}" checkfunc="data_endMaxValue()" styleClass="awp_number" minlength="1" maxlength="4" warning="数据范围结束" />（填写记录数的起止序号，最大为2000）
						</td>
					</tr>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>系列(SERIES)：
						</td>
						<td colspan="3" >
            				 	<html:select  property="disp_cond" style="{width:210px}">
								<html:options collection="t02_tp_exec_rstList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						</td>
					</tr>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>X轴：
						</td>
						<td colspan="3">
             				 <html:select  property="row_cond" style="{width:210px}">
								<html:options collection="t02_tp_exec_rstList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						 </td>
					</tr>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>Y轴：
						</td>
						<td colspan="3" >
            				 	<html:select  property="dataField" style="{width:210px}">
								<html:options collection="dataList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						</td>
					</tr>
					<tr id="yzhou" style="display:none">
						<td width="380">
							<font color="#FF3300">*</font>SY轴：
						</td>
						<td colspan="3">
							<html:select property="sy_cond" style="{width:210px}">
								<html:options collection="t02_tp_exec_rstList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						</td>
					</tr>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>标题：
						</td>
						<td colspan="3" >
						    <html:text property ="title"  minlength="1" style="{width:210px}"  warning="标题"/>
					   </td>
			   		</tr>
		        
		       		<tr>
				        <td width="380">横轴(X轴)标题：</td>
				        <td colspan="3">
							<html:text property="xaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
			       	  
		       		</tr> 
		       		<tr>
				        <td width="380">纵轴(Y轴)标题：</td>
				        <td colspan="3">
							<html:text property="yaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
			       	  
		       		</tr> 
		       		<tr>
				        <td width="380">SY轴标题：</td>
				        <td colspan="3">
							<html:text property="syaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
			       	  
		       		</tr> 
		     		 <tr>
				        <td width="380"><font color="#FF3300">*</font>宽度：</td>
				        <td colspan="3">
							<html:text property="width"   style="{width:210px}" checkfunc="widthMaxValue()" styleClass="awp_number" minlength="1" maxlength="4" warning="宽度" />
						</td>	
			       	  
		      		</tr> 
		       		<tr>
			       		<td width="380"><font color="#FF3300">*</font>高度：</td>
			        	<td colspan="3"><html:text property="height"  style="{width:210px}" checkfunc="heightMaxValue()"  styleClass="awp_number" minlength="1" maxlength="4" warning="高度"/>
						</td>	
			       	  
		       		</tr> 	
		      
					<tr>
				    	<td></td>
						<td colspan="3" align="center">
<%--						<input type="button" name="button" value="查看图形" onClick="showChart('<%=request.getContextPath()%>')"> --%>
						<input type="button"  value="保 存" class="botton" onClick="dosubmit('t02_tp_chart_modify_do.do','save')">
						<html:reset onclick="bgcolor()" value="重 置"/>
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>
<script language="JavaScript">
	var type = document.getElementsByName('type')[0].value;
	var typeName = document.getElementsByName('typeName')[0].value;
	yNomal(type,typeName);
</script>
</html:html>
