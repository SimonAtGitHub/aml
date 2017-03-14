<%@ page contentType="text/html; charset=GBk" %>
<%@page import="com.ist.aml.information.dto.T00_NOTICE"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">


function doSubmit(theUrl){
	
   document.forms[0].action=theUrl;      
   document.forms[0].submit();
     
}
function checkForm(theUrl){
    var errMsg ="";
     if(document.forms[0].title.value==""){
    	errMsg = "标题不能为空";
    }else if(document.forms[0].content.value == ""){
    	errMsg = "内容不能为空";
    }
     
   if(errMsg!=""){
        alert(errMsg);
        return false;
    } 
 
    document.forms[0].action=theUrl;
   
   document.forms[0].submit();
   
}


</script>
</head>
<body   class="mainbg">
<html:form method="post" action="/t00_notice/t00_notice_disp.do" enctype="multipart/form-data" >
<div id="main">
<div class="conditions">
<div class="cond_t">
<span>信息公告</span>
<span class="buttons">
  <a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
</span>
</div>
<div class="cond_c2">
<html:hidden property="noteice_no"/>
<table>
                <tr>
					<td>
						类别:
					</td>
					<td>
						<bean:write name="notice_gory"/>
					</td>
				    <td>
						标题:
					</td>
					<td><bean:write name="t00_notice" property="title"/>
					</td>
</tr>
<tr>
					<td >
						内容：
					</td>
					<td colspan="3" width="500"> 
					<html:textarea name="t00_notice" property="content" cols="60" rows="3" styleId="content"
									styleClass="text_white" readonly="true"/>
<%--					 <bean:write name="t00_notice" property="content"/>为解决文字过长的问题采用--%>
				
					</td>
</tr>
<tr>
				   <td>附件:</td>
			       <td>
			       <logic:notEmpty name="t00_notice" property="filepath">
											<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<bean:write name="t00_notice" property="filepath"/>','','height=160, width=300,left=100,top=100');">
                                             <bean:write name="t00_notice" property="filename"/>(可点击下载)</a>
					</logic:notEmpty>
			          
				   </td>
					
				   <td> 失效日期:</td>
				   <td>
				   <bean:write name="t00_notice" property="infactdate" />
			       </td>
          </tr>
         <tr>
					<td>发布人：</td>
					<td>
						<bean:write name="t00_notice" property="creator" />
					</td>
							  
					<td>发布机构:</td>
					<td>
						  <bean:write name="t00_notice" property="organame" />
					</td>
</tr>	
<tr>                <td>发布日期：</td>
                    <td>
                    <bean:write name="t00_notice" property="createdate" />	
					</td>
					 <td>状态：</td>
                    <td>
                    <bean:write name="t00_notice" property="flag_disp" />	
					</td>
</tr>

</table>
</div>
  </div>
<!-- all end -->   
</div>
</html:form>
</body>
</html>