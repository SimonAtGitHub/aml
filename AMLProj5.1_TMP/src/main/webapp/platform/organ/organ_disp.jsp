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
	  <span>������Ϣ</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('organ_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
  <html:errors/>
 <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td>�����ţ�</td>
         <td><bean:write name="t00_organ"  property="organkey"  />
         <html:hidden property="organkey"  /></td>
		 <td>�������ƣ�</td>
         <td><bean:write name="t00_organ"  property="organname"  /></td>
        </tr>
       <tr>
		 <td>������ƣ�</td>
         <td><bean:write name="t00_organ"  property="organsf" /></td>
		  <td>��������</td>
         <td><bean:write name="t00_organ"  property="organlevel_disp" />
       
          </td>
        </tr>
        
         <tr>
		 <td>���ڻ������룺</td>
         <td><bean:write name="t00_organ"  property="organcode" />
               </td>
		 <td>�Ƿ�羳��</td>
         <td> <bean:write name="t00_organ"  property="overarea_ind_disp" />
               </td>
        </tr>
        
         
     
	        <tr>
        
		 <td>�ϼ������ţ�</td>
         <td><bean:write name="t00_organ"  property="uporgankey"  /></td>
		  <td>�����������룺</td>
         <td><bean:write name="t00_organ"  property="org_area" /></td>
        </tr>
		<tr>
        
		 <td>�ִ���֧��ϵͳ�кţ�</td>
         <td><bean:write name="t00_organ"  property="unionorgkey" /></td>
		 <td>��ҽ����ʻ�����ϵͳ�кţ�</td>
         <td><bean:write name="t00_organ"  property="settleorgkey" /></td>
        </tr>
        <tr>
        
		 <td>��Чʱ�䣺</td>
         <td><bean:write name="t00_organ"  property="validatedate" />
               </td>
		 <td>ʧЧʱ�䣺</td>
         <td> <bean:write name="t00_organ"  property="invalidatedate" />
               </td>
        </tr>
         <tr>
         
		 <td>������ַ��</td>
         <td><bean:write name="t00_organ"  property="organaddress" /></td>
		  <td>�������룺</td>
         <td><bean:write name="t00_organ"  property="postalcode" /></td>
        </tr>
		<tr>
        
		 <td>��ϵ�ˣ�</td>
         <td><bean:write name="t00_organ"  property="linkman" /></td>
		  <td>��ϵ�绰��</td>
         <td><bean:write name="t00_organ"  property="telephone" /></td>
        </tr>
		
		<tr>
         
		 
      
	    <td >��ע��</td>
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
