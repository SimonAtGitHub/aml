<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gbk">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>

		
	<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
   var errMsg ="";
    if(type=="del"){
     	errMsg = CheckBoxMustChecked(document.forms[0]);
    }
    if(type=="mod"){
    errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
    }
    if(type=="save"){
    	/* 
    	var samevalue = document.getElementsByName("samevalue");
        var params = document.getElementsByName("param");
        for(var a=0; a<samevalue.length; a++){
   		var obj = samevalue[a];
   		 if(obj.checked){
   		  	if(obj.value == '0'){
		        if(params){
					for(var i=0; i<params.length; i++){
						if(!checkNum(params[i].value)){
							alert("参数不是数字，请重新输入");
							params[i].value = '';
							return false;
						}		
					}
		
		        }
   		  	}
   		  	if(obj.value == '1'){
				var param_obj = document.forms[0].param_obj.value;
				if(!checkNum(param_obj)){
					document.forms[0].param_obj.value = '';
					alert("参数不是数字，请重新输入");
					document.forms[0].param_obj.focus(); 	
					return false;
				}	

   		  	}  		
   		 }
    	}
    	*/ 
    }
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
		if(type=="del"){
			if(confirm('确定删除参数吗?')) {
         		document.forms[0].action=theUrl;
         		document.forms[0].target='_self';
        		document.forms[0].submit();
        		event.srcElement.disabled = true;
        	}
       }else{
        	document.forms[0].action=theUrl;
        	document.forms[0].target='_self';
        	document.forms[0].submit();
        	event.srcElement.disabled = true;
        }
    }
}



function getVal(){
  var samevalue = document.getElementsByName("samevalue");
  var org = document.getElementById("org");
	  var tr=document.getElementsByTagName("tr");
	 for(var a=0; a<samevalue.length; a++){
		 var obj = samevalue[a];
		if(obj.checked){
		  	if(obj.value == '0'){
		  		org.style.display ="none"; 
				for(var j=0;j<tr.length;j++){
				  if(tr[j].id=="orglist"){
					  tr[j].style.display = "";
				  }
				}
									
			}
			if(obj.value == '1'){
				org.style.display =""; 				
				 for(var j=0;j<tr.length;j++){
					  if(tr[j].id=="orglist"){
						  tr[j].style.display = "none";
					  }
				}
		
			}
		}
	 }
}
function closeWin(){
	if(<%=request.getAttribute("isRefresh")%>){
		if(<%=request.getAttribute("isOut")%>){
			window.parent.opener.location.href="<%=request.getContextPath()%>/rule/t21_rule/t03_param_org_list_out.do?tplakey=<%=request.getParameter("tplakey")%>&implway=1&deployflag=0";
		}else{
			window.parent.opener.location.href="<%=request.getContextPath()%>/rule/t21_rule/t03_param_org_list.do?tplakey=<%=request.getParameter("tplakey")%>&implway=1";
		}
	}
	window.parent.close();
}

function disabledAll(){
	var flag = document.getElementsByName('deployflag')[0].value;
	if('2' == flag){
		var inputs = document.getElementsByTagName('input');
		for(var i=0; i < inputs.length; i++){
			if(inputs[i].id != 'closebutton'){
				inputs[i].disabled = true;
			}
		}
		
	}
}
function getorgVal(organkey){
	var tplakey = document.getElementsByName('tplakey')[0].value;
	var parmvalkey = document.getElementsByName('parmvalkey')[0].value;
	var parmtype = document.getElementsByName('parmtype')[0].value;
	var url = 't03_param_org3_val.do?organkey_top=' + organkey + '&tplakey=' + tplakey + '&parmvalkey=' +　parmvalkey + '&parmtype=' + parmtype;
	openWin(url,tplakey);
	//window.showModalDialog(url,'');
	
}
function openWin(theUrl,win_name,height,width){	
	
    var top =  (window.screen.availHeight-30-400)/2;
    var left = (window.screen.availWidth-10-750)/2;
    var h,w;
    if(height==undefined){ h = 500 }else{ h = height; }
    if(width==undefined){ w = 600 }else{ w = width; }
   
	var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(theUrl,'',property);     
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
	<html:form method="post" action="/t21_rule/t03_param_org_list.do">
	<html:hidden property="tplakey"/>
	<html:hidden property="parmvalkey"/>
	<html:hidden property="parmtype"/>
	<input type="hidden" value="<%=request.getAttribute("isOut") %>" name="isOut" />
	<input type="hidden" value="<%=request.getAttribute("deployflag") %>" name="deployflag" />
	<div class="conditions">
			<div class='cond_t'>
			   <span>机构参数值</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onClick="dosubmit('t03_param_org_argSave.do','save');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
							 	
				<a href="javascript:void(0);" onClick="closeWin();return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
			   </span>
				</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td nowrap align="right" valign="top">
						<font color='red'>*</font>机构参数类型：
					</td>
					<td nowrap align="left">								
						<html:radio property="samevalue" value="0" onclick="getVal();">各机构都采用不同值</html:radio><br/>
						<html:radio property="samevalue" value="1" onclick="getVal();">所用机构都采用同一值</html:radio>
					</td>
				</tr>
			</table>
		</div>
	</div>
<div class="list">
		<table border="0" cellpadding="0" cellspacing="0">
		   <tr>
			   	<th nowrap width="10%">序号</th>
			   	<th nowrap width="40%">机构名称</th>
			   	<th nowrap width="30%">参数值</th>
			   	<logic:equal value="2" name="parmtype">
			   		<th nowrap width="30%">参数值2</th>
			   	</logic:equal>
		   </tr>
		   <tr id="org" align="center">
			   	<td>1</td>
			   	<td>
			   		<bean:write name="t03_param_org_val" property="organname"/>
			   	</td>
			   	<td>
			   		<input type="text" name="param_obj" value="<bean:write name="t03_param_org_val" property="param"/>" />			   		
			   	</td>
			   		<logic:equal value="2" name="parmtype">
			   		<td nowrap><input type="text" name="param2_obj" value="<bean:write name="t03_param_org_val" property="param2"/>" /></td>
			   	</logic:equal>
		   </tr>
		   
		   <logic:iterate id="dto" name="t03_param_org_valList" type="com.ist.aml.rule.dto.T03_param_org_val" indexId="index">
		   		<tr id="orglist" align="center">
		   			<td nowrap> <%=index.intValue()+1%></td>
		   			<td nowrap>
		   				<a href="#" onclick="getorgVal('<bean:write name="dto" property="organkey"/>');"><bean:write name="dto" property="organname"/></a>
		   			</td>
		   			<td nowrap>
		   				<html:text property="param" name="dto"/>
		   				<html:hidden property="organkey" name="dto"></html:hidden>		   				
		   			</td>
		   			<logic:equal value="2" name="parmtype">
		   				<td nowrap><html:text property="param2" name="dto"/></td>  
		   			</logic:equal>				   		
		   		</tr>		   
		   </logic:iterate>	
		</table>
			
		
		</div>
	</html:form>
	</div>
</BODY>
<script LANGUAGE="JavaScript">
	getVal();	disabledAll();
</script>
</html:html>
