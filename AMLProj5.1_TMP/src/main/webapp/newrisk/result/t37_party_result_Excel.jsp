<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%

		String downloadname = (String)request.getAttribute("downloadname");
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="对公.files/filelist.xml">
<link rel=Edit-Time-Data href="对公.files/editdata.mso">
<link rel=OLE-Object-Data href="对公.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Created>1996-12-17T01:32:42Z</o:Created>
  <o:LastSaved>2012-09-07T05:20:30Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
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
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:10.0pt;
	mso-number-format:"Short Date";
	text-align:center;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:10.0pt;
	mso-number-format:"Short Date";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:10.0pt;
	mso-style-name:常规;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl49
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl51
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl52
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl54
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl55
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl57
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl58
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl59
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl60
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl61
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl62
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl63
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl64
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl65
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl66
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl74
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl89
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
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
     <x:CodeName>Sheet1</x:CodeName>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>20</x:ActiveRow>
       <x:ActiveCol>11</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=833 style='border-collapse:
 collapse;table-layout:fixed;width:625pt'>
 <col width=155 style='mso-width-source:userset;mso-width-alt:4960;width:116pt'>
 <col width=72 span=2 style='width:54pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:1984;width:47pt'>
 <col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
 <col width=72 style='width:54pt'>
 <col width=31 style='mso-width-source:userset;mso-width-alt:992;width:23pt'>
 <col width=148 style='mso-width-source:userset;mso-width-alt:4736;width:111pt'>
 <col width=72 style='width:54pt'>
 <col width=142 style='mso-width-source:userset;mso-width-alt:4544;width:107pt'>
 <tr height=19 style='height:14.25pt'>
  <td colspan=10 rowspan=3 height=57 class=xl76 width=833 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:42.75pt;width:625pt'>客户信息及洗钱风险评级表</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl31 width=155 style='height:14.25pt;width:116pt'>机构号：　　</td>
  <td colspan=4 class=xl32 width=213 style='border-right:.5pt solid black;
  border-left:none;width:160pt'><bean:write name="t10_survey_cust" property="organkey" /></td>
  <td colspan=2 class=xl31 style='border-right:.5pt solid black;border-left:none'>机构名称：</td>
  <td class=xl24 width=148 style='width:111pt'><bean:write name="t10_survey_cust" property="organname"/></td>
  <td class=xl31>编号：</td>
  <td class=xl24 width=142 style='width:107pt'><bean:write name="downloadname" /></td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=10 height=36 class=xl85 width=833 style='border-right:.5pt solid black;
  height:27.0pt;width:625pt'>客户身份信息</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>客户号</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt'><bean:write name="t10_survey_cust" property="party_id" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;border-left:none;width:165pt'>客户姓名</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write name="t10_survey_cust" property="party_chn_name" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>客户归属机构</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt' x:num><bean:write name="t10_survey_cust" property="organname" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>客户类型</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write name="t10_survey_cust" property="party_class_cd_disp" /></td>
 </tr>
 
 
 <logic:equal name="t10_survey_cust" property="party_class_cd" value="C">
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>营业执照号</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt'><bean:write property="business_licence" name="t10_survey_cust" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>营业执照到期日</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write property="licence_end_dt_disp" name="t10_survey_cust" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>组织机构代码</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt' x:num><bean:write property="organ_code" name="t10_survey_cust" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>组织机构代码到期日期</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write property="organ_code_end_dt_disp" name="t10_survey_cust" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>信用机构代码</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt' x:num><bean:write property="org_credit_no" name="t10_survey_cust" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>信用机构代码到期日期</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write property="org_credit_vt_disp" name="t10_survey_cust" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>通讯地址</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt'><bean:write property="addr1" name="t10_survey_cust" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;border-left:none;width:165pt'>联系电话</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write property="tel_no" name="t10_survey_cust" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>法人代表证件类型</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt'><bean:write property="legal_card_type" name="t10_survey_cust" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;border-left:none;width:165pt'>法人代表证件号码</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write property="legal_card_no" name="t10_survey_cust" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>法人居住地</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt'><bean:write property="legal_addr" name="t10_survey_cust" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;border-left:none;width:165pt'>法人联系方式</td>
  <td class=xl27 width=142 style='width:107pt' x:num="666666666"><bean:write property="legal_tel" name="t10_survey_cust" /></td>
 </tr>
 </logic:equal>
 
 
 <logic:equal name="t10_survey_cust" property="party_class_cd" value="I">
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>客户证件类型</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;border-left:none;width:237pt'><bean:write name="t10_survey_cust" property="card_type" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>证件到期日</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write name="t10_survey_cust" property="card_end_dt_disp" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>客户证件号</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt'><bean:write name="t10_survey_cust" property="card_no" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>客户状态</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write name="t10_survey_cust" property="party_status_cd" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>客户职业</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt' x:num><bean:write name="t10_survey_cust" property="occupation" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>客户国籍</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write name="t10_survey_cust" property="country_cd" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>通讯地址</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt'><bean:write name="t10_survey_cust" property="addr1" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>联系电话</td>
  <td class=xl27 width=142 style='width:107pt'><bean:write name="t10_survey_cust" property="tel_no" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>工作单位</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt'><bean:write name="t10_survey_cust" property="company" /></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>备忘录</td>
  <td class=xl27 width=142 style='width:107pt' x:num></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>备忘录1</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt'></td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>备忘录2</td>
  <td class=xl27 width=142 style='width:107pt' x:num></td>
 </tr>
 </logic:equal>
 
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl26 width=155 style='height:14.25pt;width:116pt'>　</td>
  <td colspan=6 class=xl32 width=316 style='border-right:.5pt solid black;
  border-left:none;width:237pt'>　</td>
  <td colspan=2 class=xl35 width=220 style='border-right:.5pt solid black;
  border-left:none;width:165pt'>　</td>
  <td class=xl27 width=142 style='width:107pt'>　</td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=10 height=31 class=xl67 style='border-right:.5pt solid black;
  height:23.25pt'>客户风险等级历史变更情况</td>
 </tr>
 
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 style='height:14.25pt;border-top:none'>评级时间</td>
  <td colspan=6 class=xl73 style='border-right:.5pt solid black'>风险等级</td>
  <td colspan=3 class=xl73 style='border-right:.5pt solid black;border-left:none'>处理意见</td>
 </tr>
 <logic:iterate id="result" name="t37_level_auditList"  type="com.ist.aml.newrisk.dto.T37_level_audit">
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl29 style='height:14.25pt' x:num="41251"><bean:write name="result" property="last_upd_dt_disp" ignore="true"/></td>
  <td colspan=6 class=xl56 style='border-right:.5pt solid black;border-left:none'><bean:write name="result" property="level_after_adjust" ignore="true"/></td>
  <td colspan=3 class=xl59 style='border-right:.5pt solid black;border-left:none'><bean:write name="result" property="adjust_reason" ignore="true"/></td>
 </tr>
 </logic:iterate>
 
 
 
 
 <tr height=19 style='height:14.25pt'>
  <td rowspan=9 height=108 class=xl36 style='border-bottom:.5pt solid black;
  height:81.0pt;border-top:none'>客户洗钱风险等级</td>
  <td colspan=6 rowspan=2 class=xl39 width=316 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:237pt' x:str="系统初评等级：  ">系统初评等级：<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;</span></td>
  <td colspan=3 rowspan=2 class=xl39 width=362 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:272pt'><bean:write name="t37_party_result" property="fristappralevel_disp" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=6 rowspan=2 height=38 class=xl39 width=316 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:28.5pt;width:237pt'>人工调整等级：</td>
  <td colspan=3 rowspan=2 class=xl39 width=362 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:272pt'><bean:write name="t37_party_result" property="emendationlevel_disp" /></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=6 rowspan=5 height=32 class=xl39 width=316 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:237pt'>确认评级等级：</td>
  <td colspan=3 rowspan=5 class=xl40 width=362 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:272pt'><bean:write name="t37_party_result" property="levelkey_disp" /></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
 </tr>
 <tr height=0 style='display:none'>
 </tr>
 <tr height=0 style='display:none'>
 </tr>
 <tr height=0 style='display:none'>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl89 style='height:14.25pt;'>评审日期</td>
  <td colspan=5 class=xl32 width=285 style='border-right:.5pt solid black;
  border-left:none;width:214pt'><bean:write name="curr_time" /></td>
  <td colspan=2 class=xl89 width=179 style='border-right:.5pt solid black;
  border-left:none;width:134pt'>评定日期</td>
  <td colspan=2 class=xl35 width=214 style='border-right:.5pt solid black;
  border-left:none;width:161pt'><bean:write name="curr_time" /></td>
 </tr>
</table>

</body>

</html>
