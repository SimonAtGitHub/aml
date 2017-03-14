<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		  -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
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
    if(type=='add'){
        _Date1 = document.forms[0].create_dt_disp.value;
    	_Date2 = document.forms[0].pbc_crt_dt_disp.value;  
        if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
        if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	
	 }
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
function _Confim(url){
var errMsg="";
    if (getLength(document.forms[0].finc.value)==0) {
        errMsg = "请选择机构条件！";
       
    }
    if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
        document.forms[0].action=url;
        document.forms[0].submit();
}
function _selectAll() {
		var sForm = document.forms[0];
		var k=0;
		var transactionkeyCheckBoxS = sForm.reportkeyCheckBox;
		if(transactionkeyCheckBoxS.length == null) {
	        transactionkeyCheckBoxS = new Array(transactionkeyCheckBoxS);
	    }
		for(var i=0; i<transactionkeyCheckBoxS.length; i++) {
			if(transactionkeyCheckBoxS[i].checked){
			k=k+1;
			}
	      }
	      if(k>0){
	      for(var i=0; i<transactionkeyCheckBoxS.length; i++) {
			transactionkeyCheckBoxS[i].checked=false;
			
	      }
	      }else{
	      for(var i=0; i<transactionkeyCheckBoxS.length; i++) {
			 transactionkeyCheckBoxS[i].checked=true;
			
	      }
	      
	      }
	}
</SCRIPT>
		<style type="text/css">
<!--
.STYLE2 {color: #000000}
-->
</style>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/t07_receipt/t07_receipt_list.do" method="post">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>回执管理</span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('t07_receipt_add.do')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_upload.png" />上传</a>
						</span>
					</div>

					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="14%" height="22" align="right" bgcolor="ECF3FF">
									回执上传日期：
								</td>
								<td width="38%" bgcolor="F6F9FF">
							       <html:text property="create_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								<td align="right">
									回执类型：
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="receipt_type_cd" style="width:100">
										<html:options collection="receipt_typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr bgcolor="ECF3FF">
								<td width="14%" height="22" align="right" bgcolor="ECF3FF">
									回执生成日期：
								</td>
								<td width="38%" bgcolor="F6F9FF">
							       <html:text property="pbc_crt_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								<td width="12%" height="22" align="right" bgcolor="ECF3FF">
									排序：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:select property="ordername" style="width:100">
										<html:option value="">--请选择--</html:option>
										<html:option value="CREATE_DT">回执上传日期 </html:option>
										<html:option value="RECEIPT_TYPE_CD">回执类型 </html:option>
									</html:select>

									<html:radio property="orderby" value="" />
									升序
									<html:radio property="orderby" value="1" />
									降序
									<input type="button" name="ok" value="查询" class="in_button1"
										onClick="dosubmit('t07_receipt_list.do?newsearchflag=1','add')">
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<TR>
							<TH width="12%" nowrap>
								回执序号
							</TH>
							<TH width="15%" nowrap>
								回执类型
							</TH>
							<TH width="32%" nowrap>
								报文文件名称
							</TH>
							<TH width="18%" nowrap>
								回执上传日期
							</TH>
							<TH width="18%" nowrap>
								回执生成日期
							</TH>
							<TH width="5%" nowrap>
								下载
							</TH>
						</TR>
						<logic:present name="t07_receiptList">
							<logic:iterate id="search" name="t07_receiptList"
								type="com.ist.aml.pbcreport.dto.T07_receipt">
								<TR>
									<TD>
										<logic:equal name="search" property="receipt_type_cd"
											value="FDSC">
											<bean:write name="search" property="receiptkey" scope="page" />
										</logic:equal>
										<logic:notEqual name="search" property="receipt_type_cd"
											value="FDSC">
											<a
												href="t07_receipt_disp.do?receiptkey=<bean:write name="search" property="receiptkey"/>&receipt_type_cd=<bean:write name="search" property="receipt_search_type"/> ">
												<bean:write name="search" property="receiptkey" scope="page" />
											</a>
										</logic:notEqual>
									</TD>
									<TD>
										<bean:write name="search" property="receipt_type_cd_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="search" property="msgFile" scope="page" />
									</TD>
									<TD>
										<bean:write name="search" property="create_dt_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="search" property="pbc_crt_dt_disp"
											scope="page" />
									</TD>
									<TD>
										<a href="#"
											onClick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode(search.getReceipt_filepath())%>','','height=160, width=300,left=100,top=100');">
											下载</a>
									</TD>
								</TR>
							</logic:iterate>
						</logic:present>
					</TABLE>
				</div>
				<div class="list_page">
					<logic:present name="pageInfo">
						<table width="98%" border="0" align="center" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</logic:present>
				</div>
		</html:form>
		<!--提示块-->
		<div id=div_hint
			style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div>

	</BODY>
</HTML>
