<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>		
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>交易方式编辑</title>
		<script type='text/javascript' src='./dwr/interface/TransWay.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="../../js/validate.js" language="javascript"></script>
		
		<%
			String inname = (String)request.getParameter("inname");
			String inname_disp = (String)request.getParameter("inname_disp");
		 %>
		<script language="javascript">
					
			var typeSelectID = "seltype";
			var cashSelectID = "selcash";
			var toolSelectID = "seltool";
			var cashColID = "colCash";
			var toolColID = "colTool";
			var g_type = "", g_cash = "", g_tool = "";
			
			var debug = false;
			function TRACE(des, value){
				if(!debug)
					return;
				alert(des + ": " + value);
			}

			function changeType() {
				g_type = $(typeSelectID).options[$(typeSelectID).selectedIndex].value;
				
				cascadType(g_type);
			}
			function changeType08() {
				g_type = $(typeSelectID).options[$(typeSelectID).selectedIndex].value;
				cascadType08(g_type);
			}			
			function init() {
				//var name = <%=inname %>;
			
				var obj=document.getElementById(typeSelectID);
				//var obj = document.getElementsByName("cou")[0];
				var txt = obj.value;
				
				TRACE("input value", txt);
				if(txt.length == 6) {
					g_type = txt.substr(0,2);
					if("00" == g_type) {
						g_cash = txt.substring(2, 4);
						g_tool = txt.substring(4, 6);						
					} else {
						g_tool = txt.substring(2, 6);
					}					
				}
				cascadType();// 刷新下拉框
			}
			
			// 币种下拉框
			function cascadType() {				
				TransWay.getTypeList(refreshType);
			}
			function cascadType08() {			
				TransWay.getTypeList(refreshType08);
			}
			function refreshType08(opts) {
				var optstxt = generateStrOpts(opts);
				$(typeSelectID).outerHTML = "<select id='"+ typeSelectID +"' onchange='changeType08();'>" + optstxt + "</select>";	
				if("" == g_type) {
					g_type = "00";
				}
				
				selectOptionByValue($(typeSelectID).options, g_type);	
				//			
				if("01"==g_type) {
					$(cashColID).style.display = "none";
					cascadTool($(typeSelectID).options[$(typeSelectID).selectedIndex].value);
				}else{
					var colcashO=document.getElementById("selcash");
					$(cashColID).style.display = "";
					cascadCash($(colcashO).options[$(colcashO).selectedIndex].value);
					var typeAndCash=colcashO.options[colcashO.selectedIndex].value+':'+g_type;
					cascadTool(typeAndCash);
				}
			}
			// 
			function refreshType(opts) {
				var optstxt = generateStrOpts(opts);
				$(typeSelectID).outerHTML = "<select id='"+ typeSelectID +"' onchange='changeType08();'>" + optstxt + "</select>";	
				
				if("" == g_type) {
					g_type = "00";
				}
				
				selectOptionByValue($(typeSelectID).options, g_type);	
				
				//
				if("01"==g_type) {
					$(cashColID).style.display = "none";
					cascadTool($(typeSelectID).options[$(typeSelectID).selectedIndex].value);
				}else{
					$(cashColID).style.display = "";
					cascadCash($(typeSelectID).options[$(typeSelectID).selectedIndex].value);
					var typeAndCash=$(typeSelectID).options[$(typeSelectID).selectedIndex].value+':'+g_type;
					cascadTool(typeAndCash);
				}
			}
			
			// 省下拉框 或外国默认"000000"
			function cascadCash(type) {				
				TransWay.getCashList(type, refreshCash);				
			}
			
			// 
			function refreshCash(opts) {
				var optstxt = generateStrOpts(opts);
				$(cashSelectID).outerHTML = "<select id='"+ cashSelectID +"' onchange='changeCash08();'>" + optstxt + "</select>";				
				if(g_cash=="") g_cash = "00";
				selectOptionByValue($(cashSelectID).options, g_cash);
			}
			function changeCash08(){
				var cash =$(typeSelectID).options[$(typeSelectID).selectedIndex].value+':'+ $(cashSelectID).options[$(cashSelectID).selectedIndex].value;
												
				cascadTool(cash);
			}
			function cascadTool(type) {
				TransWay.getToolList(type, refreshTool);	
			}
			
			function refreshTool(opts) {
				var optstxt = generateStrOpts(opts);
				$(toolSelectID).outerHTML = "<select id='"+ toolSelectID +"'>" + optstxt + "</select>";
					
				if(g_tool == "") g_tool = "10";
				selectOptionByValue($(toolSelectID).options, g_tool);
			}
						
			function selectOptionByValue(optObjs, value) {				
				for(var i=0; i<optObjs.length; i++) {					
					if(optObjs[i].value==value.toLowerCase() || optObjs[i].value==value.toUpperCase()) {
						optObjs[i].selected = true;						
						break;
					}
					else
						optObjs[i].selected = false;
				}
			}
			
			function generateStrOpts(map) {
				var res = "";
				if(map == null)
					return res;
			  for(var i=0; i<map.length; i++) {	
					var obj = map[i];
					res += getOptionTxt(obj.key1, obj.value1);
				}
				return res;
			}						
						
			function getOptionTxt(value, txt) {
				return "<option value=\"" + value + "\">" + txt + "</option>";
			}
			
			//
			function closeCountryAreaInput() {
				//g_toInputObj = null;
				//$(countryAreaTableID).style.display = "none";
				window.close();
			}
			
			//
			function setTransWay() {				
				var typekey="", typetxt="", cashkey="", cashtxt="", toolkey="", tooltxt=""; 
				var res, res_disp;
				typekey = $(typeSelectID).options[$(typeSelectID).selectedIndex].value;
				typetxt = $(typeSelectID).options[$(typeSelectID).selectedIndex].text;
				
				if(typekey == "00") {
					cashkey = $(cashSelectID).options[$(cashSelectID).selectedIndex].value;
					cashtxt = $(cashSelectID).options[$(cashSelectID).selectedIndex].text;
					
					toolkey = $(toolSelectID).options[$(toolSelectID).selectedIndex].value;
					tooltxt = $(toolSelectID).options[$(toolSelectID).selectedIndex].text;	
					
					res = typekey + cashkey + toolkey;
					res_disp = typetxt + cashtxt + tooltxt;		
				} else {
					toolkey = $(toolSelectID).options[$(toolSelectID).selectedIndex].value;
					tooltxt = $(toolSelectID).options[$(toolSelectID).selectedIndex].text;
					
					res = typekey + toolkey;
					res_disp = typetxt + tooltxt;		
				}
				
				var obj = window.opener.document.getElementsByName('<%=inname%>')[0];
				//var obj = document.getElementsByName("cou")[0];
				obj.value = res;
				  
				window.opener.document.getElementsByName('<%=inname_disp%>')[0].value = res_disp;
				window.close();
				obj.fireEvent('onchange');
                obj.onblur();
				//g_toInputObj.value = res;
				//closeCountryAreaInput();
			}
		</script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" onload="init();"><!-- validateDetail(); -->
	<table> 
		<tr>			
			<!-- <td><input type="text" id="cou"/></td> -->
			<td><select id="seltype" onchange="changeType08();"></select></td>
			<td id="colcash" style="display:none" ><select id="selcash"></select></td>
			<td id="colTool"><select id="seltool"></select></td>
			<td><input type="button" onclick="setTransWay();" value="确定"/></td>
		</tr>
	</table>	
	</BODY>
</HTML>