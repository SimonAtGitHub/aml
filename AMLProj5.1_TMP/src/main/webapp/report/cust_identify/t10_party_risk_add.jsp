<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
			<script language="JavaScript" src="../../js/basefunc.js"></script>	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		
	

<script language="JavaScript">
		
function checkForm(theUrl)
{
    var isnewrisk=document.forms[0].isnewrisk.value;
	var errMsg = '';
	var risk_validite=document.forms[0].risk_validite_dt_disp.value;
	var d=new Date();
	var today=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
	if(getLength(document.forms[0].party_id.value)==0){
        errMsg+="客户号不能为空！";
        document.forms[0].party_id.focus();
    }
	else if(getLength(document.forms[0].risk_type.value)==0){
        errMsg+="风险类型不能为空！";
        document.forms[0].risk_type.focus();
    }
   
    else if(isnewrisk=="1"&&getLength(document.forms[0].elementkey.value)>0&&getLength(document.forms[0].element_score.value)==0){
        errMsg+="积分模板风险事件要点分值不能为空！";
        document.forms[0].element_score.focus();
    }
    else if(isnewrisk=="1"&&getLength(document.forms[0].element_score.value)>0&&formatNum(document.forms[0].element_score.value,2,0,5)==false)
    {    	
    	errMsg+="积分模板风险事件要点分值只能为大于0小于5的数字,且小数点后最多2位!";
    	document.forms[0].element_score.focus();		
    }   
   
    else if(getLength(document.forms[0].risk_des.value)==0){
        errMsg+="事件简述不能为空！";
        document.forms[0].risk_des.focus();
    }
    else if(getLength(document.forms[0].risk_validite_dt_disp.value)==0){
        errMsg+="失效日期不能为空！";
        document.forms[0].risk_validite_dt_disp.focus();
    }
    else if(!_compareTwoDateForString(today,risk_validite)){
  		errMsg += "失效日期不能小于当前系统日期！";	
  		document.forms[0].risk_validite_dt_disp.focus();
  	}
    else if(getLength(document.forms[0].risk_des.value)>200){
        errMsg+="事件简述内容过多！";
        document.forms[0].risk_des.focus();
    }
    else if(getLength(document.forms[0].risk_detail.value)>800){
        errMsg+="事件详述内容过多！";
        document.forms[0].risk_detail.focus();
    }
    if( errMsg=='')
    {
    	document.forms[0].action=theUrl;
    	document.forms[0].submit();
    } 	
    else
    {
    	if(errMsg!='')
		   alert(errMsg);
		return false;
    }
}
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
	
</script>
</head>

<body id="iframecontent" >

<html:form action="/cust_identify/t10_party_risk_add.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>风险事件添加</span>
	   <span class="buttons">
		
	 <a href="#" onclick="dosubmit('t10_party_risklist_mod.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	 
	   </span>		
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	   <tr>
	   	 <td><font color="#FF0000">*</font>客户号：</td>
         <td> 
         <logic:notEmpty name="party_id">
          <bean:write name="party_id"/>
          <html:hidden property="party_id" />
         </logic:notEmpty>
         
         <logic:empty name="party_id">
           <html:text property="party_id" size="10" readonly="true"/>
           <html:text property="party_chn_name" size="23" readonly="true"/>
           <a href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
         </logic:empty>
         </td>
	   </tr>
	   
	    <logic:notEmpty name="party_chn_name">
	       <tr>
			<td>客户名称：</td>
			<td><bean:write name="party_chn_name"/>
	          <input type="hidden" name="party_chn_name"  value="<bean:write name="party_chn_name"/>"/></td>
	   </tr>
	          
         </logic:notEmpty>
       <tr>
         <td><font color="red">*</font>风险类型：</td>
         <td > 
         <html:select property="risk_type">
			<html:options collection="risk_typeMap" property="label" labelProperty="value" />
		 </html:select>
         </td>
	   </tr>
	   <input type="hidden" name="isnewrisk" value="<bean:write name="isnewrisk"/>"/>
	   <logic:equal name="isnewrisk"  value="1">
       <tr>
          <td>积分模板风险事件要点：</td>
          <td>
            <input type="text" name="elementkey" readonly="readonly"/>
            <input type="text" name="elementname" readonly="readonly"/>
            <a href="#" title="指标" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/newrisk/t31_def_element/t31_def_element_locate.do?newsearchflag=1',width:650,height:350,title:'定位',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/<%=session.getAttribute("style")%>/b_location.png" />定位</a>
          </td>
       </tr>
       <tr>
          <td>积分模板风险事件要点分值：</td>
          <td>           
            <html:text  property="element_score"/>            
          </td>
       </tr>
       </logic:equal>
       <tr>
         <td><font color="#FF0000">*</font>事件简述：</td>
         <td><html:textarea  property="risk_des" cols="40" rows="4"/></td>
     
       </tr>
       
       <tr>
         <td>事件详述：</td>
         <td>
           <html:textarea property="risk_detail" cols="40" rows="5"/><br/>
         </td>
       </tr>
       <tr>
         <td><font color="#FF0000">*</font>失效日期</td>
         <td> 
         	<html:text property="risk_validite_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
         </td>
        
       </tr>
       
       <tr>
        
         <td >
	    </td>
	    <td >
         <input type="button" class="in_button1" value="提 交" onclick="checkForm('t10_party_risk_add_do.do')"/>
         <input name="" type="reset" class="in_button1" value="重 置" />
		 </td>
	   </tr>
	  </table>
	</div>
  </div>
</html:form>
 <SCRIPT LANGUAGE="JavaScript">
 	if( parent.document.all("iframe_cus")) 	 	
      parent.document.all("iframe_cus").style.height=document.body.scrollHeight+5;  
</script>
</BODY>
</HTML>