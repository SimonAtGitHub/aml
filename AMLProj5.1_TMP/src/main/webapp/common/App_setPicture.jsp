<%@ page contentType="text/html; charset=GBK" %>
<%
	String yTop1 = request.getParameter("yAxisTop");
	String yBottom1 = request.getParameter("yAxisBottom");
	if (yTop1 == null){
		yTop1 = "";
	}
	if (yBottom1 == null){
		yBottom1 = "";
	}

	String ifSetTwice = (String)request.getAttribute("setTwice");
	if ((ifSetTwice == null) || (ifSetTwice.equals(""))){
		ifSetTwice = "";
	}else{
		ifSetTwice = "checked";
	}


	out.print("纵轴上限值：<input class = 'input' type = 'text' name = 'yAxisTop' value = '" + yTop1 + "' onKeyPress = 'javascript:if(window.event.keyCode == 13){frm.yAxisBottom.focus()}'/> 纵轴下限值：<input class = 'input' type = 'text' name = 'yAxisBottom' value = '" + yBottom1 + "' onKeyPress = 'javascript:if(window.event.keyCode == 13){frm.chartAxisConfirm.click()}'/> 放大二倍：<input type = 'checkbox' name = 'setTwice' value = '2' " + ifSetTwice + "> <input class = 'button' type = 'button' name = 'chartAxisConfirm' value = 确定 onclick = '_postChartAxis(\"" + request.getAttribute("submitURL") + "\")'/>");
if (request.getAttribute("graphDataEmpty") != null && request.getAttribute("graphDataEmpty").equals("1")){
	out.print("<img src = '/application/sinochart/images/noValue.jpg' /img>");
}else{
	String chart_html = (String)request.getAttribute("charthtml");
	if(!chart_html.equals(""))
		out.print(chart_html);
	else
		out.print("<img src = '/application/sinochart/images/noValue.jpg' /img>");
}
%>