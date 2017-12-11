<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%

		String excelName = (String)request.getAttribute("excelName");
		excelName = new String(excelName.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ excelName + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="可疑交易报告.files/filelist.xml">
<link rel=Edit-Time-Data href="可疑交易报告.files/editdata.mso">
<link rel=OLE-Object-Data href="可疑交易报告.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Created>2012-07-12T08:01:14Z</o:Created>
  <o:LastSaved>2012-07-12T08:01:14Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
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
	color:black;
	font-family:SansSerif, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	color:black;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	color:black;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	color:black;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	color:black;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	color:black;
	text-align:left;
	vertical-align:top;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	color:black;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl54
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	color:black;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	color:black;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl57
	{mso-style-parent:style0;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl58
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl59
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl60
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
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
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>kyjybgtj</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:LeftToRight/>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:RangeSelection>$A$1:$G$1</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9150</x:WindowHeight>
  <x:WindowWidth>14940</x:WindowWidth>
  <x:WindowTopX>360</x:WindowTopX>
  <x:WindowTopY>270</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1302 style='border-collapse:
 collapse;table-layout:fixed;width:980pt'>
 <col width=123 style='mso-width-source:userset;mso-width-alt:4498;width:92pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:2157;width:44pt'>
 <col width=71 style='mso-width-source:userset;mso-width-alt:2596;width:53pt'>
 <col width=118 span=7 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col width=129 style='mso-width-source:userset;mso-width-alt:4717;width:97pt'>
 <col width=94 style='mso-width-source:userset;mso-width-alt:3437;width:71pt'>
 <tr height=53 style='mso-height-source:userset;height:39.95pt'>
  <td colspan=7 height=53 class=xl57 width=725 style='height:39.95pt;
  width:545pt'>金融机构可疑交易报告情况统计表</td>
  <td class=xl24 width=118 style='width:89pt'>　</td>
  <td class=xl24 width=118 style='width:89pt'>　</td>
  <td class=xl24 width=118 style='width:89pt'>　</td>
  <td class=xl24 width=129 style='width:97pt'>　</td>
  <td class=xl24 width=94 style='width:71pt'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl25 width=123 style='height:20.1pt;width:92pt'>数据类别：</td>
  <td colspan=2 class=xl26 width=130 style='width:97pt'><bean:write name="type_cd"/></td>
  <td class=xl27 width=118 style='width:89pt'>数据来源：</td>
  <td class=xl28 width=118 style='width:89pt'><bean:write name="level"/></td>
  <td class=xl29 width=118 style='width:89pt'>年度：</td>
  <td class=xl26 width=118 style='width:89pt'><bean:write name="year"/></td>
  <td class=xl29 width=118 style='width:89pt'>季度：</td>
  <td class=xl30 width=118 style='width:89pt'><bean:write name="quarter"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl31 width=123 style='height:20.1pt;width:92pt'>金融机构类别代码：</td>
  <td colspan=2 class=xl32 width=130 style='width:97pt'><bean:write name="report_organcode"/></td>
  <td class=xl33 width=118 style='width:89pt'>填报单位名称：</td>
  <td class=xl34 width=118 style='width:89pt'><bean:write name="report_orgname"/></td>
  <td class=xl35 width=118 style='width:89pt'>填报单位机构代码：</td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="report_organkey"/></td>
  <td class=xl35 width=118 style='width:89pt'>零报告标志：</td>
  <td class=xl36 width=118 style='width:89pt'><bean:write name="zero_flag"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl37 width=123 style='height:20.1pt;width:92pt'>制表人：</td>
  <td colspan=2 class=xl38 width=130 style='width:97pt'><bean:write name="realName"/></td>
  <td class=xl39 width=118 style='width:89pt'>联系电话：</td>
  <td class=xl40 width=118 style='width:89pt'><bean:write name="telephone"/></td>
  <td class=xl41 width=118 style='width:89pt'>填报日期：</td>
  <td class=xl38 width=118 style='width:89pt'><bean:write name="reportDate"/></td>
  <td class=xl41 width=118 style='width:89pt' x:str="">　</td>
  <td class=xl42 width=118 style='width:89pt' x:str="">　</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl43 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=11 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td colspan=2 rowspan=2 height=66 class=xl58 width=182 style='height:49.9pt;
  width:136pt'>向当地人民银行报送</td>
  <td colspan=2 class=xl27 width=189 style='width:142pt'>人民币重点可疑交易报告份数：</td>
  <td class=xl28 width=118 style='width:89pt'><bean:write name="cp_reportNum3"/></td>
  <td class=xl29 width=118 style='width:89pt'>金额：</td>
  <td class=xl26 width=118 style='width:89pt'><bean:write name="cp_reportAmt3"/></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td colspan=2 height=33 class=xl33 width=189 style='height:24.95pt;
  width:142pt'>外币重点可疑交易报告份数：</td>
  <td class=xl44 width=118 style='width:89pt'><bean:write name="id_reportNum3"/></td>
  <td class=xl35 width=118 style='width:89pt'>金额：</td>
  <td class=xl45 width=118 style='width:89pt'><bean:write name="id_reportAmt3"/></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl43 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=11 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl46 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=5 class=xl59 width=484 style='width:364pt'>当期可疑交易报告</td>
  <td colspan=5 class=xl60 width=601 style='width:453pt'>其中向当地公安机关报告</td>
  <td class=xl24>　</td>
 </tr>
 <tr height=53 style='mso-height-source:userset;height:39.95pt'>
  <td height=53 class=xl47 width=123 style='height:39.95pt;width:92pt'>交易类型</td>
  <td colspan=2 class=xl48 width=130 style='width:97pt'>单位可疑交易报告（份数）</td>
  <td class=xl49 width=118 style='width:89pt'>单位可疑交易报告（金额）(人民币万元/外汇万美元)</td>
  <td class=xl49 width=118 style='width:89pt'>个人可疑交易报告（份数）</td>
  <td class=xl50 width=118 style='width:89pt'>个人可疑交易报告（金额）(人民币万元/外汇万美元)</td>
  <td class=xl48 width=118 style='width:89pt'>单位可疑交易报告（份数）</td>
  <td class=xl49 width=118 style='width:89pt'>单位可疑交易报告（金额）(人民币万元/外汇万美元)</td>
  <td class=xl49 width=118 style='width:89pt'>个人可疑交易报告（份数）</td>
  <td class=xl49 width=118 style='width:89pt'>个人可疑交易报告（金额）(人民币万元/外汇万美元)</td>
  <td class=xl51 width=129 style='width:97pt'>公安机关反馈情况</td>
  <td class=xl24>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl52 width=123 style='height:24.95pt;width:92pt'>人民币可疑交易</td>
  <td colspan=2 class=xl32 width=130 style='width:97pt'><bean:write name="cp_reportNum1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="cp_reportAmt1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="id_reportNum1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="id_reportAmt1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="cpl_reportNum1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="cpl_reportAmt1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="idl_reportNum1"/></td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="idl_reportAmt1"/></td>
  <td class=xl53 width=129 style='width:97pt'><bean:write name="des1"/></td>
  <td class=xl24>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl54 width=123 style='height:24.95pt;width:92pt'>外汇可疑交易</td>
  <td colspan=2 class=xl55 width=130 style='width:97pt'><bean:write name="cp_reportNum2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="cp_reportAmt2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="id_reportNum2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="id_reportAmt2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="cpl_reportNum2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="cpl_reportAmt2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="idl_reportNum2"/></td>
  <td class=xl55 width=118 style='width:89pt'><bean:write name="idl_reportAmt2"/></td>
  <td class=xl56 width=129 style='width:97pt'><bean:write name="des2"/></td>
  <td class=xl24>　</td>
 </tr>
</table>

</body>

</html>
