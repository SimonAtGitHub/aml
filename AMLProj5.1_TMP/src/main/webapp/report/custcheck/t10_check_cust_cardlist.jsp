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
<script type="text/javascript" src="../../js/calendar.js"></script>

 <script type="text/javascript"> 
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
		_Date1 = document.forms[0].card_due_start.value;
		_Date2 = document.forms[0].card_due_end.value;  
		if(!_isDateSpaceComplete(_Date1, _Date2))
			errMsg += "请填写完整的起始时间范围！";
			else if(_Date1!="" && !formatDateAlert(_Date1))
				return false;       
			else if(_Date2!="" && !formatDateAlert(_Date2))
				return false;	      
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
function clearAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = false;
        }
    }
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	

</script>
<script type="text/javascript">
function dosubmit2(partyname,theUrl){
	
	var party_name=encodeURI(encodeURI(partyname));
	
	 document.forms[0].action=theUrl+'&party_name='+party_name;
	 document.forms[0].submit();
	
}
</script>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
<html:form action="/custcheck/t10_check_cust_cardlist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>客户识别-证件到期客户</span> 
       	  <span class="buttons">
	   
	   <!-- <a href="#" onclick="selectAll(document.forms[0])" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全选</a>
	   <a href="#" onclick="clearAll(document.forms[0])" ><img src="../../images/<%=session.getAttribute("style") %>/b_checknot.png" />全清</a>
	    --><a href="#" onclick="javascript:window.open('t10_check_cust_report.do?custType=card','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes')"><img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />导出调查报告</a> 
	   </span>
 	</div>
   <div class="cond_c">
   <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
              <td>证件到期日：</td>
           <td width="40%" bgcolor="F6F9FF">
            <html:text property="card_due_start" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
          
				
				－
				<html:text property="card_due_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
          
				
			</td>
            <td>归属机构：</td>
         	   <td>
         	   <html:text property="organkey" styleClass="text_white" size="10" onblur="_Onblur('organName')" />
				<html:text property="organName" styleClass="text_white"	size="23" readonly="true" maxlength="10" />
				<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
         	  	 </td>
            </tr>
            <tr>
              <td>客户号：</td>
         	  <td>
         	  	<html:text property="party_id" styleClass="text_white" />
         	  </td>
         	  <td>客户名称：</td>
         	  <td>
         	  	<html:text property="party_name" styleClass="text_white" />
         	  </td>
            </tr>
            <tr>
            <td>客户类型：</td>
         	<td>
				<html:select property="party_class_cd">
				<html:options collection="party_class_cdMap" property="label" labelProperty="value" />
				</html:select>
			</td>
         	<td>认别状态：</td>
         	<td><html:select property="check_status">
			    <html:options collection="check_status_map" property="label" labelProperty="value" />
			    </html:select>
			</td>
           </tr>
            <tr> 
               <td>排序：</td>
         	   <td><html:select property="order_check">
				   	<html:options collection="order_check_map" property="label" labelProperty="value" />
				   </html:select>
				   <html:radio property="fashion" value="asc" />升序
	   			   <html:radio property="fashion" value="desc"/>降序
			  </td>
			  <td></td>
			   <td>
				   <input name="" type="button" value="查　询"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_cardlist.do?newsearchflag=1','search')"/>
				   </td>
            </tr>   
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
     
	  <th>客户号</th>
	  <th>客户名称</th>
	  <th>客户类型</th>
	  <th>归属机构</th>
	  <th>证件号码</th>
	  <th>证件类型</th>
      <th>证件到期日</th>
	  <th>认别状态</th>
	 </tr>
    <logic:iterate id="result" name="t10_check_partylist" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_card">
    <% 
    	java.util.HashMap map = new java.util.HashMap();
		map.put("party_id", result.getParty_id());
		pageContext.setAttribute("map", map,PageContext.PAGE_SCOPE);
	%>
    <tr align="center" bgcolor="#FFFFFF">
      
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
         <bean:write name="result" property="organ_display" scope="page" />
       </td> 
        <td>
         <bean:write name="result" property="card_no" scope="page" />
       </td>
         <td>
         <bean:write name="result" property="card_type_display" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="card_due_dt_display" scope="page" />
       </td>
       <TD align="center" noWrap><a href="#" onclick="dosubmit2('<bean:write name="result" property="party_name" scope="page" />','<%=request.getContextPath() %>/report/custcheck/t10_cust_risk_main.do?party_id=<bean:write name="result" property="party_id" scope="page" />&party_class_cd=<bean:write name="result" property="party_class_cd" scope="page" />&flag=2')">
			<logic:equal value="0" name="result" property="check_status">未识别</logic:equal>
			<logic:equal value="1" name="result" property="check_status">已识别</logic:equal>
			<logic:equal value="2" name="result" property="check_status">已失效</logic:equal>	</a> </TD>
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