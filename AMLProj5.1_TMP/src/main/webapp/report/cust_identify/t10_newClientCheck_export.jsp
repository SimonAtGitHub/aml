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
	mso-style-name:����;
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
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
.xl28
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	color:#003366;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
	font-family:����;
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
  height:29.25pt;width:1038pt'>�ͻ�������Ϣ</td>
 </tr>
<tr><td class=xl39 colspan=6>�ͻ������Ϣ</td></tr>
<logic:equal name="clientInfo" property="party_class_cd" value="I">
<tr>
	<td class=xl40>��������</td>
	<td class=xl41><bean:write name="clientInfo" property="party_chn_name" /></td>
	<td class=xl40>������</td>
	<td class=xl41><bean:write name="clientInfo" property="country_cd_disp"/></td>
	<td class=xl40>֤�����ͣ�</td>
	<td class=xl41><bean:write name="clientInfo" property="card_type_disp"/>
		<logic:notEmpty name="clientInfo" property="card_typeinfo">
			(<bean:write name="clientInfo" property="card_typeinfo"/>)
		</logic:notEmpty>
	</td>
</tr>
<tr>
	<td class=xl40>Ӣ������</td>
	<td class=xl41><bean:write name="clientInfo" property="party_eng_name" /></td>
	<td class=xl40>֤�����룺 </td>
	<td class=xl41><bean:write name="clientInfo" property="card_no" /></td>
	<td class=xl40>֤�������գ� </td>
	<td class=xl41><bean:write name="clientInfo" property="card_end_dt_disp" /></td>
</tr>
<tr>
	<td class=xl40>ְҵ��</td>
	<td class=xl41><bean:write name="clientInfo" property="occupation_disp"/></td>
	<td class=xl40>ְ��</td>
	<td class=xl41><bean:write name="clientInfo" property="duty_disp"/></td>
	<td class=xl40>ס���ػ򾭳���ס�أ�</td>
	<td class=xl41><bean:write name="clientInfo" property="addr1" /></td>
</tr>
<tr>
	<td class=xl40>��ϵ�绰��</td>
	<td class=xl41><bean:write name="clientInfo" property="cell_no" /></td>
	<td class=xl40>������λ��</td>
	<td class=xl41><bean:write name="clientInfo" property="company" /></td>
	<td class=xl40>��λ������ҵ��</td>
	<td class=xl41><bean:write name="clientInfo" property="industry_disp"/></td>
</tr>
<tr>
	<td class=xl40>���룺</td>
	<td class=xl41><bean:write name="clientInfo" property="indiv_income" /></td>
	<td class=xl40>������Դ��</td>
	<td class=xl41><bean:write name="clientInfo" property="income_source" /></td>
	<td class=xl40>����״����</td>
	<td class=xl41><bean:write name="clientInfo" property="income_ecno" /></td>
</tr>
<tr>
	<td class=xl40>����Ŀ�ģ�</td>
	<td class=xl41><bean:write name="clientInfo" property="create_purpose" /></td>
	<td class=xl40 colspan=4></td>
</tr>
</logic:equal>
<logic:equal name="clientInfo" property="party_class_cd" value="C">
<tr>
	<td class=xl40>�ͻ�����������</td>
	<td class=xl41><bean:write name="clientInfo" property="organ_name_disp" /></td>
	<td class=xl40>�ͻ��ţ�</td>
	<td class=xl41><bean:write name="clientInfo" property="party_id"/></td>
	<td class=xl41>�ͻ����ƣ�</td>
	<td class=xl41><bean:write name="clientInfo" property="party_chn_name" /></td>
</tr>
<tr>
	<td class=xl40>�ͻ�������</td>
	<td class=xl41><bean:write name="clientInfo" property="country_cd_disp"/></td>
	<td class=xl40>�ͻ�֤�����ͣ�</td>
	<td class=xl41><bean:write name="clientInfo" property="card_type_c_disp" />
		<logic:notEmpty name="clientInfo" property="card_type_cinfo">
			(<bean:write name="clientInfo" property="card_type_cinfo" />)
		</logic:notEmpty>
	</td>
	<td class=xl40>�ͻ�֤�����룺 </td>
	<td class=xl41><bean:write name="clientInfo" property="card_no" /></td>
</tr>
<tr>
	<td class=xl40>�Թ��ͻ���ҵ��</td>
	<td class=xl41><bean:write name="clientInfo" property="industry_disp"/></td>
	<td class=xl40>�ͻ����ͣ�</td>
	<td class=xl41><bean:write name="clientInfo" property="aml2_type_cd_disp"/></td>
	<td class=xl40>��Ӫ��Χ</td>
	<td class=xl41><bean:write name="clientInfo" property="main_manage_scope" /></td>
</tr>
<tr>
	<td class=xl40>��Ӫҵ��</td>
	<td class=xl41><bean:write name="clientInfo" property="main_manage_business" /></td>
	<td class=xl40>ע���ʽ���֣�</td>
	<td class=xl41><bean:write name="clientInfo" property="enrol_fund_currency_cd_disp"/></td>
	<td class=xl40>ע���ʽ�</td>
	<td class=xl41><bean:write name="clientInfo" property="enrol_fund_amt" /></td>
</tr>
<tr>
	<td class=xl40>����������������</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_obj" /></td>
	<td class=xl40>�������������֤�����ͣ�</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_card_type_disp" />
		<logic:notEmpty name="clientInfo" property="legal_card_typeinfo">
			(<bean:write name="clientInfo" property="legal_card_typeinfo" />)
		</logic:notEmpty>
	</td>
	<td class=xl40>�������������֤�����룺</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_card_no" /></td>
</tr>
<tr>
	<td class=xl40>����������֤��������</td>
	<td class=xl41><bean:write name="clientInfo" property="legal_card_no_end_dt_disp" /></td>
	<td class=xl40>ʵ�ʿعɹɶ���</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder" /></td>
	<td class=xl40>ʵ�ʿع������֤�����ࣺ</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder_card_type_disp" /></td>
</tr>
<tr>
	<td class=xl40>ʵ�ʿع������֤�����룺</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder_card_no" /></td>
	<td class=xl40>ʵ�ʿع���֤��������</td>
	<td class=xl41><bean:write name="clientInfo" property="stock_holder_card_no_end_dt_disp" /></td>
	<td class=xl40>�������ô��룺</td>
	<td class=xl41><bean:write name="clientInfo" property="org_credit_no" /></td>
</tr>
<tr>
	<td class=xl40>�������ô�����Ч�ڣ�</td>
	<td class=xl41><bean:write name="clientInfo" property="org_credit_vt_disp" /></td>
	<td class=xl40>Ӫҵִ�յ����գ�</td>
	<td class=xl41><bean:write name="clientInfo" property="licence_end_dtdisp" /></td>
	<td class=xl40 colspan=2></td>
</tr>
</logic:equal>
<%
	LinkedHashMap checkStateMap = (LinkedHashMap) request.getAttribute("checkStateMap");
	Set<String> keySet = checkStateMap.keySet();//��ȡmap��keyֵ�ļ��ϣ�set����
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
				<tr><td class=xl42 colspan="6">�Ƿ�Ϊ����ʶ���ʩ��</td></tr>
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
					<td class=xl40>ʶ���ˣ�</td><td class=xl41><%=middleTemp.getCheckuser() %></td>
					<td class=xl40>ʶ��ʱ�䣺</td><td class=xl41><%=middleTemp.getCheckdate_disp() %></td>
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
				<tr><td class=xl42 colspan="6">�Ƿ���������쳣���Σ�</td></tr>
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
						<td class=xl40>���飺</td>
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
	<td class=xl39 colspan=6>���������Ϣ</td>
</tr>
<tr>
	<td class=xl40>������ۣ�</td>
	<td class=xl41 colspan=3><bean:write name="checkResult" property="check_explain"/></td>
	<td class=xl40>��ע�̶ȣ�����Ƶ�ȣ���</td>
	<td class=xl41><bean:write name="checkResult" property="check_result_disp"/></td>
</tr>
<tr>
	<td class=xl40>��д�ˣ�</td>
	<td class=xl41><bean:write name="checkResult" property="checker"/></td>
	<td class=xl40>��д���ڣ�</td>
	<td class=xl41><bean:write name="checkResult" property="check_dt_disp"/></td>
	<td class=xl40>�������Ч�ڣ�</td>
	<td class=xl41><bean:write name="checkResult" property="valid_dt_disp"/></td>
</tr>
<tr><td class=xl39 colspan=6>�ڰ�������Ϣ</td></tr>
<%
	T10_newClientCheck listInfo = (T10_newClientCheck)request.getAttribute("listType");
%>
<tr>
	<td class=xl40>�Ƿ��������</td>
	<td class=xl41 colspan=2><%=listInfo.getAddwmenu_flag_disp() %></td>
	<td class=xl40>�Ƿ��������</td>
	<td class=xl41 colspan=2><%=listInfo.getAddbmenu_flag_disp() %></td>
</tr>
<%
	if("1".equals(listInfo.getAddwmenu_flag())){
%>
<tr>
	<td class=xl40>������ͣ�</td>
	<td class=xl41 colspan=2><%=listInfo.getRule_type_disp() %></td>
	<td class=xl40> ����������ԭ�� </td>
	<td class=xl41 colspan=2><%=listInfo.getReason_create() %></td>
</tr>

<%
	}
	if("1".equals(listInfo.getAddbmenu_flag())){
%>
<tr>
	<td class=xl40>�������ͣ�</td>
	<td class=xl41 colspan=2><%=listInfo.getList_type_disp() %></td>
	<td class=xl40>����������ԭ��</td>
	<td class=xl41 colspan=2><%=listInfo.getB_reason_create() %></td>
</tr>
<%
	}
%>
</table>
</body>
</html>
