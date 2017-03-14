<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		
		<script language="JavaScript">

function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
	}
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
 function dosubmit(theUrl,type){
        var errMsg = "";
        if(type=="search"){
        	if(!_isDateSpaceComplete(document.forms[0].start_time.value, document.forms[0].end_time.value)){
           		errMsg = "请填写完整的起始日期范围！";
           	}
       	   else if(!_compareTwoDateForString(document.forms[0].start_time.value, document.forms[0].end_time.value)) {
       			 errMsg = "开始时间不能大于结束时间";	
       		}
         }
        if(type=="export"){
			var isExport=<%=request.getAttribute("isExport")%>
			if(isExport!=null && isExport!=undefined &&isExport=="1"){
				
			}else{
				errMsg = "无数据";	
				}
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

</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/reportsum/t07_inrep_bh_cny_sta_list.do" method="post">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>人民币大额统计表(筛选)</span>
						<span class="buttons"> <a href="#" id="hdd_display" class="bt_hidden"></a> 
						<a onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#" onclick="javascript:dosubmit('<%=request.getContextPath()%>/inves/reportsum/exportT07_inrep_bh_cny_sta.do','export')">
								<img src="../../images/blue/b_excel.png" />导出Excel</a>
						</span>
					</div>
					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0" id="searchtable">
							<tr>
								<td>
									筛选日期：
								</td>
								<td>
								<html:text property="start_time" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									-
									<html:text property="end_time" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
								</td>
								<td>
								交易机构号：
								</td>
								<td>
									<html:text property="organkey" styleClass="text_white"
										size="10" onblur="_Onblur('organname')" maxlength="50"/>
									<html:text property="organname" styleClass="text_white"
										size="23" readonly="true" maxlength="10" />
									 	<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
									<input type="button" name="button3" value="查 询"
										class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/inves/reportsum/t07_inrep_bh_cny_sta_list.do?newsearchflag=1','search')" />
								</td>
							</tr>
							
						</table>
					</div>
				</div>
				
							<html:errors />
							<font color="#FF0000"><%=StringUtils.nullToStr((String) request
								.getAttribute("message"))%></font>
						
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0">
					<tr class="listrowspan">
						<th rowspan="3">机构</th>
						<th colspan="8">单位客户</th>
						<th colspan="8">个人客户</th>
					</tr>
					
					<tr>
						<th colspan="2">大额01</th>
						<th colspan="2">大额02</th>
						<th colspan="2">大额03</th>
						<th colspan="2">大额04</th>
						<th colspan="2">大额01</th>
						<th colspan="2">大额02</th>
						<th colspan="2">大额03</th>
						<th colspan="2">大额04</th>
					</tr>
					<tr>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
						<th>笔数</th>
						<th>金额</th>
					</tr>
						<logic:iterate id="t07_inrep_bh_cny_sta" name="inrep_list"
							indexId="i" type="com.ist.aml.inves.dto.T07_INREP_BH_cny_sta">
							<tr>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="organname" /></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_01_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_01_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_02_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_02_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_03_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_03_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_04_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_04_c"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_01_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_01_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_02_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_02_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_03_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_03_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="trans_04_i"/></td>
								<td><bean:write name="t07_inrep_bh_cny_sta" property="amt_04_i"/></td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			</html:form>
		</div>
	</body>
</html>
