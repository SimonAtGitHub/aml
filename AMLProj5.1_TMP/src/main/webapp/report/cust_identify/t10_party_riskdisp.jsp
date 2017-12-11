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
		
	

<script language="JavaScript">
		
function checkForm(theUrl)
{
	var errMsg = '';
	if(getLength(document.forms[0].partyrisk_no.value)==0){
        errMsg+="事件编号不能为空！";
        document.forms[0].partyrisk_no.focus();
    }
    if(getLength(document.forms[0].risk_des.value)==0){
        errMsg+="事件简述不能为空！";
        document.forms[0].risk_des.focus();
    }
    if(getLength(document.forms[0].risk_type.value)==0){
        errMsg+="风险类型不能为空！";
        document.forms[0].risk_type.focus();
    }
    if(getLength(document.forms[0].risk_validite_dt_disp.value)==0){
        errMsg+="失效日期不能为空！";
        document.forms[0].risk_validite_dt_disp.focus();
    }
    
    if(getLength(document.forms[0].partyrisk_no.value)>10){
        errMsg+="参数编码长度不能大于10位！";
        document.forms[0].partyrisk_no.focus();
    }
    if(getLength(document.forms[0].risk_des.value)>200){
        errMsg+="参数描述长度不能大于200个字符！";
        document.forms[0].risk_des.focus();
    }
    if(getLength(document.forms[0].risk_detail.value)>800){
        errMsg+="参数描述长度不能大于800个字符！";
        document.forms[0].risk_ddtail.focus();
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
			

</script>
</head>

<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/cust_identify/t10_party_riskdisp.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>风险事件详细信息</span>
	   <span class="buttons">
			<a href="#" onclick="window.close();" ><img src="../../images/blue/b_shut.png" />关闭</a>
	   </span>
	   <html:hidden property="party_id" />
					
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	  
       <tr>
         <td>事件编号：</td>
         <td> <bean:write name="t10_party_risk" property="partyrisk_no" /></td>
       </tr>
        <tr>
	   		<td>客户号：</td>
         <td> <bean:write  name="t10_party_risk" property="party_id"/></td>
	   </tr>
	   <tr>
	   <td>客户名称：</td>
         <td> <bean:write  name="t10_party_risk" property="party_chn_name"/></td>
	   </tr>
        <tr> 
         <td>风险类型：</td>
         <td > 
         <bean:write name="t10_party_risk" property="risk_type_disp" />
         </td>
       </tr>
       <logic:equal name="isnewrisk" value="1">
        <tr> 
         <td>积分模板风险事件要点：</td>
         <td > 
         <bean:write name="t10_party_risk" property="elementkey" />
         </td>
       </tr>
       <tr> 
         <td>积分模板风险事件要点名称：</td>
         <td > 
         <bean:write name="t10_party_risk" property="elementname" />
         </td>
       </tr>
        <tr> 
         <td>积分模板风险事件要点得分：</td>
         <td > 
         <bean:write name="t10_party_risk" property="element_score" />
         </td>
       </tr>
       </logic:equal>
       <tr>
         <td>事件简述：</td>
         <td style='word-break:break-all;width:400px'><bean:write name="t10_party_risk" property="risk_des" /></td>
       </tr>
      
       <tr>
        <td>事件详述：</td>
         <td style='word-break:break-all;width:400px'>
          <bean:write name="t10_party_risk" property="risk_detail" />
         
         </td>
       </tr>
       
       <tr>
         <td>失效日期：</td>
         <td > 
          <bean:write name="t10_party_risk" property="risk_validite_dt_disp" />
         
         </td>
        
       </tr>
       
	  </table>
	</div>
  </div>
</html:form>
</div>
</BODY>
</HTML>