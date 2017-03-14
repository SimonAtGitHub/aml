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
<link rel=File-List href="机构岗位设置.files/filelist.xml">
<link rel=Edit-Time-Data href="机构岗位设置.files/editdata.mso">
<link rel=OLE-Object-Data href="机构岗位设置.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Created>2012-07-06T03:24:59Z</o:Created>
  <o:LastSaved>2012-07-06T03:24:59Z</o:LastSaved>
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
	border:.5pt solid black;
	background:#969696;
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
	border-top:.5pt solid black;
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
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
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
	border-left:.5pt solid black;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
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
.xl30
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
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid black;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
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
.xl36
	{mso-style-parent:style0;
	color:black;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	border:.5pt solid black;}
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
    <x:Name>t07_amlpost</x:Name>
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
       <x:ActiveRow>26</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1015 style='border-collapse:
 collapse;table-layout:fixed;width:765pt'>
 <col width=118 span=5 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col width=116 style='mso-width-source:userset;mso-width-alt:4242;width:87pt'>
 <col width=1 style='mso-width-source:userset;mso-width-alt:36;width:1pt'>
 <col width=118 span=2 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <tr height=45 style='mso-height-source:userset;height:33.95pt'>
  <td colspan=6 height=45 class=xl35 width=706 style='height:33.95pt;
  width:532pt'>金融机构反洗钱机构和岗位设立情况</td>
  <td class=xl24 width=1 style='width:1pt'> </td>
  <td class=xl24 width=118 style='width:89pt'>　</td>
  <td class=xl24 width=118 style='width:89pt'>　</td>
  <td class=xl24 width=72 style='width:54pt'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl25 width=118 style='height:20.1pt;width:89pt'>数据类别：</td>
  <td class=xl26 width=118 style='width:89pt'>B</td>
  <td class=xl27 width=118 style='width:89pt'>数据来源：</td>
  <td class=xl26 width=118 style='width:89pt'>F</td>
  <td class=xl27 width=118 style='width:89pt'>年度：</td>
  <td colspan=2 class=xl26 width=117 style='width:88pt'><bean:write name="year"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl28 width=118 style='height:20.1pt;width:89pt'>填报单位类别代码：</td>
  <td class=xl29 width=118 style='width:89pt'><bean:write name="report_organkey"/></td>
  <td class=xl30 width=118 style='width:89pt'>填报单位名称：</td>
  <td class=xl29 width=118 style='width:89pt'><bean:write name="report_orgname"/></td>
  <td class=xl30 width=118 style='width:89pt' x:str="">　</td>
  <td colspan=2 class=xl36 width=117 style='width:88pt' x:str="">　</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl28 width=118 style='height:20.1pt;width:89pt'>制表人：</td>
  <td class=xl29 width=118 style='width:89pt'><bean:write name="realName"/></td>
  <td class=xl30 width=118 style='width:89pt'>联系电话：</td>
  <td class=xl29 width=118 style='width:89pt' x:str=""><bean:write name="telephone"/></td>
  <td class=xl30 width=118 style='width:89pt'>填报日期：</td>
  <td colspan=2 class=xl29 width=117 style='width:88pt'><bean:write name="reportDate"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=7 height=26 class=xl33 width=707 style='height:20.1pt;width:533pt'
  x:str="">　</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=2 height=52 class=xl34 width=140 style='height:40.2pt;width:89pt'>反洗钱机构名称（或职能部门名称）</td>
  <td colspan=3 class=xl32 width=354 style='width:267pt'>单位负责人</td>
  <td colspan=3 class=xl32 width=235 style='width:177pt'>反洗钱部门负责人</td>
  <td colspan=2 class=xl32 width=236 style='width:178pt'>反洗钱部门负责人</td>
  <td class=xl24>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl31 width=118 style='height:20.1pt;width:89pt'>姓名</td>
  <td class=xl31 width=118 style='width:89pt'>职务</td>
  <td class=xl31 width=118 style='width:89pt'>联系电话</td>
  <td class=xl31 width=118 style='width:89pt'>姓名</td>
  <td colspan=2 class=xl31 width=117 style='width:88pt'>联系电话</td>
  <td class=xl31 width=118 style='width:89pt'>专职（人数）</td>
  <td class=xl31 width=118 style='width:89pt'>兼职（人数）</td>
  <td class=xl24>　</td>
 </tr>
 <logic:iterate id="amlpost" name="t07_amlpostList"  type="com.ist.aml.offs_report.dto.T07_amlpost">
 <tr height=0 style='mso-height-source:userset;height:25pt'>
  <td width=140 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="department" ignore="true"/></td>
  <td width=118 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="organ_username" ignore="true"/></td>
  <td width=118 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="organ_position" ignore="true"/></td>
  <td width=118 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="organ_telephone" ignore="true"/></td>
  <td width=118 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="depart_username" ignore="true"/></td>
  <td width=116 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="depart_telephone" ignore="true"/></td>
  <td width=1 style='border-top:none;border-left:none'></td>
  <td width=118 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="full_time_num" ignore="true"/></td>
  <td width=118 class=xl42 style='border-top:none;border-left:none'><bean:write name="amlpost" property="part_time_num" ignore="true"/></td>
  <td width=72 style='width:54pt'></td>
 </tr>
 </logic:iterate>
</table>

</body>

</html>
