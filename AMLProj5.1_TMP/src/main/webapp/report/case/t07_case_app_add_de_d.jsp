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
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/uc.js" ></script>		
		<script type="text/javascript" src="../../js/selectbox.js" ></script>
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
	

		
	function _Confim(url,type){
      
        var errMsg ="";
		//var trans= document.frames[0].document.getElementsByName('transactionkeyCheckBox');
		var subForm= document.frames[0].document.forms[0];
	      	
      	if(document.forms[0].finm.value==''){
      		errMsg="机构名称不能为空";
      	}
	
    	else if(document.forms[0].ficd.value==''){
			errMsg = "金融机构代码不能为空！";
		}else   if(type!='all'&&getLength(CheckBoxMustChecked(subForm))>0){
           errMsg="请选择交易信息！";
         }
	
	
		if (errMsg != "") {
	        alert(errMsg);
	        return false;
    	} else
    		{
			var reportkeys='';
	    		for(var i=0;i<subForm.reportkeyCheckBox.length;i++)
	    		{
	    			if (true==subForm.reportkeyCheckBox[i].checked){
	        	  		 reportkeys+=subForm.reportkeyCheckBox[i].value+',';
	      	 	 	}
	    		
	    		}
	      var party_class_cd=subForm.party_class_cd.value;
    		var curr_cd=subForm.curr_cd.value;
	    		if(reportkeys=='')
    		{reportkeys=subForm.reportkeyCheckBox.value;
    		  url+='?reportkey1='+reportkeys+'&type='+type;
    		}else {
				url+='?reportkey1='+reportkeys.substr(0,reportkeys.length-1)+'&type='+type;
				}
					url+="&party_class_cd="+party_class_cd+"&curr_cd="+curr_cd;
				
				
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
		var url='<%=request.getContextPath()%>/report/case/t07_case_app_add_de_';
		if(obj.value=='D')
		{
			window.location.href=url+'d.do';
		}else if(obj.value=='N')
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
<div id="main">
 <html:form action="/case/t07_case_app_add_de_d.do" method="post">
		
 		<div class="conditions">
 		
 		
				<div class="cond_t">
				  <span>人工识别 - 大额</span>
				   <span class="buttons">
			              <a href="#" onclick="changeCaseType('<%=request.getContextPath()%>/report/case/t07_case_app_add_ky_n.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />可 疑</a>
			              <a href="#" class="makegray"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />大 额</a>
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
			          	<td colspan="3">	<html:text property="ficd"  size="9"/>
			          		<html:text  property="finm" readonly="true" size="30"/>
							 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=ficd&input_name_disp=finm','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
						
						<font color="#FF0000"> *</font>
						</td>
						
			      	 </tr>
				  </table>
				</div>
 		
 			
 			<html:errors />
	 		
         
			 <iframe src="<%=request.getContextPath()%>/report/case/t07_case_app_add_de_d_page.do?newsearchflag=2"
				width="100%"   frameborder="0"  scrolling="no" name="iframe_cus"
				id="iframe_cus"></iframe>
		
		 <table align="right">
	     	  <tr>
				<td  class="in_button" align="right">
				     <input name="" type="button" value="全部生成" onclick="_Confim('<%=request.getContextPath() %>/report/case/t07_case_app_add_de_d_comp.do','all')"/>
					 <input name="" type="button" value="选择生成" onclick="_Confim('<%=request.getContextPath() %>/report/case/t07_case_app_add_de_d_comp.do','')"/>
			    </td>
	   			</tr>
	   			   		
	 		</table>
		
		</html:form>
		</div>
	</BODY>
</HTML>
