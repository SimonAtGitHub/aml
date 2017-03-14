<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%String contextPath = request.getContextPath(); %>

<html>
 <head>
  	<meta http-equiv=Content-Type content="text/html; charset=gb2312">
  	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">

  	<script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
  	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
  	<script language="JavaScript" src="<%=contextPath%>/js/title.js"></script>    
 </head>
 
 <script language="JavaScript">

	function importDo() {
		var url = "srchEngImportDo.do";
		
		var fileName = document.forms[0].filename.value;
		if (len(trim(fileName)) == 0) {
			alert("请选择上传文件！");
			return;
		}

		if (fileName.substr(fileName.length - 3) != "dat" || 
				fileName.substr(fileName.length - 3) != "dat") {
			alert("请选择已经导出的引擎文件！");
			return;
		}
		document.forms[0].action=url;
		document.forms[0].submit();
	}

	function gotoSrchEngList() {
		var url = "t02_srch_eng_inf_list.do?newsearchflag=1";
		document.forms[0].action=url;
		document.forms[0].submit();
	}
 </script>

 <body>
  <!-- 系统总体框架，占页面宽度的98％ -->
  <div id='content'>
   <html:form method="post" action="/search/srchEngImportDo.do" enctype="multipart/form-data">
   <!-- 标题区域 -->
    <div class='awp_title'>
     <table>		
      <tr>
      	<td width="23%"><span class="awp_title_td2">统一视图 － 导入</span></td>
       	<td align="right">
        	<input type="button" name="btnsearch" value="导入" class="botton" onclick="importDo();">
        	<input type="button" name="btn" value="返 回" class="botton"  onClick="gotoSrchEngList();">
        	&nbsp;
       </td>
      </tr>
     </table>
    </div>
    
	<html:messages id="message" message="true">
	 	<bean:write name="message" filter="false" />
    </html:messages>
    <div class='awp_detail' >
     <table>
      <tr>
       <td>选择引擎文件：</td>
       <td colspan="3" ><html:file property="filename" size="60" styleClass="botton" /></td>
      </tr>									
     </table>
    </div>
   </html:form>
  </div>
 </body>
</html>
