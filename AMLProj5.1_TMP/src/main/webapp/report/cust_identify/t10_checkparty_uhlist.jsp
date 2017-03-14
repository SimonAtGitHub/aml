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
     if(type=='view'){
        isSub=true;
     }
	 if(type=='search'){
     check_dt_s = document.forms[0].check_dt_start_disp.value;
     check_dt_e = document.forms[0].check_dt_end_disp.value;
     valid_dt_s = document.forms[0].valid_dt_start_disp.value;
     valid_dt_e = document.forms[0].valid_dt_end_disp.value;
	    if(!_isDateSpaceComplete(check_dt_s, check_dt_e)){
	        errMsg += "请填写完整的识别日期！";
	    }
	    else if(!_isDateSpaceComplete(valid_dt_s, valid_dt_e)){
	        errMsg += "请填写完整的结论有效期！";
	    }
	    else if(!_compareTwoDateForString(check_dt_s, check_dt_e)||!_compareTwoDateForString(valid_dt_s, valid_dt_e)){
	  		errMsg += "开始时间不能大于结束时间！";	
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
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/cust_identify/t10_checkparty_uhlist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>已识别客户</span> 
	  <span class="buttons"><a href="#" id="hdd_display" class="bt_hidden"></a>&nbsp;</span> 
 	</div>
   <div class="cond_c" id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >
            <tr>
	            <td>识别日期：</td>
	             <td>
	            <html:text property="check_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
					－
				<html:text property="check_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
				</td>
				<td>结论有效期：</td>
	             <td>
	            <html:text property="valid_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
					－
				<html:text property="valid_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
				</td>
            </tr>       
            <tr>
            <td>
				客户号：
			</td>
			<td>
				<html:text property="party_id" styleClass="text_white"
					size="10" onblur="_Onblur('party_chn_name')" maxlength="32"/>
				<html:text property="party_chn_name" styleClass="text_white"
					size="23" readonly="true" />
				 	<a href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			
			</td>
            <td>归属机构：</td>
         	   <td>
         	   <html:text property="organkey" styleClass="text_white" size="10" maxlength="16" onblur="_Onblur('organname')" />
				<html:text property="organname" styleClass="text_white"	size="23" readonly="true" maxlength="10" />
				<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
				
         	   
         	 </td>
            </tr>
            
            <tr>
            <td>客户类型：</td>
         	<td>
				<bean:define id="party_class_cd_str" name="party_class_cd_str"></bean:define><%=party_class_cd_str %>
				
			</td>
			<td>识别类型：</td>
         	<td>
				<html:select property="check_type">
				<html:options collection="cust_checktypeMap" property="label" labelProperty="value" />
				</html:select>
				<input name="" type="button" value="查　询"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_uhlist.do?newsearchflag=1','search')"/>
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
	  <th>识别类型</th>
	  <th>识别日期</th>
	  <th>调查结论</th>
      <th>结论有效期</th>
      <th>调查人</th>
      <th>查看详情</th>
	 </tr>
    <logic:iterate id="checkparty" name="t10_checkparty_uhlist" indexId="i" type="com.ist.aml.cust_identify.dto.T10_checkparty">
       <%
		String party_id = checkparty.getParty_id();
        if(party_id.contains("#")){
        	party_id = party_id.replace("#","%23");
        }
	%>
    <tr>
     
       <td>
         <bean:write name="checkparty" property="party_id" scope="page" />
       </td>
	     <td>
         <bean:write name="checkparty" property="party_chn_name" scope="page" />
       </td>
	     <td>
         <bean:write name="checkparty" property="party_class_cd_disp" scope="page" />
       </td>
        <td>
         <bean:write name="checkparty" property="organname" scope="page" />
        </td>
        <td>
         <bean:write name="checkparty" property="check_type_disp" scope="page" />
        </td>
       <td>
         <bean:write name="checkparty" property="check_dt_disp" scope="page" />
       </td>
       <td>
         <bean:write name="checkparty" property="check_result" scope="page" />
       </td>
       <td>
         <bean:write name="checkparty" property="valid_dt_disp" scope="page" />
       </td>
       <td>
         <bean:write name="checkparty" property="checker" scope="page" />
       </td>
       <td>
       <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_riskRateMain.do?ischecked=already&party_id=<%=party_id %>&check_type=1&url=t10_checkparty_uhlist.do&party_class_cd=<bean:write name="checkparty" property="party_class_cd" scope="page" />','view');"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" title="相关信息"/></a>
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