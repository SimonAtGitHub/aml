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
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<% String rowtable = (String)session.getAttribute("rowtable");%>
<script language="JavaScript">
function dosubmit(theUrl){
    var errMsg ="";
    //意见
    if(getLength(document.forms[0].reason.value)==0){
        errMsg+="交易处理意见不能为空！";
        document.forms[0].reason.focus();
    }
    if (getLength(document.forms[0].reason.value)>300) {
        errMsg = "交易处理意见不能多于300个字符,150个汉字！";  
　　　　　document.forms[0].reason.focus();
    }

   if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
    	var check_flag = window.opener.document.getElementById("check_flag").value;//父页面是否查证页面过来
    	document.getElementById("check_flag").value=check_flag; //把父页面的值赋值给本页面
        document.forms[0].action=theUrl;
        document.forms[0].submit();
        if(check_flag=='check'){ //查证时调用
        	var alinkID = window.opener.document.getElementById('btnID').value;//父页面input隐藏域的值
        	window.opener.document.getElementById(alinkID).innerHTML = (window.opener.document.getElementById(alinkID).innerHTML == '恢复')?'排除':'恢复';
        	var status = get_prev(window.opener.document.getElementById(alinkID).parentNode);
        	status.innerHTML = (status.innerHTML=='已排除')?'处理中':'已排除';
            //获取前一列
        	function get_prev(n){
        	    var x = n.previousSibling;
        		while(x.nodeType!=1){
        		    x = x.previousSibling;
        		}
        		return x;
        	}
          } 
    }
}

</script>
</head>

<body class="mainbg">
<html:form method="post" action="/case/addt07_stcr_trans_advi.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>交易处理意见</span>
						<span class="buttons"> 
						   <a href="#" onclick="dosubmit('t07_stcr_trans_advi.do');">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存
						   </a> 
						    <a href="#" onclick="javascript:window.close();return false;">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭
						   </a> 
						   
						</span>
					</div>
					<input type="hidden" name="check_flag" id="check_flag"/> 
					<input type="hidden" name="application_num" value="<bean:write name="application_num" />" />
					<input type="hidden" name="party_id" value="<bean:write name="party_id" />" />
					<input type="hidden" name="acct_num" value="<bean:write name="acct_num" />" />
					<input type="hidden" name="stcr" value="<bean:write name="stcr" />" />
					<input type="hidden" name="flag" value="<bean:write name="flag" />" />
				    <input type="hidden" name="transactionkey" value="<bean:write name="transactionkey" />" />
				    <input type="hidden" name="val2" value="<bean:write name="val2" />" />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
								  交易处理意见：
								</td>
								<td>
									<html:textarea property="reason" cols="60" rows="10" styleId="reason"></html:textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
</html:form>
</body>
</html>
