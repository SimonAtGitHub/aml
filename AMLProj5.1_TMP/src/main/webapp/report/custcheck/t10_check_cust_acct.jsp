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
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
		_Date1 = document.forms[0].open_dt_start_disp.value;
		_Date2 = document.forms[0].open_dt_end_disp.value; 
		
		if(!_isDateSpaceComplete(_Date1, _Date2))
			errMsg += "请填写完整的起始时间范围！";
			else if(_Date1!="" && !formatDateAlert(_Date1))
				return false;       
			else if(_Date2!="" && !formatDateAlert(_Date2))
				return false;	      
			else if(!_compareTwoDateForString(_Date1, _Date2) )
				errMsg += "开始时间不能大于结束时间！";		  		
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

</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/t10_check_acctlist.do" method="post">
<html:hidden name="t47_cp_deposit" property="party_id"/>
<html:hidden name="t47_cp_deposit" property="party_class_cd"/>
<div class="conditions">
	<div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
   		<tr> 
        	<td>开户起止日期：</td>
            <td>
              <html:text property="open_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
            
     
		
				－
				<html:text property="open_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
            
     
			
		    </td>
            <td>账户状态：</td>
            <td> <html:select property="acct_status_cd">
				     <html:options collection="acctstatuscdMap" property="label" labelProperty="value" />
				 </html:select>
		    </td>
        </tr>
        <tr> 
           <td>排序：</td>
           <td>
            <html:select property="order_name">
				<html:options collection="order_nameMap" property="label" labelProperty="value" />
   			</html:select>
   			<html:radio property="order_type" value="1" />升序
  			<html:radio property="order_type" value="2" />降序
           </td>
           <td></td>
           <td>
           	   <input type="button" name=Button3  class="in_button1" value="查 询" styleClass="input"   onClick="dosubmit('<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1','search')" >
             	
           </td>
         </tr>
    </table>
    </div>
     </div>
    <html:errors />
    <div class="list">
    <table>
    <tr>
      <th>账户</th>
	  <th>账户名称</th>
	  <th>归属机构</th>
	  <th>账户类型</th>
	  <th>账户状态</th>
	  <th>开户金额</th>
	  <th>开户日期</th>
	  <th>销户日期</th>
      <th>最后交易日期</th>
	  <th>账户金额</th>
    </tr>
    <logic:iterate id="cp_depositLis" name="t47_cp_depositList" indexId="i" type="com.ist.aml.inves.dto.T47_cp_deposit">
    <tr>
       <td><a href="#" onclick="window.open('show_t10_check_cust_acct.do?acct_num=<bean:write name="cp_depositLis" property="acct_num" scope="page"/>','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="cp_depositLis" property="acct_num" scope="page"/></a></td>
      
       <td><bean:write name="cp_depositLis" property="party_chn_name" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="organkey" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="acct_type_cd_disp" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="acct_status_cd_flag_disp" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="open_amt" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="open_dt_disp" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="close_dt_disp" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="last_occur_dt_disp" scope="page"/></td>
       <td><bean:write name="cp_depositLis" property="amt_val" scope="page"/></td>
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