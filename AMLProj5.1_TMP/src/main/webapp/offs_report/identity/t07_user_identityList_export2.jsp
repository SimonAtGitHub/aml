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
<link rel=File-List href="重新识别客户.files/filelist.xml">
<link rel=Edit-Time-Data href="重新识别客户.files/editdata.mso">
<link rel=OLE-Object-Data href="重新识别客户.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Created>2012-07-12T07:52:33Z</o:Created>
  <o:LastSaved>2012-07-12T07:52:33Z</o:LastSaved>
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
	border-bottom:none;
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
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
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
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
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
	border-right:none;
	border-bottom:.5pt solid black;
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
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
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
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
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
	border-right:1.0pt solid black;
	border-bottom:none;
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
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
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
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
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
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;
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
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl53
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
.xl54
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
.xl55
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
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl57
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl58
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl59
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl60
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
.xl61
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
	border-bottom:.5pt solid black;
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
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl63
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
    <x:Name>cxsbkhtj</x:Name>
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
       <x:ActiveRow>5</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1288 style='border-collapse:
 collapse;table-layout:fixed;width:966pt'>
 <col width=123 style='mso-width-source:userset;mso-width-alt:4498;width:92pt'>
 <col width=112 span=7 style='mso-width-source:userset;mso-width-alt:4096;
 width:84pt'>
 <col width=381 style='mso-width-source:userset;mso-width-alt:13933;width:286pt'>
 <tr height=53 style='mso-height-source:userset;height:39.95pt'>
  <td colspan=6 height=53 class=xl60 width=683 style='height:39.95pt;
  width:512pt'>金融机构客户身份识别情况(重新识别客户)</td>
  <td class=xl24 width=112 style='width:84pt'>　</td>
  <td class=xl24 width=112 style='width:84pt'>　</td>
  <td class=xl24 width=381 style='width:286pt'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl25 width=123 style='height:20.1pt;width:92pt'>数据类别：</td>
  <td class=xl26 width=112 style='width:84pt'><bean:write name="type_cd"/></td>
  <td class=xl27 width=112 style='width:84pt'>数据来源：</td>
  <td class=xl28 width=112 style='width:84pt'><bean:write name="level"/></td>
  <td class=xl29 width=112 style='width:84pt'>年度：</td>
  <td class=xl26 width=112 style='width:84pt'><bean:write name="year"/></td>
  <td class=xl29 width=112 style='width:84pt'>季度：</td>
  <td class=xl30 width=112 style='width:84pt'><bean:write name="quarter"/></td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl31 width=123 style='height:20.1pt;width:92pt'>金融机构类别代码：</td>
  <td class=xl32 width=112 style='width:84pt'><bean:write name="report_organcode"/></td>
  <td class=xl33 width=112 style='width:84pt'>填报单位名称：</td>
  <td class=xl34 width=112 style='width:84pt'><bean:write name="report_orgname"/></td>
  <td class=xl35 width=112 style='width:84pt'>填报单位机构代码：</td>
  <td class=xl32 width=112 style='width:84pt'><bean:write name="report_organkey"/></td>
  <td class=xl35 width=112 style='width:84pt'>零报告标志：</td>
  <td class=xl36 width=112 style='width:84pt'><bean:write name="zero_flag"/></td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl37 width=123 style='height:20.1pt;width:92pt'>制表人：</td>
  <td class=xl38 width=112 style='width:84pt'><bean:write name="realName"/></td>
  <td class=xl39 width=112 style='width:84pt'>联系电话：</td>
  <td class=xl40 width=112 style='width:84pt'><bean:write name="telephone"/></td>
  <td class=xl41 width=112 style='width:84pt'>填报日期：</td>
  <td class=xl38 width=112 style='width:84pt'><bean:write name="reportDate"/></td>
  <td class=xl41 width=112 style='width:84pt' x:str="">　</td>
  <td class=xl42 width=112 style='width:84pt' x:str="">　</td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl43 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=8 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl43 width=123 style='height:20.1pt;width:92pt' x:str="">　</td>
  <td colspan=8 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=2 height=52 class=xl61 width=123 style='height:40.2pt;width:92pt'>重新识别原因</td>
  <td colspan=2 class=xl62 width=224 style='width:168pt'>对公客户</td>
  <td colspan=3 class=xl63 width=336 style='width:252pt'>对私客户</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl44 width=112 style='height:20.1pt;width:84pt'>总数</td>
  <td class=xl45 width=112 style='width:84pt'>涉及受益人的</td>
  <td class=xl44 width=112 style='width:84pt'>总数</td>
  <td class=xl46 width=112 style='width:84pt'>居民</td>
  <td class=xl47 width=112 style='width:84pt'>非居民</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>变更重要信息</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="changeinfo1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="changeinfo2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="changeinfo3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="changeinfo4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="changeinfo5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl52 width=123 style='height:20.1pt;width:92pt'>其中查实的</td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="info_verified1"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="info_verified2"/></td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="info_verified3"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="info_verified4"/></td>
  <td class=xl55 width=112 style='width:84pt'><bean:write name="info_verified5"/></td>

  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>行为异常</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="behavior1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="behavior2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="behavior3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="behavior4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="behavior5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl52 width=123 style='height:20.1pt;width:92pt'>其中查实的</td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="beha_verified1"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="beha_verified2"/></td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="beha_verified3"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="beha_verified4"/></td>
  <td class=xl55 width=112 style='width:84pt'><bean:write name="beha_verified5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>犯罪嫌疑人</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="suspects1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="suspects2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="suspects3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="suspects4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="suspects5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl52 width=123 style='height:20.1pt;width:92pt'>其中查实的</td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="suspe_verified1"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="suspe_verified2"/></td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="suspe_verified3"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="suspe_verified4"/></td>
  <td class=xl55 width=112 style='width:84pt'><bean:write name="suspe_verified5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>涉及可疑交易</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="suspicious1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="suspicious2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="suspicious3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="suspicious4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="suspicious5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl52 width=123 style='height:20.1pt;width:92pt'>其中查实的</td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="suspi_verified1"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="suspi_verified2"/></td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="suspi_verified3"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="suspi_verified4"/></td>
  <td class=xl55 width=112 style='width:84pt'><bean:write name="suspi_verified5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>其他情形</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="othercase1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="othercase2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="othercase3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="othercase4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="othercase5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl52 width=123 style='height:20.1pt;width:92pt'>其中查实的</td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="other_verified1"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="other_verified2"/></td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="other_verified3"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="other_verified4"/></td>
  <td class=xl55 width=112 style='width:84pt'><bean:write name="other_verified5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>合计</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="total1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="total2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="total3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="total4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="total5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl52 width=123 style='height:20.1pt;width:92pt'>查实合计数</td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="total_verified1"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="total_verified2"/></td>
  <td class=xl53 width=112 style='width:84pt'><bean:write name="total_verified3"/></td>
  <td class=xl54 width=112 style='width:84pt'><bean:write name="total_verified4"/></td>
  <td class=xl55 width=112 style='width:84pt'><bean:write name="total_verified5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl48 width=123 style='height:20.1pt;width:92pt'>留存证件失效</td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="failurecard1"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="failurecard2"/></td>
  <td class=xl49 width=112 style='width:84pt'><bean:write name="failurecard3"/></td>
  <td class=xl50 width=112 style='width:84pt'><bean:write name="failurecard4"/></td>
  <td class=xl51 width=112 style='width:84pt'><bean:write name="failurecard5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl56 width=123 style='height:20.1pt;width:92pt'>已更新数</td>
  <td class=xl57 width=112 style='width:84pt'><bean:write name="updatecard1"/></td>
  <td class=xl58 width=112 style='width:84pt'><bean:write name="updatecard2"/></td>
  <td class=xl57 width=112 style='width:84pt'><bean:write name="updatecard3"/></td>
  <td class=xl58 width=112 style='width:84pt'><bean:write name="updatecard4"/></td>
  <td class=xl59 width=112 style='width:84pt'><bean:write name="updatecard5"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
</table>

</body>

</html>
