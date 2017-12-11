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
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}


/** 判断是否为子ID */
function isMyChild(myrealid,permCode){
       if(myrealid.length!=permCode.length){
          return false;
       }
       else{
         var len = myrealid.length -3;
         if(len>0){
           //判断myrealid后两位是否为0
           for(var i=len;i<myrealid.length;i++){
             if(myrealid.charAt(i)!='0'){
               return false;
             }
           }
           //判断前几位是否相同
           for(var i=0;i<len;i++){
             if(myrealid.charAt(i)!=permCode.charAt(i)){
               return false;
             }
           }
         }
       }
    return true;
}
/** 判断是否为父ID */
function isMyParent(myrealid,permCode){
    if(myrealid.length!=permCode.length){
       return false;
    }
    else{
      var len = myrealid.length -3;
      if(len>0){
        //判断permCode后两位是否为0
        for(var i=len;i<permCode.length;i++){
          if(permCode.charAt(i)!='0'){
            return false;
          }
        }
        //判断前几位是否相同
        for(var i=0;i<len;i++){
          if(myrealid.charAt(i)!=permCode.charAt(i)){
            return false;
          }
        }
      }
    }
    return true;
}
/** 选择关联逻辑操作 */
function checkPower(permCode){
    var myrealid = permCode.value;
    for ( var i=0; i < document.forms[0].selectedSystemkey.length; i++ ){
        if(permCode.checked){//
            if(isMyParent(myrealid,document.forms[0].selectedSystemkey[i].value)){//子选，父选
                document.forms[0].selectedSystemkey[i].checked=true;
            }
        }else{//父被取消，子取消
            if(isMyChild(myrealid,document.forms[0].selectedSystemkey[i].value)){
                document.forms[0].selectedSystemkey[i].checked=false;
            }
        }
    }
}
/** 全选或全清 */
function selectAllRoles(permCodeValue,seType){
    var myrealid = permCodeValue;
    for ( var i=0; i < document.forms[0].modulekey.length; i++ ){
        if(isMyChild(myrealid,document.forms[0].modulekey[i].value)){
            document.forms[0].modulekey[i].checked=seType;
        }
    }
}
/** 判断是否选择了权限 */
function checkRolesChk(){
    for ( var i=0; i < document.forms[0].modulekey.length; i++ ){
        if(document.forms[0].modulekey[i].checked==true){
            return true;
        }
    }
    return false;
}

</script>
</head>
<body class="mainbg">
<html:form method="post" action="/role/role_power_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>角色授权</span>
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
              <td> <html:hidden  name="t00_role"  property="rolekey"  />
              <bean:write name="t00_role" property="rolename" scope="request"/></td>
           </tr>
           
           <tr>   
              	<td>
                  <font color="#FF0000">*</font>角色级别：
            	</td>
              	<td >
                  <bean:write name="t00_role" property="rolelevel_disp" scope="request"/>
                </td>
            </tr>
            
            <tr>
              <td>
                  <font color="#FF0000">*</font>功能模块：
              </td>
              <td bgcolor="F6F9FF">
            <table cellpadding="0" cellspacing="0" border="0">
<bean:define id="systemkey" name="t00_role" property="systemkey" type="java.lang.String" scope="request"/>
<logic:iterate id="t00_module" name="moduleList" type="com.ist.platform.dto.T00_module">
   
        <logic:equal value="-1" name="t00_module" property="upmodulekey">
            <tr>
                <td colspan="2">
                    <html:multibox property="selectedSystemkey" onclick="checkPower(this)">
                    	<bean:write name="t00_module" property="modulekey"/>
                    </html:multibox>
                    <b><bean:write name="t00_module" property="modulename"/></b><br/>
                </td>
            </tr>
    	</logic:equal>
    	<logic:notEqual value="-1" name="t00_module" property="upmodulekey">
            <tr>
                <td width="20">&nbsp;</td>
                <td>
                    <html:multibox property="selectedSystemkey" onclick="checkPower(this)">
                        <bean:write name="t00_module" property="modulekey"/>
                    </html:multibox>
                    <bean:write name="t00_module" property="modulename"/>
                </td>
            </tr>
    	</logic:notEqual>

</logic:iterate>
        </table>
              </td>
            </tr>
            <tr>
	  
		<td align="center" class="in_button" colspan="4">
		 <input name="" type="button" value="提 交" onclick="checkForm('role_power_do.do')" />	
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
      