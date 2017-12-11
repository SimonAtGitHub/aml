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
<script language="JavaScript" src="../../js/jquery.validator.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<SCRIPT LANGUAGE="JavaScript">
function _submit(type,id){
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_ucmodify.do?application_pary_type=" + type + "&party_id="+id;
  document.forms[0].submit();
  
}

function do_submit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function dosubmit(theUrl){
    var errMsg = "";
    var isSub = false;
  if(!_compareTwoDateForString(document.forms[0].pbc_crt_dt_start.value, document.forms[0].pbc_crt_dt_end.value)) {
   document.forms[0].pbc_crt_dt_start.focus();
	 errMsg = "开始时间不能大于结束时间！";		    
		   }
  if(errMsg=='')
  {
      document.forms[0].action=theUrl;
      if(jQuery('#form0').validateAll()){
	          document.forms[0].submit()
	         }
  }else{
      if(errMsg!='')
          alert(errMsg);
      return false;
  }
}
function _Click(party_id,party_chn_name){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function _Commit(){
    if(checkRadio(document.forms[0].party_id)<0){
           alert("请选择！");
           return false;
    } 
     opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     window.close();
}
   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}
</SCRIPT>
	</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
    <div id="main">
		<html:form action="/validate/t07_nbs_atif_validate_list.do" method="post" styleId="form0">
	   			<%
               	 	String root=request.getContextPath();
	     			
	       		%>
 <div class="conditions">
<div class="cond_t">
		<span> 错误回执帐户
          </span>
         <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	   </span>
      </div>
      </div>
 
 
			<div class="cond_c" id="searchtable">
      <table   border="0" cellpadding="0" cellspacing="0">	
								<tr >
									
								 		<td  >
										回执日期：
									</td>
									<td >
										 <html:text property="pbc_crt_dt_start" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                         <html:text property="pbc_crt_dt_end" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									    &nbsp; &nbsp;<input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('t07_nbs_atif_validate_list.do?newsearchflag=1')" />
									
									
									</td>
								 	<td>
										账号：
									</td>
									<td >
										<html:text property="ctac" size="25" require="false" datatype="number|limit_max" max="64" msg="请输入数字|不能超过64个数字" />
										&nbsp; &nbsp;<input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('t07_nbs_atif_validate_list.do?newsearchflag=1')" />
									</td>
									
								</tr>
							<!-- 	<tr >
									<td  >
										回执日期：
									</td>
									<td >
										 <html:text property="pbc_crt_dt_start" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                         <html:text property="pbc_crt_dt_end" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									</td>
									<td > </td>
									<td class="in_button">
								 	
									<input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('t07_nbs_atif_validate_list.do?newsearchflag=1','search')" />
									</td>
								</tr> -->
							</table>
					</div>
	
  <table width="100" border="0" cellspacing="0" cellpadding="0">
     <tr><td height="8"></td></tr>
  </table>
        	<html:errors />
			
			 <div class="list">
			<table cellspacing="0" cellpadding="0"  
				   border=0>
				<tr align=center class="tdhead">
					<th  nowrap>
						账号
					</th>
					<th  nowrap>
						账号类型
					</th>
					<th  nowrap>
						回执日期
					</th>
					<th  nowrap>
						验证状态
					</th>
				</tr>
				<logic:iterate id="t07_nbs_atif" name="t07_nbs_atifList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_nbs_atif">
					<TR align="center" bgcolor="#FFFFFF">
						<TD>
						<a href="<%=request.getContextPath() %>/pbcreport/validate/getValidateAcctDisp.do?fromcase=1&atif_seqno=<bean:write name="t07_nbs_atif" property="atif_seqno"/>&ctif_seqno=<bean:write name="t07_nbs_atif" property="ctif_seqno"/>&reportkey=<bean:write name="t07_nbs_atif" property="reportkey"/>&report_type=2&pbc_msg_type_cd=&validbackurl=<%=request.getContextPath()%>/pbcreport/validate/t07_nbs_atif_validate_list.do?back_btn=1">
						<bean:write name="t07_nbs_atif" property="ctac" />
						</a>
						</TD>
						<TD><bean:write name="t07_nbs_atif" property="catp_disp" /></TD>
						<TD><bean:write name="t07_nbs_atif" property="pbc_crt_dt" /></TD>
						<TD>
						<logic:equal name="t07_nbs_atif" property="validate_ind" value="1">
							<bean:write name="t07_nbs_atif" property="validate_ind_disp" />
							</logic:equal>
							 <logic:equal name="t07_nbs_atif" property="validate_ind" value="0">
                            <font color="#FF0000">
                            <bean:write name="t07_nbs_atif" property="validate_ind_disp" scope="page"/>
                               </font>
                          </logic:equal>
                          </TD>
					</TR>
				</logic:iterate>
			</table>
			</div>
				<div class="list_page">
   <bean:write name="pageInfo" scope="request" filter="false"/>
</div>
		</html:form>
		<script>
			jQuery('#form0').checkFormSearch();
		</script>
		<!--提示块--> 
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
		
	</BODY>
</HTML>
