<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function doback(){
	var linktype = '<bean:write name="linktype" scope="request"/>';
	if(linktype=="genz_no"){
		document.forms[0].action="t27_alert_listByGenzNo.do";
   		document.forms[0].submit();
	}else if(linktype=="rule_alert"){
		document.forms[0].action="t27_alert_listByRulekey.do";
   		document.forms[0].submit();
	}else if(linktype=="search_allAlert"){
		document.forms[0].action="t27_alert_all_list.do";
   		document.forms[0].submit();
	}
}
function _submit(type,id){
   document.forms[0].action="t47_risk_client_modify.do?party_id="+id+"&party_class_cd="+type;
   document.forms[0].submit();
}

function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}

</script>
	</head>
	<body>
		<html:form method="post" action="/t27_alert/t27_alert_disp.do">
			<input type="hidden" name="alertkey" value="<bean:write name="alertkey"/>" />
			<html:errors />
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
						<span> 预警详情 </span>
						<span class="buttons"> 
							<a href="#" onClick="doback()"><img src="../../images/blue/b_back.png" />返 回</a>
						</span>
			    </div>
				<div class="cond_c3">
				  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
				    <tr>
			        <td>
					<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />基本信息</strong></span>
					</td>
					</tr>
				  </table>
				 </div>  

				<!-- table content -->
				<div class="cond_c2">
					<table border="0" cellspacing="0" cellpadding="0" >
					
					<tr>
						<td>
							预警编号：
						</td>
						<td>
							<bean:write name="t27_alert" property="alertkey" />
						</td>
						<td>
							预警对象：
						</td>
						<td>
							<bean:write name="t27_alert" property="objname" />
						</td>
					</tr>
					<tr>
						<td>
							币种：
						</td>
						<td>
							<bean:write name="t27_alert" property="curr_cd_disp" />
						</td>
						<td>
							预警日期： 
						</td>
						<td>
							<bean:write name="t27_alert" property="alert_dt_disp" />
						</td>
					</tr>
					</table>
				</div>
				</div>
			<% 
			   String root = request.getContextPath();
			   String alertkey = (String)request.getAttribute("alertkey");
			   String root1 = root +"/avp/template/tpla_chk_t07_case_list.do?newsearchflag=1&new_qry_flag=1&jump_rslt_flag=1&tplakey=2478&p_2414="+alertkey;
			   String root2 = root +"/avp/template/tpla_chk_t07_case_list.do?newsearchflag=1&new_qry_flag=1&jump_rslt_flag=1&tplakey=2479&p_2416="+alertkey;
			   String root3 = root +"/avp/template/tpla_chk_t07_case_list.do?newsearchflag=1&new_qry_flag=1&jump_rslt_flag=1&tplakey=2480&p_2418="+alertkey;
			%>	
			<div id="tab_menu">
			  <a target="trans" href=<%=root1 %> class="bglink">客户信息</a>
			  <a target="trans" href=<%=root2 %> class="">账户信息</a>
			  <a target="trans" href=<%=root3 %> class="">交易信息</a>
			</div>
			<iframe src=<%=root1 %> width="100%" height="300" scrolling="auto" frameborder="0" name="trans" id="trans"></iframe>
		</html:form>
	</body>
</html>
