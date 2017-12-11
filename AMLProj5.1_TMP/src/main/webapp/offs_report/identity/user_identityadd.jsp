<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=GBK" />
<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script language="JavaScript">
function dosubmit(theUrl,flag){
var errMsg = "";
    //客户号
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
   event.srcElement.disabled = true;
}
</script>
</head>

<body class="mainbg">
<div id="main">
<html:form method="post" action="/identity/t07_user_identityAdd.do">
<html:errors/>
	<div class="conditions">
          <div class="cond_t">
			<span>添加报表</span>
			<span class="buttons">
       			<a href="#" onclick="window.location.href='<%=request.getContextPath()%>/offs_report/identity/t07_user_identitySearch.do'"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
       		</span>
     <!-- <input type="button" value="返 回"  class="input" onclick="window.location.href='<%=request.getContextPath()%>/offs_report/identity/t07_user_identitySearch.do'"/> -->
     		</div>
     <div class="cond_c">
  		<input type="hidden" name="editflag" value='<%=request.getParameter("editflag")%>' />
          <table border="0" cellpadding="0" cellspacing="0">
          <tr>
              <td>机构名称：</td>
	          <td>
		          <html:hidden property="organkey"/>
		          <html:hidden property="organName"/>
				  <bean:write name="t07_user_identityActionForm" property="organName"/>
	          </td>
         </tr>
         <tr>
              <td>报表类型：</td>
              <td>
              	<html:select property="identitytype">
              		<html:options collection="identitytypeMap" property="label" labelProperty="value"/>
           		</html:select>
              </td>
         </tr> 
         <tr>
              <td>统计时间：</td>
              <td>
	           <html:select property="startyear">
	        	<html:options collection="dataYmMap" property="label" labelProperty="value"/>
	           </html:select>年 第<html:select property="startseason">
	        	<html:options collection="seasonMap" property="label" labelProperty="value"/>
	           </html:select>季度
	           <%if(request.getAttribute("existerror")!=null) {%><font color="red">&nbsp;&nbsp;<%=request.getAttribute("existerror")%></font>
			   <%}%>
              </td>
         </tr>  
             
         <tr>
         	  <td></td>
              <td colspan="2">
		          <html:button property="button" styleClass="in_button1" value="提 交" onclick="dosubmit('t07_user_identityAdd.do?editflag=add','new')"/>
              	  <!--  html:reset styleClass="input" value="重 置" -->
              </td>
         </tr>  
           
          </table>
        </div>
        </div>
  
</html:form>
</div>
</body>
</html>
