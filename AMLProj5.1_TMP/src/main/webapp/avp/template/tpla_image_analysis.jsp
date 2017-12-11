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
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
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

	/** 隐藏和显示非必输查询条件 **/
	function btnDisplayHiddenCon(object){	
		var btn = object;	
		try{
			if (document.getElementById("titleField").style.display == ""){				   
			    document.getElementById("titleField").style.display = "none";	  
		        document.getElementById("legendField").style.display = "none";	  
		        document.getElementById("locationField").style.display = "none";	  
		        document.getElementById("colorField").style.display = "none";	
		        document.getElementById("fontField").style.display = "none";
		        document.getElementById("titleColorField").style.display = "none";
		        document.getElementById("titleSizeField").style.display = "none";	
		        document.getElementById("yAxisLabelField").style.display = "none";	  
		        document.getElementById("xAxisLabelField").style.display = "none";
		        document.getElementById("heightField").style.display = "none";
		        document.getElementById("widthField").style.display = "none";
		        	  
			    btn.value ="高级>>";  
			}else{
			    document.getElementById("titleField").style.display = "";	  
		        document.getElementById("legendField").style.display = "";	  
		        document.getElementById("locationField").style.display = "";	  
		        document.getElementById("colorField").style.display = "";
		        document.getElementById("fontField").style.display = "";  
		        document.getElementById("titleColorField").style.display = "";
		        document.getElementById("titleSizeField").style.display = "";	
		        document.getElementById("yAxisLabelField").style.display = "";
		        document.getElementById("xAxisLabelField").style.display = "";
		        document.getElementById("heightField").style.display = "";
		        document.getElementById("widthField").style.display = "";
			    btn.value = "高级<<";				      	   
			}	
		}catch(ex){
			alert(err);
		}
	}
	/** 查看图形函数  **/
	function showChart(load_page_path) {
	   
    	var dataField = document.forms[0].dataField;
	    if (dataField.length == 0){
	    	alert("数值不能为空!");
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
         	selectAllOptions(colAreaSelect);//y轴全部选择
		 	avpSubmitPopUpSameNameWindow("", "selectField", theUrl, "800", "600");
        }
	}
	
	/* 校验x y轴坐标不能重复**/
	function checkxyNot(){
	var data_begin = parseInt(document.forms[0].data_begin.value , 10);
	var data_end = parseInt(document.forms[0].data_end.value , 10);
	var rowAreaSelect = document.forms[0].row_cond.value;//x轴必须单选 
	var colAreaSelect = document.getElementById("colAreaSelect");//y轴
	var picType = getRadioValue();
		if(data_begin > data_end){
			alert("起止数大于终止数!");
			return false;
		}
		if (rowAreaSelect.length == 0){
			alert("X轴不能为空!");
			return false ;
		}
		if(picType != "pie"){//如果不是饼图
			if(colAreaSelect.length == 0){
				alert("Y轴不能为空!");
				return false;
			}else{
				if (!colAreaSelect.length) {
			  		colAreaSelect = new Array(colAreaSelect);
			  	 }
		       	for (var i=0; i < colAreaSelect.length; i++) {
		       		var oCheck = colAreaSelect[i];
		           		if(oCheck.value.split(",")[2] == rowAreaSelect.split(",")[0]){
		           			alert("Y轴的数据在X轴上已经存在!");
		           			return false;
		           		}
		        }
			
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
	/** 标题大小最小为0 最大为80*/
	function titleMaxValue(){
		var titleSize = parseInt(document.forms[0].titleSize.value , 10);
		if (titleSize > 80){
			alert("标题大小最大为:80!");
			return false;
		}
		if (titleSize < 0 ){
			alert("字体大小不能小于0!");
			return false;
		}
		return true;
	}

 	// 定位按钮按下时调用，在新窗口中打开定位画面
      function locate_pop_window_col_set(load_page_path, areatype){
          var whole_path = load_page_path+'/avp/template/location_window_col_set.do?&areatype='+areatype;
          var colAreaSelect = document.getElementById("colAreaSelect");
          selectAllOptions(colAreaSelect);
          avpSubmitPopUpSameNameWindow("", "chartSelectField", whole_path, "600", "450");
      }
      
      // 定位子页面向本页面的行区域，列区域及数据区域设定选定的列标题时用
      function setSelectOption(elementName, value, text) {
          var oSelect = document.getElementById(elementName);
          var option = document.createElement("option");
          option.text = text;
          option.value = value;
          oSelect.add(option);
      } 
      
       //单击饼图 y轴变成单选 否则是多选
      function yNomal(chartType, typeName){
      	var picType = getRadioValue(document.forms[0].picType);
      	var labelStr = '<c:out value="${labelStr}"></c:out>';
      	if (picType == "timeseries"){
      		document.forms[0].title.value = labelStr + "-时序图";
      	}
      	if (picType == "line"){
      		document.forms[0].title.value = labelStr + "-折线图";
      	}
      	
      	if(picType == "pie"){//如果是饼图
      		document.forms[0].title.value = labelStr + "-饼图";
      		document.getElementById("yzhou").style.display = "none";
      		//document.forms[0].row_cond.readonly = false;
      	}else {
	      	document.getElementById("yzhou").style.display = "";
	      	//document.forms[0].row_cond.readonly = true;
      	}
      	if (picType == "verticalbar3d"){
      		document.forms[0].title.value = "<%=(String)request.getAttribute("labelStr")%>" + "-垂直柱图";
      	}
      	if (picType == "horizontalbar3d"){
      		document.forms[0].title.value = "<%=(String)request.getAttribute("labelStr")%>" + "-水平柱图";
      	}
      }

	function  colordialogmouseout(obj){
	    obj.style.borderColor="";
	    obj.bgColor="";
	}
	
	function  colordialogmouseover(obj){
	    obj.style.borderColor="#0A66EE";
	    obj.bgColor="#EEEEEE";
	}
	
	function  colordialogmousedown(color){
	    ecolorPopup.value=color;
	    ecolorPopup.style.background = color;
	    ocolorPopup.document.body.blur();
	}
	
	function  colordialogmore(){
	    var  sColor=dlgHelper.ChooseColorDlg(ecolorPopup.value);
	    sColor  =  sColor.toString(16);
	    if  (sColor.length  <  6)  {
	        var  sTempString  =  "000000".substring(0,6-sColor.length);
	        sColor  =  sTempString.concat(sColor);
	    }
	    ecolorPopup.value="#"+sColor.toUpperCase();
	    //document.body.bgColor="#"+sColor.toUpperCase();
	    ocolorPopup.document.body.blur();
	}
	
	function  colordialog(){	 
	    var  e=event.srcElement;
	    e.onkeyup=colordialog;      
	    ecolorPopup=e;
	    var  ocbody;
	    var  oPopBody  =  ocolorPopup.document.body;
	    var  colorlist=new  Array(40);
	    oPopBody.style.backgroundColor  =  "#f9f8f7";
	    oPopBody.style.border  =  "solid  #999999  1px";
	    oPopBody.style.fontSize  =  "12px";
	
	    colorlist[0]="#000000";    colorlist[1]="#993300";    colorlist[2]="#333300";    colorlist[3]="#003300";
	    colorlist[4]="#003366";    colorlist[5]="#000080";    colorlist[6]="#333399";    colorlist[7]="#333333";
	
	    colorlist[8]="#800000";    colorlist[9]="#FF6600";    colorlist[10]="#808000";colorlist[11]="#008000";
	    colorlist[12]="#008080";colorlist[13]="#0000FF";colorlist[14]="#666699";colorlist[15]="#808080";
	
	    colorlist[16]="#FF0000";colorlist[17]="#FF9900";colorlist[18]="#99CC00";colorlist[19]="#339966";
	    colorlist[20]="#33CCCC";colorlist[21]="#3366FF";colorlist[22]="#800080";colorlist[23]="#999999";
	
	    colorlist[24]="#FF00FF";colorlist[25]="#FFCC00";colorlist[26]="#FFFF00";colorlist[27]="#00FF00";
	    colorlist[28]="#00FFFF";colorlist[29]="#00CCFF";colorlist[30]="#993366";colorlist[31]="#CCCCCC";
	
	    colorlist[32]="#FF99CC";colorlist[33]="#FFCC99";colorlist[34]="#FFFF99";colorlist[35]="#CCFFCC";
	    colorlist[36]="#CCFFFF";colorlist[37]="#99CCFF";colorlist[38]="#CC99FF";colorlist[39]="#FFFFFF";
	
	    ocbody  =  "";
	    ocbody  +=  "<table  CELLPADDING=0  CELLSPACING=3>";
	    ocbody  +=  "<tr  height=\"20\"  width=\"20\"><td  align=\"center\"><table  style=\"border:1px  solid  #808080;\"  width=\"12\"  height=\"12\"  bgcolor=\""+e.value+"\"><tr><td></td></tr></table></td><td  bgcolor=\"eeeeee\"  colspan=\"7\"  style=\"font-size:12px;\"  align=\"center\">当前颜色</td></tr>";
	    for(var  i=0;i<colorlist.length;i++){
	        if(i%8==0)
	            ocbody  +=  "<tr>";
	        ocbody  +=  "<td  width=\"14\"  height=\"16\"  style=\"border:1px  solid;\"  onMouseOut=\"parent.colordialogmouseout(this);\"  onMouseOver=\"parent.colordialogmouseover(this);\"  onMouseDown=\"parent.colordialogmousedown('"+colorlist[i]+"')\"  align=\"center\"  valign=\"middle\"><table  style=\"border:1px  solid  #808080;\"  width=\"12\"  height=\"12\"  bgcolor=\""+colorlist[i]+"\"><tr><td></td></tr></table></td>";
	        if(i%8==7)
	            ocbody  +=  "</tr>";
	    }
	    ocbody  +=  "<tr><td  align=\"center\"  height=\"22\"  colspan=\"8\"  onMouseOut=\"parent.colordialogmouseout(this);\"  onMouseOver=\"parent.colordialogmouseover(this);\"  style=\"border:1px  solid;font-size:12px;cursor:default;\"  onMouseDown=\"parent.colordialogmore()\">其它颜色...</td></tr>";
	    ocbody  +=  "</table>";
	
	    oPopBody.innerHTML=ocbody; 
	    ocolorPopup.show(e.offsetLeft+event.clientX,  e.offsetTop+e.offsetHeight+event.clientY,  158,  147,  document.body);
	     
	    
	}
	
	/* 字体下拉框*/
	var fontsArray = new Array();
	var fontsIsAdded = false;
	function fontFacesMenuEnter(fontFacesDropdownList, dlgHelperId)
	{
		if((fontsIsAdded == false )||(fontsArray==''))
	{
		fontsArray = getSystemFonts(dlgHelperId);
	
		fontsIsAdded = true;
		for (var s=1; s < fontsArray.length; s++)
		{
		   newOption = document.createElement("option");
		   newOption.value = fontsArray[s];
		   newOption.text = fontsArray[s];
		   fontFacesDropdownList.add(newOption);
		}
	}
	  
	}
	function getSystemFonts(dlgHelperId)
	{
		var a = document.all(dlgHelperId).fonts.count;
		var fArray = new Array();
		for (i = 1;i <= parent.document.all(dlgHelperId).fonts.count;i++){
		fArray[i] = parent.document.all(dlgHelperId).fonts(i);
		}
		return fArray;
	}
	
</script>
 
     
<body>
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div id='content'>
		<html:form method="post" action="/template/tpla_image_analysis.do">
		 <input type="hidden" name="tpla_sessionId" value="<c:out value='${tpla_sessionId}' />">
         <input type="hidden" name="<c:out value='${tpla_sessionId}' />" value="<c:out value='${tpla_sessionId_value}' />">
			<!-- 标题区域 -->
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out> - 图形条件</span></td>
						<td align="right">
							<input type="button"  value="关 闭" class="botton" onClick="closeFullWin(false)">
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
							<html:radio property="charType"  value="timeseries" onclick="yNomal()">时序图</html:radio>
							<html:radio property="charType"  value="line" onclick="yNomal()">折线图</html:radio>
							<html:radio property="charType"  value="pie" onclick="yNomal()">饼图</html:radio>
							<html:radio property="charType"  value="verticalbar3d" onclick="yNomal()">垂直柱图</html:radio>
							<html:radio property="charType"  value="horizontalbar3d" onclick="yNomal()">水平柱图</html:radio>
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
							<font color="#FF3300">*</font>横轴(X轴)：
						</td>
						<td colspan="3">
							 
             				 <html:select  property="row_cond" style="{width:210px}">
								<html:options collection="t02_tp_exec_rstList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						 </td>
						 </tr>
						 
				
						 
						 <tr id="yzhou">
							<td width="380">
								<font color="#FF3300">*</font>纵轴(Y轴)：
							</td>
							<td >
								<select id="colAreaSelect" name="disp_cond" style="{width:210px}" size="10"   multiple="multiple">
	             				 </select>
							</td>
							<td style="display:none"></td>
							<td width="268"  align="left">
								<input type="button" name="locates" value="定 位 " onClick="locate_pop_window_col_set('<%=request.getContextPath()%>','1');" /><br><br>
								<input type="button" onClick="moveOptionUp(this.form['disp_cond'])" value="上移↑"><br><br>
               				    <input type="button" onClick="moveOptionDown(this.form['disp_cond'])" value="下移↓"><br><br>
								<input type="button" onClick="removeSelectedOptions(this.form['disp_cond'])" value="删 除 ">
							</td>
					</tr>
					 
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>数值：
						</td>
						<td colspan="3" >
							 
             				 <html:select  property="dataField" style="{width:210px}">
								<html:options collection="dataList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						</td>
						 </tr>
					 <tr id="widthField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>宽度：</td>
				        <td colspan="3">
							<html:text property="width"   style="{width:210px}" checkfunc="widthMaxValue()" styleClass="awp_number" minlength="1" maxlength="4" warning="宽度" />
						</td>	
				       	  
			       </tr> 
			       <tr id="heightField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>高度：</td>
				        <td colspan="3"><html:text property="height"  style="{width:210px}" checkfunc="heightMaxValue()"  styleClass="awp_number" minlength="1" maxlength="4" warning="高度"/>
						</td>	
				       	  
			       </tr> 	 
					
					<tr id="titleField" style="display:none">
						<td width="380">
							<font color="#FF3300">*</font>标题：
						</td>
						<td colspan="3" >
						    <html:text property ="title"  minlength="1" style="{width:210px}"  warning="标题"/>
						    
					   </td>
				   </tr>
				    <tr id="titleSizeField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>标题大小：</td>
				        <td colspan="3">
							<html:text property="titleSize" checkfunc="titleMaxValue()"  style="{width:210px}" styleClass="awp_number" minlength="1" maxlength="2" warning="标题大小" />
						</td>	
				       	  
			       </tr> 
			       <tr id="fontField" style="display:none">
				        <td width="380">标题字体：</td>
				        <td colspan="3" >
							<select id="blessingWords_FontFamily_DL" name="titleFamily" style="width:210px;" onmouseenter="fontFacesMenuEnter(this, 'dlgHelper');//updateFontList();">
								<option value=""><- 设置字体 -></option>
							</select>
						</td>	
				       	  
			       </tr> 
			        <tr id="titleColorField" style="display:none">
				        <td width="380">标题颜色：</td>
				        <td colspan="3" ><html:text property="titleColor"  style="{width:210px}" onfocus="colordialog()" /></td>	
				       	  
			       </tr> 
				   <tr id="colorField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>背景颜色：</td>
				        <td colspan="3" ><html:text property="background"    minlength="1" style="{width:210px}" onfocus="colordialog()" warning="背景颜色" onchange="alert('test')"/></td>	
				       	  
			       </tr>  
				   
					<tr id="legendField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>图例：</td>
				        <td colspan="3">
				        	<html:radio property="picDisplay" onclick="disHidden(this)" value="1">显示</html:radio>
							<html:radio property="picDisplay" onclick="disHidden(this)" value="2">不显示</html:radio>
				        </td>	
				    </tr>
				    
				    <tr id="locationField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>图例位置：</td>
				        <td colspan="3" >
				        	<html:radio property="picLocation" value="north">上</html:radio>
							<html:radio property="picLocation" value="south">下</html:radio>
							<html:radio property="picLocation" value="east">左</html:radio>
							<html:radio property="picLocation" value="west">右</html:radio>
						</td>  
			       </tr>
			        
			        
			       <tr id="xAxisLabelField" style="display:none">
				        <td width="380">横轴(X轴)标题：</td>
				        <td colspan="3">
							<html:text property="xaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
				       	  
			       </tr> 
			       <tr id="yAxisLabelField" style="display:none">
				        <td width="380">纵轴(Y轴)标题：</td>
				        <td colspan="3">
							<html:text property="yaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
				       	  
			       </tr> 
			      
					<tr>
					    <td></td>
						<td colspan="3" align="center">
						<input type="button" name="button" value="查看图形" onClick="showChart('<%=request.getContextPath()%>')"> 
						<input type="button" name="btnsearch" value="高级>>" class="botton" onClick="btnDisplayHiddenCon(this)">  
						<html:reset onclick="bgcolor()" value="重 置"/>
						</td>
						
					</tr>
				</table>
			</div>
			<!-- 数据区 -->
			

		</html:form>
	</div>
<script language="JavaScript">
   /**重置按钮 回复初始化背景颜色和标题颜色**/
	function bgcolor(){
		 document.forms[0].background.style.background = "#0000FF";
		 document.forms[0].titleColor.style.background = "";
	}
	/**显示或者隐藏 图例位置**/
	function disHidden(oText){
		if (oText.value == 1){//显示
			document.getElementById("locationField").style.display = "";
		}else{//不显示
			document.getElementById("locationField").style.display = "none";
		}
		
	}
	addLoadEvent(bgcolor);
</script>
</body>



</html:html>
