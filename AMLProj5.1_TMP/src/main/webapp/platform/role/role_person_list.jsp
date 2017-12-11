<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
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
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='pause'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要暂停选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
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
<html:form action="/role/role_person_list.do" method="post">
<html:hidden property="rolekey"/>
  <html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>角色下的用户</span>
	  <span class="buttons">
	  <a onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"> </a>
	  <a href="#" onclick="dosubmit('role_person_add.do?newsearchflag=1','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />增 加</a>
	  <a href="#" onclick="dosubmit('role_person_del.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	   <a href="#" onclick="dosubmit('role_list.do?newsearchflag=1','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>用户名:</td>
         <td><html:text property="username"  /></td>
        <td align="right">真实姓名：</td>
          <td ><html:text property="realname" /></td>
        </tr>
            <tr >
				<td >归属机构号：</td>
				<td >
				 <html:text property="searchOrganName" size="23" maxlength="30"  readonly="true" />
				 <html:hidden property="organkey"/>
				  <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				</td>
				<td></td>
                   <td>
					<input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('role_person_list.do?newsearchflag=1','search')" />
										
										
					                  
					</td>

								</tr>
								
	  </table>
	</div>
  </div>	
  <!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th>选择</th>
		<th>用户名</th>
		<th>真实姓名</th>
		<th>机构</th>
		<th>创建时间</th>
	  </tr>
	  <logic:iterate id="user" name="t00_userList"
					type="com.ist.platform.dto.T00_user">
					<%
java.util.HashMap map = new java.util.HashMap();
map.put("username",user.getUsername());
pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
%>
					<tr>
						<td >
							<html:multibox property="selectedUsername">
								<bean:write name="user" property="username" />
							</html:multibox>
						</td>
						<td >
						
								<bean:write name="user" property="username" scope="page" />
							
						</td>
						<td>
							<bean:write name="user" property="realname" scope="page" />
						</td>
						<td>
							<bean:write name="user" property="organname" scope="page" />
						</td>
				
						
						<td>
							<bean:write name="user" property="createdate" scope="page" />
						</td>
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
