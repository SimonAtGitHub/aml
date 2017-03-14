<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>

		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>

		<SCRIPT LANGUAGE="JavaScript"> 
		var objKey;
		var objName;
		
		function hanlde(keyValue, nameValue) {
			objKey.value = keyValue;
			objName.value = nameValue;
		}	
		
		
		function addrow(){
	        var maxRow = document.getElementById("tableHistoryRows").value;
	        var tab=document.getElementById("tableid");
			//var n=tab.rows.length;
			var del="delRow(this)";
			var newRow = tab.insertRow();
			//newRow.style.textAlign="center";
		   	
		   	var cell0 = newRow.insertCell();
			cell0.innerHTML="<input type=\"text\" name=\"colname\"  size=\"32\" maxlength=\"32\" >";
		   	
		   	//var cell1 = newRow.insertCell();
			//cell1.innerHTML="<input type=\"text\" name=\"colkey\"  size=\"32\" >";
			
		   	
		
			var cell2 = newRow.insertCell();
			cell2.innerHTML="<select name=\"isrelevance\" onchange=\"changeisrelevance(this)\"><option value=\"0\">否</option><option value=\"1\">是</option></select><br>"+
							  "<span id=\"typekey\" style=\"display:none\">关联栏目：<input type=\"text\" name=\"relevancetype_disp\"  size=\"8\" maxlength=\"8\"><input type=\"hidden\" name=\"relevancetype\">"
			                + "&nbsp&nbsp<input type=\"button\" name=\"dingwei\" onclick=\"locate_programa_window(this);\" value=\"定 位\"></span>";
				
			var cell3 = newRow.insertCell();
			cell3.innerHTML="<span id=\"collength\"><input type=\"text\" name=\"collength\"  size=\"4\" maxlength=\"4\" ></span>";
			
			var cell4 = newRow.insertCell();
			cell4.innerHTML="<span id=\"iscond\"><select name=\"iscond\"  onchange=\"\"><option value=\"0\">否</option><option value=\"1\">是</option></select></span>";
			
			var cell5 = newRow.insertCell();
			cell5.innerHTML="<select name=\"isshow\"  onchange=\"\"><option value=\"1\">是</option><option value=\"0\">否</option></select>";
			
			var cell6 = newRow.insertCell();
			cell6.innerHTML="<span id=\"issort\"><select name=\"issort\"  onchange=\"\"><option value=\"0\">否</option><option value=\"1\">是</option></select></span>";
			
		   	var cell7 = newRow.insertCell();
			cell7.innerHTML="<input type=\"text\" name=\"dispseq\"  size=\"8\" maxlength=\"8\" >";
			
			var cell8 = newRow.insertCell();	
			cell8.innerHTML="<input type='hidden' name='opetype' value='add'><input type='hidden' name='isdefaultfield' value='0'><a href='javascript:void(0);' onclick='"+del+"' >删除</a>";
			
			document.getElementById("tableHistoryRows").value = parseInt(maxRow) + 1;
            //刷新样式
			setdynamicListStyle();
			setInputStyle();    
	   }
	 function locate_programa_window(obj){
	    var trObj = obj.parentNode.parentNode; 
		var textObj = trObj.getElementsByTagName("input");
		var key = "";
		var name = "";
		for(var i=0;i<textObj.length;i++){
		 	if(textObj[i].name=="relevancetype"){
		 		objKey = textObj[i];
		 	}
		 	if(textObj[i].name=="relevancetype_disp"){
		 		objName = textObj[i];
		 	}
		 }
			
		var whole_path = '<%=request.getContextPath()%>/common/location_window_dynamic.do?localname=t12_programaLocation&issingle=radio&forms=forms[0]&localset=relevancetype,relevancetype_disp&newsearchflag=1';
	    
		var	property = 'height=600, width=600,left=100,top=100,scrollbars=yes,resizable=yes';
		
	    window.open(whole_path,'',property);  
		 	//locate_pop_window('/awp','v00_categoryLocation','checkbox','forms[0]','relevancetype,relevancetype_disp','');
	 }	
	    
	 function delRow(obj) {//删除行
	     var row = obj.parentElement.parentNode;
	     row.style.display = "none";
	 }
	 
	  function changeisrelevance(obj) {//是否关联联动
         var trObj = obj.parentNode.parentNode;   
		 //var textObj = trObj.getElementsByTagName("input");
		 //var selectObj = trObj.getElementsByTagName("select");
		 var spanObj = trObj.getElementsByTagName("span");
		
		
		 if(obj.value==1){
		 	 spanObj[0].style.display = "";
		 	 spanObj[1].style.display = "none";
		 	 spanObj[2].style.display = "none";
		 	 spanObj[3].style.display = "none"; 
		    
	     }
	     else{
	     	 spanObj[0].style.display = "none";
		     spanObj[1].style.display = "";
		 	 spanObj[2].style.display = "";
		 	 spanObj[3].style.display = ""; 
	     }
	 }
	    
	 function checkForm(){
	    var objTab = document.getElementById("tableid");
		var len=objTab.rows.length;
		var tempArr=new Array(length);//存储列名称,为了判断列名称是否重复
		var columnListStr="";
		for(var rowNo=1;rowNo<len;rowNo++){
			//添加后又删除的，实际是隐藏
			if(objTab.rows[rowNo].style.display=='none'){
				continue;
			}		
			var obj = objTab.rows[rowNo];
			var result = checkTr(obj, tempArr);
			if(result == 'error')return false;
			columnListStr+=result;
			columnListStr+="$$";// 一个列信息值拼写完毕
		}
		if(columnListStr=='') {
		    alert("请定义数据表的列！");
		    return false;
		}
		document.getElementById("columnListStr").value=columnListStr.substring(0,columnListStr.length-2);
		//alert("columnListStr:"+document.getElementById("columnListStr").value);
		return true;
	}
	
	function checkTr(obj, tempArr) {//校验一行
	    
	    var result = "";
	    var opetype = "";
	    var colkey = "";
	    var old_collength = "";
	    var isrelevance = "";
	    var relevancetype = "";
	    var inputArray = obj.getElementsByTagName("input");
	    for(i=0;i <inputArray.length;i++) {//文本情况
		   var name = inputArray[i].name;
		   var value = inputArray[i].value;
		   
		   if(name == 'colname') {//列显示名称
		       if(trim(value)==''){
					alert("列显示名称不能为空！");
					inputArray[i].focus();
					return "error";
			   }
			   
			   if(!checkColName(tempArr, value)) {
				    alert("列显示名称["+value+"]已经存在,请修改！");
					inputArray[i].focus();
					return "error";;
			   }
			   
			   tempArr[tempArr.length] = value;
		   }
		   else if(name == 'old_collength') {//原字段长度
		       old_collength = value;
		       continue;
		   }		   
		   else if(name == 'collength') {//字段长度
			   if(value == '') value ="0";
			   if(inputArray[i].parentNode.style.display == ''){
				   if(!checkNum(value)){
						alert("字段长度只能输入数字！");
						inputArray[i].focus();
						return "error";
				   } 
				   if(parseInt(value) < 1 ) {
				       alert("字段长度必须要大于0！");
					inputArray[i].focus();
						return "error";
				  }
				   if(parseInt(value)>4000){
					   alert("字段长度不能大于4000！");
					   inputArray[i].focus();
					   return "error";
					}
				   if(old_collength == '') old_collength ="0";
				   if(parseInt(old_collength) > parseInt(value)) {
				        alert("字段长度不能小于原长度["+old_collength+"]！");
						inputArray[i].focus();
						return "error";
				   }
				}
		   }
		   else if(name == 'colkey') {//字段代码
		       colkey = value;
		   }
		   else if(name == 'opetype') {//操作类型
		       opetype = value;
		   }
		   else if(name == 'relevancetype') {//定位栏目
		       relevancetype = value;
		   }
		   else if(name == 'dispseq') {//调序
			   if(!checkNum(value)){
					alert("排序字段只能输入数字！");
					inputArray[i].focus();
					return "error";
			   } 
		   }		   
		   else if(name == 'isdefaultfield') {//是否默认字段
		       //isdefaultfield = value;
		       //alert(value);
		   }
		   //		
		   if(name != 'opetype' && name != 'colkey' && name != 'dingwei' && name != 'relevancetype_disp' && name != 'relevancetype')
		   		result+=value+"$";
		   		//alert(name+":"+value);
		   		//alert(result);
        }      
        var selectArray = obj.getElementsByTagName("select");
        for(i=0;i <selectArray.length;i++) {//下拉框情况
           var name = selectArray[i].name;
           var value = selectArray[i].value;
		   if(name == 'iscond') {
		      result+=value+"$";
		   }
		   else if(name == 'isshow') {
		      result+=value+"$";
		   }
		   else if(name == 'issort') {
		      result+=value+"$";
		   }
		   else if(name == 'isrelevance') {
		      isrelevance = value;
		      
		   }
        }
        result+=opetype;
        if(trim(colkey)!='')
        	result+="$"+colkey;
        if(trim(isrelevance)!='')
        	result+="$"+isrelevance;
        if(trim(relevancetype)!='')
        	result+="$"+relevancetype;
        
        /** 返回结果拼装信息
        colname 
		collength 【old_collength (不拼装)】
		dispseq
		isdefaultfield
		iscond
		isshow
		issort
		opetype
		colkey 
		isrelevance 是否关联
		relevancetype 关联类别
        */
        
        return result;
	}	
	
	function checkColName(obj, colName) {//判断列名称是否已存在
	    for(var i=0;i<obj.length;i++) {
	        if(obj[i] == colName)return false;
	    }
	    return true;
	}
	

	function commitColumn(theUrl) {//提交列
	    if(!checkForm()) return ;
	    
	    //var tablename = document.getElementById("tablename").value;
	    var tablename = document.forms[0].tablename.value;
	    if(trim(tablename) == '') {
	        alert("请输入数据表名称");
	        return ;
	    }
		document.forms[0].action=theUrl;
		document.forms[0].submit();
    }
    
        </SCRIPT>
	</HEAD>
	<BODY>
		<div id='content'>
			<html:form method="post"
				action="/system_manager/t12_programa/t12_programa_table.do">

				<div class='awp_title'>

					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">栏目管理 - 数据表管理</span>
							</td>
							<td align="right">
							
								<logic:empty name="t12_programa_table" property="tablecode">
									<input type="button" value="复制现有数据表" name="Button22322"
										class="input"
										onclick="awpDoSubmit('t12_programa_table_copy.do','add')" />
									<input type="button" value="定义新数据表" name="Button22322"
										class="input"
										onclick="awpDoSubmit('t12_programa_table_add.do','add')" />
								</logic:empty>
								<logic:notEmpty name="t12_programa_table" property="tablecode">
									<input type="button" class="input" value="暂时保存"
										onclick="commitColumn('t12_programa_table_modify_save.do')"
										align="right">
									<input type="button" class="input" value="应 用"
										onclick="commitColumn('t12_programa_table_modify_do.do')"
										align="right">
									<!-- <input type="button" class="input" value="调  序"    name=add onClick="locate_order_window('<%=request.getContextPath()%>','<%=request.getAttribute("keys")%>','<%=request.getAttribute("names")%>','t12_programa_cols','colkey','dispseq');">   -->
								</logic:notEmpty>

								<input type="button" value="返  回" name="Button22322"
									class="input" onclick="awpDoSubmit('t12_programa_list.do','add')" />
							</td>
						</tr>
					</table>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<input type="hidden" id="tableHistoryRows" name="tableHistoryRows"
					value="1" />
				<input type="hidden" id="columnListStr" name="columnListStr" />

				<div class='awp_cond'>
					<TABLE>

						<logic:empty name="t12_programa_table" property="tablecode">
							<tr>
								<td>
									<FONT color="#ff0000">数据表未定义，请先进行定义</FONT>
								</td>
							</tr>
						</logic:empty>

						<logic:notEmpty name="t12_programa_table" property="tablecode">
							<tr>
								<td>
									数据表名称：
								</td>
								<td>
									<html:text property="tablename" name="t12_programa_table"
										size="32" maxlength="32" />
								</td>
								<td>
									数据表代码：
								</td>
								<td>
									<html:hidden property="tablecode" name="t12_programa_table" />
									<bean:write property="tablecode" name="t12_programa_table" />
								</td>
								
							</tr>
						</logic:notEmpty>

					</TABLE>
				</div><br/>
				<html:hidden property="categorykey" />
					<input type="hidden" name="programakey"
						value="<bean:write name="t12_programaActionForm" property="programakey"/>" />
				<logic:notEmpty name="t12_programa_table" property="tablecode">
				<p align="right">
					<input type="button" class="input" value="添加列信息"
										onclick="addrow()">
									
							
				</p>
				
				<div class='awp_dynamic_list'>
					
					<table id="tableid">
						<tr>
							<td noWrap>
								列显示名称
							</td>
							<td noWrap >是否关联</td>
							<td noWrap>
								字段长度
							</td>
							<td noWrap>
								是否查询条件
							</td>
							<td noWrap>
								是否列表显示
							</td>
							<td nowrap>
								是否用于排序
							</td>
							<td nowrap>
								显示顺序
							</td>
							<td nowrap>
								操作
							</td>
						</tr>
						<logic:iterate id="col" name="t12_programa_colsList"
							type="com.ist.cms.dto.T12_programa_cols">
							<tr align="left" title="<bean:write name="col" property="colkey"/>">
								<td nowrap>
									<logic:equal name="col" property="isdefaultfield" value="0">
										<html:text name="col" property="colname" size="32"
											maxlength="32" />
									</logic:equal>
									<logic:equal name="col" property="isdefaultfield" value="1">
									     <bean:define id="columnkey" name="col" property="colkey"></bean:define>
									     <html:text name="col" property="colname" size="32" maxlength="32" />
									     <br><font color="red">注：
									        <logic:iterate id="defCol" name="defColsMap">
									            <logic:equal value="<%=String.valueOf(columnkey) %>" name="defCol" property="key">
									               <bean:write name="defCol" property="value"/>
									            </logic:equal>
									        </logic:iterate>
									     </font> 
									</logic:equal>
											
								</td>
								
							<td noWrap align="left">
								<logic:equal name="col" property="isdefaultfield" value="0">
								   <html:select name="col" property="isrelevance"  onchange="changeisrelevance(this)">
											<html:options collection="yesNoMap" property="label"
												labelProperty="value" />
								   </html:select><br>
								   <logic:equal value="0" name="col" property="isrelevance">
								   	 <span id="typekey" style="display:none">
								      关联栏目：<html:text name="col" property="relevancetype_disp" size="10"/>
								          <html:hidden name="col" property="relevancetype"/>
			                              <input type="button" name="dingwei" onclick="locate_programa_window(this);" value="定 位">
			                       </span>
								   </logic:equal>
								   <logic:equal value="1" name="col" property="isrelevance">
								      <span id="typekey" >
								   	  关联栏目：<html:text name="col" property="relevancetype_disp" size="10"/>
								          <html:hidden name="col" property="relevancetype"/>
			                              <input type="button" name="dingwei" onclick="locate_programa_window(this);" value="定 位">
			                       </span>
								   </logic:equal>
								  
								</logic:equal>
								<logic:equal name="col" property="isdefaultfield" value="1">
								</logic:equal>
							</td>
							 
								<td noWrap>
									<input type="hidden" name="old_collength"
										value="<bean:write name="col" property="collength"/>">
									<logic:equal name="col" property="isdefaultfield" value="0">
										<logic:equal value="0" name="col" property="isrelevance">
											<span id="collength">
												<html:text name="col" property="collength" size="4" maxlength="4" />
									       </span>
										</logic:equal>
										<logic:equal value="1" name="col" property="isrelevance">
											<span id="collength" style="display:none">
												<html:text name="col" property="collength" size="4" maxlength="4" />
									       </span>
										</logic:equal>
										
									</logic:equal>
									<logic:equal name="col" property="isdefaultfield" value="1">
										<bean:write name="col" property="collength" />
										<html:hidden name="col" property="collength" />
									</logic:equal>
								</td>
								
								<td noWrap>
								<logic:equal name="col" property="isrelevance" value="1">
									<span id="iscond" style="display:none">  
									<html:select name="col" property="iscond">
										<html:options collection="yesNoMap" property="label"
											labelProperty="value" />
									</html:select></span>
								</logic:equal>
								<logic:equal name="col" property="isrelevance" value="0">
									<span id="iscond">  
									<html:select name="col" property="iscond">
										<html:options collection="yesNoMap" property="label"
											labelProperty="value" />
									</html:select></span>
								</logic:equal>
								
								</td>
								
								<td noWrap>
									<html:select name="col" property="isshow">
										<html:options collection="yesNoMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>

								<td noWrap>
									<logic:equal name="col" property="isrelevance" value="1">
										<span id="issort" style="display:none">  
											<html:select name="col" property="issort">
												<html:options collection="yesNoMap" property="label"
													labelProperty="value" />
											</html:select>
									</span>
									</logic:equal>
									<logic:equal name="col" property="isrelevance" value="0">
										<span id="issort" >  
											<html:select name="col" property="issort">
												<html:options collection="yesNoMap" property="label"
													labelProperty="value" />
											</html:select>
									</span>
									</logic:equal>
									
								</td>
								
								
								<td noWrap>
									<html:text name="col" property="dispseq" size="8"
										maxlength="8" />
								</td>

								<td noWrap align="left">
									<html:hidden name="col" property="colkey" />
									<logic:notEqual value="0" name="col" property="iscreate">
									<input type="hidden" name="opetype" value="alter">
									</logic:notEqual>
									<logic:equal value="0" name="col" property="iscreate">
									<input type="hidden" name="opetype" value="add">
									</logic:equal>
									<html:hidden name="col" property="isdefaultfield" />
									<logic:equal name="col" property="isdefaultfield" value="0">
										<a href="javascript:void(0);" onclick="delRow(this)">删除</a>
										<a href="#" onclick="openWin('<%=request.getContextPath() %>/cms/system_manager/t12_programa/t12_programa_colsExtendAttriModiy.do?tablecode=<bean:write name="col" property="tablecode"/>&colkey=<bean:write name="col" property="colkey"/>','',500,600)">扩展属性</a>
									</logic:equal>
								</td>
							</tr>
						</logic:iterate>
					</table>
					
				</div>
				</logic:notEmpty>
			</html:form>
		</div>
	</BODY>

</HTML>
