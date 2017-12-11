<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script LANGUAGE="JavaScript">
function toExcel(url){
   document.forms[0].action=url;
   document.forms[0].submit();
}
</script> 
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg" >
<html:form action="/para_export/export.do" method="post">
<div id="main">

	<div class="conditions">
  <div class="cond_t">
      <span>反洗钱指标参数一览表下载 </span> 
     </div>
  
  
   <div class="list">
          <table  border="0" cellpadding="0" cellspacing="0">
          <!--  
            <tr>

              <td>
                <font  color="red">反洗钱指标参数一览表   </font>
               	<a href="#" onClick="window.open('<%=request.getContextPath()%>/common/download_zhibiao.jsp?url=<%=request.getAttribute("url")%>','','height=160, width=300,left=100,top=100');this.style.color='red';">
              </td>
               
            </tr>
            <tr>

              <td>
       			<font color="red"> 风险评级指标参数一览表  </font>
                	<a href="#" onClick="window.open('<%=request.getContextPath()%>/common/download_zhibiao.jsp?url=<%=request.getAttribute("url1")%>','','height=160, width=300,left=100,top=100');this.style.color='red';">
              </td>
            </tr>
           --> 
            <tr>
            	<td>金融机构反洗钱指标参数一览表</td>
            	<td>
            		<a href="#" onClick="toExcel('exportT07_valparaList.do')">
       				<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
       			</td>
            </tr>
            <tr>
            	<td >风险评级公式表</td>
            	<td>
            		<a href="#" onclick="toExcel('exportT08_gsList.do')">
       				<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
            	</td>
            </tr>
            <tr>
            	<td>风险评级积分表</td>
            	<td>
            		<a href="#" onclick="toExcel('exportT08_def_tmplList.do')">
       				<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
            	</td>
            </tr>
          </table>
 	</div>
 	
 
 	
 	
 	
 	
 </div>
 </div>
</html:form>
</BODY>
</html:html>
