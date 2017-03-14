<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40" />
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String downloadname = "督办信息列表" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="aa.files/filelist.xml">
<link rel=Edit-Time-Data href="aa.files/editdata.mso">
<link rel=OLE-Object-Data href="aa.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>dunkee</o:Author>
  <o:LastAuthor>微软用户</o:LastAuthor>
  <o:LastPrinted>2007-11-16T07:12:53Z</o:LastPrinted>
  <o:Created>2007-11-16T07:05:37Z</o:Created>
  <o:LastSaved>2011-05-25T06:04:19Z</o:LastSaved>
  <o:Company>longtop</o:Company>
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
	font-size:12.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl27
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt dashed windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt dashed windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dashed windowtext;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dashed windowtext;
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
    <x:Name>数据</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>10</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9720</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>240</x:WindowTopX>
  <x:WindowTopY>75</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1175 style='border-collapse:
 collapse;table-layout:fixed;width:885pt'>
 <col width=9 style='mso-width-source:userset;mso-width-alt:329;width:7pt'>
 <col width=194 style='mso-width-source:userset;mso-width-alt:7094;width:146pt'>
 <col width=73 span=10 style='mso-width-source:userset;mso-width-alt:2669;
 width:55pt'>
 <col width=87 style='mso-width-source:userset;mso-width-alt:3181;width:65pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=82 style='mso-width-source:userset;mso-width-alt:2998;width:62pt'>
 <col width=80 span=241 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl24 width=9 style='height:26.25pt;width:7pt'></td>
  <td colspan=8 class=xl25 width=1166 style='width:878pt'>督办信息列表</td>
 </tr>
 <tr height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 colspan=2 class=xl24 style='height:11.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl26>　</td>
  <td colspan=5 class=xl26>　</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl24 style='height:15.0pt'></td>
  <td class=xl27 width=194 style='width:146pt'>机构</td>
  <td class=xl28 width=73 style='border-left:none;width:80pt'>数据日期</td>
  <td class=xl28 width=73 style='border-left:none;width:80pt'>交易日期</td>
  <td class=xl28 width=73 style='border-left:none;width:55pt'>数据类型</td>
  <td class=xl28 width=73 style='border-left:none;width:55pt'>客户类型</td>
  <td class=xl28 width=73 style='border-left:none;width:55pt'>需补录</td>
  <td class=xl28 width=73 style='border-left:none;width:55pt'>已补录</td>
  <td class=xl28 width=73 style='border-left:none;width:55pt'>未补录</td>
  
 </tr>
 <logic:iterate id="t07_supervise_msg" name="t07_supervise_msgList" type="com.ist.aml.information.dto.T07_Supervise_msg">
  <tr height=32 style='height:24.0pt'>
  <td height=32 style='height:24.0pt'></td>
  <td class=xl30 width=194 style='border-top:none;width:146pt'><bean:write name="t07_supervise_msg" property="msg_org_name"/></td>
  <td class=xl31 width=73 style='border-top:none;border-left:none;width:80pt'><bean:write name="t07_supervise_msg" property="create_dt_disp"/></td>
  <td class=xl31 width=73 style='border-top:none;border-left:none;width:80pt'><bean:write name="t07_supervise_msg" property="tx_dt_disp"/></td>
  <td class=xl31 width=73 style='border-top:none;border-left:none;width:55pt'><bean:write name="t07_supervise_msg" property="case_type_s"/></td>
  <td class=xl31 width=73 style='border-top:none;border-left:none;width:55pt'><bean:write name="t07_supervise_msg" property="party_class_cd_s"/></td>
  <td class=xl31 width=73 style='border-top:none;border-left:none;width:55pt'><bean:write name="t07_supervise_msg" property="total_num"/></td>
  <td class=xl31 width=87 style='border-top:none;border-left:none;width:65pt'><bean:write name="t07_supervise_msg" property="oper_num"/></td>
  <td class=xl31 width=73 style='border-top:none;border-left:none;width:55pt'><bean:write name="t07_supervise_msg" property="nooper_num"/></td>
 </tr>
 </logic:iterate>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=9 style='width:7pt'></td>
  <td width=194 style='width:146pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=82 style='width:62pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>