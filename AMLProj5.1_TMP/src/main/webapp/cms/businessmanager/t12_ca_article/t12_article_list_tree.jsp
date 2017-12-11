<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<HEAD>
 <%
   String path = request.getContextPath();
 %>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	 <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<title></title>
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	 function uniteTable(tb,colLength){  
	
		//   检查表格是否规整   
		if   (!checkTable(tb))   return;   
		var   i=0;   
		var   j=0;   
		var   rowCount=tb.rows.length; //   行数   
		var   colCount=tb.rows[0].cells.length; //   列数   
		var   obj1=null;   
		var   obj2=null;   
		//   为每个单元格命名   
		for   (i=0;i<rowCount;i++){   
			for   (j=0;j<colCount;j++){   
				tb.rows[i].cells[j].id="tb__"   +   i.toString()   +   "_"   +   j.toString();   
			}   
		}   
		//   逐列检查合并   
		for   (i=0;i<colCount;i++){   
			if   (i==colLength)   return;   
			obj1=document.getElementById("tb__0_"+i.toString())   
			
			for   (j=1;j<rowCount;j++){   
				obj2=document.getElementById("tb__"+j.toString()+"_"+i.toString());   
				if   (obj1.innerText   ==   obj2.innerText && (obj1.innerText != "无数据")&& (obj1.innerText != "")){   
					obj1.rowSpan++;   
					obj2.parentNode.removeChild(obj2);   
				}else{   
					obj1=document.getElementById("tb__"+j.toString()+"_"+i.toString());  
				}   
			}   
		}   
	}   
	    
	
	//   功能：检查表格是否规整   
	function   checkTable(tb){   
		if   (tb.rows.length==0)   return   false;   
		if   (tb.rows[0].cells.length==0)   return   false;   
		for   (var   i=0;i<tb.rows.length;i++){   
			if   (tb.rows[0].cells.length   !=   tb.rows[i].cells.length)   return   false;   
		}   
		return   true;   
	}  
	function openPaperPage(URL){	
		var winProperty = 'height=450, width=600,right=1,top=1,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no';
		window.open(URL,'',winProperty);
    }
	</script> 
<style>
	.tablelist td {backgroud:#fff;border:1px solid #bbb; line-height:27px; padding-left:4px;}
	</style> 
</HEAD>

<body>
	<div id='content'>
	<html:form method="POST" action="/businessmanager/t12_ca_article/t12_ca_article_list.do">
	
 <div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">视 图</span>
						</td>
						<td align="right">
						&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<br/>
		  <table style="background:#fff;" id="table1" border="0" width="98%" align="center" cellpadding="0" cellspacing="0" class="tablelist">
					<c:out value="${html}" escapeXml="false"></c:out>
		  </table>
		
   		</html:form></div>
		   <script type="text/javascript">
		   uniteTable(table1,'<bean:write name="collevel"/>');
		   </script>
	</body>
</html>
