/**
 * <p>
 * avp_func.js
 * </p>
 * 
 * 主要供avp功能模块使用的js函数，主要提供以下功能，未说明函数，请不用使用：
 * 1.avp常用功能函数：
 *	    function avpCondSubmit(theUrl):相当于点击提交按钮，检查所有输入项是否符合指定的条件，如输入项长度，最小及最
 *			大输入长度，必输项等如果存在，如果有的话.显示数据正在加载提示层
 *      function avpJumpSubmit(theUrl):在当前窗口中，跳转到指定页面，显示数据正在加载页面，如果有的话
 *      function avpPopUp(theUrl,sWidth,sHeight):弹出一个指定宽度和长度的窗口；
 * 
 * 2.样式设置功能：只需设置相应的class属性，并在页面中引入本脚本即可，不需显示调用本脚本中的函数,可与div配合使用
 *      表格样式：目前支持4种样式，即列表表格（list_tab）、条件表格（cond_tab）、明细表格（detail_tab）、及标题表格（title_tab），表
 *      格中列宽度（width），对齐方式（align）及noWrap需要进性手工设置.
 *			例：<table class='list_tab'>
 ×
 *		输入元素样式：主要通过class,min_len,max_len来进行输入控制，其中class指明输入值类型：avp_number类型，只允许用户
 *			输入数字或小数点,支持负数，avp_date类型允许用户以多种方式输入日期,如1998-01-01,1998-1-1,19980101,如输入日期为合法日
 *			期，自动将日期转换为iso格式(yyyy-mm-dd),min_len及max_len用于控制用户输入长度，对于check，radio，select
 *			指选择元素个数
 *          例：
 *			<input type="text" class="avp_number" min_len='8' max_len='8' warning='请输入8位电话号码'>
 *			<input type="text" class="avp_date" warning='请输入日期'>
 *          
 * 
 * @author $Author: gaojx $
 * @version $Revision: 1.7 $ $Date: 2008/03/17 11:44:23 $
 */

/**每月的日期天数*/
var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

/**
 * 添加需在页面加载时需执行的js函数
 * 
 * @param func
 * @return
 */
function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != "function") {
		window.onload = func;
	} else {
		window.onload = function () {
			oldonload();
			func();
		};
	}
}
/**
 * 添加指定元素的样式
 * 
 * @param oElement
 * @param value
 * @return
 */
function addClass(oElement, value) {
	if (!oElement.className) {
		oElement.className = value;
	} else {
		newClassName = oElement.className;
		newClassName += " ";
		newClassName += value;
		oElement.className = newClassName;
	}
}
/**
 * 替换指定元素的样式
 * 
 * @param oElement
 * @param value
 * @return
 */
function replaceClass(oElement, value) {
	oElement.className = value;
}

/**
 * 设置指定表格的样式，目前支持以下几种表格：
 * cond －条件表格 detail－明细数据显示表格 list－数据列表 title-标题表格 
 * @return
 */
function addTableStyle() {
	if (!document.getElementsByTagName) {
		return false;
	}
	var tables = document.getElementsByTagName("table");
	for (var i = 0; i < tables.length; i++) {
		var table_type = tables[i].getAttribute("className");
		switch (table_type) {
		  case "cond_tab": //条件表格
			setCondTableStyle(tables[i]);
			break;
		  case "detail_tab": //明细表格
			setDetailTableStyle(tables[i]);
			break;
		  case "list_tab": //数据列表
			setListTableStyle(tables[i]);
			break;
		  case "title_tab"://标题表格
			setTitleTableStyle(tables[i]);
			break;
		  case "msg_tab"://提示表格
			setMsgTableStyle(tables[i]);
			break;
		}
	}
}

/**
 * 设定提示表格样式
 * @param oTable 
 * @return
 */
function setMsgTableStyle(oTable) {
	//设置表格样式,实际可使用样式表进行进一步优化设置
	//设置表格样式
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "1");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("bgColor", "#000000");
	oTable.setAttribute("width", "98%");

    //设置显示样式
	var cols = oTable.getElementsByTagName("td");
		for (var j = 0; j < cols.length; j++) {
			if ( j==0 ) {
				cols[j].setAttribute("align", "center");
				addClass(cols[j], "deep");
				addClass(cols[j], "msg_title");

			} else {
				addClass(cols[j], "light");
				addClass(cols[j], "msg_cont");
			}
		}
}

/**
 * 设定标题表格样式，为进行完整设置
 * @param oTable 
 * @return
 */
function setTitleTableStyle(oTable) {
	//设置表格样式,实际可使用样式表进行进一步优化设置
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "2");
	oTable.setAttribute("cellSpacing", "0");
	oTable.setAttribute("width", "98%");
	
	//设置所有的INPUT框
	var inputs = oTable.getElementsByTagName("input");
	for (var i = 0; i < inputs.length; i++) {
		var sType = inputs[i].type;
		if (sType == "button") {
			addClass(inputs[i], "input");
		}
	}
}
/**
 * 设置列表表格显示样式
 * 
 * @param oTable
 * @return
 */
function setListTableStyle(oTable) {
	//设置表格样式,实际可使用样式表进行进一步优化设置
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "2");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("bgColor", "#000000");
	oTable.setAttribute("width", "100%");

    //设置显示样式
	var rows = oTable.getElementsByTagName("tr");
	
	//设置标题栏样式
	rows[0].setAttribute("bgColor", "#A3C0EE");
	rows[0].setAttribute("height", "22");
	rows[0].setAttribute("align", "center");
	for (var i = 1; i < rows.length; i++) {
		rows[i].setAttribute("height", "22");
		rows[i].setAttribute("bgColor", "#FFFFFF");
		
		//添加鼠标移入效果
		rows[i].onmouseover = function () {
			this.bgColor = "#CCCCCC";
		};
		//添加鼠标移出效果
		rows[i].onmouseout = function () {
			this.bgColor = "#FFFFFF";
		};
	}
}
/**
 * 设置明细模式显示表格
 * 
 * @param oTable
 * @return
 */
function setDetailTableStyle(oTable) {
	
	//设置表格样式
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "2");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("bgColor", "#000000");
	oTable.setAttribute("width", "100%");

    //设置显示样式
	var rows = oTable.getElementsByTagName("tr");
	
	for (var i = 0; i < rows.length; i++) {
		var old = false;
		rows[i].setAttribute("height", "22");
		rows[i].setAttribute("bgColor", "#FFFFFF");

		var cols = rows[i].getElementsByTagName("td");
		for (var j = 0; j < cols.length; j++) {
			if (old) {
				addClass(cols[j], "light");
				old = false;
			} else {
				addClass(cols[j], "deep");
				old = true;
			}
		}
	}
}
/**
 * 设置输入条件样式表
 * 
 * @param oTable
 * @return
 */
function setCondTableStyle(oTable) {
    
	//设置表格样式
	oTable.setAttribute("width", "100%");
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "1");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("align", "center");

    //设置显示样式
	var rows = oTable.getElementsByTagName("tr");
	for (var j = 0; j < rows.length; j++) {
		var old = false;
		rows[j].setAttribute("height", "22");

		var cols = rows[j].getElementsByTagName("td");
		for (var i = 0; i < cols.length; i++) {
			if (old ) {
				addClass(cols[i], "light");
				old = false;
			} else {
				addClass(cols[i], "deep");
				old = true;
			}
		}
	}
    //设置所有的INPUT框
	var inputs = oTable.getElementsByTagName("input");
	for (var i = 0; i < inputs.length; i++) {
		var sType = inputs[i].type;
		if (sType == "text" || sType == "file" || sType == "textarea" || sType == "password") {
			var chk_type = inputs[i].getAttribute("className");
			if (chk_type == "avp_date") {
				var regDate = new RegExp("^\\d{1,4}([-]?(\\d{1,2}([-]?(\\d{1,2})?)?)?)?$", "i");
				//关闭中文输入
				inputs[i].style.imeMode = "Disabled";
				inputs[i].onkeypress = function () {
					return regInput(this, regDate, String.fromCharCode(event.keyCode));
				};
				inputs[i].onpaste = function () {
					return regInput(this, regDate, window.clipboardData.getData("Text"));
				};
				inputs[i].ondrop = function () {
					return regInput(this, regDate, event.dataTransfer.getData("Text"));
				};
				inputs[i].onblur = function () {
					return avpChkDate(this);
				};
			} else if (chk_type == "avp_number") {
					var regNum = new RegExp("^[-]?\\d*\\.?\\d*$", "i");
					//关闭中文输入
					inputs[i].style.imeMode = "Disabled";
					inputs[i].onkeypress = function () {
						return regInput(this, regNum, String.fromCharCode(event.keyCode));
					};
					inputs[i].onpaste = function () {
						return regInput(this, regNum, window.clipboardData.getData("Text"));
					};
					inputs[i].ondrop = function () {
						return regInput(this, regNum, event.dataTransfer.getData("Text"));
					};
					
			}
			replaceClass(inputs[i], "text_white");
		}
		if (sType == "button"||sType == "reset") {
			replaceClass(inputs[i], "input");
		}
	}
}

/**
 * input框输入验证基本函数
 * 
 * @param oElement
 * @param reg
 * @param inputStr
 * @return
 */
function regInput(oElement, reg, inputStr) {
	var docSel = document.selection.createRange();
	oSel = docSel.duplicate();
	oSel.text = "";
	var srcRange = oElement.createTextRange();
	oSel.setEndPoint("StartToStart", srcRange);
	var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);
	return reg.test(str);
}

/**
 * 字符串日期检查函数
 * 
 * @param dateStr
 * @return 日期格式正确，将返回国际标准格式的字符串，否则返回 false
 */
function chkDateStr(dateStr) {
	var year = "";
	var month = "";
	var day = "";
	var firstPos = dateStr.indexOf("-");
	if (firstPos == -1) {
		year = dateStr.substr(0, 4);
		month = dateStr.substr(4, 2);
		day = dateStr.substr(6, 2);
	} else {
		var secPos = dateStr.indexOf("-", firstPos + 1);
		if (secPos == -1) {
			return false;
		}
		
		year = dateStr.substring(0, firstPos);
		month = dateStr.substring(firstPos+1 , secPos);
		day = dateStr.substring(secPos+1 , 10);
	}

	//空值
	if (isNaN(year) || isNaN(month) || isNaN(day)) {
		return false;
	}
	//判断年的合法性,由于parseInt将前缀为 '0' 的字符串被当作八进制，故使用parseFloat
	var yearInt = parseFloat(year);
	if (yearInt > 3001 || yearInt < 1900) {
		return false;
	}
	//判断月合法性
	var monthInt = parseFloat(month);
	if (monthInt < 1 || monthInt > 12) {
		return false;
	} else {
		if (monthInt < 10) {
			month = "0" + monthInt;
		}
	}

	//判断日的合法性
	var dayInt = parseFloat(day);
	var maxdays = daysInMonth[monthInt - 1]; 
	//二月处理
	if (2 == monthInt) {
		maxdays = ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28;
	}
	if (dayInt < 1 || dayInt > maxdays) {
		return false;
	} else {
		if (dayInt < 10) {
			day = "0" + dayInt;
		}
	}
	return year + "-" + month + "-" + day;
}

/**
 * 指定元素日期检查函数
 * 
 * @param oElement
 * @return 
 */
function avpChkDate(oElement) {
	var dateStr = oElement.value;
	if (dateStr.length == 0) {
		return true;
	}
	var fmtDate = chkDateStr(dateStr);
	if (fmtDate) {
		oElement.value = fmtDate;
		return true;
	} else {
		alert("\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u65e5\u671f\uff01");
		//oElement.focus();
		//oElement.select();
		return false;
	}
}
/**
 * 隐藏加载信息
 * 
 * @return 
 */
function hidLoadInfo(){
	var divLoad = document.getElementById("loading");
	if(divLoad){
		divLoad.style.visibility = "hidden";
	}
}


addLoadEvent(addTableStyle);
addLoadEvent(hidLoadInfo);

//----------------------------------------------------------------------------

/**
 *弹出一个指定宽度和长度的窗口
 *
 */
function avpPopUp(theUrl,sWidth,sHeight){
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   window.open(theUrl,'',parm);   
}

/**
 *随机字符串
 *
 */
function  randomChar(len)  {
  var  x="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var  tmp="";
  for(var  i=0;i<len;i++)  {
  	tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
  }
  return  tmp;
}

/**
 *以提交形式弹出一个指定宽度和长度的窗口
 *
 */
function avpSubmitPopUp(formName,theUrl,sWidth,sHeight){
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var win_name = randomChar(10);
   var form;
   if(formName == ""){
   		form= document.forms[0];
   }else{
   		form= document.getElementById();
   } 
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   window.open('',win_name,parm);   
   
   var old_target = form.target;

   form.action=theUrl;
   form.target=win_name;
   form.submit();  
   form.target = old_target;
}

/**提交*/
function avpDoSubmit(theUrl){
	document.forms[0].action=theUrl;
	document.forms[0].submit();
}

/**
 * 跳转按钮功能
 * 
 * @return 
 */
function avpJumpSubmit(theUrl){
	dispLoadInfo();
	avpDoSubmit(theUrl);
	event.srcElement.disabled = true; 
}


/**
 * 连接跳转按钮功能
 * 
 * @return 
 */
function avpHerfJumpSubmit(theUrl){
	dispLoadInfo();
	location.herf = theUrl;
	event.srcElement.disabled = true; 
}
/**
 * 显示加载信息
 * 
 * @return 
 */
function dispLoadInfo1(){
	var divLoad = document.getElementById("loading");
	if(divLoad){
		divLoad.style.visibility = "visible";
	}
	var divData = document.getElementById("data_area");
	
	if(divData){
		divData.style.height = "10";
		divData.style.visibility = "hidden";
	}
}

/**
 * 提供复位按钮功能
 * 
 * @return 
 */
function avpReset(){
	oForm = document.forms[0];
	var els = oForm.elements;

	for(var i=0;i<els.length;i++){
		var sType = els[i].type;
		switch(sType){
			case "hidden":
					if((els[i].name).substring(0,2) == "p_"){
						if((els[i].name) != "p_reportkey"){
							els[i].value="";
						}
					}
				break;
			case "text":
			case "password":
			case "file":
			case "textarea":
					els[i].value="";
				break;
			case "checkbox":
			case "radio":
				var oElememts = document.getElementsByName(els[i].name);
				for(var j=0 ;j<oElememts.length;j++){
					oElememts[j].checked = false;
				}
				break;
			case "select-one":
			case "select-multiple":
				var oElememts = els[i].getElementsByTagName("option");
				for(var j=0 ;j<oElememts.length;j++){
					oElememts[j].selected = false;
				}
				els[i].selectedIndex = 0;
				break;  
		}
	}

}
/**
 * 条件页面提交
 * 
 * @param theUrl
 * @return 
 */
function avpCondSubmit(theUrl) {
	oForm = document.forms[0];
	var els = oForm.elements;
	var isNotChkOk = false;
	var i = 0;
    
    //遍历所有表元素
	for (; i < els.length; i++) {
    	//验证最小值
		if (els[i].min_len && (getElementValLen(els[i]) < els[i].min_len)) {
			isNotChkOk = true;
			break;
		}
       
       //验证输入最大值
		if (els[i].max_len && (getElementValLen(els[i]) > els[i].max_len)) {
			isNotChkOk = true;
			break;
		}
	}
	//验证不通过,弹出提示warning,同时该表单元素取得焦点
	if (isNotChkOk) {
		alert(els[i].warning);
		goBack(els[i]);
		return false;
	}else{
		dispLoadInfo();
		oForm.action=theUrl;
		oForm.submit();
		event.srcElement.disabled = true; 
	}
}

/**
 * 取指定元素值的长度，对于选择框，返回选中值的个数
 * 
 * @param oElememt
 * @return 
 */
function getElementValLen(oElememt) {
    //取得表单元素的类型
	var sType = oElememt.type;
	switch (sType) {
	  case "text":
	  case "hidden":
	  case "password":
	  case "file":
	  case "textarea":
		return len(oElememt.value);
	  case "checkbox":
	  case "radio":
		return getValLenChoose(oElememt);
	  case "select-one":
	  case "select-multiple":
		return getValLenSel(oElememt);
	}
}

/**
 * 取指定元素值的长度，对于选择框，返回选中值的个数
 * 
 * @param oForm
 * @return 
 */
function getValLenChoose(oElememt) {
	var sLen = 0;
    //取得第一个元素的name,搜索这个元素组
	var tmpels = document.getElementsByName(oElememt.name);
	for (var i = 0; i < tmpels.length; i++) {
		if (tmpels[i].checked) {
			sLen += 1;
		}
	}
	return sLen;
}
/**
* 取select元素，选中值的个数
*/
function getValLenSel(oElememt) {
	var sLen = 0;
	for (var i = 0; i < oElememt.options.length; i++) {                                                        
        //单选下拉框提示选项设置为value=""                   
		if (oElememt.options[i].selected && oElememt.options[i].value != "") {
			sLen += 1;
		}
	}
	return sLen;
}
/**
* 检查错误后，使错误元素得到焦点
*/
function goBack(oElememt) {
    //取得表单元素的类型
	var sType = oElememt.type;
	switch (sType) {
	  case "text":
	  case "hidden":
	  case "password":
	  case "file":
	  case "textarea":
		oElememt.focus();
		var rng = oElememt.createTextRange();
		rng.collapse(false);
		rng.select();
	  case "checkbox":
	  case "radio":
		var oElememts = document.getElementsByName(oElememt.name);
		oElememts[0].focus();
	  case "select-one":
	  case "select-multiple":
		oElememt.focus();
	}
}

/**
*把选定的select信息，copy到textarea中
*
*/
function cpSelToText(objList,textId,appendChar){
	    var objText = document.getElementById(textId);
		var len = objList.value.length;
		var addStr = appendChar + objList.value + appendChar;
 
		if(objText.value == ""){
			objText.value = addStr;
			
        }else{
			objText.focus();
			var range = document.selection.createRange();
            range.moveStart("character", -1);
            range.select();
            if(range.text.length == 0){
				objText.value = objText.value + addStr;
            }else{
                 range.text = range.text + addStr;
				 len = range.text.length;
             }
			range.select();
			range.moveStart("character", len);
         }
		
		objText.focus();
		
	}
	
	
/**
 *设置所有的日期样式
 */
	function setCebDate(){
   	//设置所有的INPUT框
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			var sType = inputs[i].type;
			if (sType == "text" ){
				if(inputs[i].getAttribute("className") == "ist_date") {
					var regDate = new RegExp("^\\d{1,4}([-]?(\\d{1,2}([-]?(\\d{1,2})?)?)?)?$", "i");
					//关闭中文输入
					inputs[i].style.imeMode = "Disabled";
					inputs[i].onkeypress = function () {
						return regInput(this, regDate, String.fromCharCode(event.keyCode));
					}
					inputs[i].onpaste = function () {
						return regInput(this, regDate, window.clipboardData.getData("Text"));
					}
					inputs[i].onblur = function () {
						return avpChkDate(this);
					}
				}else if(inputs[i].getAttribute("className") == "ceb_number") {
					var regNum = new RegExp("^[-]?\\d*\\.?\\d*$", "i");
					//关闭中文输入
					inputs[i].style.imeMode = "Disabled";
					inputs[i].onkeypress = function () {
						return regInput(this, regNum, String.fromCharCode(event.keyCode));
					};
					inputs[i].onpaste = function () {
						return regInput(this, regNum, window.clipboardData.getData("Text"));
					};
					inputs[i].ondrop = function () {
						return regInput(this, regNum, event.dataTransfer.getData("Text"));
					};
					
				}
				replaceClass(inputs[i], "text_white");
			}		
		}
	}
	
	 
function ShortcutKey(){ 
		if(window.event.keyCode==13) {
			var qry = document.getElementById('avp_query'); 
			if(qry){
				qry.onclick();
			}else{
			    var turnPage = document.getElementById('intPage');
			    if(turnPage){
			        goPage();
			    }
			} 
	}
}

var time_begin = (new Date()).getTime();
function show_time()
{

	var time_now=(new Date()).getTime();

	var time_distance=time_now-time_begin;
	var int_minute=Math.floor(time_distance/60000)
	time_distance-=int_minute*60000;
	var int_second=Math.floor(time_distance/1000)

	var msgTxt = document.getElementById("msgTxt");
	if(msgTxt){
		msgTxt.innerHTML="<font color='#FF0000'>正在加载数据，已查询["+int_minute+":"+int_second+"]秒，请稍后...</font>";
	}
	setTimeout("show_time()",1000);
}

function dispLoadInfo(){
	var msgw,msgh,bordercolor;
	msgw=400;//提示窗口的宽度
	msgh=100;//提示窗口的高度
	titleheight=25 //提示窗口标题高度
	bordercolor="#336699";//提示窗口的边框颜色
	titlecolor="#bad3fc";//提示窗口的标题颜色
			
	var sWidth,sHeight;
	sWidth=document.body.offsetWidth;
	sHeight=screen.height;

	var bgObj=document.createElement("div");
	bgObj.setAttribute('id','bgDiv');
	bgObj.style.position="absolute";
	bgObj.style.top="0";
	bgObj.style.background="#ECF3FF";
	bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
	bgObj.style.opacity="0.6";
	bgObj.style.left="0";
	bgObj.style.width=sWidth + "px";
	bgObj.style.height=sHeight + "px";
	bgObj.style.zIndex = "10000";
	document.body.appendChild(bgObj);
	
	var msgObj=document.createElement("div")
	msgObj.setAttribute("id","msgDiv");
	msgObj.setAttribute("align","center");
	msgObj.style.background="white";
	msgObj.style.border="1px solid " + bordercolor;
	msgObj.style.position = "absolute";
    msgObj.style.left = "50%";
    msgObj.style.top = "50%";
    msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
    msgObj.style.marginLeft = "-225px" ;
    msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
    msgObj.style.width = msgw + "px";
    msgObj.style.height =msgh + "px";
    msgObj.style.textAlign = "center";
    msgObj.style.lineHeight ="25px";
    msgObj.style.zIndex = "10001";
   
	var title=document.createElement("h4");
	title.setAttribute("id","msgTitle");
	title.setAttribute("align","right");
	title.style.margin="0";
	title.style.padding="3px";
	title.style.background=bordercolor;
	title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
	title.style.opacity="0.75";
	title.style.border="1px solid " + bordercolor;
	title.style.height="18px";
	title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
	title.style.color="white";
	
	time_begin = (new Date()).getTime();	  
	document.body.appendChild(msgObj);
	document.getElementById("msgDiv").appendChild(title);
	var txt=document.createElement("p");
	txt.style.margin="1em 0"
	txt.setAttribute("id","msgTxt");
    txt.innerHTML="<font color='#FF0000'>正在加载数据，已查询[0:0]秒，请稍后...</font>";
    document.getElementById("msgDiv").appendChild(txt);
    setTimeout("show_time()",1000);
}
document.onkeydown=ShortcutKey