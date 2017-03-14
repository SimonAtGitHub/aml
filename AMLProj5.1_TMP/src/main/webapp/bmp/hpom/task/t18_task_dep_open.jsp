<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<html:html lang="true">
<head>
    <html:base />
    <META http-equiv=Content-Type content="text/html; charset=GBK">
    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	   var url;
	   url = '<%=request.getContextPath()%>/bmp/t18_tasklist/'+theUrl;
       document.forms[0].action=url;
       document.forms[0].submit();
       //window.close();
	}
	function selectTask(){
	// var aaEle = listfrm.document.getElementById('aa');
	   var val;
	   var busval = "";
	   var displayval = "";
	   var typeval = "";
	   var buskeyEle = document.getElementById('businesskey_d');
	   var diplayEle = document.getElementById('tasktype_diplay');
	   var typeEle = document.getElementById('tasktype_d');
	   var elements = document.getElementsByName('selectbuskey');
	   for(var i=0;i<elements.length;i++){
   		if(elements[i].checked){
   			val = elements[i].value.split("-");
   			if(busval!=""){
   				busval+=","+val[0];
   				displayval+=","+val[1];
   				typeval+=","+val[2];
   			}else{
   			   busval=val[0];
   			   displayval=val[1];
   			   typeval=val[2];
   			}
   		}
   		buskeyEle.value =  busval;
   		diplayEle.value = displayval;
   		typeEle.value = typeval;
	}
	    
  }
  function open_relation(theUrl){
  	 var property = 'height=500, width=600,left=200,top=200,scrollbars=yes,resizable=yes';
     window.open(theUrl,'',property); 
  }
  function freshParent(){
   window.opener.opener=null;
   window.opener.location.replace(window.opener.location.href);
   window.close();
  }
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
    <div id='content'>
        <html:form method="POST" action="/t18_tasklist/t18_task_dep.do" >
            <div class='awp_title'>
                <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
                    <tr>
                        <td>
                            <span class="awp_title_td2">任务 - 任务依赖</span>
                        </td>
                        <td align="right">
                            <html:button property="closebutton" value="关 闭" onclick="freshParent();" />
                        </td>
                    </tr>
                </table>
               </div>
            <html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
				<html:hidden property="businesskey"/>
				<html:hidden property="tasktype"/>
				<html:hidden property="granularity"/>
				<br/>
                 <p align="left">
                                                                业务编码：
                       <bean:write name="t18_tasklist" property="businesskey" scope="request" />
                     	  任务类别：
                       <bean:write name="t18_tasklist" property="tasktype_disp" scope="request" />
                                                                粒度：
                       <bean:write name="t18_tasklist" property="granularity_disp" scope="request" />
                 </p>
                <div class="awp_detail">
                    <table>
                        
                        <tr>
                            <td width="100px" align="right">
                                	依赖业务编码：
                            </td>
                            <td colspan="3">
                                <textarea  class="text_white" name="businesskey_d" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                              	  依赖任务类别：
                            </td>
                            <td colspan="3">
                               <textarea  class="text_white" name="tasktype_diplay" readonly></textarea>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                              	  依赖任务粒度：
                            </td>
                            <td colspan="3">
                               <input type="hidden" name="granularity_d" value=""/>
                               <textarea class="text_white" name="granularity_diplay" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                
                            </td>
                            <td>
                               <input type="button" name="btn1" value="设置依赖" onclick="dosubmit('t18_task_dep_open_do.do');"/> &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                <input type="hidden" name="tasktype_d" value=""/>
        </html:form>
   </div>    
        <iframe frameborder="0" id="listfrm" scrolling="auto" style="overflow-y:auto;overflow-x:hidden;margin:auto" width="98%" height="320" src="<%=request.getContextPath()%>/bmp/t18_tasklist/t18_task_dep_list.do?selfbusinesskey=<bean:write name="t18_tasklist" property="businesskey" />&selftasktype=<bean:write name="t18_tasklist" property="tasktype" />&selfgranularity=<bean:write name="t18_tasklist" property="granularity" />"></iframe>

</body>
</html:html>