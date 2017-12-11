<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>

<script type="text/javascript">
function dosubmit(theUrl,type){
 var errMsg = "";
    var isSub = false;
    if(type=='ret'){
       errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要退回选择的机构信用代码吗？')){
                isSub = true;
            }
        }
    }
    else if(type=='sum'){
       if(document.forms[0].organkey.value ==""){
	     errMsg+="请选择查询机构！";
         document.forms[0].organkey.focus();
       }
       else if(document.forms[0].statistic_dt_start_disp.value ==""||document.forms[0].statistic_dt_start_disp.value ==""){
         errMsg+="请选择起止日期！";
         document.forms[0].statistic_dt_start_disp.focus();
       }
       isSub = true;
    }
    else if(type=='search'){
    	_Date1 = document.forms[0].statistic_dt_start_disp.value;
    	_Date2 = document.forms[0].statistic_dt_end_disp.value;
    	if(!_isDateSpaceComplete(_Date1, _Date2)){
    		errMsg += "请填写完整的起止日期！";
    	}      
         else if(!_compareTwoDateForString(_Date1, _Date2) ){
  			errMsg += "开始日期不能大于结束日期！";
         }
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

var bool = true;
function toExcel(url){
	<logic:present name="t10_party_cretallist">
    <bean:size id="len" name="t10_party_cretallist" />
    	<logic:equal name="len" value="0">
    		alert('没有可导出的数据！');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
   document.forms[0].action=url;
   document.forms[0].submit();
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/cust_identify/t10_party_cretallist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>机构信用代码应用统计</span> 
	  <span class="buttons">
	     <a href="#" id="hdd_display" class="bt_hidden"></a>
	     <a href="#" onclick="dosubmit('t10_party_cretal_statistics.do','sum')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />全部汇总</a>
	     <a href="#" onclick="toExcel('export_t10_party_cretal.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
	     <a href="#" onclick="dosubmit('retT10_party_cretal.do?status_cd=2','ret')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />退回</a>
	     
	  </span> 
 	</div>
   <div class="cond_c" id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
            <td>报送机构：</td>
         	   <td>
         	   <html:text property="organkey" styleClass="text_white" size="10" onblur="_Onblur('organname')" />
				<html:text property="organname" styleClass="text_white"	size="23" readonly="true" maxlength="10" />
				<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
         	   
         	 </td>
         	  <td>起止日期：</td>
	             <td>
	            <html:text property="statistic_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
					－
				<html:text property="statistic_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
				<input name="" type="button" value="查　询"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/t10_party_cretallist.do?newsearchflag=1','search')"/>
				</td>
            </tr>
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
       <tr class="listrowspan">
          <th rowspan="2">选择</th>
          <th rowspan="2">统计年月</th>
		  <th rowspan="2">报送机构名称</th>
          <th rowspan="2">查询总笔数</th>
          <th colspan="4">对新客户的身份识别环节</th>
          <th colspan="5">持续客户身份识别和重新识别客户环节（含账户年检）</th>
        </tr>
		<tr class="listrowspan">
		  
          <th>查询笔数</th>
          <th>涉及客户数</th>
          <th>涉及账户数</th>
          <th>发现异常数或可疑线索数</th>
          <th>查询笔数</th>
          <th>涉及客户数</th>
          <th>涉及账户数</th>
          <th>发现异常数或可疑线索数</th>
          <th>状态</th>
        </tr>
    <logic:iterate id="party_cretal" name="t10_party_cretallist" indexId="i" type="com.ist.aml.cust_identify.dto.T10_party_cretal">
    <tr>
       <td>
		<html:multibox property="checkboxKeys">
			<bean:write name="party_cretal" property="organkey" scope="page" />,<bean:write name="party_cretal" property="statistic_dt_disp" scope="page" />
		</html:multibox>
	   </td>
	   <td>
         <bean:write name="party_cretal" property="statistic_y_m" scope="page" />
       </td>
       <td>
         <bean:write name="party_cretal" property="organname" scope="page" />
       </td>
	     <td>
         <bean:write name="party_cretal" property="querycount_s" scope="page" />
       </td>
	     <td>
         <bean:write name="party_cretal" property="querycount_n" scope="page" />
       </td>
       <td>
         <bean:write name="party_cretal" property="partycount_n" scope="page" />
       </td> 
       <td>
         <bean:write name="party_cretal" property="acctcount_n" scope="page" />
       </td> 
       <td>
         <bean:write name="party_cretal" property="kycount_n" scope="page" />
       </td>
       <td>
         <bean:write name="party_cretal" property="querycount_r" scope="page" />
       </td>
       <td>
         <bean:write name="party_cretal" property="partycount_r" scope="page" />
       </td> 
       <td>
         <bean:write name="party_cretal" property="acctcount_r" scope="page" />
       </td> 
       <td>
         <bean:write name="party_cretal" property="kycount_r" scope="page" />
       </td>
       <td>
         <bean:write name="party_cretal" property="status_cd_disp" scope="page" />
       </td>
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