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
<link rel=File-List href="jsp.files/filelist.xml">
<link rel=Edit-Time-Data href="jsp.files/editdata.mso">
<link rel=OLE-Object-Data href="jsp.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Created>2007-11-02T14:04:46Z</o:Created>
  <o:LastSaved>2012-09-12T02:47:40Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:DownloadComponents/>
  <o:LocationOfComponents HRef="file:///C:\DOCUME~1\IBM_USER\LOCALS~1\Temp\Rar$EX00.234\"/>
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
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
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
    <x:Name>t07_nbs_trans_report</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>240</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>25</x:ActiveRow>
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
  <td colspan=11 height=39 class=xl28 width=1381 style='border-right:.5pt solid black;
  height:29.25pt;width:1038pt'>客户风险评级信息</td>
 </tr>
 <tr class=xl27 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl32 width=105 style='height:22.5pt;width:85pt'>客户号</td>
  <td class=xl33 width=140 style='width:150pt'>客户名称</td>
  <td class=xl38 width=230 style='border-top:none;border-left:none;width:173pt'>客户归属机构</td>
  <td class=xl38 width=102 style='border-top:none;border-left:none;width:77pt'>对公/对私</td>
  <td class=xl39 width=113 style='border-top:none;border-left:none;width:85pt'>系统评级结果</td>
  <td class=xl38 width=91 style='border-top:none;border-left:none;width:85pt'>系统评级日期</td>
  <td class=xl40 style='border-top:none;border-left:none'>是否人工调整</td>
  <td class=xl38 width=146 style='border-top:none;border-left:none;width:110pt'>当前风险等级</td>
  <td class=xl38 width=125 style='border-top:none;border-left:none;width:94pt'>模板类型</td>
  <td class=xl40 style='border-top:none;border-left:none'>开户日期</td>
 </tr>
 
 <logic:iterate id="result" name="tempList"  type="com.ist.aml.risk_rate.dto.T37_party_result">
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
   <td height=30 class=xl34 width=105 style='height:22.5pt;width:85pt'><bean:write name="result" property="party_id" /></td>
  <td class=xl34 width=140 style='border-left:none;width:150pt'><bean:write name="result" property="party_chn_name" /></td>
  <td class=xl34 width=230 style='border-top:none;border-left:none;width:173pt'><bean:write name="result" property="organ_name" /></td>
  <td class=xl34 width=102 style='border-top:none;border-left:none;width:77pt'><bean:write name="result" property="party_class_cd_disp" /></td>
  <td class=xl34 width=113 style='border-top:none;border-left:none;width:85pt'><bean:write name="result" property="fristappralevel_disp" /></td>
  <td class=xl34 width=91 style='border-top:none;border-left:none;width:85pt'><bean:write name="result" property="statistic_dt_disp" /></td>
  <td class=xl34 style='border-top:none;border-left:none'><bean:write name="result" property="modify_cd_disp" /></td>
  <td class=xl34 width=146 style='border-top:none;border-left:none;width:110pt'><bean:write name="result" property="levelkey_disp" /></td>
  <td class=xl34 width=125 style='border-top:none;border-left:none;width:94pt'><bean:write name="result" property="temptype_disp" /></td>
  <td class=xl39 width=113 style='border-top:none;border-left:none;width:85pt'><bean:write name="result" property="create_dt_disp" /></td>
 </tr>
 </logic:iterate>
 
 <tr height=16 style='height:12.0pt'>
  <td height=16 class=xl25 style='height:12.0pt'></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl24 width=146 style='width:110pt'></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
</table>

</body>

</html>
