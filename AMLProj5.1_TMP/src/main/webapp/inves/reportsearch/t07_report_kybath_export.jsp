<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
      String cast_type=(String)request.getAttribute("cast_type");
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String typename="";
		if(cast_type!=null && cast_type.equals("1")){
		  typename="大额";
		}else{
		  typename="可疑";
		}
		String downloadname =typename+"案例导出列表" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="t07_reportsearvh_kybath_export.files/filelist.xml">
<link rel=Edit-Time-Data href="t07_reportsearvh_kybath_export.files/editdata.mso">
<link rel=OLE-Object-Data href="t07_reportsearvh_kybath_export.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Created>1996-12-17T01:32:42Z</o:Created>
  <o:LastSaved>2011-05-24T02:30:00Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:DownloadComponents/>
  <o:RemovePersonalInformation/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
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
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
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
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
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
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:黑体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl27
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
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
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:CodeName>Sheet1</x:CodeName>
     <x:Selected/>
     <x:LeftColumnVisible>23</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>31</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:CodeName>Sheet2</x:CodeName>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:CodeName>Sheet3</x:CodeName>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>4530</x:WindowHeight>
  <x:WindowWidth>8505</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>
<body link=blue vlink=purple>
			<table x:str border=0 cellpadding=0 cellspacing=0 width=3953 style='border-collapse:
 collapse;table-layout:fixed;width:2965pt'>
 <col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
 <col width=143 style='mso-width-source:userset;mso-width-alt:4576;width:107pt'>
 <col width=79 style='mso-width-source:userset;mso-width-alt:2528;width:59pt'>
 <col width=130 style='mso-width-source:userset;mso-width-alt:4160;width:98pt'>
 <col width=76 style='mso-width-source:userset;mso-width-alt:2432;width:57pt'>
 <col width=89 span=2 style='mso-width-source:userset;mso-width-alt:2848;
 width:67pt'>
 <col width=72 style='width:54pt'>
 <col width=153 style='mso-width-source:userset;mso-width-alt:4896;width:115pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:2848;width:67pt'>
 <col width=71 span=2 style='mso-width-source:userset;mso-width-alt:2272;
 width:53pt'>
 <col width=72 span=40 style='width:54pt'>
 <tr height=58 style='mso-height-source:userset;height:43.5pt'>
  <td height=58 width=11 style='height:43.5pt;width:8pt'></td>
  <td colspan=50 class=xl26 width=3942 style='width:2957pt'>   
                          <logic:equal value="1" name="cast_type">大额案例相关信息表</logic:equal>
						     <logic:equal value="2" name="cast_type">可疑案例相关信息表</logic:equal></td>
 </tr>
 <tr height=51 style='mso-height-source:userset;height:38.25pt'>
  <td height=51 style='height:38.25pt'></td>
  <td class=xl25 width=143 style='border-top:none;width:107pt'>案例编号</td>
  <td class=xl25 width=79 style='border-top:none;border-left:none;width:59pt'>案例日期</td>
  <td class=xl25 width=130 style='border-top:none;border-left:none;width:98pt'>金融机构名称</td>
  <td class=xl25 width=76 style='border-top:none;border-left:none;width:57pt'>金融机构代码(报送)</td>
  
  <td class=xl24 width=89 style='width:67pt'>案例状态</td>


  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>报告涉及金额</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易明细总笔数</td>
    <logic:equal value="2" name="cast_type">
      <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>客户号</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>案例意见</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>可疑程度</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>可疑交易特征描述</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>采取措施</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>可疑特征</td>
  </logic:equal>
  <logic:equal value="1" name="cast_type">
   <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>大额特征</td>
  </logic:equal>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易日期</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易代码</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>币种</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易金额</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易对手账户类型</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易对手客户账号</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>对方金融机构名称</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>对方金融机构代码类型</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>对方金融机构代码</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易对手姓名/名称</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易对手身份证件/证明文件类型</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易对手身份证件/证明文件号码</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>业务标示号</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>资金收付标志</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>资金来源用途</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>代办人姓名</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>代办人身份证件/证明文件类型</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>代办人身份证件/证明文件号码</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>代办人国籍</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>流水号</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易种类</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易机构</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>涉外收支交易分类与代码</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>对方金融机构网点行政区划代码</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易方式</td>
  <td class=xl25 width=72 style='border-top:none;border-left:none;width:54pt'>交易状态</td>
 </tr>
 <logic:iterate id="trans" name="list"  type="com.ist.aml.report.dto.T07_case_party_trans">
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 style='height:21.0pt'></td>
  <td class=xl28 style='border-top:none'><bean:write name="trans" property="application_num"/> 　</td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="case_date_disp"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="apporganname"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="app_org_id"/>   </td>
  
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="app_state_cd"/>   </td>
  
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tran_amt"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tran_count"/>   </td>
    <logic:equal value="2" name="cast_type">
      <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="party_id"/>   </td>
    <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="application_advice"/>   </td>
   <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="case_level"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="action_descrip"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="take_action"/>   </td>
  </logic:equal>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="stcr"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tx_dt_disp"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tx_cd"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="curr_cd"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="amt"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_acct_type_cd"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_acct_num"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_organname"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_organ_type"/>   </td>
   <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_organkey"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_name"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_card_type"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_card_no"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="transactionkey"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="receive_pay_cd"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="use_des"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="agent_name"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="agent_card_type"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="agent_card_no"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="agent_country"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tx_no"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tx_type_cd"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="organkey"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="tsctkey"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="opp_area"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="settle_type_cd"/>   </td>
  <td class=xl28 style='border-top:none;border-left:none'>　<bean:write name="trans" property="handle_status_cd"/>   </td>
 </tr>
 </logic:iterate>
</table>

	
	</body>
</html>