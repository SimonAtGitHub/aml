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
<link rel=File-List href="识别客户.files/filelist.xml">
<link rel=Edit-Time-Data href="识别客户.files/editdata.mso">
<link rel=OLE-Object-Data href="识别客户.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Created>2012-07-11T08:32:18Z</o:Created>
  <o:LastSaved>2012-07-11T08:32:18Z</o:LastSaved>
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
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
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
.xl37
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
.xl38
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
.xl39
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
.xl40
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
.xl41
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border:none;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl42
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
.xl43
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
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl44
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
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
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
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
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
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl54
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	background:white;
	mso-pattern:auto none;
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
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl59
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid black;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl60
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl61
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
.xl62
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl63
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
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
    <x:Name>sbkhtj</x:Name>
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
       <x:ActiveRow>1</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1300 style='border-collapse:
 collapse;table-layout:fixed;width:978pt'>
 <col width=123 style='mso-width-source:userset;mso-width-alt:4498;width:92pt'>
 <col width=118 span=5 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <col width=28 style='mso-width-source:userset;mso-width-alt:1024;width:21pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:4315;width:89pt'>
 <col width=352 style='mso-width-source:userset;mso-width-alt:12873;width:264pt'>
 <tr height=53 style='mso-height-source:userset;height:39.95pt'>
  <td colspan=6 height=53 class=xl57 width=713 style='height:39.95pt;
  width:537pt'>金融机构客户身份识别情况（识别客户）</td>
  <td class=xl24 width=89 style='width:67pt'>　</td>
  <td class=xl24 width=28 style='width:21pt'>　</td>
  <td class=xl24 width=118 style='width:89pt'>　</td>
  <td class=xl24 width=352 style='width:264pt'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl25 width=123 style='height:20.1pt;width:92pt'>数据类别：</td>
  <td class=xl26 width=118 style='width:89pt'><bean:write name="type_cd"/></td>
  <td class=xl27 width=118 style='width:89pt'>数据来源：</td>
  <td class=xl28 width=118 style='width:89pt'><bean:write name="level"/></td>
  <td class=xl29 width=118 style='width:89pt'>年度：</td>
  <td class=xl26 width=118 style='width:89pt'><bean:write name="year"/></td>
  <td colspan=2 class=xl29 width=117 style='width:88pt'>季度：</td>
  <td class=xl30 width=118 style='width:89pt'><bean:write name="quarter"/></td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl31 width=123 style='height:20.1pt;width:92pt'>金融机构类别代码：</td>
  <td class=xl32 width=118 style='width:89pt'><bean:write name="report_organcode"/></td>
  <td class=xl33 width=118 style='width:89pt'>填报单位名称：</td>
  <td class=xl34 width=118 style='width:89pt'><bean:write name="report_orgname"/></td>
  <td class=xl35 width=118 style='width:89pt'>填报单位机构代码：</td>
  <td class=xl32 width=118 style='width:89pt' x:num><bean:write name="report_organkey"/></td>
  <td colspan=2 class=xl35 width=117 style='width:88pt'>零报告标志：</td>
  <td class=xl48 width=118 style='border-left:none;width:89pt'><bean:write name="zero_flag"/></td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl36 width=123 style='height:20.1pt;width:92pt'>制表人：</td>
  <td class=xl37 width=118 style='width:89pt'><bean:write name="realName"/></td>
  <td class=xl38 width=118 style='width:89pt'>联系电话：</td>
  <td class=xl39 width=118 style='width:89pt' x:num><bean:write name="telephone"/></td>
  <td class=xl40 width=118 style='width:89pt'>填报日期：</td>
  <td class=xl37 width=118 style='width:89pt'><bean:write name="reportDate"/></td>
  <td colspan=2 class=xl40 width=117 style='width:88pt' x:str="">　</td>
  <td class=xl56 width=118 style='border-left:none;width:89pt' x:str="">　</td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl41 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=9 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl41 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=9 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=3 height=26 class=xl58 width=359 style='height:20.1pt;width:270pt'>项目</td>
  <td class=xl42 width=118 style='width:89pt'>新客户</td>
  <td class=xl43 width=118 style='width:89pt'>一次性交易</td>
  <td class=xl44 width=118 style='width:89pt'>跨境汇兑</td>
  <td class=xl45 width=89 style='width:67pt'>其它情况</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=12 height=312 class=xl58 width=123 style='height:241.2pt;
  width:92pt'>对公客户</td>
  <td colspan=2 class=xl59 width=236 style='width:178pt'>总数</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_total1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="cp_total2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_total3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="cp_total4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl49 width=236 style='height:20.1pt;width:178pt'>通过代理行识别数</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_proxy1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="cp_proxy2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_proxy3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="cp_proxy4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl53 width=236 style='height:20.1pt;width:178pt'>通过第三方识别数</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_thparty1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="cp_thparty2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_thparty3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="cp_thparty4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl49 width=236 style='height:20.1pt;width:178pt'>与离岸中心有关的</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_disembark1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="cp_disembark2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_disembark3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="cp_disembark4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl53 width=236 style='height:20.1pt;width:178pt'>受益人数</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_benefit1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="cp_benefit2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_benefit3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="cp_benefit4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=7 height=182 class=xl60 width=118 style='height:140.7pt;
  width:89pt'>发现问题</td>
  <td class=xl49 width=118 style='width:89pt'>合计</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_questotal1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="cp_questotal2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_questotal3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="cp_questotal4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>匿名、假名</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_anonymous1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="cp_anonymous2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_anonymous3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="cp_anonymous4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl49 width=118 style='height:20.1pt;width:89pt'>证件造价</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_falsecard1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="cp_falsecard2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_falsecard3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="cp_falsecard4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>证件失效</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_failurecard1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="cp_failurecard2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_failurecard3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="cp_failurecard4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl49 width=118 style='height:20.1pt;width:89pt'>利用他人证件</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_otherscard1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="cp_otherscard2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_otherscard3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="cp_otherscard4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>犯罪嫌疑人</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_suspects1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="cp_suspects2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="cp_suspects3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="cp_suspects4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl49 width=118 style='height:20.1pt;width:89pt'>其它情形</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_othercase1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="cp_othercase2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="cp_othercase3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="cp_othercase4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=14 height=364 class=xl62 width=123 style='height:281.4pt;
  width:92pt'>对私客户</td>
  <td colspan=2 class=xl53 width=236 style='width:178pt'>总数</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_total1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_total2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_total3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_total4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl49 width=236 style='height:20.1pt;width:178pt'>通过代理行识别数</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_proxy1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_proxy2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_proxy3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_proxy4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl53 width=236 style='height:20.1pt;width:178pt'>通过第三方识别数</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_thparty1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_thparty2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_thparty3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_thparty4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=2 height=52 class=xl60 width=118 style='height:40.2pt;width:89pt'>居民</td>
  <td class=xl49 width=118 style='width:89pt'>合计</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_residents1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_residents2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_residents3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_residents4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>其中他人代理的</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_resiproxy1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_resiproxy2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_resiproxy3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_resiproxy4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=2 height=52 class=xl63 width=118 style='height:40.2pt;width:89pt'>非居民</td>
  <td class=xl49 width=118 style='width:89pt'>合计</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_nonresidents1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_nonresidents2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_nonresidents3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_nonresidents4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>其中他人代理的</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_nonresiproxy1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_nonresiproxy2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_nonresiproxy3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_nonresiproxy4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=7 height=182 class=xl60 width=118 style='height:140.7pt;
  width:89pt'>发现问题</td>
  <td class=xl49 width=118 style='width:89pt'>合计</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_questotal1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_questotal2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_questotal3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_questotal4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>匿名、假名</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_anonymous1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_anonymous2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_anonymous3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_anonymous4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl49 width=118 style='height:20.1pt;width:89pt'>证件造假</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_falsecard1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_falsecard2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_falsecard3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_falsecard4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>证件失效</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_failurecard1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_failurecard2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_failurecard3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_failurecard4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl49 width=118 style='height:20.1pt;width:89pt'>利用他人证件</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_otherscard1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_otherscard2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_otherscard3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_otherscard4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl53 width=118 style='height:20.1pt;width:89pt'>犯罪嫌疑人</td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_suspects1"/></td>
  <td class=xl47 width=118 style='width:89pt'><bean:write name="id_suspects2"/></td>
  <td class=xl46 width=118 style='width:89pt'><bean:write name="id_suspects3"/></td>
  <td class=xl48 width=89 style='width:67pt'><bean:write name="id_suspects4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl49 width=118 style='height:20.1pt;width:89pt'>其它情形</td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_othercase1"/></td>
  <td class=xl51 width=118 style='width:89pt'><bean:write name="id_othercase2"/></td>
  <td class=xl50 width=118 style='width:89pt'><bean:write name="id_othercase3"/></td>
  <td class=xl52 width=89 style='width:67pt'><bean:write name="id_othercase4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=3 height=26 class=xl61 width=359 style='height:20.1pt;width:270pt'>合计</td>
  <td class=xl54 width=118 style='width:89pt'><bean:write name="all_total1"/></td>
  <td class=xl39 width=118 style='width:89pt'><bean:write name="all_total2"/></td>
  <td class=xl54 width=118 style='width:89pt'><bean:write name="all_total3"/></td>
  <td class=xl55 width=89 style='width:67pt'><bean:write name="all_total4"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
</table>

</body>

</html>
