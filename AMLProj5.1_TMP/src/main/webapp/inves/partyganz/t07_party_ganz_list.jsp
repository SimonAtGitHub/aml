<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script type="text/javascript" src="../../js/title.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>

<script type="text/javascript">

function dosubmit(theUrl,type){
    var isSub = false;
  	if(type=='add'){
       isSub=true;
    }else if(type=='search'){
       isSub=checkDate();
    }else if(type=='view'){
    	isSub = true;
    }
    if(isSub){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        return false;
    }
}
function checkDate(){
	var create_disp_val = document.forms[0].create_date_disp.value;
	var infact_disp_val = document.forms[0].infact_date_disp.value;
	if((""!=create_disp_val&&""!=infact_disp_val)&&!_compareTwoDateForString(create_disp_val,infact_disp_val)){
		alert("开始时间不能大于结束时间！");
		return false;
	}
	return true;
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/partyganz/t07_party_ganz_list.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>跟踪客户查询</span>
	  <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>&nbsp;
	  <!-- 
	  <a href="#" onclick="dosubmit('t07_party_ganz_add.do','add')"><img src="../../images/blue/b_add.png" />增加</a>
	   -->
 	  </span>
 	</div>
   <div class="cond_c" id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
            	<td>
            		跟踪编号：
            	</td>
         		<td>
					<html:text property="genz_no" styleClass="text_white" size="10" maxlength="32"/>
				</td>
            	<td>
					客户：
				</td>
				<td>
					<html:text property="party_id" styleClass="text_white"
						size="10" onblur="_Onblur('party_chn_name')" maxlength="32"/>
					<html:text property="party_chn_name" styleClass="text_white"
						size="23" readonly="true" />
				 		<a href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />定位</span></a>			
				</td>				
            </tr>
            
            <tr>
            <td>
            	跟踪起止日期：
            </td>
         	<td>
				<html:text property="create_date_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />
				--
				<html:text property="infact_date_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />
			</td>
         	<td>
         		状态：
         	</td>
         	<td>
         		<html:select property="status_cd" style="width:100">
					<html:options collection="statusMap" property="label"labelProperty="value" />
				</html:select>
         	    <input name="" type="button" value="查　询"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/inves/partyganz/t07_party_ganz_list.do?newsearchflag=1','search')"/>
			</td>
           </tr>
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      <th>跟踪客户编号</th>
	  <th>客户号</th>
	  <th>客户名称</th>
	  <th>证件类型</th>
	  <th>证件号</th>
	  <th>创建日期</th>
	  <th>失效日期</th>
      <th>状态</th>
	 </tr>
    <logic:iterate id="t07_party_ganz" name="t07_party_ganzlist" indexId="i" type="com.ist.aml.inves.dto.T07_party_ganz">
    <tr>
       <td>
         <bean:write name="t07_party_ganz" property="genz_no" scope="page" />
       </td>
       <td>
       	<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/rule/t27_alert/t27_alert_listByGenzNo.do?newsearchflag=1&selectGenzNo=<bean:write name="t07_party_ganz" property="genz_no"/>','view')">
											<bean:write name="t07_party_ganz" property="party_id" scope="page" /></a>
         
       </td>
	   <td>
         <bean:write name="t07_party_ganz" property="party_chn_name" scope="page" />
       </td>
       <td>
         <bean:write name="t07_party_ganz" property="card_type_disp" scope="page" />
       </td>
       <td>
         <bean:write name="t07_party_ganz" property="card_no" scope="page" />
       </td>
       <td>
       	 <bean:write name="t07_party_ganz" property="create_date_disp" scope="page" />
       </td>
       <td>
       	 <bean:write name="t07_party_ganz" property="infact_date_disp" scope="page" />
       </td>
       <td>
       	 <bean:write name="t07_party_ganz" property="status_cd_disp" scope="page" />
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