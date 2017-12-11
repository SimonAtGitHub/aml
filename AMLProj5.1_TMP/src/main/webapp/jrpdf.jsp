<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="net.sf.jasperreports.engine.data.*" %>
<%@ page import="net.sf.jasperreports.j2ee.servlets.*" %>
<%@ page import="com.ist.common.jasperreport.controller.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.Boolean" %>
<HTML>
<HEAD>
<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script language="JavaScript" src="../../js/title.js"></script>
<script LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<body topmargin="0" leftmargin="0">
    <html:form action="/common/pestpdf.do" method="post">
 
    <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0" valign="top">
     <tr valign="top"><td class="td1"><span class="css014"> <strong><font color="0072BC">报表展示</font></strong> </span> </td>
       <td width="22%" align="right" nowrap class="td2">
           <table width="100%" border="0" cellspacing="0" cellpadding="1" valign="top">
         <tr valign="top">
           <td nowrap valign="top" align="right">
               <!--
               <html:button value="打 印" property="button" styleClass="input" onclick="dosubmit('../common/print.do')"/>
               <html:button value="导 出 Excel" property="button" styleClass="input" onclick="dosubmit('../common/excel.do')"/>
               <html:button value="导 出 Pdf" property="button" styleClass="input" onclick="dosubmit('../common/pdf.do')"/>
               <html:button value="返 回" property="button" styleClass="input" onclick="dosubmit('../b_basereport/check_upreport_list.do')"/>
               <html:button value="关 闭" property="button" styleClass="input" onclick='window.close();'/>
               -->
              <html:button value="关 闭" property="button"
						styleClass="input" onclick='window.close();' />
	     
                </td>
         </tr>
         <tr>
           <td nowrap>
           </td>
         </tr>

       </table>
       </td>
     </tr>
   </table>
   <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
     <tr>
       <td height="48" class="td1">
               <html:link page="/common/excel.do">
          <img src="/lab/images/excel.gif" border="0">
           </html:link>
         
         <html:link page="/common/pdf.do"  >
        <img src="/lab/images/pdf.gif" border="0">
         
           </html:link>
        
      </td>
       <td width="22%" align="right" nowrap class="td2">&nbsp;</td>
     </tr>
   </table>
   <table width="98%"  border="5" align="center" cellpadding="2" cellspacing="0">
<%
            StringBuffer sbuffer = new StringBuffer();
            JReportParam jReportParam = null;
            jReportParam = (JReportParam) request.getAttribute("jReportParam");
            Collection collection = null;
            
            if(request.getAttribute("collection")!=null){
            
            collection = (Collection) request.getAttribute("collection");
            }
            response.setContentType("text/html;charset=GBK");
          
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jReportParam.getJasperFile().getPath());
            JRDataSource jRDataSource = null;
            jRDataSource = new JRBeanCollectionDataSource(collection);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
            jReportParam.getParameters(), jRDataSource);
            JRHtmlExporter exporter = new JRHtmlExporter();
            request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperPrint);
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STRING_BUFFER, sbuffer);
            exporter.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);
            exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "image?image=");
            exporter.exportReport();
           // System.out.println(":::::::::******444*****"+sbuffer.toString());
          
%>
 
<tr border="1">
    <td border="1">
        <%=sbuffer.toString()%>
    </td>

</tr>

</table>
</html:form>
</body>
</HTML>
