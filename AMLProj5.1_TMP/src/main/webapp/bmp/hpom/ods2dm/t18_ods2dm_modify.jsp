<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	pageContext.setAttribute("ctx",request.getContextPath());
%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<bean:write name="ctx"/>/css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/jquery.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/aml.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/basefunc.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/load_window.js"></script>
		
	<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
		}
	function checkForm(theUrl){
	    var errMsg ="";
	
	 	if(getLength(trim(document.forms[0].tableename.value)) == 0){
	        errMsg+=" 表名不能为空！";
	        document.forms[0].tableename.focus();
	    }else if(getLength(document.forms[0].tableename.value)>32){
	        errMsg+="表名不能多于32个字符！";
	        document.forms[0].tableename.focus();
	    }else if(getLength(trim(document.forms[0].shfilename.value)) ==0){
	        errMsg+="脚本文件名不能为空！";
	        document.forms[0].shfilename.focus();
	    }
	     else if(getLength(document.forms[0].shfilename.value) >64){
	        errMsg+="脚本文件名不能多于64个字符！";
	        document.forms[0].shfilename.focus();
	    } 
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	    	document.forms[0].shfilename.value=trim(document.forms[0].shfilename.value);
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	
	</SCRIPT>
	
</head>
<body >
<div id='content'>
	<html:form action="/hpom/t18_ods2dm_modify.do" method="POST">
		<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>ODS2DM脚本管理 - 修改</span>
	  <span class="buttons">
	    <a href="javascript:void(0);" onClick="dosubmit('generateProScript.do?genetype=1');"><img src="../../images/<bean:write name="style" scope="session"/>/b_edit.png" />生成全量</a>
	    <a href="javascript:void(0);" onClick="dosubmit('generateProScript.do?genetype=0');"><img src="../../images/<bean:write name="style" scope="session"/>/b_download.png" />生成增量</a>
	    <a href="javascript:void(0);" onClick="checkForm('t18_ods2dm_modify_do.do')"><img src="../../images/<bean:write name="style" scope="session"/>/b_save.png" />保 存</a>
	    <a href="javascript:void(0);" onClick="dosubmit('t18_ods2dm_list.do');"><img src="../../images/<bean:write name="style" scope="session"/>/b_back.png" />返 回</a>
	  
	  </span>
	</div>
    </div>
	<div  class='cond_c2'>
      <table>
        <tr>
          <td noWrap>表名：</td>
          <td>
          <html:hidden property="tableename"/>
          <bean:write name="t18_ods2dmetlActionForm" property="tableename"/>
          </td>
        </tr>
        <tr>
          <td noWrap>脚本文件名：</td>
          <td>
          <html:text property="shfilename" size="40"/>
          </td>
        </tr>
        <tr>
          <td noWrap>脚本内容：</td>
          <td><html:textarea property="shcontent" cols="6" rows="20" style="width=670"></html:textarea>
         </td>
        </tr>
      </table>
	  </div>
	</html:form>
</div>
</body>
</html>