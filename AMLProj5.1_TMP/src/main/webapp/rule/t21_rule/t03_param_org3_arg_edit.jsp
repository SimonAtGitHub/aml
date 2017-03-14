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



</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
	<html:form method="post" action="/t21_rule/t03_param_org_list.do">
	<html:hidden property="tplakey"/>
	<html:hidden property="parmvalkey"/>
	<html:hidden property="parmtype"/>
	<input type="hidden" value="<%=request.getAttribute("organkey") %>" name="organkey_top" />
	<div class="conditions">
		<div class='cond_t'>
		   <span><bean:write name="t03_param_org_val" property="organname"/> -- 机构参数值</span>
		   <span class="buttons">
		    <a href="javascript:void(0);" onClick="dosubmit('t03_param_org3_argSave.do','save');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
						 	
			<a href="javascript:void(0);" onClick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
		   </span>
		</div>
	</div>
<div class="list">
		<table>
		   <tr>
			   	<th nowrap width="10%">序号</th>
			   	<th nowrap width="40%">机构名称</th>
			   	<th nowrap width="30%">参数值</th>
			   	<logic:equal value="2" name="parmtype">
			   		<th nowrap width="30%">参数值2</th>
			   	</logic:equal>
		   </tr>
		   
		   <logic:iterate id="dto" name="t03_param_org_valList" type="com.ist.aml.rule.dto.T03_param_org_val" indexId="index">
		   		<tr class="orglist" align="center">
		   			<td nowrap> <%=index.intValue()+1%></td>
		   			<td nowrap>
		   				<bean:write name="dto" property="organname"/>
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
</html:html>
