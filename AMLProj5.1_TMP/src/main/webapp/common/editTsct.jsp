<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>		
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>涉外交易分类代码编辑</title>
		<script type='text/javascript' src='./dwr/interface/Tsct.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="../../js/validate.js" language="javascript"></script>
		
		<%
			String inname = (String)request.getParameter("inname");
			String inname_disp = (String)request.getParameter("inname_disp");
		 %>
		<script language="javascript">
			
			var L1SelectID = "selL1";
			var L2SelectID = "selL2";
			var L3SelectID = "selL3";
			var g_L1 = "", g_L2 = "", g_L3 = "";
			
			var debug = false;
			function TRACE(des, value){
				if(!debug)
					return;
				alert(des + ": " + value);
			}

			function changeL1() {
				g_L1 = $(L1SelectID).options[$(L1SelectID).selectedIndex].value;
				
				cascadL1(g_L1);
			}
			
			function changeL2() {
				g_L2 = $(L2SelectID).options[$(L2SelectID).selectedIndex].value;
				
				cascadL2(g_L2);
			}
						
			function init() {
				//var name = <%=inname %>;
				var obj = window.opener.document.getElementsByName('<%=inname %>')[0];
				//var obj = document.getElementsByName("cou")[0];
				var txt = obj.value;
				TRACE("input value", txt);
				if(txt.length == 6) {
					g_L1 = txt.substr(0,1);
					g_L2 = txt.substring(0, 3);
					g_L3 = txt.substring(0, 6);	
				}
				cascadL1();// 刷新下拉框
			}
			
			// 
			function cascadL1() {				
				Tsct.getTsctLevel1(refreshL1);
			}
			
			// 
			function refreshL1(opts) {
				var optstxt = generateStrOpts(opts, true, "0");
				$(L1SelectID).outerHTML = "<select id='"+ L1SelectID +"' onchange='changeL1();'>" + optstxt + "</select>";	

				if(g_L1=="") g_L1 = "0";
				selectOptionByValue($(L1SelectID).options, g_L1);	
				
				if($(L1SelectID).options[$(L1SelectID).selectedIndex].value=="0") {
					$(L2SelectID).outerHTML = "<select id='"+ L2SelectID +"'>" + getOptionTxt("000","---") + "</select>";
					$(L3SelectID).outerHTML = "<select id='"+ L3SelectID +"'>" + getOptionTxt("000000", "---") + "</select>";				
					return;
				}
				
				cascadL2($(L1SelectID).options[$(L1SelectID).selectedIndex].value);
			}
			
			
			function cascadL2(type) {				
				Tsct.getTsctLevel2(type, refreshL2);				
			}
			
			// 
			function refreshL2(opts) {
				var optstxt = generateStrOpts(opts, false, "");
				$(L2SelectID).outerHTML = "<select id='"+ L2SelectID +"' onchange='changeL2();'>" + optstxt + "</select>";
				
				if(g_L2=="") g_L2 = $(L1SelectID).options[$(L1SelectID).selectedIndex].value + "01";
				selectOptionByValue($(L2SelectID).options, g_L2);
				
				cascadL3($(L2SelectID).options[$(L2SelectID).selectedIndex].value);
			}
			
			function cascadL3(type) {
				Tsct.getTsctLevel3(type, refreshL3);	
			}
			
			function refreshL3(opts) {
				var optstxt = generateStrOpts(opts, false, "");
				$(L3SelectID).outerHTML = "<select id='"+ L3SelectID +"'>" + optstxt + "</select>";
					
				if(g_L3 == "") $(L1SelectID).options[$(L1SelectID).selectedIndex].value + "01010";
				selectOptionByValue($(L3SelectID).options, g_L3);
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
			
			function generateStrOpts(map, bTip, tipValue) {
				var res = "";
				
				if(map == null)
					return res;
				
				// 是否有“--请选择--”选项
				if(bTip) {
					res += getOptionTxt(tipValue, "--请选择--");
				}
				
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
			function setTsct() {
				var res, res_disp;
				
				res = $(L3SelectID).options[$(L3SelectID).selectedIndex].value;
				res_disp = $(L3SelectID).options[$(L3SelectID).selectedIndex].text;
				
				if("000000" == res) 
					res_disp = res;
				
				var obj = window.opener.document.getElementsByName('<%=inname%>')[0];
				//var obj = document.getElementsByName("cou")[0];
				obj.value = res;
				window.opener.document.getElementsByName('<%=inname_disp%>')[0].value = res_disp;
				window.close();
				window.opener.document.getElementsByName('<%=inname%>')[0].fireEvent('onchange');
                window.opener.document.getElementsByName('<%=inname%>')[0].onblur();
				//g_toInputObj.value = res;
				//closeCountryAreaInput();
			}
		</script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" onload="init();"><!-- validateDetail(); -->
	<table> 
		<tr>			
			<!-- <td><input type="text" id="cou"/></td> -->
			<td><select id="selL1" onchange="changeL1();"></select></td>
			<td><select id="selL2" onchange="changeL2();"></select></td>
			<td><select id="selL3"></select></td>
			<td><input type="button" onclick="setTsct();" value="确定"/></td>
		</tr>
	</table>	
	</BODY>
</HTML>