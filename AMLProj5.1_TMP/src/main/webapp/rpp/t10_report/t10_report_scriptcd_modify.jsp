<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%String contextPath = request.getContextPath(); %>

<html>
 <head>
  <meta http-equiv=Content-Type content="text/html; charset=gb2312">
  <meta content="MSHTML 6.00.2600.0" name=GENERATOR>

  <%@ include file="../../bmp/platform/common/style_include.jsp" %>
  <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
  <SCRIPT LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
  <script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
  <script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>   
 </head>
 
 <script language="JavaScript">
  <!--
  	function validateForm() {
  		if(getLength(document.forms[0].scriptcd.value)>4000){
	        document.forms[0].scriptcd.focus();    
	        alert("脚本代码不能为空或者大于4000个字符！");
	        return false;
    	}
    	
    	awpDoSubmit('modifyT10_report_scriptcdDo.do')
  	}
	
  //--> 
 </script>

 <body>
  <!-- 系统总体框架，占页面宽度的98％ -->
  <div id='content'>
   <html:form action="/t10_report/t10_report_scriptcd_modify.do" method="post">
   <!-- 标题区域 -->
   <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${t10_reportActionForm.reportname}" />  -  脚本代码</span></td>
						<td align="right">
							<input type="button" value="保 存" onclick="validateForm()">
        					<input type="button" value="关 闭" onClick="window.close()">						                  </td>
					</tr>
				</table>
			</div>    
    
    <!-- 错误信息提示区 -->
    <html:messages id="errors" message="true">
     <bean:write name="errors" filter="fasle" />
    </html:messages>
    
    <div class='awp_detail' >
     <html:hidden property="reportkey"/> 
     <html:hidden property="reportname"/>     
     <table>
      <tr>
       <td><font color="#FF3300">*</font>脚本代码：</td>
       <td colspan="3" >
       	<html:textarea property="scriptcd" cols="60" rows="30"></html:textarea>
       </td>
      </tr>     						
     </table>
    </div>
    
     <div class="awp_msgtab">
	  <table>
		<tr> 
        <td ><p><strong>系统提示：</strong><br>
           脚本代码入口方法要求：方法名称必须为："avpMethod",方法不包含任何参数！&nbsp;<br>
        </td>
        </tr>
      </table>
    </div>
    
   </html:form>
  </div>
 </body>
</html>
