<%@ page language="java"  pageEncoding="GBK"%>

<SCRIPT LANGUAGE="JavaScript">		
		function onLoadDo() {//加载
		    var savetype = eval("document.all."+"SAVETYPE");//保存方式
		    var value = "";
		    for(var i=0;i<savetype.length;i++) {
		        if(savetype[i].checked) {
		           value = savetype[i].value;
		        }
		    }
		    showContentOrFile(value);
		}
	</SCRIPT>

<jsp:include page="/cms/t12_article_add_include.jsp" />
