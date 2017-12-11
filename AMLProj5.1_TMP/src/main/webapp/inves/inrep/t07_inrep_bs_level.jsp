<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="../../js/App_Select.js"></script>
<script language="JavaScript">
function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].statistic_dt_start.value;
    _Date2 = document.forms[0].statistic_dt_end.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "请填写完整的起始时间范围！";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "开始时间不能大于结束时间！";	  
 if(errMsg!=''){
     alert(errMsg);
      return false; 
  }
   errMsg = DateDiff(_Date1,_Date2,30);
   if(errMsg!=''){
      alert(errMsg);
      bool = false;
      return false;
   }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

var bool = true;
function toExcel(theUrl){
	<logic:present name="t07_inrep_bs_levelList">
    <bean:size id="len" name="t07_inrep_bs_levelList" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
    var _Date1 = document.forms[0].statistic_dt_start.value;
    var _Date2 = document.forms[0].statistic_dt_end.value;  
    if(_Date1=="" || _Date2==""){
    	alert("导出时请填写交易日期，相差时间不能超过30天！");
    	bool = false;
    	return false;
    }
   	if(!formatDateAlert(_Date1) || !formatDateAlert(_Date2)){
   		bool = false;
   		return false;
   	}
   	if(!_compareTwoDateForString(_Date1, _Date2)){
   		alert("开始时间不能大于结束时间！");
   		bool = false;
   		return false;
   	}
   	var errMsg = DateDiff(_Date1,_Date2,30);
    if(errMsg!=''){
    	alert(errMsg);
    	bool = false;
    	return false;
    }
	if(!bool || s_date != _Date1 || e_date != _Date2){
		alert("请查询！");
		return false;
	}
	document.forms[0].action=theUrl;
    document.forms[0].submit();
}
var s_date = "";
var e_date = "";
function initDate(){
  	s_date = document.forms[0].statistic_dt_start.value;
  	e_date = document.forms[0].statistic_dt_end.value;
}
</script>
	</head>
	<body onload="initDate()" class="mainbg">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="main">
			<html:form action="/t07_inrep_bs_level/t07_inrep_bs_level_list.do"
				method="post">

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>可疑程度统计表</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#" onclick="toExcel('t07_inrep_bs_level.do');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出</a>
							<!-- <input type="button" name="upload" value="导出Excel" class="input" onclick="toExcel();" /> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									报送日期：
								</td>
								<td>

									<html:text property="statistic_dt_start" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
									--
									<html:text property="statistic_dt_end" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />

								</td>
								<td>
									报送机构：
								</td>
								<td>
									<html:text property="organkey" styleClass="text_white"
										size="10" maxlength="60" />
									<html:text property="organname" styleClass="text_white"
										readonly="true" size="23" maxlength="60" />
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
										class="cond_buttons"><img
												src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span>
									</a>
									<input type="button" name="ok" value="查 询" class="in_button1"
										onclick="dosubmit('t07_inrep_bs_level_list.do?newsearchflag=1','search')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<!-- list -->
				<div class="list">
					<table border=0 cellpadding="0" cellspacing="0">
						<tr class="listrowspan">
							<th rowspan="3">
								机构
							</th>
							<th rowspan="3">
								可疑报告份数
							</th>
							<th colspan="5">
								重点可疑
							</th>
							<th colspan="5">
								重点可疑且同时报告当地人行
							</th>
							<th colspan="5">
								重点可疑且报告当地公安
							</th>
							<th colspan="5">
								重点可疑且报告当地公安和人行
							</th>

						</tr>
						<tr class="listrowspan">
							<th rowspan="2">
								份数
							</th>
							<th colspan="2">
								人民币
							</th>
							<th colspan="2">
								外币
							</th>
							<th rowspan="2">
								份数
							</th>
							<th colspan="2">
								人民币
							</th>
							<th colspan="2">
								外币
							</th>
							<th rowspan="2">
								份数
							</th>
							<th colspan="2">
								人民币
							</th>
							<th colspan="2">
								外币
							</th>
							<th rowspan="2">
								份数
							</th>
							<th colspan="2">
								人民币
							</th>
							<th colspan="2">
								外币
							</th>
						</tr>
						<tr class="listrowspan">
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
							<th>
								笔数
							</th>
							<th>
								金额
							</th>
						</tr>
						<logic:present name="t07_inrep_bs_levelList">
							<logic:iterate id="search" name="t07_inrep_bs_levelList"
								type="com.ist.aml.inves.dto.T07_INREP_BS_level">
								<tr>
									<td>
										<bean:write name="search" property="organname" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="sum_mount" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_02" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_dc_02" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_dc_02" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_fc_02" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_fc_02" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_03" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_dc_03" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_dc_03" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_fc_03" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_fc_03" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_04" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_dc_04" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_dc_04" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_fc_04" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_fc_04" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="case_05" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_dc_05" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_dc_05" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="trans_fc_05" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="amt_fc_05" scope="page" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<logic:present name="pageInfo">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
				</div>
				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>