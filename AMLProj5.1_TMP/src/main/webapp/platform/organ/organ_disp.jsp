<%@ page contentType="text/html; charset=GBk" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

	<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}


</script>
</head>
<body class="mainbg">
<html:form method="post" action="/organ/organ_add_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>机构信息</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('organ_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>
 <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td>机构号：</td>
         <td><bean:write name="t00_organ"  property="organkey"  />
         <html:hidden property="organkey"  /></td>
		 <td>机构名称：</td>
         <td><bean:write name="t00_organ"  property="organname"  /></td>
        </tr>
       <tr>
		 <td>机构简称：</td>
         <td><bean:write name="t00_organ"  property="organsf" /></td>
		  <td>机构级别：</td>
         <td><bean:write name="t00_organ"  property="organlevel_disp" />
       
          </td>
        </tr>
         
     
	        <tr>
        
		 <td>上级机构号：</td>
         <td><bean:write name="t00_organ"  property="uporgankey"  /></td>
		  <td>行政区划代码：</td>
         <td><bean:write name="t00_organ"  property="org_area" /></td>
        </tr>
		<tr>
        
		 <td>现代化支付系统行号：</td>
         <td><bean:write name="t00_organ"  property="unionorgkey" /></td>
		 <td>民币结算帐户管理系统行号：</td>
         <td><bean:write name="t00_organ"  property="settleorgkey" /></td>
        </tr>
        <tr>
        
		 <td>生效时间：</td>
         <td><bean:write name="t00_organ"  property="validatedate" />
               </td>
		 <td>失效时间：</td>
         <td> <bean:write name="t00_organ"  property="invalidatedate" />
               </td>
        </tr>
         <tr>
         
		 <td>机构地址：</td>
         <td><bean:write name="t00_organ"  property="organaddress" /></td>
		  <td>邮政编码：</td>
         <td><bean:write name="t00_organ"  property="postalcode" /></td>
        </tr>
		<tr>
        
		 <td>联系人：</td>
         <td><bean:write name="t00_organ"  property="linkman" /></td>
		  <td>联系电话：</td>
         <td><bean:write name="t00_organ"  property="telephone" /></td>
        </tr>
		
		<tr>
         
		 
      
	    <td >备注：</td>
          <td colspan="3" >
          <bean:write name="t00_organ"  property="organdes"  />
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
