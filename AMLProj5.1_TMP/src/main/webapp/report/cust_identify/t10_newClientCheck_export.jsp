<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.ist.aml.cust_identify.dto.T10_newClientCheck" %>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
	String downloadname = (String)request.getAttribute("downloadname");
	downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1").trim();
	response.setHeader("Content-disposition", "attachment; filename=" + downloadname + ".xls");
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="jsp.files/filelist.xml">
<link rel=Edit-Time-Data href="jsp.files/editdata.mso">
<link rel=OLE-Object-Data href="jsp.files/oledata.mso">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:常规;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl28
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	mso-pattern:white none;
	background-color:#9BCD9B;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:white none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:white;
	mso-pattern:white none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	color:#003366;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:white none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-pattern:white none;
	background-color: #9BCD9B;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-pattern:white none;
	background-color: #B4EEB4;}
.xl41
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	mso-pattern:white none;
	background-color: #B4EEB4;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background-color: #00CD66;
	white-space:normal;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
-->
</style>
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1381 style='border-collapse:
 collapse;table-layout:fixed;width:1038pt'>
 <col class=xl25 width=105 style='mso-width-source:userset;mso-width-alt:3840;
 width:79pt'>
 <col class=xl25 width=140 style='mso-width-source:userset;mso-width-alt:5120;
 width:105pt'>
 <col class=xl25 width=230 style='mso-width-source:userset;mso-width-alt:8411;
 width:173pt'>
 <col class=xl25 width=102 style='mso-width-source:userset;mso-width-alt:3730;
 width:77pt'>
 <col class=xl25 width=113 style='mso-width-source:userset;mso-width-alt:4132;
 width:85pt'>
 <col class=xl25 width=105 style='mso-width-source:userset;mso-width-alt:3840;
 width:79pt'>
 <col class=xl25 width=146 style='mso-width-source:userset;mso-width-alt:5339;
 width:110pt'>
 <col class=xl25 width=125 style='mso-width-source:userset;mso-width-alt:4571;
 width:94pt'>
 <col class=xl25 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl25 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl25 width=113 style='mso-width-source:userset;mso-width-alt:4132;
 width:85pt'>
 <col class=xl25 width=49 style='mso-width-source:userset;mso-width-alt:1792;
 width:37pt'>
 <col class=xl25 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl25 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <col class=xl25 width=51 span=3 style='mso-width-source:userset;mso-width-alt:
 1865;width:38pt'>
 <col class=xl25 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl25 width=67 style='mso-width-source:userset;mso-width-alt:2450;
 width:50pt'>
 <tr class=xl26 height=39 style='mso-height-source:userset;height:29.25pt'>
  <td colspan=6 height=39 class=xl28 width=1381 style='border-right:.5pt solid black;
  height:29.25pt;width:1038pt'>客户调查信息</td>
 </tr>
<tr><td class=xl39 colspan=6>客户身份信息</td></tr>
<logic:equal name="clientInfo" property="party_class_cd" value="I">
<tr>
	<td class=xl40>中文名：</td>
	<td class=xl41><bean:write name="clientInfo" property="party_chn_name" /></td>
	<td class=xl40>国籍：</td>
	<td class=xl41><bean:write name="clientInfo" property="country_cd_disp"/></td>
	<td class=xl40>证件类型：</td>
	<td class=xl41><bean:write name="clientInfo" property="card_type_disp"/>
		<logic:notEmpty name="clientInfo" property="card_typeinfo">
			(<bean:write name="clientInfo" property="card_typeinfo"/>)
		</logic:notEmpty>
	</td>
</tr>
<tr>
	<td class=xl40>英文名：</td>
	<td class=xl41><bean:write name="clientInfo" property="party_eng_name" /></td>
	<td class=xl40>证件号码： </td>
	<td class=xl41><bean:write name="clientInfo" property="card_no" /></td>
	<td class=xl40>证件到期日： </td>
	<td class=xl41><bean:write name="clientInfo" property="card_end_dt_disp" /></td>
</tr>
<tr>
	<td class=xl40>职业：</td>
	<td class=xl41><bean:write name="clientInfo" property="occupation_disp"/></td>
	<td class=xl40>职务：</td>
	<td class=xl41><bean:write name="clientInfo" property="duty_disp"/></td>
	<td class=xl40>住所地或经常居住地：</td>
	<td class=xl41><bean:write name="clientInfo" property="addr1" /></td>
</tr>
<tr>
	<td class=xl40>联系电话：</td>
	<td class=xl41><bean:write name="clientInfo" property="cell_no" /></td>
	<td class=xl40>工作单位：</td>
	<td class=xl41><bean:write name="clientInfo" property="company" /></td>
	<td class=xl40>单位所属行业：</td>
	<td class=xl41><bean:write name="clientInfo" property="industry_disp"/></td>
</tr>
<tr>
	<td class=xl40>收入：</td>
	<td class=xl41><bean:write name="clientInfo" property="indiv_income" /></td>
	<td class=xl40>收入来源：</td>
	<td class=xl41><bean:write name="clientInfo" property="income_source" /></td>
	<td class=xl40>经济状况：</td>
	<td class=xl41><bean:write name="clientInfo" property="income_ecno" /></td>
</tr>
<tr>
	<td class=xl40>开户目的：</td>
	<td class=xl41><bean:write name="clientInfo" property="create_purpose" /></td>
	<td class=xl40 colspan=4></td>
</tr>
</logic:equal>
<logic:equal name="clientInfo" property="party_class_cd" value="C">
<tr>
	<td class=xl40>客户归属机构：</td>
	<td class=xl41><bean:write name="clientInfo" property="organ_name_disp" /></td>
	<td class=xl40>客户号：</td>
	<td class=xl41><bean:write name="clientInfo" property="party_id"/></td>
	<td class=xl41>客户名称：</td>
	<td class=xl41><bean:write name="clientInfo" property="party_chn_name" /></td>
</tr>
<tr>
	<td class=xl40>客户国籍：</td>
	<td class=xl41><bean:write name="clientInfo" property="country_cd_disp"/></td>
	<td class=xl40>客户证件类型：</td>
	<td class=xl41><bean:write name="clientInfo" property="card_type_c_disp" />
		<logic:notEmpty name="clientInfo" property="card_type_cinfo">
			(<bean:write name="clientInfo" property="card_type_cinfo" />)
		</logic:notEmpty>
	</td>
	<td class=xl40>客户证件号码： </td>
	<td class=xl41><bean:write name="clientInfo" property="card_no" /></td>
</tr>
<tr>
	<td class=xl40>对公客户行业：</td>
	<td class=xl41><bean:write name="clientInfo" property="industry_disp"/></td>
	<td class=xl40>客户类型：</td>
	<td class=xl41><bean:write name="clientInfo" property="aml2_type_cd_disp"/></td>
	<td class=xl40>主营范围</td>
	<td class=xl41><bean:write name="clientInfo" property="main_manage_scope" /></td>
</tr>
<tr>
	<td class=xl40>主营业务</td>
	<td class=xl41><bean:write name="clientInfo" property="main_manage_business" /></td>
	<td class=xl40>注册资金币种：</td>
	<td class=xl41><bean:write name="clientInfo" property="enrol_fund_currency_cd_disp"/></td>
	<td class=xl40>注册资金：</td>
	<td class=xl41><bean:write name="clientInfo" property="enrol_fund_amt" /></td>
</tr>
<tr>
	<td class=xl40>法定代表人姓名：</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_obj" /></td>
	<td class=xl40>法定代表人身份证件类型：</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_card_type_disp" />
		<logic:notEmpty name="clientInfo" property="legal_card_typeinfo">
			(<bean:write name="clientInfo" property="legal_card_typeinfo" />)
		</logic:notEmpty>
	</td>
	<td class=xl40>法定代表人身份证件号码：</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_card_no" /></td>
</tr>
<tr>
	<td class=xl40>法定代表人证件到期日</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_card_no_end_dt_disp" /></td>
	<td class=xl40>实际控股股东：</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder" /></td>
	<td class=xl40>实际控股人身份证件种类：</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder_card_type_disp" /></td>
</tr>
<tr>
	<td class=xl40>实际控股人身份证件号码：</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder_card_no" /></td>
	<td class=xl40>实际控股人证件到期日</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder_card_no_end_dt_disp" /></td>
	<td class=xl40>机构信用代码：</td>
	<td class=xl41><bean:write name="clientInfo" property="org_credit_no" /></td>
</tr>
<tr>
	<td class=xl40>机构信用代码有效期：</td>
	<td class=xl41><bean:write name="clientInfo" property="org_credit_vt_disp" /></td>
	<td class=xl40 colspan=4></td>
</tr>
</logic:equal>
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

				<tr><td class=xl39 colspan=6><%=upTemp.getElementname() %></td></tr>
	<%
						if(upTemp.getElementid().equals("1")){
	%>
				<tr><td class=xl42 colspan="6">是否为以下识别措施：</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("1");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td class=xl40><%=middleTemp.getElementname() %></td>
					<td class=xl41><%=middleTemp.getIstrue_disp() %></td>
	<%
								if("1".equals(middleTemp.getIstrue())){
	%>
					<td class=xl40>识别人：</td><td class=xl41><%=middleTemp.getCheckuser() %></td>
					<td class=xl40>识别时间：</td><td class=xl41><%=middleTemp.getCheckdate_disp() %></td>
	<%
								}else{
									%>
									<td class=xl40 colspan=4></td>
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
					<td class=xl40><%=middleTemp.getElementname() %></td>
					<td colspan="5" class=xl41><%=middleTemp.getContext() %></td>
				</tr>
	<%
							}
						}else if(upTemp.getElementid().equals("3")){
	%>
				<tr><td class=xl42 colspan="6">是否存在以下异常情形：</td></tr>
	<%
							ArrayList middleList = (ArrayList) checkStateMap.get("3");
							for(int j = 0;j < middleList.size(); j++){
								T10_newClientCheck middleTemp = (T10_newClientCheck) middleList.get(j);
	%>
				<tr>
					<td class=xl40><%=middleTemp.getElementname() %></td>
					<td class=xl41><%=middleTemp.getIstrue_disp() %></td>
					
	<%
								if("1".equals(middleTemp.getIstrue())){
	%>
						<td class=xl40>详情：</td>
						<td colspan=3 class=xl41><%=middleTemp.getContext() %></td>
	<%
								}else{
	%>
									<td class=xl40 colspan="4"></td>
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
					<td colspan="5"  class=xl40><%=middleTemp.getElementname() %></td>
					<td class=xl41><%=middleTemp.getContext() %></td>
				</tr>
	<%
							}
						}
		    		}
		    	}
		    }
		}
	%>

<tr>
	<td class=xl39 colspan=6>调查结论信息</td>
</tr>
<tr>
	<td class=xl40>调查结论：</td>
	<td class=xl41 colspan=3><bean:write name="checkResult" property="check_explain"/></td>
	<td class=xl40>关注程度（报送频度）：</td>
	<td class=xl41><bean:write name="checkResult" property="check_result_disp"/></td>
</tr>
<tr>
	<td class=xl40>填写人：</td>
	<td class=xl41><bean:write name="checkResult" property="checker"/></td>
	<td class=xl40>填写日期：</td>
	<td class=xl41><bean:write name="checkResult" property="check_dt_disp"/></td>
	<td class=xl40>调查表有效期：</td>
	<td class=xl41><bean:write name="checkResult" property="valid_dt_disp"/></td>
</tr>
<tr><td class=xl39 colspan=6>黑白名单信息</td></tr>
<%
	T10_newClientCheck listInfo = (T10_newClientCheck)request.getAttribute("listType");
%>
<tr>
	<td class=xl40>是否白名单：</td>
	<td class=xl41 colspan=2><%=listInfo.getAddwmenu_flag_disp() %></td>
	<td class=xl40>是否黑名单：</td>
	<td class=xl41 colspan=2><%=listInfo.getAddbmenu_flag_disp() %></td>
</tr>
<%
	if("1".equals(listInfo.getAddwmenu_flag())){
%>
<tr>
	<td class=xl40>免检类型：</td>
	<td class=xl41 colspan=2><%=listInfo.getRule_type_disp() %></td>
	<td class=xl40> 白名单建立原因： </td>
	<td class=xl41 colspan=2><%=listInfo.getReason_create() %></td>
</tr>

<%
	}
	if("1".equals(listInfo.getAddbmenu_flag())){
%>
<tr>
	<td class=xl40>名单类型：</td>
	<td class=xl41 colspan=2><%=listInfo.getList_type_disp() %></td>
	<td class=xl40>黑名单建立原因：</td>
	<td class=xl41 colspan=2><%=listInfo.getB_reason_create() %></td>
</tr>
<%
	}
%>
</table>
</body>
</html>
