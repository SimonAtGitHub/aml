<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/basefunc.js"></script>

<% String rowtable = (String)session.getAttribute("rowtable");%>
<script language="JavaScript">
function dosubmit(theUrl){
    var errMsg ="";
    //意见
    if(getLength(document.forms[0].reason.value)==0){
        errMsg+="<%=com.ist.util.Constans.ALERT_NAME %>处理意见不能为空！";
        document.forms[0].reason.focus();
    }
    if (getLength(document.forms[0].reason.value)>300) {
        errMsg = "<%=com.ist.util.Constans.ALERT_NAME %>处理意见不能多于300个字符,150个汉字！";  
　　　　　document.forms[0].reason.focus();
    }

   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
        
        var obj = window.parent;
        //obj.test1();
        //window.close();

         
		            
		              
        //obj.test(flag);
        var flag = '<bean:write name="flag" />';
        if(flag == '1'){
          flag = '已排除';
        }else if(flag == '2'){
          flag = '处理中';
       }
      obj.test(flag);
      
    //  var stcr=document.forms[0].stcr.value;
    //  var application_num=document.forms[0].application_num.value;
     // var party_id=document.forms[0].party_id.value;
     //  var flag=document.forms[0].flag.value;
     //  var iframe1 = obj.document.getElementById('down');
      // iframe1.src = '<%=request.getContextPath()%>/report/case/stcr_trans_list.do?stcr='+stcr+"&application_num="+application_num+"&party_id="+party_id+"&newsearchflag=1";
       //window.parent.ymPrompt.close();
    }
}

</script>
</head>

<body class="mainbg">
<html:form method="post" action="/case/t07_case_stcr_advi_add.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>修改<%=com.ist.util.Constans.ALERT_NAME %>处理意见</span>
						<span class="buttons"> 
						   <a href="#" onclick="dosubmit('t07_case_stcr_advi_add_do.do');return false">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存
						   </a> 
						   <a href="#" onclick="javascript:window.parent.ymPrompt.close();return false;">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭
						   </a> 
						</span>
					</div>
					<input type="hidden" name="application_num" value="<bean:write name="application_num" />" />
					<%-- <input type="hidden" name="party_id" value="<bean:write name="party_id" />" />--%>
					<input type="hidden" name="stcr" value="<bean:write name="stcr" />" />
					<input type="hidden" name="flag" value="<bean:write name="flag" />" />
					<input type="hidden" name="objtype" value="<bean:write name="objtype" />" />
					<input type="hidden" name="seq_num" value="<bean:write name="seq_num" />" />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
								   <%=com.ist.util.Constans.ALERT_NAME %>处理意见：
								</td>
								<td>
									<html:textarea property="reason" cols="60" rows="10"></html:textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
</html:form>
</body>
</html>
