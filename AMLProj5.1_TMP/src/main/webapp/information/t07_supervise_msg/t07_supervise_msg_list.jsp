<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}  
    function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
       _Date1 = document.forms[0].start_dt.value;
    	_Date2 = document.forms[0].end_dt.value;  
    if(type=='search'){
        if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;
	     else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	
  		  isSub = true;	
	 }    
      if(type=='del'){
          errMsg = CheckBoxMustChecked(document.forms[0]);
	        if(errMsg==''){
	            if(confirm('你真的要删除吗？')){
	                isSub = true;
	            }
	        }
    }else if(type=='add'){
       isSub=true;
    }else if(type=='report'){
       isSub=true;
    }
    if(errMsg==''&&isSub){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
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
 function  _Onclick(theUrl){

        document.forms[0].action=theUrl;
        document.forms[0].submit();
 }
 
</script>
	</head>
<body class="mainbg">
<html:form action="/t07_supervise_msg/t07_supervise_msg_list.do" method="post">
<input type="hidden" name="backurl" value="<bean:write name="backurl"/>"/>
<input type="hidden" name="msg_mode" value="<bean:write name="msg_mode"/>"/>
<html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>督办信息列表</span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
	   <logic:present name="msg_mode">
	    <logic:equal value="1" name="msg_mode">
	  <a href="#" onclick="dosubmit('t07_supervise_msg_add.do?msg_mode=1','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />发起督办</a>
	   <a href="#" onclick="dosubmit('t07_supervise_msg_delete_do.do?newsearchflag=1','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	    <a href="#" onclick="dosubmit('t07_supervise_msg_list_export.do','report')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />督办导出</a>
	 </logic:equal>
	 </logic:present>
	  </span>
	</div>
 <!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>督办类型:</td>
         <td><html:select property="msg_type_s">
				<html:options collection="msg_typeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
        <td>数据日期：</td>
          <td >
           <html:text property="start_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
               ---
           <html:text property="end_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
        
        
          </td>
        </tr>
	    <tr>
			<td>接收机构：</td>
			<td> 
			<html:text property="receipt_org_s" size="9" maxlength="50"/>
			<html:text property="msg_org_name_s"  readonly="true"/>
		     <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=receipt_org_s&input_name_disp=msg_org_name_s','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
		    </td>

		    <td>督办标题：</td>
		    <td>
		     <html:text property="msg_name_s" size="40" maxlength="80"/>

	         </td>
			</tr>
			 <tr>
	       <td>数据类型:</td>
         <td>
         <html:select property="case_type_s1" >
				<html:options collection="casetypeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
		   <td>客户类型：</td>
          <td >
           <html:select property="party_class_cd_s" >
				<html:options collection="clienttypeMap" property="label"
			      labelProperty="value" />
				</html:select>
				
				
		    <input type="button" name="ok" class="in_button1" value="查 询" onclick="dosubmit('t07_supervise_msg_list.do?newsearchflag=1','search')" />
				
          </td>
        </tr>
								
	  </table>
	</div>
  </div>	
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  <logic:equal name="msg_mode" value="1">
	  	<th>选择</th>
	  	</logic:equal>
		<th>督办标题</th>
		<th>发起机构</th>
		<th>接收机构</th>
		<th>督办类型</th>
		<th>数据类型</th>
		<th>客户类型</th>
		<th>状态</th>
		<th>督办时间</th>
	  </tr> 
  <logic:iterate id="t07_supervise_msg" indexId="i" name="t07_supervise_msgList" type="com.ist.aml.information.dto.T07_Supervise_msg">

    <tr>
        
        <logic:equal name="msg_mode" value="1">
        <td >
			<html:multibox property="msg_ids">
			  <bean:write name="t07_supervise_msg" property="msg_id" />
			</html:multibox>
			</td>
			</logic:equal>
		
      <td> 
        <logic:equal name="msg_mode" value="1">
      <a href="#" onclick="_Onclick('t07_supervise_msg_detail.do?msg_mode=<bean:write name="msg_mode"/>&msg_id=<bean:write name="t07_supervise_msg" property="msg_id" />')">
      <bean:write name="t07_supervise_msg" property="msg_name"/>
      </a>
      </logic:equal>
        <logic:equal name="msg_mode" value="2">
      <a href="#" onclick="_Onclick('t07_supervise_msg_disp.do?msg_mode=<bean:write name="msg_mode"/>&msg_id=<bean:write name="t07_supervise_msg" property="msg_id" />')">
      <bean:write name="t07_supervise_msg" property="msg_name"/>
      </a>
      </logic:equal>
     </td>
     <td><bean:write name="t07_supervise_msg" property="msg_org_name"/></td>  
      <td><bean:write name="t07_supervise_msg" property="receipt_org"/></td>  
      <td><bean:write name="t07_supervise_msg" property="msg_type"/></td>
      <td><bean:write name="t07_supervise_msg" property="case_type_s"/></td>
     <td><bean:write name="t07_supervise_msg" property="party_class_cd_s"/></td> 
       <td><bean:write name="t07_supervise_msg" property="msg_state_disp"/></td>
       <td><bean:write name="t07_supervise_msg" property="create_dt"/></td>  
    </tr>
  </logic:iterate>
  </table>
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
<!-- all end -->   
</div>
		</html:form>
</body>
</html>
