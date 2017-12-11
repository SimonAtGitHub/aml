<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../../js/load_window.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
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
	    } else if(getLength(document.forms[0].shfilename.value) >64){
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
<body class="mainbg">
	<html:form action="/hpom/t18_ods_ftp_modify.do" method="POST">
	<html:errors/>
		<div id="main">
			<!-- conditions --> 
			  <div class="conditions">
			    <!-- title -->
				<div class="cond_t">
					<span>FTP脚本管理 - 修改</span>
					<span class="buttons">
						<a href="javascript:checkForm('t18_ods_ftp_modify_do.do')"><img src="../../images/blue/b_back.png" />保 存</a>
						<a href="dosubmit('t18_ods_ftp_list.do')"><img src="../../images/blue/b_back.png" />返 回</a>
					</span>
				</div>
			</div>
			<div id='content'>
				<div class="cond_c2">
			      <table>
			        <tr>
			          <td noWrap><font color="#FF0000">*</font>表名：</td>
			          <td><html:text property="tableename" styleClass="text_white" size="30" readonly="true" />
			          </td>
			        </tr>
			        <tr>
			          <td noWrap><font color="#FF0000">*</font>脚本文件名：</td>
			          <td><html:text property="shfilename" styleClass="text_white" size="30" />
			          </td>
			        </tr>
			        <tr>
			          <td noWrap>脚本内容：</td>
			          <td><html:textarea property="shcontent" cols="6" rows="20" style="width=670"></html:textarea>
			         </td>
			        </tr>
			      </table>
				  </div>
			</div>
		</div>
	</html:form>
</body>
</html>