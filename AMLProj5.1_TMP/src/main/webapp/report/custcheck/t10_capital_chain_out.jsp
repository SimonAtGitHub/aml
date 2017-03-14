<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%String analy_from = (String)request.getAttribute("analy_from"); %>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script type="text/javascript" src="../../js/calendar.js"></script>
<script type="text/javascript"> 
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
	_Date1 = document.forms[0].start_dt_display.value;
    _Date2 = document.forms[0].end_dt_display.value;  
    if(_Date1 == '' && _Date2 == ''){
        errMsg += "数据时间不能为空！";
    }    
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/t10_cust_capital_chain_out.do" method="post">
<input type="hidden" name="analy_from" value="<bean:write name="analy_from"/>"/>
<input type="hidden" name="party_id" value="<bean:write name="party_id"/>"/>

    <%
    	int out_trans=((Integer)request.getAttribute("out_trans")).intValue();
       	String out_amt_str = ((String)request.getAttribute("out_amt_str"));
    	int out_row = ((ArrayList)request.getAttribute("t10_out_result")).size();
     %>
    <div class="cond_t2">
		   <span class="buttons">
		     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />资金流出</strong>
		     	交易总笔数：<%=out_trans %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  	 	 			交易总金额：<%=out_amt_str %>人民币
		   </span>
 	</div>
    <div class="list">
    <table>
    <tr>
      <th>资金转出客户号</th>
	  <th>资金转出客户名称</th>
	  <th>资金转出交易行</th>
	  <th>资金转出金融机构所在地</th>
	  <th>交易日期</th>
	  <th>交易金额</th>
	  <th>币种</th>
	  <th>交易方式</th>
	  <th>对方客户号</th>
	   <th>对方客户名称</th>
    </tr>
    <logic:iterate id="out_result" name="t10_out_result" indexId="i" type="com.ist.aml.report.dto.T10_capital_chain">
    <tr>
       <td><bean:write name="out_result" property="party_id" scope="page"/></td>
       <td><bean:write name="out_result" property="party_chn_name" scope="page"/></td>
       <td><bean:write name="out_result" property="organName" scope="page"/></td>
       <td><bean:write name="out_result" property="tx_occur_area" scope="page"/></td>
       <td><bean:write name="out_result" property="tx_dt_display" scope="page"/></td>
       <td><bean:write name="out_result" property="amt" scope="page"/></td>
       <td><bean:write name="out_result" property="currency_cd" scope="page"/></td>
       <td><bean:write name="out_result" property="tx_type" scope="page"/></td>
           <td><bean:write name="out_result" property="opp_party_id" scope="page"/></td>
         <td><bean:write name="out_result" property="opp_name" scope="page"/></td>

    </tr>
	</logic:iterate>
    </table>
    </div>
    <div class="list_page">
			<bean:write name="pageInfo" scope="request" filter="false" />
	</div>
	
</html:form> 
</body>
</html>
