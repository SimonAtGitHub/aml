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

	   alert(buskeyEle);
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
                            <html:button property="closebutton" value="返 回" onclick="dosubmit('t18_tasklist_list.do');" />
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
				
				 <div class='awp_cond'>
                 <table><tr>
                 	<td> 任务类别：</td><td> <bean:write name="t18_tasklist" property="tasktype" scope="request" />-<bean:write name="t18_tasklist" property="tasktype_disp" scope="request" /> | 业务编码：<bean:write name="t18_tasklist" property="businesskey" scope="request" /> | 粒度：<bean:write name="t18_tasklist" property="granularity_disp" scope="request" /></td>
                 	<td></td><td></td>
                 </tr></table>
                 </div>
                <div class="awp_detail">
                    <table>
                        
                        <tr>
                            <td width="100px" align="right">
                                                                依赖业务编码：
                            </td>
                            <td colspan="3">
                                <textarea class="text_white" id="businesskey_d" name="businesskey_d" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                              	  依赖任务类别：
                            </td>
                            <td colspan="3">
                               <input type="hidden" id="tasktype_d" name="tasktype_d" value=""/>
                               <textarea class="text_white" id="tasktype_diplay" name="tasktype_diplay" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                              	  依赖任务粒度：
                            </td>
                            <td colspan="3">
                               <input type="hidden" id="granularity_d" name="granularity_d" value=""/>
                               <textarea class="text_white" id="granularity_diplay" name="granularity_diplay" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">&nbsp;</td>
                            <td>
                               <input type="button" name="btn1" value="设置依赖" onclick="dosubmit('t18_task_dep_do.do');"/> &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                <html:hidden property="currdskey"/>
        </html:form>
   </div>    
   <iframe frameborder="0" id="listfrm" scrolling="auto" style="overflow-y:auto;overflow-x:hidden;margin:auto" width="98%" height="320" src="<%=request.getContextPath()%>/bmp/t18_tasklist/t18_task_dep_list.do?selfbusinesskey=<bean:write name="t18_tasklist" property="businesskey" />&selftasktype=<bean:write name="t18_tasklist" property="tasktype" />&selfgranularity=<bean:write name="t18_tasklist" property="granularity" />"></iframe>
</body>
</html:html>