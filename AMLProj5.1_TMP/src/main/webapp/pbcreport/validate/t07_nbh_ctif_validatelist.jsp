<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

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
		<meta http-equiv=Content-Type content="text/html; charset=GBK"/>
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<script src="../../js/title.js"></script> 
		<SCRIPT LANGUAGE="JavaScript">
function _submit(type,id){
  document.forms[0].action="<%=request.getContextPath()%>/information/client/t47_party_ucmodify.do?application_pary_type=" + type + "&party_id="+id;
  document.forms[0].submit();
  
}

function do_submit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(!_compareTwoDateForString(document.forms[0].pbc_crt_dt_start.value, document.forms[0].pbc_crt_dt_end.value)) {
   document.forms[0].pbc_crt_dt_start.focus();
	 errMsg = "开始时间不能大于结束时间";		    
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
		<html:form action="/validate/t07_nbh_ctif_validate_list.do" method="post" styleId="form0">
		 <div class="conditions">
<div class="cond_t">
		<span  class="in_button" > 错误回执客户
		 
		   </span>
		    <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	   </span>
      </div>
      </div>
  <div class="cond_c" id="searchtable">
  <table   border="0" cellpadding="0" cellspacing="0">	
  <tr>
									<td>客户号：</td>
									<td>
										<html:text property="csnm" size="25" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的客户id|不能超过32个字符" />
									<td>
										客户名称：
									</td>
									<td>
										<html:text property="ctnm" size="25" require="false" datatype="safeString|limit_max" max="64" msg="请输入合法的客户id|不能超过64个字符"/>
									</td>
								</tr>
  
								<tr>
								<td>
										证件号码：
									</td>
									<td>
										<html:text property="ctid" size="25" require="false" datatype="number|limit_max" max="20" msg="请输入数字|不能超过20个数字"/>
									</td>
									<td>
										证件类型：
									</td>
									<td>
										<html:select property="citp" style="width:250px"   onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
									
								</tr>
								
								<tr>
									<td>
										数据种类：
									</td>
									<td>
										<html:select property="casetype">
							<html:options collection="casetype" property="label"
								labelProperty="value" />
						</html:select> (处理可疑错误回执客户时此处选择可疑)
									</td>
									<!-- <td>是否通过验证：</td>
									<td>		
									<html:select property="validate_ind">
										<html:option value="">--请选择--</html:option>
										<html:option value="1">是</html:option>
										<html:option value="0">否</html:option>	
									</html:select>
									</td> -->
									<td  >
										回执日期：
									</td>
									<td >
										 <html:text property="pbc_crt_dt_start" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                         <html:text property="pbc_crt_dt_end" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									
									<input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('t07_nbh_ctif_validate_list.do?newsearchflag=1')" />
									</td>
								</tr>
								<!-- <tr>
										<td  >
										回执日期：
									</td>
									<td >
										 <html:text property="pbc_crt_dt_start" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                         <html:text property="pbc_crt_dt_end" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									</td>
									<td> </td>
									<td>		
									 
									<input type="button" name="button1" value="查 询" class="in_button1"
											onclick="dosubmit('t07_nbh_ctif_validate_list.do?newsearchflag=1','search')" />
									</td>
								</tr> -->
							</table>
				</div> 
	

        	<html:errors />
  <div class="list">
  <table cellspacing="0" cellpadding="0"  
				   border=0>
								<tr>
									<th width="9%" nowrap>
										客户号
									</th>
									<th width="11%" nowrap>
										客户名称
									</th>
									<th width="15%" nowrap>
										客户证件类型
									</th>
									<th width="15%" nowrap>
										客户证件号码
									</th>
									<th width="15%" nowrap>
										回执日期
									</th>
									<th width="9%" nowrap>
										验证状态
									</th>
								</tr>
								<logic:iterate id="t07_nbh_ctif" name="t07_nbh_ctifList"
									indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbh_ctif">
									<TR>
									   <TD>
									   		<a href="<%=request.getContextPath() %>/pbcreport/validate/getValidateCustDisp.do?pbc_msg_type_cd=<bean:write name="t07_nbh_ctif" property="pbc_msg_type_cd"/>&fromcase=1&cati_seqno=<bean:write name="t07_nbh_ctif" property="cati_seqno"/>&reportkey=<bean:write name="t07_nbh_ctif" property="reportkey"/>&report_type=<bean:write name="t07_nbh_ctif" property="casetype"/>&validbackurl=<%=request.getContextPath()%>/pbcreport/validate/t07_nbh_ctif_validate_list.do?back_btn=1" >
											<bean:write name="t07_nbh_ctif" property="csnm" />
											</a>
										</TD>
										<TD>
											<bean:write name="t07_nbh_ctif" property="ctnm" />
										</TD>
										<TD>
											<bean:write name="t07_nbh_ctif" property="citp_disp" />
										</TD>
										<TD>
											<bean:write name="t07_nbh_ctif" property="ctid" />
										</TD>
								<TD>
											<bean:write name="t07_nbh_ctif" property="pbc_crt_dt" />
										</TD>
										<TD>
										<logic:equal name="t07_nbh_ctif" property="validate_ind" value="1">
											<bean:write name="t07_nbh_ctif" property="validate_ind_disp" />
											</logic:equal>
											 <logic:equal name="t07_nbh_ctif" property="validate_ind" value="0">
                            <font color="#FF0000">
                            <bean:write name="t07_nbh_ctif" property="validate_ind_disp" scope="page"/>
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
