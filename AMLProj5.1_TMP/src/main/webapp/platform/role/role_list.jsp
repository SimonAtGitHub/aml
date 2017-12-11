<%@ page contentType="text/html; charset=GBK" %>
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
    function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('你真的要删除选择的角色吗？')){
                    isSub = true;
                }
            }
        }
        else if(type=='search' || type=='add'){
            isSub = true;
        }
        if(isSub && errMsg==''){
            document.forms[0].action=theUrl;
            document.forms[0].submit();
        }else{
            if(errMsg!='')
                alert(errMsg);
            return false;
        }
    }
</script>
	</head>
<body class="mainbg">
<html:form action="/role/role_list.do" method="post">
 <html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>角色管理</span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
	  <a href="#" onclick="dosubmit('role_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
	  <a href="#" onclick="dosubmit('role_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
	  <a href="#" onclick="dosubmit('role_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	  <!--  <a href="#" onclick="dosubmit('role_person_list.do?newsearchflag=1','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_adduser.png" />添加用户</a>-->
	  <a href="#" onclick="dosubmit('role_power.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_givfun.png" />赋予权限</a>
	  </span>
	</div>
  <!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>角色名:</td>
         <td><html:text property="rolename_s"  /></td>
        <td align="right">角色级别：</td>
          <td ><html:select property="rolelevel_s">
				<html:options collection="rolelevelMap" property="label"
			      labelProperty="value" />
				</html:select></td>
        </tr>
	    <tr>
			<td>状态：</td>
			<td><html:select property="flag_s">
				<html:options collection="flagMap" property="label"
			      labelProperty="value" />
				</html:select>
		    </td>

		    <td ></td>
		    <td><input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('role_list.do?newsearchflag=1','search')" />
	         </td>
			</tr>
								
	  </table>
	</div>
  </div>	
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th>选择</th>
		<th>角色名</th>
		<th>角色级别</th>
		<th>岗位</th>
		<th>角色描述</th>
		<th>状态</th>
	  </tr>
<logic:iterate id="role" name="t00_roleList" type="com.ist.platform.dto.T00_role">
   
<%
java.util.HashMap map = new java.util.HashMap();
map.put("rolekey",role.getRolekey());
pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
%>
    <tr>
      <td>
          <html:multibox property="selectedRolekey">
              <bean:write name="role" property="rolekey"/>
          </html:multibox>
      </td>
      <td><html:link name="map" page="/role/role_disp.do"><bean:write name="role" property="rolename" scope="page"/></html:link></td>
      <td>
      <bean:write name="role" property="rolelevel_disp" scope="page"/></td>
        <td>
        	<logic:iterate id="post" name="role" property="postList"
								type="com.ist.platform.dto.T00_role">
				<bean:write name="post" property="post_disp" scope="page" />
		     </logic:iterate>
        
        </td>
      <td ><bean:write name="role" property="role_des" scope="page"/></td>
      <td ><bean:write name="role" property="flag_disp" scope="page"/></td>
    </tr>
</logic:iterate>
  </table>
  </div>		
	
	<!-- list_page --> 
  <div class="list_page">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
    </div>
<!-- all end -->   
</div>
</html:form>
</body>
</html>

