<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript">
	   function dosubmit(theUrl){
			    document.forms[0].action=theUrl;
			    document.forms[0].submit();
		}
function _Commit11(){
		
	    if(checkRadio(document.forms[0].selectedStcrkey)<0){
	           alert("请选择！");
	           return false;
	    }
	    else
	    {
	    	var tag="";
	    	var key="";
	    	var temp =  document.forms[0].selectedStcrkey;
	    	var dist=document.forms[0].input_name_disp.value;
	    	if(temp.length != undefined && temp.length > 1){
	    		for (i=0;i<temp.length;i++)
		     	{ 
		       	if(temp[i].checked) {
		         	tag = tag + temp[i].value + "\n" ;
		         	var j=temp[i].value;
		         	var k=j.substring(0,j.indexOf("--"));
		         	key = key + k +",";
		         	}
		     	}
		    }else{
		    	tag=temp.value;
		    	key=tag.substring(0,tag.indexOf("--"));
			    }
	    	

	     	if(dist=='keyCharacteristic'){
	     	    window.parent.document.forms[0].keyCharacteristic.value =  tag;
	     	    window.parent.document.forms[0].key.value =  key;
	     	}
	     	else if(dist=='assistCharacteristic'){
	     	    window.parent.document.forms[0].assistCharacteristic.value =  tag;
	     	    window.parent.document.forms[0].assist.value =  key;
	     	}
	     	
	   	 	window.parent.ymPrompt.close();
	    }
	}

function _Commit(){
	
    if(checkRadio(document.forms[0].selectedStcrkey)<0){
           alert("请选择！");
           return false;
    }
    else{
        var val = document.forms[0].keys_str.value;
      	var length=document.forms[0].selectedStcrkey.length;
      	if(length>1){
      	   for(i=0;i<length;i++){
      	     if(document.forms[0].selectedStcrkey[i].checked){
      	       var value=document.forms[0].selectedStcrkey[i].value;
      	       var values=value.split("***");
      	       window.parent.document.forms[0].hid_stcrkey.value=values[0];
      	       window.parent.document.forms[0].hid_pbc_des.value=values[1];
      	       window.parent.document.forms[0].keys_str1.value=val + '*' + values[0];
      	       window.parent.addrow();
      	     }
      	   }
      	}else{
      	   var value=document.forms[0].selectedStcrkey.value;
      	       var values=value.split("***");
      	       window.parent.document.forms[0].hid_stcrkey.value=values[0];
      	       window.parent.document.forms[0].hid_pbc_des.value=values[1];
      	     window.parent.document.forms[0].keys_str1.value=val + '*' + values[0];
      	       window.parent.addrow();
      	}
      	
   	 	 window.parent.ymPrompt.close();
   }
}
	function _init_aa()
	{   
	    var dist=document.forms[0].input_name_disp.value;
	    var stcrs="";
	    if(dist=='keyCharacteristic'){
	      stcrs ='<%=request.getAttribute("key")%>';
	    }else if(dist=='assistCharacteristic'){
	      stcrs ='<%=request.getAttribute("assist")%>';
	    }
	   	var stcr =stcrs.split(',');
	   	var temp =  document.forms[0].selectedStcrkey;
	   	if(stcrs.length>0){
	   	   	for (j=0;j<stcr.length;j++)
		   	  { 
			   	  if(temp.length != undefined && temp.length > 1){
				   		for (i=0;i<temp.length;i++)
				     	{   
				     	    var tp=temp[i].value;
				       		if(tp.substring(0,tp.indexOf("--"))==stcr[j]) {
				         		temp[i].checked="checked";
				         	}
				     	}
				   	  }else{
					   		var tp=temp.value;
				       		if(tp.substring(0,tp.indexOf("--"))==stcr[j]) {
				       			temp.checked="checked";
				         	}
					   	  }  
			   	
		   	  }
	   	 } 		
	}
	
	
</script>
	</head>
	<body class="mainbg">
		<html:form action="/module/t21_pbcrule_search.do" method="post">
		<html:hidden property="input_name"/>
        <html:hidden property="input_name_disp"/>
        <html:hidden property="keys_str" />
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
					  <span>特征定位</span>
					  <span class="buttons">
					    <a href="#" onclick="javascript:_Commit();"><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选 定</a>
	                    <a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
					  </span>
					</div>
					<!-- table content 
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									特征码：
								</td>
								<td>
									<html:text property="stcrkey" />
								</td>

								<td nowrap>
									特征名称：
								</td>
								<td>
									<html:text property="pbc_des" />
								</td>
								<td>
								 <input  type="button" name="search" value="查  询" class="in_button1" onclick="dosubmit('character_list.do?newsearchflag=1')"/>
								</td>
							</tr>
						</table>

					</div>-->
				</div>


				<div class="list">
					<table>
						<tr>
							<th>
								选择
							</th>
							<th>
								特征码
							</th>
							<th>
								特征名称
							</th>
						</tr>
						<logic:iterate id="t21_pubcrule" name="t21_pubcruleList"
							type="com.ist.mfa.dto.T23_rule_module">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("stcrkey", t21_pubcrule.getStcrkey());
										pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<html:multibox property="selectedStcrkey">
										<bean:write name="t21_pubcrule" property="stcrkey" />***<bean:write name="t21_pubcrule" property="pbc_des" scope="page" />
									</html:multibox>
								</td>
								<td align="center" nowrap>
									<bean:write name="t21_pubcrule" property="stcrkey"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t21_pubcrule" property="pbc_des"
										scope="page" />
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
           </div>
		</html:form>
	</body>
	<script></script>
</html>