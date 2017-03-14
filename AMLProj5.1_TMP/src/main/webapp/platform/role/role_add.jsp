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
function checkForm(theUrl){
    var errMsg ="";
    var reg = /^[^@\/\'\\\"#$%&\^\*]+$/;
    var reg1 = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&mdash;—|{}【】‘；：”“'。，、？]");
    
    if(getLength(document.forms[0].rolename.value)>64){
        errMsg="角色名不能大于64个字符！";
        document.forms[0].rolename.focus();
    }else if(getLength(document.forms[0].rolename.value)==0){
        errMsg="角色名不能为空！";
        document.forms[0].rolename.focus();
    } 
    else if(!reg.test(document.forms[0].rolename)){
        errMsg+="角色名含有非法字符！";
        document.forms[0].rolename.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }
    
    

    
    if(getLength(document.forms[0].role_des.value)>100){
        errMsg="角色描述不能大于100个字符！";
        document.forms[0].role_des.focus();
    }else if(getLength(document.forms[0].role_des.value)==0){
        errMsg="角色描述不能为空！";
        document.forms[0].role_des.focus();
    }
    
    //角色描述
    else if( !reg.test(document.forms[0].role_des)){
        errMsg+="角色描述含有非法字符！";
        document.forms[0].role_des.focus();
    }
      selectAllOptions(document.forms[0].list2);
     if(getLength(document.forms[0].list2.value)==0){
        errMsg="角色岗位不能为空！";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</script>
</head>
<body class="mainbg">
<html:form method="post" action="/role/role_add_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>新建角色</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('role_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>
  <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td><font color="#FF0000">*</font>角色名：</td>
         <td>
       
         <html:text property="rolename" /></td>
		 <td><font color="#FF0000">*</font>角色描述：</td>
         <td><html:text property="role_des" /></td>
        </tr>
	     <tr>
	    <td ><font color="#FF0000">*</font>角色级别：</td>
          <td > <html:select property="rolelevel">
                      <html:options collection="rolelevelMap" property="label" labelProperty="value"/>
                  </html:select></td>
         <td><font color="#FF0000">*</font>状态：</td>
      <td colspan="3"> <html:select property="flag">
                      <html:options collection="flagMap" property="label" labelProperty="value"/>
                  </html:select>
         </td>
          </tr>
            <tr>
			 
       <td ><font color="#FF0000">*</font>角色岗位：</td>
          <td colspan="3">
            <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
          <%=multiSeHTMLStr%>
                  </td>
        </tr>

	
       <tr>
	  
		<td align="center" class="in_button" colspan="4">
		 <input name="" type="button" value="提 交" onclick="checkForm('role_add_do.do')" />	
		  <input name="" type="reset" value="重 置" />		</td>
	   </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>

</html:form>
</body>
</html>
