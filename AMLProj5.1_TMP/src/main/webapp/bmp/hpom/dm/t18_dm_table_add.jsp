<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
		}
		
	function Trim(str,is_global)
	{
		var result;
		result = str.replace(/(^\s+)|(\s+$)/g,"");
		if(is_global.toLowerCase()=="g")
		result = result.replace(/\s/g,"");
		return result;
	} 
	function checkForm(theUrl){
	    var errMsg ="";
	
	 	if(getLength(trim(document.forms[0].tableename.value)) == 0){
	        errMsg+=" 表英文名称不能为空！";
	        document.forms[0].tableename.focus();
	    }else if(getLength(document.forms[0].tableename.value)>32){
	        errMsg+="表英文名称不能多于32个字符！";
	        document.forms[0].tableename.focus();
	    }else if(getLength(trim(document.forms[0].tablecname.value)) ==0){
	        errMsg+="表中文名称不能为空！";
	        document.forms[0].tablecname.focus();
	    } else if(getLength(document.forms[0].tablecname.value) >256){
	        errMsg+="表中文名称名不能多于256个字符！";
	        document.forms[0].tablecname.focus();
	    }  
	
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	    	
	    	document.forms[0].tablecname.value=Trim(document.forms[0].tablecname.value,"g");
	    	document.forms[0].tableename.value=Trim(document.forms[0].tableename.value,"g");
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	
	
	</SCRIPT>
	
</head>
<body >
<div id='content'>
	<html:form action="/hpom/t18_dmtable_add.do" method="POST">
	<div class="conditions">
	<div class="cond_t">
	  <span>DM脚本管理 - 新建</span>
	  <span class="buttons">
		  <a href="javascript:void(0);" onClick="dosubmit('t18_dmtable_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
	</div>
     
	<html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle"/>
	</html:messages>
	<div  class='cond_c2'>
      <table border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td noWrap><font color="#FF0000">*</font>表英文名称：</td>
          <td><html:text property="tableename" styleClass="text_white" size="30" onblur="checkCharOrNumAlert(this)" />
          创建后不允许修改！
          </td>
        </tr>
        <tr>
          <td noWrap><font color="#FF0000">*</font>表中文名称：</td>
          <td><html:text property="tablecname" styleClass="text_white" size="30" />
          </td>
        </tr>
        <tr>
        	 <td noWrap><font color="#FF0000">*</font>粒度：</td>
        	 <td>			
				<html:select property="granularity">
					<html:options collection="granularitymap" property="label" labelProperty="value"/>	
				</html:select>
        	 </td>
        </tr>
        <tr>
          <td noWrap>脚本内容：</td>
          <td><html:textarea property="shcontent" cols="6" rows="20" style="width=670"></html:textarea>
         </td>
        </tr>
         <tr>
          <td></td>
          <td>
          <input type="button" value="保 存" onClick="checkForm('t18_dmtable_add_do.do')" class="in_button1"/>
          <input type="reset" value="重  填" class="in_button1">
         </td>
        </tr>
      </table>
	  </div>
	  </div>
	</html:form>
</div>
</body>
</html>