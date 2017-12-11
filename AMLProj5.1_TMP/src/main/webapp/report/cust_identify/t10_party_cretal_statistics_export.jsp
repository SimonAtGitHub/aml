<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String typename="";

		String downloadname =typename+"机构信用代码应用统计表" + nowdate;
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
	font-size:20.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl25
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	
	mso-pattern:auto none;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	text-align:left;
	font-size:10.0pt;
	font-weight:400;
	border-bottom:.5pt solid windowtext;
}
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
  <td colspan=10 class=xl24 width=3942 style='width:2957pt'>   
                          机构信用代码在反洗钱等领域运用情况统计表</td>
 </tr>
 <tr><td height=58 width=72 style='height:43.5pt;width:54pt'></td>
    <td colspan="8" class=xl27>填报单位：<bean:write name="party_cretal"  property="organname" scope="request"/></td>
    <td  colspan="2" class=xl27>填报日期：<bean:write name="party_cretal"  property="statistic_dt_disp" scope="request"/></td>
 </tr>
 <tr style='mso-height-source:userset;height:25pt'>
      <td height=58 width=72 style='height:25pt;width:54pt'></td>
      <td colspan="10" class=xl25 style='border-top:none;'>一、在反洗钱领域应用情况</td>
 </tr>
 <tr  style='mso-height-source:userset;height:30pt'>
  <td  style='height:30pt'></td>
  <td rowspan="2" class=xl25 width=143 style='border-top:none;width:110pt'>报送机构名称</td>
  <td rowspan="2" class=xl25 width=79 style='border-top:none;border-left:none;width:70pt'>查询总笔数</td>
  <td colspan="4" class=xl25 width=130 style='border-top:none;border-left:none;width:200pt'>对新客户的身份识别环节</td>
  <td colspan="4" class=xl25 width=76 style='border-top:none;border-left:none;width:200pt'>持续客户身份识别和重新识别客户环节（含账户年检）</td>
</tr>
<tr style='mso-height-source:userset;height:45pt'>
  <td  style='height:45pt'></td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>查询笔数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>涉及客户数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>涉及账户数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>发现异常数或可疑线索数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>查询笔数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>涉及客户数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>涉及账户数</td>
  <td class=xl25 style='border-top:none;border-left:none;width:50pt'>发现异常数或可疑线索数</td>
 </tr>

 <tr  style='mso-height-source:userset;height:25pt'>
  <td width=72 style='height:25pt;'></td>
  <td class=xl25 style='border-top:none;'><bean:write name="party_cretal"  property="organname" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="querycount_s" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="querycount_n" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="partycount_n" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="acctcount_n" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="kycount_n" scope="request"/></td>

  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="querycount_r" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="partycount_r" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="acctcount_r" scope="request"/></td>
  <td class=xl25 style='border-top:none;border-left:none'><bean:write name="party_cretal"  property="kycount_r" scope="request"/></td>
 </tr>

 <tr style='mso-height-source:userset;height:25pt'><td height=58 width=72 style='height:25pt;width:54pt'></td>
      <td colspan="10" class=xl25 style='border-top:none;'>二、在其他领域应用情况</td>
 </tr>
 <tr style='mso-height-source:userset;height:30pt'><td height=58 width=72 style='height:30pt;width:54pt'></td>
    <td colspan="4" class=xl25 style='border-top:none;'>业务名称</td>
    <td class=xl25 style='border-top:none;border-left:none'>查询笔数</td>
    <td colspan="3" class=xl25 style='border-top:none;border-left:none'>应用结果</td>
    <td colspan="2" class=xl25 style='border-top:none;border-left:none'>备注</td>
 </tr>
 <tr style='mso-height-source:userset;height:25pt'><td height=58 width=72 style='height:25pt;width:54pt'></td>
    <td colspan="4" class=xl25 style='border-top:none;'></td>
    <td class=xl25 style='border-top:none;border-left:none'></td>
    <td colspan="3" class=xl25 style='border-top:none;border-left:none'></td>
    <td colspan="2" class=xl25 style='border-top:none;border-left:none'></td>
 </tr>
 <tr style='mso-height-source:userset;height:25pt'><td height=58 width=72 style='height:25pt;width:54pt'></td>
    <td colspan="4" class=xl25 style='border-top:none;'></td>
    <td class=xl25 style='border-top:none;border-left:none'></td>
    <td colspan="3" class=xl25 style='border-top:none;border-left:none'></td>
    <td colspan="2" class=xl25 style='border-top:none;border-left:none'></td>
 </tr>
  <tr style='mso-height-source:userset;height:25pt'><td height=58 width=72 style='height:25pt;width:54pt'></td>
    <td colspan="4" class=xl25 style='border-top:none;'></td>
    <td class=xl25 style='border-top:none;border-left:none'></td>
    <td colspan="3" class=xl25 style='border-top:none;border-left:none'></td>
    <td colspan="2" class=xl25 style='border-top:none;border-left:none'></td>
 </tr>
  <tr><td height=58 width=72 style='height:43.5pt;width:54pt'></td>
    <td colspan="8" style='border:none;align:left;font-size:10.0pt;'>负责人：</td>
    <td colspan="2" style='border:none;align:left;font-size:10.0pt;'>制表人：</td>
 </tr>
</table>

	
	</body>
</html>