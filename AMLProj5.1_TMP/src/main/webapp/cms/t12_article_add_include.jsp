<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ist.cms.dto.T12_programa" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.ist.cms.common.constant.CmsConstant" %>
<%@ include file="../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
      <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/jquery-ui.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
			<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>
			<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	//解决冲突
	jQuery.noConflict();
		function showContentOrFile(value) {
		    if(value == "1") {//显示文章内容
		        document.getElementById("contents").style.display = "block";
		        document.getElementById("file").style.display = "none";
		    }else {//显示附件上传
		        document.getElementById("contents").style.display = "none";
		        document.getElementById("file").style.display = "block";
		    }
		}
		function   savePos(oE)   
		{   
			if(oE.createTextRange){         
				oE.caretPos   =   document.selection.createRange().duplicate();  
			}
		} 
		
	  function   copychar(from ,to)   
	   
	  {    
            if (from == "") {
         	    //alert("请选择！");
         	    return ;
            }
			var parvalueStr = from;
		    var parlength = getLength(parvalueStr);
		    var parvalue = parvalueStr.substr(0, parlength);
		    
		    var text = "<%=CmsConstant.SPLITER_BEGIN%>" + parvalue + "<%=CmsConstant.SPLITER_END%>";
			var textEl = document.getElementById(to);
	
	        if(textEl.createTextRange   &&   textEl.caretPos)   
	        {   
	              var   caretPos   =   textEl.caretPos;   
	              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
	        }   
	        else   
	              textEl.value     =   text;   
 	 } 
  	// 定位子页面向本页面的行区域，列区域及数据区域设定选定的列标题时用
      function setSelectOption(elementName, value, text) {
          var oSelect = document.getElementById(elementName);
          var option = document.createElement("option");
          option.text = text;
          option.value = value + ":" + text;
          oSelect.add(option);
      } 
      //删除select子元素
      function delSelectOption (elementName, value) {
        var oSelect = document.getElementById(elementName);
      	var length = oSelect.options.length - 1;    
	     for(var i = length; i >= 0; i--){  
	         if(oSelect[i].value.indexOf(value) != -1){  
	            var textValue = "<%=CmsConstant.SPLITER_BEGIN%>" + oSelect[i].value + "<%=CmsConstant.SPLITER_END%>"; 
	            var content =  document.getElementById('D_ARTICLECON').value;
	            while (content.indexOf(textValue) != -1) {
	            	content = content.replace(textValue ,"");
	            }
	            document.getElementById('D_ARTICLECON').value =  content;
	            oSelect.options[i] = null; 
	         }    
	     }    
      }
      //
      //校验文章内容格式
function checkforms (url) {
	if(exist('D_ARTICLECON')){ 
	      var content =  document.getElementById('D_ARTICLECON').value;//文章内容
	      var arrStr = content.split("<%=CmsConstant.SPLITER_END%>");
	      for (var i = 0;i < arrStr.length ; i++) {
	  	 	 var arrvalue = arrStr[i];
		  	 arrvalue = arrvalue.replace("<%=CmsConstant.SPLITER_BEGIN%>","");
		  	 if (arrvalue.indexOf("<%=CmsConstant.SPLITER_BEGIN%>") != -1){
		  	 	 alert("文件内容格式不正确!");
		  	 	return;
		  	 }
	  	}
	}
  	if(!checkTextArea()) return ;
  	if(!checkText()) return ;
  	if (<c:out value="${isartcategory} "/>==1&&document.getElementById("bookkey").value==1&&getLength(trim(document.forms[0].artcategorykey.value))==0) {
  		document.forms[0].artcategorykey.focus();
		alert("选择文章类别不能为空!!");
		return;
	}
	avpCondSubmit(url);//提交
}
function exist(id){
    var s=document.getElementById(id);
    if(s)
 {
  return true;
 }
    else
 {
  return false;
 }
   }


function checkTextArea() {//校验文本域是否长度是否超过最大长度
    var flag = true;
    var ta = document.getElementsByTagName('textarea');
    for(var i = 0; i < ta.length; i++ ) {
       var obj = ta[i];
       if(getLength(obj.value) > obj.maxlength ) {
           alert("["+obj.title+"]的字符长度["+getLength(obj.value)+"]超过最大长度["+obj.maxlength+"]！");
           obj.focus();
           flag = false;
           break;
       };       
    }
    return flag;
}

function checkText() {//校验文本输入框是否长度是否超过最大长度
    var flag = true;
    var ta = document.getElementsByTagName('input');
    for(var i = 0; i < ta.length; i++ ) {
       var obj = ta[i];
       if(obj.type != 'text')continue;//不是文本输入不做判断 
       if(obj.readOnly)continue;//只读不做判断
       if(getLength(obj.value) > obj.maxLength ) {
           alert("["+obj.title+"]的字符长度["+getLength(obj.value)+"]超过最大长度["+obj.maxLength+"]！");
           obj.focus();
           flag = false;
           break;
       };
    }
    return flag;
}
function dosubmit(theUrl,type){
	var errMsg = "";
	var isSub = false;
	if(type=='modi'){
		errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		isSub = true;
	 }
	 else if(type=='del'){
		errMsg = CheckBoxMustChecked(document.forms[0]);
		if(errMsg==''){
			if(confirm('你真的要删除吗？')){
			isSub = true;
		}
		}
	}
	else if( type=='save' ){
		if (<c:out value="${isartcategory} "/>==1&&getLength(trim(document.forms[0].categorykey.value))==0&&getLength(trim(document.forms[0].artcategorykey.value))==0&&document.getElementById("bookkey").value=="1") {
	  		document.forms[0].artcategorykey.focus();
			alert("选择文章类别不能为空!!");
			return;
		}
		if(!checkTextArea()) return ;
	  	if(!checkText()) return ;
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
	</SCRIPT>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
<div class='awp_detail'>
	<table>
				
	    <tr>
	        <html:hidden property="programakey" />
            <html:hidden property="articlekey" />
            <input type="hidden" value="1" id="isBack" name="isBack"/>
			<td>栏目名称：</td>
			<td>
			    <bean:write property="programaname" name="t12_programa" ignore="true"/> 
			</td>
		</tr>
		 <!-- 选择文章类别 -->
		 <logic:equal value="1" name="isartcategory">
			   <tr>
			       <td><font color="red" style="color: red">*</font>选择文章类别：</td>
				   <td>
				     <html:text property="artcategorykey" readonly="true" size="8"/>
				     <html:text property="artcategorykey_disp" readonly="true"></html:text> 
				     <logic:equal value="" name="categorykey">
					<input type="hidden" id = "bookkey" value="1"/>
				     	<input type="button" name="locate" value="单 选" class="input" onclick="locate_tree_window('<%= request.getContextPath() %>','<%= request.getAttribute("menu_id") %>','forms[0]','artcategorykey,artcategorykey_disp','lastradio','&programakey=<bean:write name="t12_articleActionForm" property="programakey" />');return false;" />
				   	 </logic:equal>
				   </td>
			   </tr>	
			   <logic:notEqual value="" name="categorykey">
			   <input type="hidden" id = "bookkey" value="0"/>
					<html:hidden property="artcategorykey"/>
					<html:hidden property="artcategorykey_disp" />
			</logic:notEqual>  
		</logic:equal>
		<%=request.getAttribute("htmlStr0") %>
		<%=request.getAttribute("htmlStr1") %>
	</table>
			<% 
				List t12_programa_attachtypeList = (List)request.getAttribute("t12_programa_attachtypeList");
				if(StringUtils.isNotBlank((String)request.getAttribute("htmlStr1"))){
				if(t12_programa_attachtypeList == null && t12_programa_attachtypeList.size() <= 0){
			%>
				<jsp:include page="../cmp/attachment/attach_include.jsp" />
			<%}else{ %>
				<jsp:include page="../cmp/attachment/attach_include_n.jsp" />
			<% }}%>
		
</div>

		