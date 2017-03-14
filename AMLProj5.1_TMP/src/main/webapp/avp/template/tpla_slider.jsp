<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

<BODY  bgcolor="#FFCD0C"  >
<DIV id=showmenu style="LEFT: 2px; WIDTH: 18px; POSITION: absolute; TOP: 221px; HEIGHT: 59px">
	
</DIV>

<SCRIPT language=javascript>
//显示/隐藏左边帧( 默认情况下为显示左边帧 2003.4 )
var currentChoice = true;
arrow1=new Image;
arrow2=new Image;
//arrow1.src="<%=request.getContextPath()%>/images/arr2.gif";
//arrow2.src="<%=request.getContextPath()%>/images/arr1.gif";
var wid = 18;
if (currentChoice) {
	document.img1.src=arrow1.src;
	document.img1.alt="隐藏菜单";
} else {
    document.img1.src=arrow2.src;
    document.img1.alt="显示菜单";
}
function addFrame(){
	if(currentChoice){
		wid +=2 ;
		parent.tpla.cols=wid+"%,10,*";
	}
}
function hidFrame(){
	if(currentChoice){
			parent.tpla.cols="0,10,*";
			document.img1.src=arrow2.src;
			document.img1.alt="显示菜单";

	} else {
			parent.tpla.cols=wid+"%,10,*";
			document.img1.src=arrow1.src;
			document.img1.alt="隐藏菜单";
	}
	currentChoice = !currentChoice;

}
window.document.body.ondblclick= addFrame;
</SCRIPT>



</BODY>
</HTML>
