<%@ page contentType="text/html; charset=GBK" %>
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
<html:form method="post" action="/role/role_list.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>角色信息</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('role_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>

 <div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
              <td>角色名：</td>
              <td><bean:write name="t00_role" property="rolename"/></td>
              <td>内建角色：</td>
              <td><bean:write name="t00_role" property="isbuildin_disp"/></td>
    	</tr>
 
        <tr>
          <td>角色级别：</td>
          <td><bean:write name="t00_role" property="rolelevel_disp"/></td>
           <td>状态：</td>
           <td><bean:write name="t00_role" property="flag_disp"/></td>
        </tr>
        <tr>
              <td>创建人：</td>
              <td><bean:write name="t00_role" property="creator"/></td>
               <td>创建时间：</td>
              <td><bean:write name="t00_role" property="createdate"/></td>
    </tr>
     <tr>
              <td>修改人：</td>
              <td><bean:write name="t00_role" property="modifier"/></td>
                <td>修改时间：</td>
       <td><bean:write name="t00_role" property="modifydate_disp"/></td>
    </tr>
     <tr>
        <td>岗位：</td>
            <td colspan="3">
            <logic:iterate id="post" name="t00_role" property="postList"
								type="com.ist.platform.dto.T00_role">
				<bean:write name="post" property="post_disp" scope="page" />
		     </logic:iterate>
            </td>
     </tr>
       
    <tr>
              <td>功能权限：</td>
              <td colspan="3">
            <table cellpadding="0" cellspacing="0" border="0">
<logic:iterate id="t00_module" name="role_authList" type="com.ist.platform.dto.T00_module">
        <logic:equal value="-1" name="t00_module" property="upmodulekey">
            <tr>
                <td colspan="2">
                    <b><bean:write name="t00_module" property="modulekey"/>-<bean:write name="t00_module" property="modulename"/></b>
                    <br/>
                </td>
            </tr>
    	</logic:equal>
    	<logic:notEqual value="-1" name="t00_module" property="upmodulekey">
            <tr>
                <td width="20">&nbsp;</td>
                <td>
                    <bean:write name="t00_module" property="modulekey"/>-<bean:write name="t00_module" property="modulename"/>
                </td>
            </tr>
    	</logic:notEqual>
</logic:iterate>
</table>
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