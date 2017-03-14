<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript">

function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmit(theUrl){

	var errMsg = "";
    create_dt_s = document.forms[0].risk_create_dt_start_disp.value;
    create_dt_e = document.forms[0].risk_create_dt_end_disp.value;
    val_dt_s = document.forms[0].risk_validite_dt_start_disp.value;
    val_dt_e = document.forms[0].risk_validite_dt_end_disp.value;
    
    if(!_isDateSpaceComplete(create_dt_s, create_dt_e)){
       errMsg = "请填写完整的创建日期！";
   	}
    else if(!_compareTwoDateForString(create_dt_s, create_dt_e)){
  		errMsg = "开始时间不能大于结束时间！";	
  	}
    else if(!_isDateSpaceComplete(val_dt_s, val_dt_e))
    {
    	errMsg = "请填写完整的创建日期！";
    }
    else if(!_compareTwoDateForString(val_dt_s, val_dt_e))
    {
    	errMsg = "开始时间不能大于结束时间！";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
      }else{
      document.forms[0].action=theUrl;
      document.forms[0].submit();
      }
}

</script>
</head>
<body id="iframecontent">
<html:form action="/cust_identify/t10_party_risklist.do" method="post">
<div class="conditions">
	<div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
   		<tr> 
        	<td>创建日期：</td>
            <td>
              <html:text property="risk_create_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
				－
			  <html:text property="risk_create_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
			
		    </td>
		    <td>失效日期：</td>
            <td>
              <html:text property="risk_validite_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
				－
			  <html:text property="risk_validite_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
		    </td>
		 </tr>
		 <tr>
		 	<td>风险类型：</td>
		 	<td> <html:select property="risk_type">
				     <html:options collection="risk_typeMap" property="label" labelProperty="value" />
				 </html:select>
		    </td>
            <td></td>
           <td>
           	   <input type="button" name=Button3  class="in_button1" value="查 询" styleClass="input"   onClick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/t10_party_risklist.do?newsearchflag=1&party_id=<%=(String)request.getAttribute("party_id")%>')" >
             	
           </td>
         </tr>
    </table>
    </div>
     </div>
    <html:errors />
    <div class="list">
    <table>
    <tr>
      <th>选择</th>
      <th>事件编号</th>
	  <th>事件简述</th>
	  <th>风险类型</th>
	  <th>创建时间</th>
	  <th>创建人</th>
	  <th>失效时间</th>
    </tr>
    <logic:iterate id="party_risk" name="t10_party_riskList" indexId="i" type="com.ist.aml.cust_identify.dto.T10_checkparty_fun">
    <tr>
       <td>
		<html:multibox property="selectedPartyrisk_No" ><bean:write name="party_risk" property="partyrisk_no" /></html:multibox>
	   </td>
       <td><a href="#" onclick="window.open('t10_party_riskdisp.do?party_id=<bean:write name="party_risk" property="party_id" scope="page"/>&partyrisk_no=<bean:write name="party_risk" property="partyrisk_no" scope="page"/>','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="party_risk" property="partyrisk_no" scope="page"/></a></td>
       <td><bean:write name="party_risk" property="risk_des" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_type" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_create_dt_disp" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_create_user" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_validite_dt_disp" scope="page"/></td>
    </tr>
	</logic:iterate>
    </table>
      </div>
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
</html:form>
</body>
</html>