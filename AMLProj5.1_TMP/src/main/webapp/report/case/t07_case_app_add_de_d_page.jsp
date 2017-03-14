<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />		
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>	
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

function dosubmit(theUrl,type){
    var errMsg = "";
    if(type=='new'){
        errMsg = CheckBoxMustChecked(document.forms[0]);   
    } 

    if(errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
	var errMsg="";
	var val=0;
	
	if(getLength(document.forms[0].start_dt.value)>0||getLength(document.forms[0].end_dt.value)>0){
			val+=1 ;
	}else  if (getLength(document.forms[0].crcd.value)>0) {
        	val+=1 ; 
    }else  if (getLength(document.forms[0].ticd.value)>0) {
       		val+=1 ;  
    }else   if (getLength(document.forms[0].party_id.value)>0) {
       		val+=1 ;  
    }
	var organkey=parent.document.getElementsByName('ficd')[0];
	
	if(organkey.value=='')
	   {
	   		errMsg+="请先定位机构!";
	}else if(val==0)
 	{
 		errMsg="请至少输入一个查询条件！";
 	}else  if(getLength(document.forms[0].start_dt.value)>0&&getLength(document.forms[0].end_dt.value)>0){
		   		if(!_compareTwoDateForString(document.forms[0].start_dt.value, document.forms[0].end_dt.value)) {
		           	document.forms[0].start_dt.focus();
			        errMsg += "大额交易发生日期开始时间不能大于结束时间";		    
				}
   	}
    if(errMsg!=''){
        alert(errMsg);
        return false; 
       }else
       {
       url+='&organkey='+organkey.value;
        document.forms[0].action=url;
        document.forms[0].submit();
       }
}
function selectAll(obj){
    if(document.forms[0].reportkeyCheckBox!=null){
    if(obj.value=="全  选"){
        obj.value="全不选"
		if(document.forms[0].reportkeyCheckBox.value!=""){
                document.forms[0].reportkeyCheckBox.checked=true;
    	}
        if(document.forms[0].reportkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].reportkeyCheckBox.length; i++ ){
             document.forms[0].reportkeyCheckBox[i].checked=true;
        }
    }
    else{
	    obj.value="全  选"
	    if(document.forms[0].reportkeyCheckBox.value!="")
                document.forms[0].reportkeyCheckBox.checked=false;
        if(document.forms[0].reportkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].reportkeyCheckBox.length; i++ )
	             document.forms[0].reportkeyCheckBox[i].checked=false;
    }
  }
    else{
        alert("对不起！没有可选的项.");
    }
}
function _Open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
</SCRIPT>
<style type="text/css">
<!--
.STYLE2 {color: #000000}
-->
</style>
</head>
<body leftmargin="0" topmargin="0">
<div id="iframecontent">
<script type="text/javascript" src="../../js/calendar.js"></script>
<html:form action="/case/t07_case_app_add_de_d_page.do" method="post" >

		<div class="conditions">
				<div class="cond_t">
				  <span>选择已上报的交易 </span>
				
				</div>

		<div class="cond_c">

	<table  border="0" cellpadding="0" cellspacing="0">
    

             <tr>
               <td >大额交易发生日期：</td>
               <td >          
               	<html:text property="start_dt" size="12" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg"/>--
				<html:text property="end_dt" size="12" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg"/>
            </td>
                 <td >大额交易特征：</td>
                 <td ><html:select property="crcd">
                 <html:options collection="pbcruleMap"  property="label" labelProperty="value" />
                </html:select>  
                </td>
            </tr>
          
             <tr>
             
               <td >客户号：</td>
               <td >
               
               <html:text property="party_id"  size="18" />
               <html:hidden property="party_chn_name" />
					<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />定位</span></a>
						
                 </td>
                 <td  >业务标识号：</td>
                 <td ><html:text property="ticd" size="20" maxlength="60"/> </td>
              
              
             </tr>
               <tr>
               <td>币种：</td>
               <td><html:select property="curr_cd" >
              <html:options collection="curr_cdMap"  property="label" labelProperty="value" />
              </html:select>   </td>
               <td>客户类型：</td>
               <td><html:select property="party_class_cd" >
              <html:options collection="party_class_cdMap"  property="label" labelProperty="value" />
              </html:select>  
            </tr>
             <tr >
             
               <td >排序：</td>
               <td><html:select property="ordername" >
             	 	<html:options collection="orderMap"  property="label" labelProperty="value" />
             	 </html:select> 
             	 <html:radio property="ordertype" value="" /> 升序
             	<html:radio property="ordertype" value="1"/>降序</td>
             	<td></td>
             	<td >
              <input type="button" name="ok" value="查 询" class="in_button1"  onClick="_Confim('<%=request.getContextPath()%>/report/case/t07_case_app_add_de_d_page.do?newsearchflag=1')" />
              </td>
             </tr>
         </table>
</div>
</div>

	<div class="list">
   <table  border="0" cellpadding="0" cellspacing="0">
  <tr>
      
      <th>选择</th>
      <th>业务标识号</th>
      <th>客户号</th>
      <th>大额交易特征</th>
      <th>交易日期</th>
   </tr>
    <logic:present name="t07_nbh_tsdtList">
    <logic:iterate id="search" name="t07_nbh_tsdtList" type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
			<tr>
			
				<td><html:multibox property="reportkeyCheckBox" value="<%=search.getReportkey()+search.getCati_seqno()+search.getCrcd()+search.getTsdt_seqno() %>">
					<bean:write name="search" property="reportkey" />
				</html:multibox>
				</td>
			<%--<td ><a href="#" onclick="_Open('../../pbcreport/report/nbh_tsdt_detail.do?reportkey=<bean:write name='search' property='reportkey' />&cati_seqno=<bean:write name='search' property='cati_seqno' />&Crcd=<bean:write name='search' property='crcd' />&tsdt_seqno=<bean:write name='search' property='tsdt_seqno' />')" > 
	         
	         --%><td><a href="#" onclick="_Open('<%=request.getContextPath() %>/pbcreport/report/ibh_tsdt_detaillist.do?closeflag=1&&pbc_msg_type_cd=N&fromcase=2&reportkey=<bean:write name='search' property='reportkey' />&cati_seqno=<bean:write name='search' property='cati_seqno' />&Crcd=<bean:write name='search' property='crcd' />&tsdt_seqno=<bean:write name='search' property='tsdt_seqno' />')" >
	  <bean:write name="search" property="ticd" scope="page"/></a>
	  </td>	  
	  <td><bean:write name="search" property="party_id" scope="page"/></td>
	  <td><bean:write name="search" property="crcd_disp" scope="page"/></td>
	  <td><bean:write name="search" property="tstm_disp" scope="page"/></td>
     </tr>  
</logic:iterate>
</logic:present>   
	    
</table>
</div>
<div class="list_page">
   <logic:present name="pageInfo">
   
      	<bean:write name="pageInfo" scope="request" filter="false"/>

    </logic:present>
   </div>
   
 <!--   <table>   
   <tr><td>  
        <html:button property="button4" value="创建"  onclick="dosubmit('addT07_caseDeleteDo.do','new')"/>
           
        <html:button property="button4" value="全部创建"  onclick="dosubmit('addT07_caseDeleteDo.do?type=all','all')"/>
      </td>
    </tr>
	
  </table> -->
 </html:form>
 <!--提示块--> 
 </div>
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
 
</BODY>
</HTML>