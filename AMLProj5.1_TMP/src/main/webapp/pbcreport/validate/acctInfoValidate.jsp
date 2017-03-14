<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>

		<script type='text/javascript' src='./dwr/interface/CountryArea.js'></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="../../js/validate.js" language="javascript"></script>

	
<%HashMap errorMap=(HashMap)request.getAttribute("errorHash"); %>
		<style>
			v\:* { behavior: url(#default#VML);} 
			o\:* { behavior: url(#default#VML);}
			.link { text-decoration:none; }
		</style>

		<script language="javascript">	
	    var g_appid = "1";
		function validateDetail() {
			  g_changed = true;
	          validate($$('ctac',0), '', '');
		}

function _Confim(url, type){
var errMsg ="";
      if(document.forms[0].catp.value==""){
        errMsg+=" 帐户类型不能为空  ";
       }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
           if( !checkAllValidate()) {
				//alert("存在未校正的数据，保存失败！");
				return ;
			}
			
		   document.forms[0].action=url;
		   document.forms[0].submit();
		   //document.location.href="<%=request.getAttribute("validbackurl")%>";
		   alert("保存成功！");
		   
		}
}
		
	</script>
		<style type="text/css">
			.STYLE2 {color: #ff0000}
		</style>
		<script language="javascript">
			var c= new Array();
			c.push(0);c.push(0);c.push(0);c.push(0);
			function expand(idx, id) {
				/*c[idx]++; 
				var disp='none'; 
				if(c[idx]==1) 
					disp='none'; 
				else {
					disp=''; 
					c[idx]=0;
				} 
				document.getElementById(id).style.display=disp;*/
			}
			
function  _back(url){
            document.forms[0].action=url;
		   document.forms[0].submit();
}
	</script>
	</head>
	<body class="mainbg" onload="validateDetail();"> 
	<div id="main">
		<html:form action="/validate/getValidateAcctDisp" method="post">
			<input type="hidden" name="reportkey" value="<bean:write name="reportkey"/>"/>
			<input type="hidden" name="fromcase" value="<bean:write name="fromcase"/>"/>
			<input type="hidden" name="report_type" value="<bean:write name="report_type"/>"></input>
			<input type="hidden" name="validbackurl" value="<bean:write name="validbackurl"/>"></input>
			<input type="hidden" name="party_class_cd" value="C" />

			<html:hidden property="atif_seqno"/>
			<html:hidden property="ctif_seqno"/>
			<%
			
				boolean notEdit = false;
				
			%>
 <!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>帐户信息补录 </span>
	  <span class="buttons">
	   		  
					<a href="#"
							onclick="_Confim('<%=request.getContextPath()%>/pbcreport/validate/modifyValidatedAcctDo.do?reportkey=<bean:write name='reportkey'/>', 'save')">
								<img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a> 
								<a href="#" onclick="_back('<bean:write name="validbackurl"/>')"> 
								<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> 
		  
	  </span>
	</div>
  <html:errors/>
		
		<!-- table content -->
	<div class="cond_c2">
			 <table border="0" cellpadding="0" cellspacing="0">
				<tr >
					<td >
								 帐户类型：
							</td>
									<td >										
											<html:select property="catp" disabled="<%=notEdit %>" onchange="change();" onblur="validateDetail('');">
											<html:options collection="catpMap" property="label" labelProperty="value" />
										</html:select>
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CATP")) out.print("["+errorMap.get("CATP")+"]");%>
									 </strong>
									  </font>
									</td>
								</tr>			
								<tr>
									<td ><!--CTAC-->
										 账号：
									</td>
									<td >
								    <html:text property="ctac" readonly="<%=notEdit %>" onchange="change();" onblur="validateDetail('');" alt="账号" />
									  <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CTAC")) out.print("["+errorMap.get("CTAC")+"]");%>
									 </strong>
									  </font>
									</td>
								</tr>
					<tr>	
							 
				</tr>
			</table>
		</div>
  </div>

<!-- all end -->   
</html:form>
</div>
</body>
</html>