<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/load_window.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

	<script language="JavaScript">
function  _Disp(){
 	var type=eval('document.forms[0].curr_cd');
   	var tv=type.value;
   	if(tv=="2"){
    	document.all.kind1.style.display="";
   		document.all.kind2.style.display="";
    	document.all.null1.style.display="none";
    	document.all.null2.style.display="none";
    } else {
		document.all.kind1.style.display="none";
		document.all.kind2.style.display="none";
		document.all.null1.style.display="";
		document.all.null2.style.display="";
   	}
}
function fPopUpCalendarDlg(ctrlobj){
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}

function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //用户名
    if(getLength(document.forms[0].username.value)==0){
        errMsg+="用户名不能为空！";
        document.forms[0].username.focus();
    }else if(getLength(document.forms[0].username.value)>16){
        errMsg+="用户名不能大于16个字符！";
        document.forms[0].username.focus();
    }else if(getLength(document.forms[0].username.value)<4){
        errMsg+="用户名不能小于4个字符！";
        document.forms[0].username.focus();
    }else if(checkString(document.forms[0].username.value)==0){
        errMsg+="用户名含有非法字符！";
        document.forms[0].username.focus();
    }
 
    //真实姓名
    else if(getLength(document.forms[0].realname.value)==0){
        errMsg+="用户真实姓名不能为空！";
        document.forms[0].realname.focus();
    }
    //else if(getLength(document.forms[0].realname.value)>16){
     //   errMsg+="用户真实姓名不能大于16个字符！";
     //   document.forms[0].realname.focus();
   // }
    //归属机构
    else if(getLength(document.forms[0].organkey.value)==0){
        errMsg+="归属机构不能为空！";
    }else if(getLength(document.forms[0].postalcode.value)!=0 && checkNumber(document.forms[0].postalcode.value)==0){
        errMsg+="邮政编码含有非数字字符！";
        document.forms[0].postalcode.focus();
    }  else if(getLength(document.forms[0].emailaddress.value)>64){
        errMsg+="用户电子邮件不能大于64个字符！";
        document.forms[0].emailaddress.focus();
    }else if(checkEmail(document.forms[0].emailaddress.value)==false){
        errMsg+="用户电子邮件含有非法字符或格式有误！";
        document.forms[0].emailaddress.focus();
    }
    //用户电话
  //  else if(getLength(document.forms[0].telephone.value)==0){
    //    errMsg+="用户电话号码不能为空！";
     //  document.forms[0].telephone.focus();
     //   }
    else if(getLength(document.forms[0].telephone.value)>0 && checkTelephone(document.forms[0].telephone.value)==0){
        errMsg+="用户电话输入有误！";
        document.forms[0].telephone.focus();
    }
    //移动电话
    else if(getLength(document.forms[0].mobilephone.value)>0 && checkNumber(document.forms[0].mobilephone.value)==0){
        errMsg+="用户移动电话输入有误！";
        document.forms[0].mobilephone.focus();
    }
     selectAllOptions(document.forms[0].list2);
       //归属机构
     if(getLength(document.forms[0].list2.value)==0){
        errMsg+="角色不能为空！";
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
	<html:form method="post" action="/user/user_modify_do.do">
	<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>修改用户</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('user_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
  <html:errors/>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
				<tr >
					<td >
						<font color="#FF0000">*</font>用户名：
					</td>
					<td>
						<html:text  name="t00_userActionForm" property="username"  size="15"  readonly="true"/>
					</td>
					<td>
						<font color="#FF0000">*</font>真实姓名：
					</td>
					<td>
						<html:text  name="t00_userActionForm" property="realname"  size="50" />
					</td>
				</tr>
				<tr>
					
					<td>
						<font color="#FF0000">*</font>状态：
					</td>
					<td bgcolor="F6F9FF">
						<html:select property="flag">
							<html:options collection="flagMap" property="label"
								labelProperty="value" />
						</html:select>
					</td>
				
					<td   >
						<font color="#FF0000">*</font>归属机构：
					</td>
					<td>
						 <input type="text" name="searchOrganName"  value="<bean:write name="orgname"/>"/>
						<html:hidden  name="t00_userActionForm" property="organkey"  />
						
					   <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
					</td>
				</tr>
				
	 <tr>
      <td>
      <font color="#FF0000">*</font>角色：</td>
      <td  colspan="3">
          <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
          <%=multiSeHTMLStr%>
      </td>
    </tr>
				 <tr>
         <td>地址：</td>
         <td colspan="3"><html:text name="t00_userActionForm"  property="address"  size="60" /></td>
        </tr>
		<tr>
         <td>电话号码：</td>
         <td><html:text name="t00_userActionForm"  property="telephone"/></td>
         <td>移动电话：</td>
         <td><html:text name="t00_userActionForm"  property="mobilephone"/></td>
       </tr>
       <tr>
         <td><font color="#FF0000">*</font>数据组：</td>
         <td colspan="3">
         <html:textarea property="groupname" rows="3" cols="60" styleId="groupname" readonly="true"></html:textarea>
         <html:hidden property="groupkey"/>
         	<input type="button" name="locate" value="多 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','t00_groupLocation','checkbox','forms[0]','groupkey,groupname','flag=\'1\'');return false;"/>
         </td>
       	</tr>
		<tr>
         <td>邮政编码：</td>
         <td><html:text name="t00_userActionForm"  property="postalcode"/></td>
         <td>Email：</td>
         <td><html:text name="t00_userActionForm"  property="emailaddress"/></td>
       </tr>
	    <tr>
         <td>其他：</td>
         <td colspan="3"> 
        <html:textarea name="t00_userActionForm"  property="remark" rows="5" cols="70" ></html:textarea>
         </td>
       </tr>
       <tr>
	   <td></td>
		<td colspan="3" align="left" class="in_button" >
		 <input name="tijiao" type="button" value="提 交" onclick="checkForm('user_modify_do.do')" />	
		  <input name="reset" type="reset" value="重 置" />		</td>
	   </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>
