<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
		%>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href=<%=cssurl%> type="text/css" /> -->
		<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript"><!--

		

function dosubmit(theUrl){
		document.forms[0].action=theUrl;
        document.forms[0].submit();
}
function _Click(party_id,party_chn_name,party_class_cd,organkey,card_type,card_no){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
     document.forms[0].party_class_cd_s.value=party_class_cd;
     document.forms[0].organkey.value=organkey;
     document.forms[0].card_type.value=card_type;
     document.forms[0].card_no.value=card_no;
   
    
}
function _Commit(){

	var flexObj=window.opener.document.getElementById("REL");
	var partyInfo={};
	partyInfo.party_id=document.forms[0].party_id.value;
	partyInfo.party_name=document.forms[0].party_chn_name.value;
	partyInfo.party_class_cd=document.forms[0].party_class_cd_s.value;

	flexObj.setPartyInfo(partyInfo);
	window.close();
}
--></script>

	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/common/t47_party_list1.do" method="post">
				<html:errors />
				<input type="hidden" name="input_name"
					value="<%=(String) request.getAttribute("input_name")%>" />
				<input type="hidden" name="input_name_disp"
					value="<%=(String) request.getAttribute("input_name_disp")%>" />
				<input type="hidden" name="type"
					value="<%=(String) request.getAttribute("type")%>" />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>客户定位</span>
						<span class="buttons"> <a href="#" onclick="javascript:_Commit();"><img
									src="../images/<%=session.getAttribute("style") %>/b_add.png" />选 定</a> <a
							href="javascript:window.close();"><img
									src="../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a> </span>
						<!--<html:button property="button3" value="选定" styleClass="input" onclick="_Commit()"/>
          <html:button property="close" value="关闭" styleClass="input" onclick="javascript:window.close();"/> -->
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									客户号：
									<!-- 
	         <html:text property="host_cust_id" styleClass="text_white"  size="12"/>
	          -->
									<html:text property="party_id_s" styleClass="text_white"
										size="12" />
									<!--  <font color='red'> * </font> -->&nbsp;&nbsp; 客户名称：
									<html:text property="party_chn_name_search"
										styleClass="text_white" size="12" />
									&nbsp;&nbsp; 证件号：
									<html:text property="card_no" styleClass="text_white" size="12" />
									&nbsp;&nbsp; 客户类型：
									<html:select property="party_class_cd">
										<html:options collection="clienttypeMap" property="label"
											labelProperty="value" />
									</html:select>

									<html:button property="button3" value="查 询"
										styleClass="in_button1"
										onclick="dosubmit('t47_party_list_for_flex.do?newsearchflag=1&searchtype=search')" />
									<html:hidden property="party_chn_name" />
									<html:hidden property="party_id" />
									<html:hidden property="party_class_cd_s" />
									<html:hidden property="organkey" />
									<html:hidden property="card_type" />
									<html:hidden property="card_no" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								选择
							</th>
							<th>
								序号
							</th>
							<th>
								客户编号
							</th>
							<th>
								客户名称
							</th>
							<th>
								客户类型
							</th>
						</tr>
						<logic:iterate id="party" name="t47_partyList" indexId="i"
							type="com.ist.aml.report.dto.T47_party">

							<tr align="center" class="interval"
								onmouseover="this.className='interval2'"
								onmouseout="this.className='interval'">
								<td>
									<input type="radio" name="party_id1"
										onclick="_Click('<bean:write name="party" property="party_id" />','<bean:write name="party" property="party_chn_name" />',
										'<bean:write name="party" property="party_class_cd" />','<bean:write name="party" property="organkey" />',
										'<bean:write name="party" property="card_type" />','<bean:write name="party" property="card_no" />')" />
								</td>
								<td><%=i.intValue() + 1%></td>
								<td>
									<!-- 
      <bean:write name="party" property="host_cust_id" scope="page"/>
       -->
									<bean:write name="party" property="party_id" scope="page" />
								</td>
								<td>
									<bean:write name="party" property="party_chn_name" scope="page" />
								</td>
								<td>
									<logic:equal name="party" property="party_class_cd" value="I">对私</logic:equal>
									<logic:equal name="party" property="party_class_cd" value="C">对公</logic:equal>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			</html:form>
		</div>
	</body>
</html>
