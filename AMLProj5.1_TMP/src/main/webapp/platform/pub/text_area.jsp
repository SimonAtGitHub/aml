<%@ page pageEncoding="GBK"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>

<%
String input_id = StringUtils.trimToEmpty(request.getParameter("input_id"));
String readonlyStr = StringUtils.trimToEmpty(request.getParameter("readflag"));
%>

<html>
	<head>
		<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=GBK">

	<%@ include file="../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/avpfunc.js"></script>

		<script type=text/javascript>
function reback(){
   if (!form1.content.readOnly){
	   //window.opener.document.forms[0].<%=input_id%>.value = form1.content.value;  
	    window.opener.document.getElementById("<%=input_id%>").value = form1.content.value;  
   }   
   window.close();
}

function setCursorPos(x){   
   var txtRange = x.createTextRange();   
   txtRange.moveStart("character",x.value.length);   
   txtRange.moveEnd("character",0);   
   txtRange.select();   
} 

function loadValue(){
	//form1.content.value = window.opener.document.forms[0].<%=input_id%>.value;
	form1.content.value = window.opener.document.getElementById("<%=input_id%>").value
	form1.content.focus();
}
</script>

	</head>

	<body >
		
	<div id='content'>

		<FORM name=form1 action="" method="post">
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">文本域详细内容</span></td>
						<td align="right">
							<input type="button" value="确 定" class="input" onclick="reback()" />					                  </td>
					</tr>
				</table>
			</div>       
			
			<div class='awp_detail'>
			<table>
				<tr >
					<td >
						详细内容：
					</td>
					<td >
						<textarea style="font-size:14" name="content" rows="30" cols="90" <%=readonlyStr %>
							onKeyUp="setTextAreaShowNumber('textarea_i',this)"
							onfocus="setCursorPos(this);setTextAreaShowNumber('textarea_i',this)"  
							onfocusout="setTextAreaClearNumber('textarea_i')"
							></textarea><I id="textarea_i"></I>
					</td>
				</tr>
				
			</table>
			</div>
		</FORM>
		</div>
		<script type=text/javascript>
			loadValue();
		</script>
	</body>
	
</html>

