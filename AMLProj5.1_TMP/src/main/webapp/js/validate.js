
var g_changed = false; // 是否修改
		//var g_appid = "2";
var G_VALIDATING = "VALIDATING";
var G_VALIDATE = "VALIDATE";
var G_INVALIDATE = "INVALIDATE";
var G_UNVALIDATE = "UNVALIDATE";
var g_ArrMsg = new Array(); // 显示验证阶段的html对象列表
/*
		 * 根据name获取页面中第i+1个html对象
		 * @param name html对象name
		 * @param i 想获取的html对象在页面中的索引
		 */
function $$(name, i) {
	return document.getElementsByName(name)[i];
}
/*
		 * 根据显示验证阶段html对象的ps判断是否所有验证字段都验证通过
		 */
function checkAllValidate() {
	for (var i = 0; i < g_ArrMsg.length; i++) {
		var msg = g_ArrMsg[i].ps;
		if (msg == G_INVALIDATE) {
			alert("存在未校正的数据，保存失败！");
			return false;
		} else {
			if (msg == G_VALIDATING) {
				alert("还在验证数据，请稍候保存！");
				return false;
			}
		}
	}
	return true;
}
/*
		 * 根据验证对象id创建一个html对象用于显示验证阶段
		 * @param obj 页面中验证字段的输入框对象，或者id为需验证对象id加"_disp"、"_flag"或"_value"的html对象
		 */
function createMsgArea(obj) {
	var id = obj.name;
	id = id + "_vmsg";
	//var o = document.createElement("<span class='tipstyle' id='" + id + "' ps=''></span>");
	var o = document.createElement("span"); 
	o.className="tipstyle";
	o.setAttribute("id", id);
	o.setAttribute("ps", "");
	g_ArrMsg.push(o);
	return o;
}
function insertAdjacentElement(obj,where,parsedNode){
  switch(where){
  case "beforeBegin":
  obj.parentNode.insertBefore(parsedNode,obj);
  break;
  case "afterBegin":
  obj.insertBefore(parsedNode,obj.firstChild);
  break;
  case "beforeEnd":
  obj.appendChild(parsedNode);
  break;
  case "afterEnd": 
  if(obj.nextSibling){
  obj.parentNode.insertBefore(parsedNode,obj.nextSibling); 
  }
  else{
  obj.parentNode.appendChild(parsedNode);
  }
  break;
  }
  }

/*
		 * 获取显示验证阶段的html对象，如果第一次验证则在验证字段输入框后添加显示验证阶段的html对象
		 * @param obj 页面中验证字段的输入框对象，或者id为需验证对象id加"_disp"、"_flag"或"_value"的html对象		 
		 */
function getMsgArea(obj) {
	var id = obj.name;
	id = id + "_vmsg";
	var msgarea;
	if ($(id) == null) {
		msgarea = createMsgArea(obj);
		//obj.insertAdjacentElement("afterEnd", msgarea);alert("5::"+msgarea);
		insertAdjacentElement(obj,"afterEnd", msgarea);
		return msgarea;
	} else {
		return $(id);
	}
}

/*
		 * 显示或更新验证阶段
		 * 
		 * @param obj 页面中验证字段的输入框对象，或者id为需验证对象id加"_disp"、"_flag"或"_value"的html对象		 
		 * @param flag 验证阶段标志 0 验证中 1 正确 2 错误 3 未验证
		 * @param msg 显示内容
		 */
function showValidateMsg(obj, flag, msg) {

	var msgarea = getMsgArea(obj);
	msgarea.innerHTML = "";
	if (flag == 0) { // 验证中
		msgarea.innerHTML = "验证中...";
		msgarea.ps = G_VALIDATING;
	} else {
		if (flag == 1) { // 正确
			msgarea.innerHTML = "<img src='../../images/validate.jpg'/>";
			msgarea.ps = G_VALIDATE;
		} else {
			if (flag == 2) { // 错误
				msgarea.innerHTML = msg;
				msgarea.ps = G_INVALIDATE;
			} else {
				if (flag == 3) { // 未验证
					msgarea.innerHTML = "<img src='../../images/validate.jpg'/>";
					msgarea.ps = G_UNVALIDATE;
				} else {
					if (flag == 4) {
						msgarea.ps = G_VALIDATE;
					}
				}
			}
		}
	}
}
		// 设置字段修改标志
function change() {
	g_changed = true;
}
function setRoot(url) {
	root = url;
}
/*
		 * 获取需验证字段值及其所需参考
		 * 如果字段值修改，则显示验证状态，调用验证函数
		 * 
		 * @param obj 页面中验证字段的输入框对象，或者id为需验证对象id加"_disp"、"_flag"或"_value"的html对象		 
		 * @param ref1name 验证需要的第一参考，如果不为空并且有name为该值的html对象，则取该对象的value为第一参考，否则以传入的值为第一参考
		 * @param ref2name 验证需要的第二参考，如果不为空并且有name为该值的html对象，则取该对象的value为第二参考，否则以传入的值为第二参考
		 */
function validate(obj, ref1name, ref2name) {
	var id = obj.name;
	var vObj = obj;
	var ref1 = "", ref2 = "";
	var idx = id.indexOf("_disp");
	if (idx == -1) {
		idx = id.indexOf("_flag");
	}
	if (idx == -1) {
		idx = id.indexOf("_value");
	}
	if (idx != -1) {
		id = id.substr(0, idx);
		vObj = $$(id, 0);
	}
	if (ref1name != "") {
		var ref1obj = $$(ref1name, 0);
		if (ref1obj != null) {
			ref1 = ref1obj.value;
		} else {
			ref1 = ref1name;
		}
	}
	if (ref2name != "") {
		var ref2obj = $$(ref2name, 0);
		if (ref2obj != null) {
			ref2 = ref2obj.value;
		} else {
			ref2 = ref2name;
		}
	}

			//g_validateObj = obj;
	if (g_changed) { 
		showValidateMsg(vObj, 0, ""); // 显示验证状态
				//g_validating = true;
				// 调用验证函数，并且设置验证完后处理响应函数
		BasicReport.validateOneItem(g_appid, vObj.name, vObj.value, ref1, ref2, updateValidateRes);//appid, obj.name, obj.value
				//var para = { "app_id":g_appid, "field_id":vObj.name, "value":vObj.value, "ref1":ref1, "ref2":ref2 };
				//BasicReport.validateItem(para, updateValidateRes);
		g_changed = false;
	}
}
function validate1(obj, ref1name, ref2name, alertType, tsdr, cfrc, tdrc, tstp) {
	var id = obj.name;
	var vObj = obj;
	var ref1 = "", ref2 = "", ref3 = "", ref4 = "", ref5 = "", ref6 = "", ref7 = "";
	var idx = id.indexOf("_disp");
	if (idx == -1) {
		idx = id.indexOf("_flag");
	}
	if (idx == -1) {
		idx = id.indexOf("_value");
	}
	if (idx != -1) {
		id = id.substr(0, idx);
		vObj = $$(id, 0);
	}
	if (ref1name != "") {
		var ref1obj = $$(ref1name, 0);
		if (ref1obj != null) {
			ref1 = ref1obj.value;
		} else {
			ref1 = ref1name;
		}
	}
	if (ref2name != "") {
		var ref2obj = $$(ref2name, 0);
		if (ref2obj != null) {
			ref2 = ref2obj.value;
		} else {
			ref2 = ref2name;
		}
	}

	//alert(alertType+' tsdr'+tsdr+' cfrc'+cfrc+' tdrc'+tdrc+' tstp'+tstp);
			//g_validateObj = obj;
	if (g_changed) {
		showValidateMsg(vObj, 0, ""); // 显示验证状态
		
		BasicReport.validateOneItem1(g_appid, vObj.name, vObj.value, ref1, ref2, alertType, tsdr, cfrc, tdrc, tstp, updateValidateRes);//appid, obj.name, obj.value
				//var para = { "app_id":g_appid, "field_id":vObj.name, "value":vObj.value, "ref1":ref1, "ref2":ref2 };
				//BasicReport.validateItem(para, updateValidateRes);
		g_changed = false;
	}
}
/*
		 * 显示验证结果
		 * @param res 验证结果，参数类型在配置文件（dwr.xml）中配置
		 */
function updateValidateRes(res) {
	if (res.validate == "VALIDATE" || res.validate == "true") { // 正确
		showValidateMsg($$(res.name, 0), 1, ""); // 通过
	} else {
		if (res.validate == "INVALIDATE" || res.validate == "false") {
			showValidateMsg($$(res.name, 0), 2, res.msg); // 不通过		
		} else {
			if (res.validate == "END") { // 未验证
				showValidateMsg($$(res.name, 0), 3, "");
			}
		}
	}
			//g_validating = false;
}
		//返回对象值
function get_obj_value(refname) {
	var refvalue = "";
	var refobj = $$(refname, 0);
	if (refobj != null) {
		refvalue = refobj.value;
	}
	return refvalue;
}
//返回交易方式		
function get_tstp_value(refname, refname1, refname2) {
	var res = "";
	var refvalue = "";
	var refobj = $$(refname, 0);
	var refvalue1 = "";
	var refobj1 = $$(refname1, 0);
	var refvalue2 = "";
	var refobj2 = $$(refname2, 0);
	if (refobj != null) {
		refvalue = refobj.value;
	}
	if (refobj1 != null) {
		refvalue1 = refobj1.value;
	}
	if (refobj2 != null) {
		refvalue2 = refobj2.value;
	}
	if (refvalue == "00" || refvalue=="CNY") {
		res = "00" + refvalue1 + refvalue2;
	} else {
		res = "01" + refvalue2;
	}
	return res;
}
function get_opp_country(refname, refname1, refname2,refname3) {
	var res = "";
	var refvalue = "";
	var refobj = $$(refname, 0);
	var refvalue1 = "";
	var refobj1 = $$(refname1, 0);
	var refvalue2 = "";
	var refobj2 = $$(refname2, 0);
	var refvalue3 = "";
	var refobj3 = $$(refname3, 0);
	if (refobj != null) {
		refvalue = refobj.value;
	}
	if (refobj1 != null) {
		refvalue1 = refobj1.value;
	}
	if (refobj2 != null) {
		refvalue2 = refobj2.value;
	}
	if (refobj3 != null) {
		refvalue3 = refobj3.value;
	}
	
	if (refvalue == "CHN"||refvalue == "Z01"||refvalue == "Z02"||refvalue == "Z03"||refvalue == "") {
	     res = refvalue;
		if (getLength(refvalue1) == 6) {
			res = refvalue + refvalue1;
		} 
		if (getLength(refvalue2) == 6) {
				res = refvalue + refvalue2;
		}
		if (getLength(refvalue3) == 6) {
				res = refvalue + refvalue3;
		}
		if (getLength(res) == 6) {
			res = "NULL" + res;
	}
		
	} else {
		if (refvalue != null && getLength(refvalue) == 3) {
			res = refvalue + "000000";
		}
	}
	return res;
}

