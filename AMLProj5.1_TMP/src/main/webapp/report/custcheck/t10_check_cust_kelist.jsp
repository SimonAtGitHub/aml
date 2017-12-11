<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>


<script type="text/javascript"> 
function dosubmit(theUrl){
	
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text" && ele[i].type.toLowerCase()!="hidden")continue;
       ele[i].value="";
    } 
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}
function selectAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = true;
        }
    }
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function clearAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = false;
        }
    }
}
function dosubmit2(partyname,theUrl){
	var party_name=encodeURI(encodeURI(partyname));
	 document.forms[0].action=theUrl+'&party_name='+party_name;
	 document.forms[0].submit();
}
</script>
</head>
<body  class="mainbg">
<div id="main">
<html:form action="/custcheck/t10_check_cust_kelist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>客户识别-可疑客户识别</span> 
       <span class="buttons">
	  <!--   <a href="#" onclick="selectAll(document.forms[0])" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全选</a>
	   <a href="#" onclick="clearAll(document.forms[0])" ><img src="../../images/<%=session.getAttribute("style") %>/b_checknot.png" />全清</a>
	   --><a href="#" onclick="javascript:window.open('t10_check_cust_report.do?custType=keyi','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes')"><img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />导出调查报告</a> 
	   </span>
 	</div>
   <div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">       
      <tr>
        <td>客户号：</td>
   	  <td><html:text property="party_id" styleClass="text_white" maxlength="50"/></td>
        <td>客户名称：</td>
   	  <td><html:text property="party_name" styleClass="text_white" maxlength="50"/></td>
      </tr>
         <tr>
            <td>归属机构：</td>
      	    <td>
      	   		<html:text property="organkey" styleClass="text_white" size="10" onblur="_Onblur('organName')" maxlength="40"/>
				<html:text property="organName" styleClass="text_white"	size="23" readonly="true" maxlength="20" />
				 <a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				</td>
            <td>客户名单类型：</td>
      	  	<td bgcolor="F6F9FF">
				<html:select property="party_class_cd" >
					<html:options collection="party_class_cdMap" property="label" labelProperty="value" />
				</html:select>
  			</td>
         </tr>
         <!-- <tr>
           <td>报送次数：</td>
      	   <td><html:text property="trans_rep"  styleClass="text_white"/></td> 
      	   <td>认别状态：</td>
       	   <td><html:select property="check_status">
	    		<html:options collection="check_status_map" property="label" labelProperty="value" />
	    	  </html:select>
		   </td>
        </tr> -->
         <tr> 
            <td>排序：</td>
      	    <td><html:select property="order_check" >
	   			<html:options collection="order_check_map" property="label" labelProperty="value" />
	   			</html:select>
	   			<html:radio property="fashion" value="asc" >升序</html:radio>
	   			<html:radio property="fashion" value="desc">降序</html:radio>
  			</td>
  			<td></td>
   			<td>
	   			<input name="" type="button" value="查　询"  class="in_button1" onclick="dosubmit('<%=request.getContextPath()%>/report/custcheck/t10_check_cust_kelist.do?newsearchflag=1')"/>
	   			
	   			</td>
      	</tr>   
    </table>
   </div>
   </div>
  <html:errors />
    <div class="list">
  <table  border="0"   cellpadding="0" cellspacing="0"  >
     <tr>
      
	  <th>客户号</th>
	  <th>客户名称</th>
	  <th>客户类型</th>
	  <th>归属机构</th>
	  <th>交易总数</th>
      <th>上报交易</th>
      <th>排除交易</th>
      <th>大额上报数</th>
      <th>可疑上报数</th>
      <th>可疑认定数</th>
	   <th>认别状态</th> 
	 </tr>
    <logic:iterate id="result" name="t10_check_partylist" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_ke">
    <tr>
     
       <td>
         
             <bean:write name="result" property="party_id" scope="page" />
           
       </td>
	     <td>
         <bean:write name="result" property="party_name" scope="page" />
       </td>
	     <td>
         <bean:write name="result" property="party_class_cd_display" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="organName" scope="page" />
       </td> 
        <td>
         <bean:write name="result" property="trans_all" scope="page" />
       </td>
         <td>
         <bean:write name="result" property="trans_rep" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="trans_del" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="case_de_all" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="case_ky_all" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="case_ky_rep" scope="page" />
       </td>
      
       <td><a href="#" onclick="dosubmit2('<bean:write name="result" property="party_name" scope="page" />','<%=request.getContextPath()%>/report/custcheck/t10_cust_risk_main.do?party_id=<bean:write name="result" property="party_id" scope="page" />&party_class_cd=<bean:write name="result" property="party_class_cd" scope="page" />&organkey=<bean:write name="result" property="organkey" scope="page" />&newsearchflag=1&flag=1')">
			<logic:equal value="0" name="result" property="check_status">未识别</logic:equal>
			<logic:equal value="1" name="result" property="check_status">已识别</logic:equal>
			<logic:equal value="2" name="result" property="check_status">已失效</logic:equal>	</a>	
	   </td>
    </tr>
	</logic:iterate>
	</table>
</div>
</html:form>
<div class="list_page">
			<logic:present name="pageInfo">
				<table width="98%" align="center" border="0" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</logic:present>
		</div> 
</div>
</body>
</html>