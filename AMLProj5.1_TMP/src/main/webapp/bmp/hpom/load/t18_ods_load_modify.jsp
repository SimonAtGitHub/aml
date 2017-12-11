<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=UTF-8">
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
	function checkForm(theUrl,type){
	    var errMsg ="";
	
	 	if(getLength(document.forms[0].tableename.value) == 0){
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
	    	if(type){
		    	var obj1 = document.forms[0].shcontent;
	    		var shcontent = strToChar(obj1);
	    		//test
	    		var  element = document.getElementsByName('shcontent1')[0];
	    		var  trelement = document.getElementById('sqlsh');
	    		var  teelement = document.getElementById('test');
	    		trelement.style.display="none";
	    		teelement.style.display="";
	    		element.value = obj1.value;
	    		obj1.value = shcontent;

	    		var obj2 = document.forms[0].runshcontent;
	    		var runshcontent = strToChar(obj2);
	    		var  element = document.getElementsByName('runshcontent1')[0];
	    		var  trelement = document.getElementById('sqlrunsh');
	    		var  teelement = document.getElementById('test1');
	    		trelement.style.display="none";
	    		teelement.style.display="";
	    		element.value = obj2.value;
	    		obj2.value = runshcontent;
	    	}
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	function isload(t) {
		if(t!=null&&t!=""){
		
			var loadway = t.value;
			
			//import		
			if (loadway == 'import') {
				document.getElementById("db2_import").style.display = "";
				document.getElementById("db2_load").style.display = "none";
				document.getElementsByName("db2_load")[0].value="";
			}
			//load
			if (loadway == 'load') {
				document.getElementById("db2_load").style.display = "";
				document.getElementById("db2_import").style.display = "none";
				document.getElementsByName("db2_import")[0].value="";
			}
		}
	}

	function strToChar(obj){
		var   uiuser$   =   obj.value;
		var   str1=new   String(uiuser$);
		var   uiuser1= ""; 
		for(i=0;i <str1.length;i++)         
		{ 
		      uiuser1=uiuser1+parseInt(str1.charCodeAt(i)).toString(2)+ " "; 
		}
		return uiuser1;
	}
</SCRIPT>
	
</head>
<body >
	<html:form action="/hpom/t18_ods_load_modify.do" method="POST">	
	<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>数据装载脚本管理 - 修改</span>
	  <span class="buttons">
	    <a href="javascript:void(0);" onClick="checkForm('dgenerate_script.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />重新计算</a>
	    <a href="javascript:void(0);" onClick="checkForm('t18_ods_load_modify_do.do','save');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
		<a href="javascript:void(0);" onClick="dosubmit('t18_ods_load_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  
	  </span>
	</div>

	<div  class='cond_c2'>
      <table border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td noWrap><font color="#FF0000">*</font>表名：</td>
          <td><html:text property="tableename" styleClass="text_white" size="30"  readonly="true"/>
          </td>
        </tr>
        <tr>
          <td noWrap><font color="#FF0000">*</font>脚本文件名：</td>
          <td><html:text property="shfilename" styleClass="text_white" size="30" readonly="true"/>
          </td>
        </tr>
        <logic:equal value="2" name="dbname">
         <tr>
          <td noWrap>装载方式：</td>
          <td>
          	<html:select property="loadway" onchange="isload(this)">
				<html:options collection="loadwaymap" property="label"
					labelProperty="value" />
			</html:select>
          </td>
        </tr>
        </logic:equal>
        <logic:equal value="1" name="dbname">
        <tr>
          <td noWrap>加载模式：</td>
          <td>
          	<html:select property="oracle_load" >
				<html:options collection="oracleloadmap" property="label"
					labelProperty="value" />
			</html:select>
          </td>
        </tr>
        </logic:equal>
        <tr id="db2_load" style="display: none;">
          <td noWrap>加载模式：</td>
          <td>
          	<html:select property="db2_load" >
				<html:options collection="db2loadmap" property="label"
					labelProperty="value" />
			</html:select>
          </td>
        </tr>
        <tr id="db2_import" style="display: none;">
          <td noWrap>加载模式：</td>
          <td>
          	<html:select property="db2_import" >
				<html:options collection="db2importmap" property="label"
					labelProperty="value" />
			</html:select>
          </td>
        </tr>
         <tr id="sqlrunsh">
          <td noWrap>执行脚本内容：</td>
          <td><html:textarea property="runshcontent" cols="6" rows="3" style="width=670"></html:textarea>
         </td>
        </tr>
          </tr>
         <tr id="test1" style="display: none;">
          <td noWrap >执行脚本内容：</td>
          <td><textarea name="runshcontent1" cols="6" rows="3" style="width=670"></textarea>
         </td>
        </tr>
        <tr id="sqlsh">
          <td noWrap>脚本内容：</td>
          <td><html:textarea property="shcontent" cols="6" rows="20" style="width=670"></html:textarea>
         </td>
        </tr>
        <tr id="test" style="display: none;">
          <td noWrap >脚本内容：</td>
          <td><textarea name="shcontent1" cols="6" rows="20" style="width=670"></textarea>
         </td>
        </tr>
      </table>
	  </div>
	  </div>
	</html:form>
</body>
<script type="text/javascript">
	isload(document.getElementsByName("loadway")[0]);
</script>
</html>