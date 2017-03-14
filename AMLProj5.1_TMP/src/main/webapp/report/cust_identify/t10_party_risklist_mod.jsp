<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>


<script type="text/javascript">

function dosubmit(theUrl,type){

  var errMsg = "";
  var isSub = false;
  if(type=='del')
  {
  	errMsg = CheckBoxMustChecked(document.forms[0]);
    if(errMsg=='')
    {
       if(confirm('确定要删除选择的风险事件吗？'))
       {
           isSub = true;
       }
    }
  }
  if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }
  if(type=='add')
  	isSub = true;
  if(type=='search'){
     risk_create_s = document.forms[0].risk_create_dt_start_disp.value;
     risk_create_e = document.forms[0].risk_create_dt_end_disp.value;
     risk_validite_s = document.forms[0].risk_validite_dt_start_disp.value;
     risk_validite_e = document.forms[0].risk_validite_dt_end_disp.value;
    if(!_isDateSpaceComplete(risk_create_s, risk_create_e)){
        errMsg += "请填写完整的创建日期！";
    }
    else if(!_isDateSpaceComplete(risk_validite_s, risk_validite_e)){
        errMsg += "请填写完整的失效日期！";
    }
    else if(!_compareTwoDateForString(risk_create_s, risk_create_e)||!_compareTwoDateForString(risk_validite_s, risk_validite_e)){
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
function _Open(url){
 
  window.open(url,'','height=200, width=500,left=100,top=100,scrollbars=yes,resizable=yes');
 // window.open(url);
      
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
</script>
</head>
<body id="iframecontent" class="mainbg">
<html:form action="/cust_identify/t10_party_risklist_mod.do" method="post">
<div class="conditions">
	<div class="cond_t">
	  <span>配置管理 - 风险事件管理</span>
	  <span class="buttons">
	  <%
	  	String id = (String)request.getAttribute("party_id");
	  	if(id.contains("#")){
      		id = id.replace("#","%23");
      	}
	  %>
	  <a href="#" onclick="dosubmit('t10_party_risk_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a>
	  <a href="#" onclick="dosubmit('t10_party_risk_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
	  <a href="#" onclick="dosubmit('t10_party_risk_del.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
	  </span>
	</div>
	<html:errors />
	<div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
   		<tr> 
        	<td>创建日期：</td>
            <td>
              <html:text property="risk_create_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
				－
			  <html:text property="risk_create_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
			
		    </td>
		    <td>失效日期：</td>
            <td>
              <html:text property="risk_validite_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
				－
			  <html:text property="risk_validite_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
		    </td>
		 </tr>
		 <tr>
		    <td>
				客户号：
			</td>
			<td>
				<html:text property="party_id" styleClass="text_white"
					size="10" maxlength="64" onchange="_Onblur('party_chn_name')"/>
					<html:text property="party_chn_name" styleClass="text_white"
                    size="23" readonly="true" />
					 <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>
			</td>
		 	<td>风险类型：</td>
		 	<td> <html:select property="risk_type">
				     <html:options collection="risk_typeMap" property="label" labelProperty="value" />
				 </html:select>
				 <input type="button" name=Button3  class="in_button1" value="查 询" styleClass="input"   onClick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/t10_party_risklist_mod.do?newsearchflag=1','search')" >
		    </td>
         </tr>
    </table>
    </div>
     </div>
    <div class="list">
    <table>
    <tr>
      <th>选择</th>
      <th>事件编号</th>
      <th>客户号</th>
      <th>客户名称</th>
	  <th>事件简述</th>
	  <th>风险类型</th>
	  <th>创建时间</th>
	  <th>创建人</th>
	  <th>失效时间</th>
    </tr>
    <logic:iterate id="party_risk" name="t10_party_riskList" indexId="i" type="com.ist.aml.cust_identify.dto.T10_checkparty_fun">
    <tr>
       <td>
		<html:multibox property="selectedPartyrisk_No" ><bean:write name="party_risk" property="partyrisk_no" /></html:multibox>
	   </td>
       <td><a href="#" onclick="window.open('t10_party_riskdisp.do?partyrisk_no=<bean:write name="party_risk" property="partyrisk_no" scope="page"/>','', 'height=400, width=500,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="party_risk" property="partyrisk_no" scope="page"/></a></td>
      <td><bean:write name="party_risk" property="party_id" scope="page"/></td>
      <td><bean:write name="party_risk" property="party_chn_name" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_des" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_type" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_create_dt_disp" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_create_user" scope="page"/></td>
       <td><bean:write name="party_risk" property="risk_validite_dt_disp" scope="page"/></td>
    </tr>
	</logic:iterate>
    </table>
      </div>
   <div class="list_page">
		<table width="98%" border="0" align="center" cellpadding="3"
			cellspacing="3">
			<tr>
				<td align="center">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</td>
			</tr>
		</table>
    </div>
</html:form>
</body>
</html>