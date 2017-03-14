<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.util.Constans" %>
<HTML>
	<HEAD>		
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>

		<script type='text/javascript' src='./dwr/interface/CountryArea.js'></script>		
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="../js/validate.js" language="javascript"></script>
		
		<%
			String inname = (String)request.getParameter("inname");
			String inname_disp = (String)request.getParameter("inname_disp");
			String type = (String)request.getParameter("type");
	        String p_area=Constans.tx_occur_area;	 
       %>
		<script language="javascript"><!--
			// 显示行政区划代码的输入框			
			var countrySelectID = "selcountry";
			var areaSelectID = "selarea";
			var citySelectID = "selcity";
			var townSelectID = "seltown";
			var cityColID = "colCity";
			var townColID = "colTown";
			var cityID = "City";
			var townID = "Town";
			var areaID = "Area";
			var g_country = "", g_area = "";
			
			var debug = false;
			function TRACE(des, value){
				if(!debug)
					return;
				alert(des + ": " + value);
			}

			function changeCountry() {
				var selObj, idx;
				selObj = $(countrySelectID);
				idx = $(countrySelectID).selectedIndex;
				g_country = selObj.options[idx].value;
				
				cascadArea(g_country);
			}
			
			function changeArea() {
				var selObj, idx;
				selObj = $(areaSelectID);
				idx = $(areaSelectID).selectedIndex;
				g_area = selObj.options[idx].value;
				
				cascadCity(g_area);
			}
			
			function changeCity() {
				var selObj, idx;
				selObj = $(citySelectID);
				idx = $(citySelectID).selectedIndex;
				g_area = selObj.options[idx].value;	
				cascadTown(g_area);	
			}
			
			function changeTown() {
				var selObj, idx;
				selObj = $(citySelectID);
				idx = $(citySelectID).selectedIndex;
				g_area = selObj.options[idx].value;				
			}
			
			function init() {
				//var name = <%=inname %>;
				var obj = window.opener.document.getElementsByName('<%=inname %>')[0];
				//var obj = document.getElementsByName("cou")[0];
				var txt = obj.value
				TRACE("input value", txt);
				var orgcountry = "", orgarea = "";
				if(txt.length == 9) {
					g_country = txt.substr(0,3);
					g_area = txt.substr(3,9);
				} else if(txt.length==6) {
					if(txt!="000000") {
						g_country = "CHN";						
					} else {
						g_country = "USA";
					}
					g_area = txt;
				}
				
				cascadCountry();// 刷新下拉框
		            
			}
			
			// 国家下拉框
			function cascadCountry() {
			
			if ('<%=type%>'=='1'){				
				CountryArea.getCountryList1(refreshCountry);	
				}else {
				CountryArea.getCountryList(refreshCountry);	
				
				}			
			}
			// 
			function refreshCountry(opts) {
				var optstxt = generateStrOpts(opts);
				
				$(countrySelectID).outerHTML = "<select id='selcountry' onchange='changeCountry();'>" + optstxt + "</select>";	
				
				TRACE("country options innerHTML", $(countrySelectID).innerHTML);
				
				if("" == g_country) {
					g_country = "CHN";
				//	g_area = "110101";
				}				
				
				selectOptionByValue($(countrySelectID).options, g_country);	
				// 省下拉框 或外国默认"000000"
				cascadArea(g_country);
			}
			
			// 省下拉框 或外国默认"000000"
			function cascadArea(strc) {
				if(strc=='Z01'||strc=='Z02'||strc=='Z03'){
					strc='CHN'
				}				
				CountryArea.getAreaList(strc, refreshArea);				
			}
			
		
			function refreshArea(opts) {
				var optstxt = generateStrOpts(opts);
				$(areaSelectID).outerHTML = "<select id='"+ areaSelectID +"' onchange='changeArea();'>" + optstxt + "</select>";
				
				TRACE("area options", optstxt);
				
				var selValue = g_area;
				//if(g_country=="") {
				//	selValue = "110000";					
				if(selValue==""){	
					selValue=<%=p_area%>;		
				} else if("chn"!=g_country && "CHN"!=g_country && "Z01"!=g_country && "Z02"!=g_country && "Z03"!=g_country) {
					selValue = "000000";	
				} else {
				   selValue = selValue.substring(0,2) + "0000";
				}
				
				selectOptionByValue($(areaSelectID).options, selValue);
				
				// 中国某省下属 市下拉框
				if("chn"!=g_country && "CHN"!=g_country && "Z01"!=g_country && "Z02"!=g_country && "Z03"!=g_country) {	
					$(cityColID).style.display = "none";
					$(townColID).style.display = "none";
					$(cityID).style.display = "none";
					$(townID).style.display = "none";
					$(areaID).style.display = "none";
				} else {
					$(cityColID).style.display = "";
					$(townColID).style.display = "";
					$(cityID).style.display = "";
					$(townID).style.display = "";
					$(areaID).style.display = "";
					cascadCity($(areaSelectID).options[$(areaSelectID).selectedIndex].value);
				}
			}
			
			function cascadCity(strc) {
				CountryArea.getCityListByProvince(strc, refreshCity);	
			}
			
			function refreshCity(opts) {
				var optstxt = generateStrOpts(opts);
				$(citySelectID).outerHTML = "<select id='"+ citySelectID +"' onchange='changeCity();'>" + optstxt + "</select>";
				
				var selValue = g_area;
				if(g_country=="") {
					selValue = "110100";					
				} else if("chn"!=g_country && "CHN"!=g_country && "Z01"!=g_country && "Z02"!=g_country && "Z03"!=g_country) {
					selValue = "000000";	
				} else {					
				 	selValue = selValue.substring(0,4) + "00";
				}				
				
				selectOptionByValue($(citySelectID).options, selValue);
				// 中国某省某市下属 县下拉框	
				cascadTown($(citySelectID).options[$(citySelectID).selectedIndex].value);
			
			}
			
			function cascadTown(strc) {
		     CountryArea.getTownListByCity(strc, refreshTown);	
			}
			
			function refreshTown(opts) {		
				var optstxt = generateStrOpts(opts);
				$(townSelectID).outerHTML = "<select id='"+ townSelectID +"' onchange='changeTown();'>" + optstxt + "</select>";
				
				var selValue = g_area;
				if(g_country=="") {
					selValue = "110100";					
				} else if("chn"!=g_country && "CHN"!=g_country && "Z01"!=g_country && "Z02"!=g_country && "Z03"!=g_country) {
					selValue = "000000";	
				}
				
				selectOptionByValue($(townSelectID).options, selValue);				
			}
			
			function selectOptionByValue(optObjs, value) {
				TRACE("selectOptionByValue", value);
				TRACE("options length", optObjs.length);
				
				for(var i=0; i<optObjs.length; i++) {					
					//if(optObjs[i].value==value.toLowerCase() || optObjs[i].value==value.toUpperCase()) {
					if(optObjs[i].value==value){
						optObjs[i].selected = true;
						
						TRACE("select ", value);
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
			function setCountryArea() {				
				var countrykey="", countrytxt="", areakey="", areatxt=""; 
				
				countrykey = $(countrySelectID).options[$(countrySelectID).selectedIndex].value;
				countrytxt = $(countrySelectID).options[$(countrySelectID).selectedIndex].text;
					
				areakey = $(areaSelectID).options[$(areaSelectID).selectedIndex].value;
				areatxt = "外国";
				if("chn"!=g_country && "CHN"!=g_country && "Z01"!=g_country && "Z02"!=g_country && "Z03"!=g_country) {
                    areatxt = ('<%=type%>'=='short')? "000000":"";
				} else {
				  if ($(townSelectID).options[$(townSelectID).selectedIndex].value!="-1"){
					areakey = $(townSelectID).options[$(townSelectID).selectedIndex].value;					
					areatxt = $(areaSelectID).options[$(areaSelectID).selectedIndex].text + 
							  //$(citySelectID).options[$(citySelectID).selectedIndex].text + 	
							  $(townSelectID).options[$(townSelectID).selectedIndex].text; 
							  }
	              else if ($(citySelectID).options[$(citySelectID).selectedIndex].value!="-1"){//第三级地区未知就取第二级的地区编号
	                areakey = $(citySelectID).options[$(citySelectID).selectedIndex].value;					
					areatxt = $(citySelectID).options[$(citySelectID).selectedIndex].text;
	              }  else if ($(areaSelectID).options[$(areaSelectID).selectedIndex].value!="-1"){//第三级和第二级地区未知就取第一级的地区编号
	                areakey = $(areaSelectID).options[$(areaSelectID).selectedIndex].value;					
					areatxt = $(areaSelectID).options[$(areaSelectID).selectedIndex].text;
	              } 

				}
				var res = ('<%=type%>'=='short')? areakey : (countrykey+areakey);
				var res_disp = ('<%=type%>'=='short')? areatxt : countrytxt+areatxt;
		      
				window.opener.document.getElementsByName('<%=inname%>')[0].value = res;
				window.opener.document.getElementsByName('<%=inname_disp%>')[0].value = res_disp;
				
				window.close();
				window.opener.document.getElementsByName('<%=inname%>')[0].fireEvent('onchange');
                window.opener.document.getElementsByName('<%=inname%>')[0].onblur();
				//g_toInputObj.value = res;
				//closeCountryAreaInput();
			}
		--></script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" onload="init();"><!-- validateDetail(); -->
	<table> 
		<tr>			
			<td>国家:</td><td><select id="selcountry" onchange="changeCountry();"></select></td>
			<td id="Area">省：</td><td><select id="selarea" onchange="changeArea();"></select></td>
			<td id="City">市：</td><td id="colCity" style="display:none" onchange="changeCity();"><select id="selcity"></select></td>
			<td id="Town">区：</td><td id="colTown" style="display:none" onchange="changeTown();"><select id="seltown"></select></td>
			<td><input type="button" onclick="setCountryArea();" value="确定"/></td>
		</tr>
	</table>	
	</BODY>
</HTML>