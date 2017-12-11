<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%--
本菜单为公用的菜单显示界面
需要从后台得到如下参数
menuList ArrayList对象，封装 com.ist.rep1104.basever.dto.T04_menu数据，为显示的菜单数据
--%>

<html>
	<head>
		<SCRIPT LANGUAGE="JavaScript">
	function test(){
		var awp_chk = document.getElementsByName('awp_tree');
		var sel_key = document.getElementById('problemsCode');
		var sel_val = document.getElementById('problemsText');
	    var val = "";
		var key = "";
		var len = awp_chk.length;
		for (var i = 0; i < len; i++){
			if(awp_chk[i].checked){
				key += ","+awp_chk[i].value;
				val += ","+awp_chk[i].disp_val;
			}
		}
		sel_key.value=key.substr(1);
		sel_val.value=val.substr(1);
	}
  function dosubmit(theUrl){
    test();
    document.forms[0].action=theUrl;
    document.forms[0].submit();
	}

function topWin(){
			window.focus();
	}
	

	
	
</SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>数据项菜单</title>
		<%@ include file="style_include.jsp" %>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/MzTreeView.js"></script>
		<link href="<%=request.getContextPath()%>/skin/<%=style %>/css/dtreeStyle.css"
			rel="stylesheet" type="text/css" />
	</head>

	<body  leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0" onblur="topWin();">
		<html:form action="/common/location_treewindow.do" method="post">

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			
						<input type="hidden" id="problemsText" name="names" value="" 
							/>
						<input type="hidden" id="problemsCode" name="selectedkey" value=""
							size="30" />
					
				
<%
			            String output = (String) request.getAttribute("output_tree");
			            out.print(output);
			%>

			
<SCRIPT language=javascript>

var OpenedWin = null;
 
function myload2()

{
		if (navigator.appName == "Netscape")

    {
    	document.actionbar.pageY=108;
			document.actionbar.pageX=10;
			//window.screen.width-100;
			mymove2();
		}
		else
		{
			actionbar.style.top=108;
			actionbar.style.left=10;//window.screen.width-100
			mymove2();
		}
}
 
document.ns = navigator.appName == "Netscape"
var a
var b
var x=0
function mymove2()
{
 		window.screen.width>800 ? a=200:a=0
 		b=window.screen.width
 		if(document.ns)
 		{
 			document.actionbar.top=pageYOffset;//pageYOffset+270+a
 			document.actionbar.left=10;//b-100
 			setTimeout("mymove2();",1)
 		}
 		else
 		{
 			actionbar.style.top=document.body.scrollTop+380;//document.body.scrollTop+270+a
 			actionbar.style.left=450;//b-130
 			setTimeout("mymove2();",1)
 		}
}

</SCRIPT>
			<!--begin float-->
			<SCRIPT language=javascript>
	
if (navigator.appName == "Netscape")
		
{document.write("<layer align=center id=actionbar top=180 width=770>");
}
	else
		
{document.write("<div align=center id=actionbar style='position:absolute;height:40;width:770;top:180;left:-100;visibility: visible;z-index: 1'>");
}

</SCRIPT>
			<table align="left">
				<tr>

					<td>
						<input type='button' class="botton" value="确 定" 
							onclick="dosubmit('location_commontreewindow_result.do')" />

						<input type="button" class="botton" name="reset" value="重 选"
							onclick="_resetAll();" />
					</td>

				</tr>
			</table>
			<SCRIPT language=javascript>

	if(navigator.appName == "Netscape")

		{document.write("</layer>");
		
myload2();
}
	else
		{document.write("</div>");
		
myload2();
}

</SCRIPT>
			<!----float button end---->
			<input type="hidden" name="forms"
				value="<%=request.getAttribute("forms")%>" />
			<input type="hidden" name="localset" id="localset"
				value="<%=request.getAttribute("localset")%>" />
			<input type="hidden" name="menu_id" id="menu_id"
				value="<%=request.getAttribute("menu_id")%>" />
			<input type="hidden" name="format" id="format"
				value="<%=request.getAttribute("format")%>" />
		</html:form>

	</body>
</html>
