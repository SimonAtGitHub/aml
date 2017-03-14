<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="javascript">
 function dosubmit(url){
    if(url!=""){
      jQuery.ajax({
	 			type:"post",
				url:"updateT07_packetStatus.do",
				data:{url:url},
				dataType:"text",
				success:function(msg){
					if(msg==0){
					   return false;
					}
				 }
	 		});
	  }
      url= "<%=request.getContextPath()%>/common/download_organ.jsp?url="+url;  
       window.open(url,'','height=160, width=300,left=100,top=100');
  
}
function _Submit(){
    var url='<%=(String)request.getParameter("url")%>';  
        document.forms[0].action=url;
        document.forms[0].submit();
    
}

</script>
</head>

<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/report/normal_huge_list.do" method="post">

<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>报送报告管理 - 数据包创建结果</span>
	  <span class="buttons">
	   <a href="#" onclick="_Submit()" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返回</a>
	  </span>
	</div>
	<!-- table content -->
	<div class="list">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <th >创建数据包结果：</th>
         </tr>
<logic:notEmpty name="pathList" > 
         <logic:iterate id="t07_result_disp" name="pathList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_result_disp">	
					 <tr>
         <td colspan="2"><a href="#" onclick="dosubmit('<bean:write name="t07_result_disp" property="url"/>');this.style.color='red';">
								<bean:write name="t07_result_disp" property="disp" />
						</a>
			</td>
			</tr>	
			</logic:iterate>	
			</logic:notEmpty>
			<logic:notEmpty name="resultdisp" > 
			<tr>
			    <td colspan="2"><bean:write name="resultdisp" scope="request" filter="false" /></td>
			    	 </tr>
			</logic:notEmpty>
	
	  </table>
	</div>
  </div>
<!-- all end --> 
</html:form>  
</div>

</body>
</html>


