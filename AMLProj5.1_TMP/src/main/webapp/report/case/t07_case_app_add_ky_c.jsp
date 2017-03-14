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
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/uc.js" ></script>		
		<script type="text/javascript" src="../../js/selectbox.js" ></script>
		
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">

	function dosubmit(theUrl, type) {
		var errMsg = "";
		var isSub = false;
		if (type == 'search') {
			isSub = true;
		}
		if (isSub && errMsg == '') {
			//alert(theUrl);
			document.forms[0].action = theUrl;
			document.forms[0].submit();
		} else {
			if (errMsg != '')
				alert(errMsg);
			return false;
		}
	}
	

		
function _Confim(url){

        var errMsg ="";
		var report= document.forms[0].reportkey.value;  
      	if(document.forms[0].finm.value==''){
      		errMsg="机构名称不能为空";
      	}
	
    	else if(document.forms[0].ficd.value==''){
			errMsg = "金融机构代码不能为空！";
		}else if(report==''){
           errMsg="请选择报告信息！";
         }
	
		if (errMsg != "") {
	        alert(errMsg);
	        return false;
    	} else
    		{
    		
			   url=url+'?reportkey1='+document.forms[0].reportkey.value;
			   //alert(url);
			   document.forms[0].action=url;
			   document.forms[0].submit();
			}
}

 
   function changeCaseType(theUrl){
		//alert(theUrl);
		window.location.href=theUrl;
       // document.forms[0].action=theUrl;
      //  document.forms[0].submit();

}

	function caseChange(obj)
		{
		var url='<%=request.getContextPath()%>/report/case/t07_case_app_add_ky_';
		if(obj.value=='N')
		{
			window.location.href=url+'n.do?type=n';
		}else if(obj.value=='A')
		{
			window.location.href=url+'n.do?type=a';
		}
		else if(obj.value=='C')
		{
			window.location.href=url+'c.do';
		}
	}
</SCRIPT>


<style type="text/css">
.STYLE2 {
	color: #ff0000
	}
</style>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
<div id="main">
 <html:form action="/case/t07_case_app_add_ky_c.do" method="post">
		<input type="hidden" name="reportkey" id="reportkey"/> 
		
 		<div class="conditions">
 		
 		
				<div class="cond_t">
				  <span>人工识别 - 可疑 </span>
				   <span class="buttons">
			             	<a href="#" class="makegray"> <img src="../../images/blue/b_add2.png" />可 疑</a>
			               <a href="#" onclick="changeCaseType('<%=request.getContextPath()%>/report/case/t07_case_app_add_de_n.do')"><img src="../../images/blue/b_add2.png" />大 额</a>
				   </span>
				</div>
			 
			 		<div class="cond_c2">
			          <table  border="0" cellpadding="0" cellspacing="0">
						<tr>
			              <td>案例种类：</td>
			        		 <td>
			        		 	<html:select property="case_kind" onchange="caseChange(this)">
								 <html:options collection="casecagetoryMap" property="label"	labelProperty="value" />
								 </html:select>
								<font color="#FF0000">*</font>
								</td>
					
			       		<td>机构名称：</td>
			          	<td colspan="3">
			          		<html:text property="ficd"  size="9"/>
			          		<html:text  property="finm" readonly="true" size="30"/>
						<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=ficd&input_name_disp=finm','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
						
						<font color="#FF0000"> *</font>
						</td>
						
			      	 </tr>
				  </table>
				</div>
 		
 			
 			<html:errors />
	 		
         
			 <iframe src="<%=request.getContextPath()%>/report/case/t07_case_app_add_ky_c_page.do?newsearchflag=2&casetype=1"
				width="100%"   frameborder="0"  scrolling="no" name="iframe_cus"
				id="iframe_cus"></iframe>
		
		 <table align="right">
	     	  <tr>
				<td  class="in_button" align="right">
					 <input name="" type="button" value="完成" onClick="_Confim('<%=request.getContextPath() %>/report/case/t07_case_app_add_ky_c_comp.do')"/>		</td>
	   			</tr>
	   			   		
	 		</table>
		
		</html:form>
		</div>
	</BODY>
</HTML>
