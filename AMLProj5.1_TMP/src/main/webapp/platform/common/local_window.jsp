<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
             /**
             * 客户选择公共页面：
             * 权限：公共页面没有权限控制 
             * 接口参数：
             * form_name form框的名字
             * input_name 客户号的文本框的名字
             * input_name1 客户名称的文本框的名字
             * 例如：<input type=button value="查 询" name=Button52 class="text_white" onClick="window.open('/pub/cp_host_cust_id_search.jsp?form_name=form1&input_name=s_host_cust_id','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
             *         <html:button property="b2" value="查 询" styleClass="input" onclick="window.open('/common/t00_user_search.do?input_name=username&input_name_disp=realname','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"/>
             */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/load_window.js"></script>


<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
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
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
   
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    var parDoc = opener.document;
	
    var isCheck = true;
	var par_element = document.getElementById('localset').value.split(',');
	var selVal ;
   //隐藏域
   var hideElemens =  parDoc.getElementById(par_element[0]);
   var dispElemens =  parDoc.getElementById(par_element[1]);
    if(checkRadio(document.forms[0].selectedkey)<0){
    
        //hideElemens.value="";
        //dispElemens.value="";
        window.close();
    }
    else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
//全选切换
function selectORClearBox(_setval){
   var _form=document.forms[0];
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	
function openChildWin(theUrl){

window.open(theUrl, '', 'height=200, width=160,left=50,top=30,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no');	
}

//
function locate_sel(){
	var parDoc = opener.document;
	
    var isCheck = true;
	var par_element = document.getElementById('localset').value.split(',');
	
	var selVal ;
   //隐藏域
   var hideElemens =  parDoc.getElementsByName(par_element[0]);
   var dispElemens =  parDoc.getElementsByName(par_element[1]);
 
   var elements = hideElemens[0].value;

	//var oCheck = document.forms[0].selectedkey;
	var oCheck = document.getElementsByName('selectedkey');
    var eleStr = elements.split(',');
	for( var i=0; i < oCheck.length; i++ ){
        if (oCheck[i].checked){
			selVal = oCheck[i].value.split('&');
			
			isCheck = false;
 				
   				if(!in_array(selVal[0],eleStr)){
   				 	
   				    if(hideElemens[0].value=='')
   				    {
   				    	hideElemens[0].value = selVal[0];
   				    	dispElemens[0].value = selVal[1];
   				    }
   				    else
   				    {
   				    	hideElemens[0].value = hideElemens[0].value+","+selVal[0];
   						dispElemens[0].value = dispElemens[0].value+","+selVal[1];
   				    }
   				}
 			
        }
   }

   if(isCheck){
	   alert("请选择");
       return false;
   }


   window.close();
}

function checkQuery(obj){
	if(obj.value.indexOf("'") >= 0){
		alert("不能输入单引号字符！");
		var a = obj.value.replace("'","");
		obj.value = a;
		obj.focus();
		return false;
	}	
}

function in_array(needle, haystack) {

 var type = typeof needle;
 if(type == 'string' || type =='number') {
  for(var i in haystack) {
   if(haystack[i] == needle) {
     return true;
   }
  }
 }
 return false;
} 


</script>
	</head>
	<body class="mainbg">
		<html:form action="/common/location_window.do" method="post">
		<html:errors/>
		<div id="main">
			<html:hidden property="key" />
			<html:hidden property="key_name" />
			<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
			<div class="cond_t">
	 			 <span><%=(String) request.getAttribute("modulename")%> </span>
					<span class="buttons"> 
						<a href="#" onclick="checkForm('location_window_result.do')" ><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选 定</a>
						 <logic:equal name="issingle" value="checkbox">
						 <a href="#" onclick="locate_sel()"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />追 加</a>
						</logic:equal> 
						<a href="#" onclick="dosubmit('location_window.do?flag=1')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />全 部</a>
						<a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
					</span>
			</div>            
			
			<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<div class="cond_c" id="searchtable">
			<table >
				<tr>
					<td >
						<bean:write name="key_name" />
						：
						<input type="text" name="query1" class="text_white" size="20"
							id="100" value="<%=request.getAttribute("query1")%>" onkeyup="checkQuery(this)"/>
						<bean:write name="key_disp_name" />
						：
						<input type="text" name="query2" class="text_white" size="20"
							id="200" value="<%=request.getAttribute("query2")%>" onkeyup="checkQuery(this)"/>
						<html:button property="s1" value="查  询" styleClass="in_button1"
							onclick="dosubmit('location_window.do?newsearchflag=1')" />
						<html:button property="s2" value="清  空" styleClass="in_button1"
							onclick="emptyall();" />
					</td>
				</tr>
			</table>
			</div>
			<input type="hidden" name="localset" id="localset"
				value="<%=request.getAttribute("localset")%>" />
			<input type="hidden" name="forms"
				value="<%=request.getAttribute("forms")%>" />
			<input type="hidden" name="issingle"
				value="<%=request.getAttribute("issingle")%>" />
			<input type="hidden" name="localname"
				value="<%=request.getAttribute("localname")%>" />
			<input type="hidden" name="condition"
				value="<%=request.getAttribute("condition")%>" />
			<input type="hidden" name="query1"
				value="<%=request.getAttribute("query1")%>" />
			<input type="hidden" name="query2"
				value="<%=request.getAttribute("query2")%>" />
			<bean:define id="htmlstr" name="htmlstr"></bean:define>
			 <!-- list --> 
  			<div class="list">
			<%=htmlstr%>
			</div>
			<logic:equal name="flag" value="">
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
			</logic:equal>
			</div>
		</html:form>
	</BODY>
	<!--<script type="text/javascript">
	setTableStyle("list_table","list");
	</script>
--></HTML>


