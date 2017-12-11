<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css"
			rel="stylesheet" type="text/css">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/jquery.autocomplete.css"
			type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
		}
	function checkForm(theUrl){
	    var errMsg ="";
	
	 	if(getLength(document.forms[0].shcontent.value) >4000){
	        errMsg+=" 脚本内容不能超过4000个字符！";
	        document.forms[0].tableename.focus();
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	
	</SCRIPT>
	
</head>
<body >
<div id='content'>
	<html:form action="/hpom/t18_Shfilename_disp.do" method="POST">
    <div class='awp_title'>
     <table>
       <td><span class="awp_title_td2">DM数据表脚本管理</span></td>
       <td width="84%" align="right">
       	
			<input type="button" value="保 存" onClick="checkForm('t18_Shfilename_disp_do.do?tableename=<%=request.getAttribute("tableename") %>')"/>
			<input type="button" value="关 闭" onClick="window.close()"/>
		</td>
      </tr>
     </table>
	</div>  
	<div  class='awp_detail'>
      <table>
        <tr>
          <td noWrap>脚本文件名：</td>
          <td><html:text property="shfilename" styleClass="text_white" size="30"  readonly="true" />
          </td>
        </tr>
        <tr>
          <td noWrap>脚本内容：</td>
          <td><html:textarea property="shcontent" cols="6" rows="20"></html:textarea>
         </td>
        </tr>
      </table>
	  </div>
	</html:form>
</div>
</body>
</html>