<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.aml.cust_identify.dto.T10_newClientCheck" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<meta http-equiv=Content-Type content="text/html; charset=gb2312"/>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script language="JavaScript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
function dosubmit(theUrl,type){
	document.forms[0].action=theUrl;
	document.forms[0].submit();
}
function w_check(){
	var w_val=document.forms[0].addwmenu_flag.value;
	if(w_val == 0){
		document.getElementById("w_reason").value = "";
		document.getElementById("w_rule_type").value = "";
		document.getElementById("w_flag2").style.display='none';
	}
	if(w_val == 1){
		if(document.forms[0].addbmenu_flag.value != 1){
			b_check();
		}else{
			document.forms[0].addbmenu_flag.value = 0;
			b_check();
		}
		document.getElementById("w_flag2").style.display='';
		document.getElementById("b_flag2").style.display='none';
	}
}
function b_check(){
	var b_val=document.forms[0].addbmenu_flag.value;
	
	if(b_val == 0){
		document.getElementById("b_reason").value = "";
		document.getElementById("m_list_type").value = "";
		document.getElementById("b_flag2").style.display='none';
	}
	if(b_val == 1){
		if(document.forms[0].addwmenu_flag.value != 1){
			w_check();
		}else{
			document.forms[0].addwmenu_flag.value = 0;
			w_check();
		}
		document.getElementById("b_flag2").style.display='';
		document.getElementById("w_flag2").style.display='none';
	}
}
function showOrNot(obj,id){
	var tmp = document.getElementById(id);
	if(obj.checked == true){
		tmp.style.display="";
	}else{
		tmp.style.display="none";
	}
}
</script>
</HEAD>
<body leftmargin="0" topmargin="0" class="mainbg" id="iframecontent">
<div id="main">
<html:form styleId="form1" action="/cust_identify/new_client_investigation_view.do" method="post">
<%	
	String check_type = (String) request.getAttribute("check_type");
	String url = (String) request.getAttribute("url");
	if(url.contains("#")){
		url = url.replace("#","%23");
	}
	String showCheckReason = (String) request.getAttribute("showCheckReason");
%>
	<html:hidden name="clientInfo" property="party_id"/>
	<html:hidden name="clientInfo" property="party_class_cd"/>
	<div class="conditions">
		<div class="cond_t">
			<span>核查客户身份信息-已识别</span>
			<span class="buttons">
				<a href="javascript.void(0);" onclick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/exportClientCheckInfo.do');return false;" ><img src="../../images/blue/b_export.png" />导出客户调查信息</a>
			</span>
		</div>
		<logic:equal name="clientInfo" property="party_class_cd" value="I">
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>中文名：</td>
						<td><bean:write name="clientInfo" property="party_chn_name" />
						</td>
						<td>国籍：</td>
						<td>
							<bean:write name="clientInfo" property="country_cd_disp"/>
						</td>
					</tr>
					<tr>
					  <td>英文名：</td>
					  <td><bean:write name="clientInfo" property="party_eng_name" /></td>
					  <td>证件类型：</td>
					  <td>
					  	<bean:write name="clientInfo" property="card_type_disp"/>
					  	<logic:notEmpty name="clientInfo" property="card_typeinfo">
							(<bean:write name="clientInfo" property="card_typeinfo"/>)
						</logic:notEmpty>
					  </td>
					</tr>
					
					<tr>
					  <td>证件号码： </td>
					  <td><bean:write name="clientInfo" property="card_no" /></td>
						<td>证件到期日： </td>
						<td>
							<bean:write name="clientInfo" property="card_end_dt_disp" />
						</td>
					</tr>
					<tr>
					  <td>住所地或经常居住地：</td>
					  <td><bean:write name="clientInfo" property="addr1" /></td>
					  <td>联系电话：</td>
					  <td><bean:write name="clientInfo" property="cell_no" /></td>
					</tr>
					<tr>
						<td>职业：</td>
						<td><bean:write name="clientInfo" property="occupation_disp"/></td>
						<td>职务：</td>
						<td><bean:write name="clientInfo" property="duty_disp"/></td>
					</tr>
					<tr>
					  <td>工作单位：</td>
					  <td><bean:write name="clientInfo" property="company" /></td>
					  <td>单位所属行业：</td>
					  <td><bean:write name="clientInfo" property="industry_disp"/></td>
					</tr>
					<tr>
					  <td>收入：</td>
					  <td><bean:write name="clientInfo" property="indiv_income" /></td>
					  <td>经济状况：</td>
					  <td><bean:write name="clientInfo" property="income_ecno" /></td>
					</tr>
					<tr>
						<td>收入来源：</td>
						<td><bean:write name="clientInfo" property="income_source" /></td>
						<td>开户目的：</td>
						<td><bean:write name="clientInfo" property="create_purpose" /></td>
					</tr>
				</table>
			</div>
		</logic:equal>
		<logic:equal name="clientInfo" property="party_class_cd" value="C">
			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td>客户归属机构：</td>
					  <td><bean:write name="clientInfo" property="organ_name_disp" /></td>
					  <td>客户号：</td>
					  <td><bean:write name="clientInfo" property="party_id"/></td>
					</tr>
					<tr>
					  <td>客户名称：</td>
					  <td><bean:write name="clientInfo" property="party_chn_name" /></td>
					  <td>客户证件类型：</td>
					  <td><bean:write name="clientInfo" property="card_type_c_disp" />
					  <logic:notEmpty name="clientInfo" property="card_type_cinfo">
						(<bean:write name="clientInfo" property="card_type_cinfo" />)
					</logic:notEmpty>
					  </td>
					</tr>
					<tr>
						<td>客户国籍：</td>
						<td><bean:write name="clientInfo" property="country_cd_disp"/></td>
						 <td>客户证件号码： </td>
						 <td><bean:write name="clientInfo" property="card_no" /></td>
					</tr>
					<tr>
					  	<td>对公客户行业：</td>
						<td><bean:write name="clientInfo" property="industry_disp"/></td>
					  <td>客户类型：</td>
					  <td><bean:write name="clientInfo" property="aml2_type_cd_disp"/></td>
					</tr>
					<tr>
						<td>主营范围</td>
						<td><bean:write name="clientInfo" property="main_manage_scope" /></td>
						<td>主营业务</td>
						<td><bean:write name="clientInfo" property="main_manage_business" /></td>
					</tr>
					<tr>
					  <td>注册资金币种：</td>
					  <td><bean:write name="clientInfo" property="enrol_fund_currency_cd_disp"/></td>
					  <td>注册资金：</td>
					  <td><bean:write name="clientInfo" property="enrol_fund_amt" /></td>
					</tr>
					<tr>
					  <td>法定代表人姓名：</td>
					  <td><bean:write name="clientInfo" property="legal_obj" /></td>
					  <td>法定代表人身份证件类型：</td>
					  <td><bean:write name="clientInfo" property="legal_card_type_disp" />
					  <logic:notEmpty name="clientInfo" property="legal_card_typeinfo">
						(<bean:write name="clientInfo" property="legal_card_typeinfo" />)
					</logic:notEmpty>
					</td>
					</tr>
					<tr>
						<td>法定代表人身份证件号码：</td>
						<td><bean:write name="clientInfo" property="legal_card_no" /></td>
						<td>法定代表人证件到期日</td>
						<td><bean:write name="clientInfo" property="legal_card_no_end_dt_disp" /></td>
					</tr>
					<tr>
					  <td>实际控股股东：</td>
					  <td><bean:write name="clientInfo" property="stock_holder" /></td>
					  <td>实际控股人身份证件种类：</td>
					  <td><bean:write name="clientInfo" property="stock_holder_card_type_disp" /></td>
					</tr>
					<tr>
						<td>实际控股人身份证件号码：</td>
						<td><bean:write name="clientInfo" property="stock_holder_card_no" /></td>
						<td>实际控股人证件到期日</td>
						<td><bean:write name="clientInfo" property="stock_holder_card_no_end_dt_disp" /></td>
					</tr>
	                  <tr>
	                  	<td>机构信用代码：</td>
						<td><bean:write name="clientInfo" property="org_credit_no" /></td>
						<td>机构信用代码有效期：</td>
						<td>
						<bean:write name="clientInfo" property="org_credit_vt_disp"  />
						</td>
	                  </tr>
	                  <!-- by zyd 2018-08-07 新乡增加营业执照到期日 -->
	                    <tr>
	                  	<td>营业执照到期日：</td>
						<td><bean:write name="clientInfo" property="licence_end_dtdisp" /></td>
						<td></td>
						<td>
						</td>
	                  </tr>
	                  <!-- end -->
				</table>
			</div>
		</logic:equal>
	</div>
	
	<%
		LinkedHashMap checkStateMap = (LinkedHashMap) request.getAttribute("checkStateMap");
		Set<String> keySet = checkStateMap.keySet();//获取map的key值的集合，set集合
		for(String key:keySet){
		    if(key != null && !key.equals("")){
		    	if("-1".equals(key)){
		    		ArrayList upList = (ArrayList) checkStateMap.get("-1");
		    		for(int i = 0; i<upList.size();i++){
		    			T10_newClientCheck upTemp = (T10_newClientCheck) upList.get(i);
	%>
	<div class="conditions">
		<div class="cond_t">
			<span><%=upTemp.getElementname() %></span>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
	<%
						if(upTemp.getElementid().equals("1")){
	%>
				<tr><td></td><td align="center" colspan="4">是否为以下识别措施：</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("1");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td><%=middleTemp.getElementname() %></td>
					<td>&nbsp;&nbsp;<%=middleTemp.getIstrue_disp() %>
	<%
								if("1".equals(middleTemp.getIstrue())){
	%>
						<td style="text-align:left;">识别人：<%=middleTemp.getCheckuser() %></td>
					</td>
					<td>识别时间：</td><td><%=middleTemp.getCheckdate_disp() %></td>
	<%
								}else{
									%>
									<td colspan=2></td><td></td>
									<%
									
								}
	%>
				</tr>
	<%
							}
						}else if(upTemp.getElementid().equals("2")){
							ArrayList middleList = (ArrayList) checkStateMap.get("2");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td colspan="3" ><%=middleTemp.getElementname() %></td>
					<td colspan="3">&nbsp;<%=middleTemp.getContext() %></td>
				</tr>
	<%
							}
						}else if(upTemp.getElementid().equals("3")){
	%>
				<tr><td></td><td align="center" colspan="3">是否存在以下异常情形：</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("3");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td><%=middleTemp.getElementname() %></td>
					<td>&nbsp;&nbsp;<%=middleTemp.getIstrue_disp() %></td>
					
	<%
								if("1".equals(middleTemp.getIstrue())){
	%>
						<td style="text-align:center;">详情：</td>
						<td><%=middleTemp.getContext() %></td>
	<%
								}else{
	%>
									<td></td><td colspan="2"></td>
	<%
								}
	%>
				</tr>
	<%
							}
						}else{
							ArrayList middleList = (ArrayList) checkStateMap.get("3");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td colspan="3" ><%=middleTemp.getElementname() %></td>
					<td><%=middleTemp.getContext() %></td>
				</tr>
	<%
							}
						}
		    		%>
		    </table>
		</div>
	</div>
		    		<%
		    		}
		    	}
		    }
		}
	%>
	
	<div class="conditions">
		<div class="cond_t">
			<span>调查结论信息</span>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<%if("yes".equals(showCheckReason)){ %>
				<tr>
					<td>发起调查原因：</td>
					<td colspan="4"><bean:write name="checkResult" property="check_reason"/></td>
				</tr>
				<%} %>
				<tr>
					<td>调查结论：</td>
					<td colspan=3 style='word-break:break-all'><bean:write name="checkResult" property="check_explain"  /></td>
				</tr>
				<tr>
					<td>填写人：</td>
					<td><bean:write name="checkResult" property="checker"/></td>
					<td>填写日期：</td>
					<td><bean:write name="checkResult" property="check_dt_disp"/></td>
				</tr>
				<tr>
					<td>调查表有效期：</td>
					<td><bean:write name="checkResult" property="valid_dt_disp"/></td>
					<td>关注程度（报送频度）：</td>
					<td><bean:write name="checkResult" property="check_result_disp"/></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="conditions">
		<div class="cond_t">
			<span>黑白名单信息</span>
		</div>
		<div class="cond_c2">
			<table border="0" cellpadding="0" cellspacing="0">
				<%
					T10_newClientCheck listInfo = (T10_newClientCheck)request.getAttribute("listType");
				%>
				<tr>
					<td >是否白名单：</td>
					<td><%=listInfo.getAddwmenu_flag_disp() %></td>
					<td>是否黑名单：</td>
					<td><%=listInfo.getAddbmenu_flag_disp() %></td>
				</tr>
				<%
					if("1".equals(listInfo.getAddwmenu_flag())){
				%>
				<tr>
					<td>免检类型：</td>
					<td><%=listInfo.getRule_type_disp() %></td>
					<td> 白名单建立原因： </td>
					<td><%=listInfo.getReason_create() %></td>
				</tr>
				
				<%
					}
					if("1".equals(listInfo.getAddbmenu_flag())){
				%>
				<tr>
					<td>名单类型：</td>
					<td><%=listInfo.getList_type_disp() %></td>
					<td>黑名单建立原因：</td>
					<td bgcolor="F6F9FF" colspan="3">
						<%=listInfo.getB_reason_create() %>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		
	</div>
</html:form>
</div>
</BODY>
</HTML>
