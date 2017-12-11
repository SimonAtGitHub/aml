<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
    
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script type="text/javascript">
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Onblur(){
   document.forms[0].searchOrganName.value="";
}

function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].app_dt_start_disp.value;
    _Date2 = document.forms[0].app_dt_end_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	  
 if(errMsg!=''){
     alert(errMsg);
      return false; 
  }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}

</script>

<script type="text/javascript">
function dosubmit(theUrl){

	var errMsg = "";
	if(!_compareTwoDateForString(document.forms[0].case_date_start_disp.value, document.forms[0].case_date_end_disp.value)) {
    	errMsg = "开始时间不能大于结束时间";	
    }
   if(errMsg == '')
   {
   	document.forms[0].action=theUrl;
   	document.forms[0].submit();
   }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
   
}
function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text" && ele[i].type.toLowerCase()!="hidden")continue;
       ele[i].value="";
    } 
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/t10_check_cust_caselist.do" method="post">
<input type="hidden" name="party_id" value="<bean:write name="party_id"/>"/>
  <div class="conditions">
	  <div class="cond_c">
  		<table border="0" cellpadding="0" cellspacing="0">
  			<tr>
	  			<td>案例编号：</td>
	       		<td>
	       			<html:text property="application_num" styleClass="text_white" maxlength="64"/>
	       		</td>
	       		<td>案例名称：</td>
	       		<td>
	       		<html:text property="case_name" styleClass="text_white" maxlength="120"/>
	       			
	       		</td>
        	 </tr>
			<tr>
          		<td width="10%">数据日期：</td>
          		<td width="40%">
          		
	   <html:text property="case_date_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
            
     
		
					
					－
					<html:text property="case_date_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
            
     
					
				</td>
          		<td width="20%">案例类型：</td>
          		<td>
					<html:select property="cast_type">
						<html:options collection="casecagetoryMap" property="label"	labelProperty="value" />
					</html:select>
			  	</td>
			</tr>
        	<tr>
          		<td>案例状态：</td>
          		<td>
					<html:select property="app_state_cd">
						<html:options collection="casestatusMap" property="label" labelProperty="value" />
					</html:select>
				</td>
				<td>
        			报送状态：
				</td>
				<td>
					<html:select property="casesearchtime">
						<html:options collection="casesearchtimeMap" property="label" labelProperty="value" />
					</html:select>
					
				</td>
        	</tr>
        	<tr>
        		<td></td><td></td><td></td>
          		<td>
          			<input type="button" name="ok" value="查 询" class="in_button1" onclick="dosubmit('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1');" />
				</td>
        	</tr>
      	</table>
      	</div>
      </div>
      <html:errors />
    <div class="list">
  	<table border="0" cellpadding="0" cellspacing="0">
     <tr>
      <th>案例编号</th>
	  <th>案例名称</th>
	  <th>案例类型</th>
	  <th>案例状态</th>
      <th>数据日期</th>
      <th>可疑行为描述</th>
	  <th>采取措施</th>
	  <th>排除原因</th>
	 </tr>
    <logic:iterate id="result" name="t10_check_cust_caselist" indexId="i" type="com.ist.aml.report.dto.T07_case_application">
   
    <tr>
       <td>
       	
		 <bean:write name="result" property="application_num" scope="page" />
       </td>
	   <td>
         <bean:write name="result" property="case_name" scope="page" />
       </td>
	   <td>
         <bean:write name="result" property="cast_type_disp" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="app_state_cd_s" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="case_date_disp" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="action_descrip" scope="page" />
       </td> 
        <td>
         <bean:write name="result" property="take_action" scope="page" />
       </td>
         <td>
         <bean:write name="result" property="application_advice" scope="page" />
       </td>
    </tr>
	</logic:iterate>
  	</table>
  	</div>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
       <tr>
          <td align="center"><bean:write name="pageInfo" scope="request" filter="false"/></td>
       </tr>
    </table>
 
</html:form>
</body>
</html>