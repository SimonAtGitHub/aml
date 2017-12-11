<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>定位</title>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/awp_base.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src=../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
	  function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	  }
	function locate_sel(){
		var parDoc = opener.document;
	    var isCheck = true;
		var par_element = document.getElementById('localset').value.split(',');
		var selVal ;
	    //隐藏域
	    var hideElemens =  parDoc.getElementsByName(par_element[0]);
	    var dispElemens =  parDoc.getElementsByName(par_element[1]);
	    var elements = hideElemens[0].value;
		var oCheck = document.getElementsByName('selectedkey');
	    var eleStr = elements.split(',');
		for( var i=0; i < oCheck.length; i++ ){
	        if (oCheck[i].checked){
				selVal = oCheck[i].value.split('&');
				isCheck = false;
   				if(!in_array(selVal[0],eleStr)){
   				    if(hideElemens[0].value=='')
   				    {
   				    	hideElemens[0].value = selVal[0];
   				    	dispElemens[0].value = selVal[1];
   				    }
   				    else
   				    {
   				    	hideElemens[0].value = hideElemens[0].value+","+selVal[0];
   						dispElemens[0].value = dispElemens[0].value+","+selVal[1];
   				    }
   				}
	        }
	   }
	   if(isCheck){
		   alert("请选择！");
	       return false;
	   }
	   window.close();
	}

	function in_array(needle, haystack) {
		 var type = typeof needle;
		 if(type == 'string' || type =='number') {
		  for(var i in haystack) {
		   if(haystack[i] == needle) {
		     return true;
		   }
		  }
		 }
		 return false;
	} 
function checkForm(theUrl,type){
	    var parDoc = opener.document;
	    var isCheck = true;
		var par_element = document.getElementById('localset').value.split(',');
	
		var selVal ;
	   //隐藏域
	
	 //  var hideElemens =  parDoc.getElementsByName(par_element[0]);
	  
	 //  var dispElemens =  parDoc.getElementsByName(par_element[1]);
	   
	     var hideElemens=eval("opener.document.forms[0]."+par_element[0]);
	    var dispElemens=eval("opener.document.forms[0]."+par_element[1]);
	    if(checkRadio(document.forms[0].selectedkey)<0){
	        hideElemens.value="";
	        dispElemens.value="";
	        alert("请选择！");
	    }else{
		   var oCheck = document.getElementsByName('selectedkey');
			for( var i=0; i < oCheck.length; i++ ){
	   				if(oCheck[i].checked){
	   			
				        selVal = oCheck[i].value.split('&');
				      
				    	hideElemens.value = selVal[0];
				         
				          
				    	 if(selVal[1] == ''){
				    	    dispElemens.value = selVal[0];
				    	 }else{
				    	 	dispElemens.value = selVal[1];
				    
				    	 	// disp.value=selVal[1];
				    	 	 
				    	 }
				    	 
				    	
				    	
				    	 
						
						break;
	   				}
		        }
		       window.close(); 
		   }
	}
	function emptyall()
	{
		 document.getElementById("typekey").value="";
		 document.getElementById("typename").value="";
	}
	function openChildWin(theUrl){

		window.open(theUrl, '', 'height=250, width=500,left=300,top=150,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no');	
		}
	</script>
	</head>
	<body class="mainbg">
	<html:form action="/dict/location_window_dict.do" method="post">
		<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>定位选择</span>
						<span class="buttons"> 
						<a href="#" onclick="checkForm('location_window_result.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />选 定</a>
						 <logic:equal name="issingle" value="checkbox">
						 <a href="#" onclick="locate_sel()"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />追 加</a>
						</logic:equal> 
<!--						<a href="#" onclick="dosubmit('/common/location_window.do?flag=1')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />全 部</a>-->
						<a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<input type="hidden" name="localset" id="localset" value="<%=request.getAttribute("localset")%>" />
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									编码：
								</td>
								<td>
									<html:text property="typekey" />
								</td>
								<td>
									名称：
								</td>
								<td>
									<html:text property="typename"  />
											<input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('location_window_dict.do?newsearchflag=1')" />
								</td>
							</tr>
						
						</table>
					</div>
					</div>
					<!-- list -->
					<div class="list">
					  <input type="hidden" name="type" value="<%=request.getAttribute("type")%>" />
						<table border="0" cellspacing="0" cellpadding="0">
							<tr align="center">
								<th width="20%">
									选择
								</th>
								<th width="40%">
									代码
								</th>

								<th width="40%">
									名称
								</th>
							</TR>
							<logic:iterate id="dict" name="t00_dictList" type="com.ist.platform.dto.T00_dict">

								<TR align="center">
									<TD noWrap>
										<input type="radio" name="selectedkey" value="<bean:write name="dict" property="typekey" scope="page" />&<bean:write name="dict" property="typename" scope="page" />"/>									</TD>
									<TD align="left" noWrap>
										<a style='cursor:hand;' onclick="openChildWin('<%=request.getContextPath()%>/platform/t00_category/category.do?typekey=<bean:write name="dict" property="typekey" scope="page" />','400','500')"><bean:write name="dict" property="typekey" scope="page" /></a>
									</TD>
									<TD align="left" noWrap>
										<bean:write name="dict" property="typename" scope="page" />
									</TD>
								</TR>
							</logic:iterate>
						</TABLE>
					</div>
					<!-- list_page -->
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
				
			</div>
		</html:form>
	</BODY>
</HTML>


