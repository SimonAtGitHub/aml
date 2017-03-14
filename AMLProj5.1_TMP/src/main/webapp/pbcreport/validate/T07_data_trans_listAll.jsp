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
<script language="JavaScript">
function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].start_time.value;
    _Date2 = document.forms[0].end_time.value; 
    _Date3 = document.forms[0].pbc_crt_dt_start.value;
    _Date4 = document.forms[0].pbc_crt_dt_end.value;   
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))

	        return false;	        
         else if(_Date1!=''&&_Date2!=''&&!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "交易日期开始时间不能大于结束时间！";	
         else if(_Date3!=''&&_Date4!=''&&!_compareTwoDateForString(_Date3, _Date4) )
  			errMsg += "回执日期开始时间不能大于结束时间！";					    
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
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
function _Click(url){
 document.forms[0].action=url;
        document.forms[0].submit();
    
}
</script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
	<script type="text/javascript" src="../../js/calendar.js"></script>
    <div id="main">
		<html:form action="/validate/getT07_data_trans_listAll.do" method="post" styleId="form0">
		<input type="hidden" name="validbackurl"
								value="<%=request.getContextPath()%>/pbcreport/validate/getT07_data_trans_listAll.do" />
		
		 <div class="conditions">
<div class="cond_t">
		<span> 错误回执交易
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
										交易日期：
									</td>
									<td >
										 <html:text property="start_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                         <html:text property="end_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									</td>
									<td >
										业务标识号：
									</td>
									<td>
										<html:text property="ticd" styleClass="text_white"
											size="20" require="false" datatype="safeString|limit_max" max="64" msg="请输入合法标识号|不能超过64个数字"/>
									</td>
								</tr>
											<tr >
												<tr >
									<td>
										客户号：
									</td>
									<td>
										<html:text property="csnm" styleClass="text_white"
											size="20" require="false" datatype="safeString|limit_max" max="32" msg="请输入合法的客户id|不能超过32个字符" />
									</td>
									<td  >
										回执日期：
									</td>
									<td >
										 <html:text property="pbc_crt_dt_start" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
                                         <html:text property="pbc_crt_dt_end" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									</td>
									
								</tr>
											<tr >
									<td >
										数据种类：
									</td>
									<td  >
									<html:select property="casetype">
							<html:options collection="casetype" property="label"
								labelProperty="value" />
						</html:select> (处理可疑错误回执交易时此处选择可疑)
								　　　</td>
									<td >
										
									</td>
									<td >
										
										<input type="button" name="button3" value="查 询" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/validate/getT07_data_trans_listAll.do?newsearchflag=1&fromcase=0')" />
									</td>
								</tr>
								
  </table> </div>
			<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>

			 <div class="list">
			<table cellspacing="0" cellpadding="0"  
				   border=0>
				<tr align=center class="tdhead">
					<th width="15%" nowrap>
						业务标识号
					</th>
					<th width="10%" nowrap>
						客户号
					</th>
					<th width="11%" nowrap>
						交易发生日期
					</th>
					<th width="15%" nowrap>
						交易机构
					</th>
					<th width="10%" nowrap>
						交易金额
					</th>
					<th width="10%" nowrap>
						币种
					</th>
					<th width="10%" nowrap>
						收/付
					</th>
					<th width="10%" nowrap>
						错误类型
					</th>
					<th width="10%" nowrap>
						回执时间
					</th>
				</tr>

				<logic:iterate id="tsdt" name="t07_ibh_tsdtList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_data_trans_list">
					<TR>
						<TD>
							<a href="#" onclick="_Click('<%=request.getContextPath()%>/pbcreport/validate/getValidateTransDisp.do?reportkey=<bean:write name="tsdt" property="reportkey" />&fromcase=0&ticd=<bean:write name="tsdt" property="ticd" />&trans_type=<bean:write name="tsdt" property="trans_type" />&ctif_seqno=<bean:write name="tsdt" property="ctif_seqno" />&rpdi_seqno=<bean:write name="tsdt" property="rpdi_seqno" />&crcd=<bean:write name="tsdt" property="crcd" />')">
								<bean:write name="tsdt" property="ticd" /></a>
						</TD>
						<TD>
							<bean:write name="tsdt" property="csnm" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="tstm_disp" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="finc_disp" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="crat_disp" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="crtp_disp" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="tsdr_disp" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="errors_type" />
						</TD>
						<TD>
							<bean:write name="tsdt" property="pbc_crt_dt" />
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
	</BODY>
</html>