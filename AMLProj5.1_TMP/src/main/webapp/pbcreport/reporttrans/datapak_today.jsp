<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script type='text/javascript' src='./dwr/interface/ChangeStatus.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
function fPopUpCalendarDlg(ctrlobj){
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
	}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;  
if(type=='search' || type=='add'){
    _Date1 = document.forms[0].start_time.value;
    _Date2 = document.forms[0].end_time.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	
       isSub=true;
    }else if(type=='back'){
       errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
       if(confirm('你真的要删除所选的数据包退回到报告管理吗？')){
                isSub = true;
            }
            }
    }
     if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    } else {if(errMsg!='')
            alert(errMsg);
        return false;
    }
  }
function change(key,status){
	if(status != '已回执'){
		ChangeStatus.modifyT07_packet_statusfordownload(key);
	     var tdobj=eval('document.all.'+key);
	     tdobj.innerText="已下载";
		}
    }
function _isDateCorrect(_Date)
{	
    var length = _Date.length(); 
    if(length==0)
    {
    	return true;
    }
    if(length!=10)  //判断日期的长度是否是10位
    {
        return false;
    }
    var i = 0;
    var element = '0';
    for(i=0;i<4;i++)  //判断年数是否正确
    {
    	element = _Date.charAt(i);
    	if(element<'0' || element>'9')
    	{
    		return false
    	}
    }
    element = _Date.charAt(4);//判断年月之间是否用“-”隔开
    if(element!='-')
    {
    	return false;
    }	
	var subString = _Date.subString(5,7);//判断月份是否正确
	var month = (new Integer()).parseInt(subString);
	if(month<1 || month>12)
	{
		return false;
	}
	element = _Date.charAt(7);//判断月日之间是否用“-”隔开
    if(element!='-')
    {
    	return false;
    }
	subString = _Date.subString(8,9);//判断“日”的格式是否为数字
	var day = (new Integer()).parseInt(subString);
	if(day<0 || day>31)
	{
		return false;
	}
	return true;
}
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<script type="text/javascript" src="../../js/calendar.js"></script>
	<div id="main">
		<html:form action="/reporttrans/datapak_today.do" method="post">
		
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>数据包管理</span>
						<span class="buttons"> <a href="#" id="hdd_display" class="bt_hidden"></a>  
						<a href="#"
							onClick="dosubmit('<%=request.getContextPath()%>/pbcreport/reporttrans/recreate_report.do','back')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_rereport.png" />退回报告</a> </span>
					</div>
					<html:errors />
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td  >
									数据包名称：
								</td>
								<td  >
									<html:text property="packet_filename" styleClass="text_white"
										size="40" maxlength="64" />
								</td>
								<td  >
									报送日期：
								</td>
								<td>
								   <html:text property="start_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
		                           <html:text property="end_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
							</tr>

							<tr bgcolor="ECF3FF">
								<td width="14%" height="" align="right">
									数据包类型：
								</td>
								<td width="36%" height="" bgcolor="F6F9FF">
									<html:select property="packet_type_cd">
										<html:options collection="packet_type_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="" align="right">
									报送批次：
								</td>
								<td width="36%" bgcolor="F6F9FF">
									<html:text property="batch_seq" styleClass="text_white"
										size="13" maxlength="30"/>
								</td>
							</tr>

							<tr bgcolor="ECF3FF">
								<td width="14%" height="" align="right">
									交易报告类型：
								</td>
								<td width="36%" height="" bgcolor="F6F9FF">
									<html:select property="report_type_cd">
										<html:options collection="report_type_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td width="14%" height="" align="right">
									上报状态：
								</td>
								<td width="36%" height="" bgcolor="F6F9FF">
									<html:select property="packet_status_cd">
										<html:options collection="packet_status_cdMap"
											property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>

							<tr bgcolor="ECF3FF">
								<td width="14%" height="" align="right">

								</td>
								<td width="36%" bgcolor="F6F9FF">
								</td>
								<td height="" bgcolor="" align="right">
									排序：
								</td>
								<td width="36%" height="" bgcolor="F6F9FF">
									<html:select property="packetorder">
										<html:options collection="packetorderMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:radio property="order" value="1" />
									升序
									<html:radio property="order" value="2" />
									降序
									<input type="button" name="button" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/reporttrans/datapak_today.do?newsearchflag=1','add')"></input>

								</td>

							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th height="22">
								选中
							</th>
							<th height="22">
								数据包名称
							</th>
							<th height="22">
								数据包类型
							</th>
							<th>
								交易报告类型
							</th>
							<th>
								报告机构
							</th>
							<th>
								报送截止日期
							</th>
							<th>
								当日报送批次
							</th>
							<th>
								上报状态
							</th>
							<th>
								下载
							</th>
						</tr>
						<logic:present name="t07_packetList">
							<logic:iterate id="t07_packet" name="t07_packetList" indexId="i"
								type="com.ist.aml.pbcreport.dto.T07_packet">
								<%
										java.util.HashMap map = new java.util.HashMap();
										map.put("packetkey", t07_packet.getPacketkey());
										map.put("orgpacketkey", t07_packet
												.getOrig_packet_filename());
										pageContext.setAttribute("t07_msgList", map,
												PageContext.PAGE_SCOPE);
								%>
								<%
										String key = t07_packet.getPacketkey();
										String type = t07_packet.getPacket_type_cd();
										String packet_status_cd = t07_packet.getPacket_status_cd();
										String value = key + "," + type;
								%>
								<tr align="center" bgcolor="#FFFFFF">
									<TD height=22>
										<input type="checkbox" name="packetkeys" value=<%=value %>>
									</TD>
									<TD height="22">
										<!-- <html:link name="t07_msgList"page="/reporttrans/reportinfo.do"> -->
											<bean:write name="t07_packet" property="packet_filename" scope="page" />
										<!-- </html:link> -->
									</TD>
									<td height="22">
										<bean:write name="t07_packet" property="packet_type_cd" />
									</td>
									<td>
										<bean:write name="t07_packet" property="report_type_cd" />
									</td>
									<td height="22">
										<bean:write name="t07_packet" property="reportorgankey" />
									</td>
									<td>
										<bean:write name="t07_packet" property="senddate_ch" />
									</td>
									<td>
										<bean:write name="t07_packet" property="batch_seq" />
									</td>
									<td id="<%=key%>">
										<bean:write name="t07_packet" property="packet_status_cd" />
									</td>
									<td>
										<%
														if (t07_packet.getPacket_filepath() == null
														|| "".equals(t07_packet.getPacket_filepath())) {
										%>
										暂无
										<%
										} else {
										%>
										<a href="#"
											onClick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=t07_packet.getPacket_filepath()%>','','height=160, width=300,left=100,top=100');this.style.color='red';change('<%=key%>','<%=packet_status_cd%>');">
											下载 </a>
										<%
										}
										%>
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
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
		<!-- all end -->
		</div>
	</BODY>
</HTML>

