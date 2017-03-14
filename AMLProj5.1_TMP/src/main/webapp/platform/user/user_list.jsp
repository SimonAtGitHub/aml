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
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要激活选择的用户吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        //location.href=theUrl+"&"+Math.random();
        location.href=theUrl;
    }else if(type=='chaxun'){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else if(type=='export'){
      
       var obj=document.forms[0].selectedUsername;
        var sellength=obj.length;
   		var uname=""; 
			if(sellength>1){
				for(var i=0;i<sellength;i++){
				   if(obj[i].checked){
				   var name=obj[i].value; 
					uname=uname+",'"+name+"'";
					}
				}
				
			}else{
			   uname=",'"+document.forms[0].selectedUsername.value+"'";
			}
			
        if(errMsg==''){
            if(confirm('你真的要导出所查到的用户信息吗？')){
                isSub = true;
            }
        }
        
       if(isSub){
        theUrl=theUrl+"?uname="+uname;
       // alert(theUrl);
        window.open(theUrl,'','height=160, width=300,left=100,top=100');
        }
        return ;
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
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}
</script>
	</head>
	<body class="mainbg">
<html:form action="/user/user_list.do" method="post">
  <html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>用户管理</span>
	  <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	  <a href="#" onclick="dosubmit('cmbc_user_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
	  <a href="#" onclick="dosubmit('cmbc_user_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
	  <a href="#" onclick="dosubmit('user_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	   <a href="#" onclick="dosubmit('user_modify_passwd.do','pass')"><img src="../../images/<%=session.getAttribute("style") %>/b_reset.png" />重置密码</a>
	   <a href="#" onclick="dosubmit('export_user_message.do','export')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />导出用户</a>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>用户名：</td>
         <td><html:text property="username_in"  /></td>
        <td align="right">真实姓名：</td>
          <td ><html:text property="realname_in" /></td>
        </tr>
	    <tr>
			<td>状态：</td>
			<td><html:select property="flag">
				<html:options collection="flagMap" property="label"
			      labelProperty="value" />
				</html:select>
		    </td>

		    <td >选择角色：</td>
		    <td><html:select property="rolekey">
				<html:option value="">--请选择--</html:option>
			<html:options collection="t00_roleList" property="rolekey"
						labelProperty="rolename" />
						</html:select>
	         </td>
			</tr>
            <tr >
				<td >归属机构：</td>
				<td >
				 <html:text property="organ" size="13" styleClass="text_white" ></html:text>
				 <html:text property="searchOrganName" styleClass="text_white" readonly="true"></html:text>
				 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organ&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
				</td>

				<td >排序：</td>
				<td>
										<html:select property="orderby">
											<html:options collection="usersortMap" property="label" labelProperty="value" />
										</html:select>
										<input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('user_list.do?newsearchflag=1','chaxun')" />
										
					                  
					</td>

								</tr>
								
	  </table>
	</div>
  </div>	
  <!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>
		<th>用户名</th>
		<th>真实姓名</th>
		<th>归属机构</th>
		<th>角色</th>
	<!--  	<th>电话</th>
		<th>电子邮件</th> -->
		<th>状态</th>
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
							<html:link name="map" page="/user/user_disp.do">
								<bean:write name="user" property="username" scope="page" />
							</html:link>
						</td>
						<td>
							<bean:write name="user" property="realname" scope="page" />
						</td>
						<td>
							<bean:write name="user" property="organkey" scope="page" />
						</td>
				
						<td>
							<logic:iterate id="role" name="user" property="roleList"
								type="com.ist.platform.dto.T00_com_auth">
								<bean:write name="role" property="rolekey_disp" scope="page" />
							</logic:iterate>
						</td>
						<!-- 
							<td>
							<bean:write name="user" property="telephone" scope="page" />
						</td>
						<td>
							<bean:write name="user" property="emailaddress" scope="page" />
						</td>  -->
						<td>
							<bean:write name="user" property="flag_disp" scope="page" />
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
