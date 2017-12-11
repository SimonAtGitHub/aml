<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>

 <script type="text/javascript"> 
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
		_Date1 = document.forms[0].check_start_dt.value;
		_Date2 = document.forms[0].check_end_dt.value;  
		if(!_isDateSpaceComplete(_Date1, _Date2))
			errMsg += "请填写完整的起始时间范围！";
			else if(_Date1!="" && !formatDateAlert(_Date1))
				return false;       
			else if(_Date2!="" && !formatDateAlert(_Date2))
				return false;	      
			else if(!_compareTwoDateForString(_Date1, _Date2) )
				errMsg += "开始时间不能大于结束时间！";		  		
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

function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	

</script>
<script type="text/javascript">
function dosubmit2(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	
}
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/custcheck/t10_check_cust_resultlist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>客户识别</span> 
       	  <span class="buttons">
	  <a href="#" onclick="javascript:window.open('t10_check_cust_report.do?custType=resultparty','enter2','height=200, width=300,left=0,top=0,scrollbars=yes,resizable=yes')"><img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />导出调查报告</a> 
	   </span>
 	</div>
   <div class="cond_c" id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
              <td>识别日期：</td>
            <td>
            <html:text property="check_start_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
          
				
				－
				<html:text property="check_end_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
          
				
			</td>
            <td>归属机构：</td>
         	   <td>
         	   <html:text property="organkey" styleClass="text_white" size="10" onblur="_Onblur('organName')" />
				<html:text property="organName" styleClass="text_white"	size="23" readonly="true" maxlength="10" />
				<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
         	   
         	 </td>
            </tr>
            <tr>
              <td>客户号：</td>
         	  <td>
         	  	<html:text property="party_id" styleClass="text_white" />
         	  </td>
         	  <td>客户名称：</td>
         	  <td>
         	  	<html:text property="party_name" styleClass="text_white" />
         	  </td>
            </tr>
            <tr>
            <td>客户类型：</td>
         	<td>
				<html:select property="party_class_cd">
				<html:options collection="party_class_cd_map" property="label" labelProperty="value" />
				</html:select>
			</td>
         	<td>调查结论：</td>
         	<td><html:select property="check_result">
			    <html:options collection="check_result_map" property="label" labelProperty="value" />
			    </html:select>
			</td>
           </tr>
           <tr>
            <td>识别方式：</td>
         	<td>
				<html:select property="check_type">
				<html:options collection="check_type_map" property="label" labelProperty="value" />
				</html:select>
			</td>
         	<td>排序：</td>
         	   <td><html:select property="order_check">
				   	<html:options collection="order_check_map" property="label" labelProperty="value" />
				   </html:select>
				   <html:radio property="fashion" value="asc" />升序
	   			   <html:radio property="fashion" value="desc"/>降序
				   <input name="" type="button" value="查　询"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_resultlist.do?newsearchflag=1','search')"/>
				   </td>
           </tr>
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      
	  <th>客户号</th>
	  <th>客户名称</th>
	  <th>客户类型</th>
	  <th>归属机构</th>
	  <th>调查日期</th>
	  <th>调查结论</th>
      <th>结论有效期</th>
	  <th>调查人</th>
	  <th>查看详情</th>
	  <th>查看历史信息</th>
	 </tr>
    <logic:iterate id="result" name="t10_check_cust_resultlist" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_result">
    <tr>
     
       <td>
         <bean:write name="result" property="party_id" scope="page" />
       </td>
	     <td>
         <bean:write name="result" property="party_name" scope="page" />
       </td>
	     <td>
         <bean:write name="result" property="party_class_cd_display" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="organName" scope="page" />
       </td> 
       <td>
         <bean:write name="result" property="check_dt_display" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="check_result_display" scope="page" />
       </td>
        <td>
         <bean:write name="result" property="valid_dt_display" scope="page" />
       </td>
       <td>
         <bean:write name="result" property="checker" scope="page" />
       </td>
       <td><a href="#" onclick="dosubmit2('<%=request.getContextPath()%>/report/custcheck/t10_check_cust_detail.do?party_id=<bean:write name="result" property="party_id" scope="page" />&newsearchflag=1&party_class_cd=<bean:write name="result" property="party_class_cd" scope="page" />&id_flag=1');">客户详情</a></td>
       <td><a href="#" onclick="window.open('show_t10_check_cust_resulinfo.do?party_id=<bean:write name="result" property="party_id" scope="page" />','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">历史调查信息</a></td>
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