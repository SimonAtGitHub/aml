<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.ist.platform.dto.Para_export"%> 

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String typename="";

		String downloadname ="风险评级公式表" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="参数表2.files/filelist.xml">
<link rel=Edit-Time-Data href="参数表2.files/editdata.mso">
<link rel=OLE-Object-Data href="参数表2.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Created>1996-12-17T01:32:42Z</o:Created>
  <o:LastSaved>2012-07-17T06:51:58Z</o:LastSaved>
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
	color:black;
	font-size:14.0pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;}
.xl25
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#969696;
	mso-pattern:auto none;}
.xl26
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#969696;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	
	vertical-align:middle;
	font-size:10.0pt;}
.xl28
	{mso-style-parent:style0;
	font-size:10.0pt;
	vertical-align:middle;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style0;
	font-size:10.0pt;
	vertical-align:middle;}
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
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>200</x:HorizontalResolution>
      <x:VerticalResolution>200</x:VerticalResolution>
     </x:Print>
     <x:CodeName>Sheet2</x:CodeName>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>19</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1231 style='border-collapse:
 collapse;table-layout:fixed;width:724pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:2752;width:65pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:2752;width:65pt'>
 <col width=92 style='mso-width-source:userset;mso-width-alt:2944;width:69pt'>
 <col width=125 style='mso-width-source:userset;mso-width-alt:4000;width:94pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3200;width:75pt'>
 <col width=169 style='mso-width-source:userset;mso-width-alt:5408;width:127pt'>
 <col width=92 style='mso-width-source:userset;mso-width-alt:2944;width:69pt'>
 <col width=220 style='mso-width-source:userset;mso-width-alt:7040;width:165pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3168;width:74pt'>
 <col width=121 style='mso-width-source:userset;mso-width-alt:3872;width:91pt'>
 <tr height=30 style='height:22.5pt'>
  <td colspan=10 height=30 class=xl29 width=1231 style='height:22.5pt;
  width:724pt'>风险评级公式表</td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl24 style='height:18.75pt'>模板编码</td>
  <td class=xl25 style='border-left:none;width:60pt'>公式编码</td>
  <td class=xl25 style='border-left:none;width:65pt'>风险等级</td>
  <td class=xl25 style='border-left:none;width:95pt'>公式描述</td>
  <td class=xl25 style='border-left:none;width:65pt'>公式类型</td>
  <td class=xl25 style='border-left:none;width:45pt'>粒度</td>
  <td class=xl25 style='border-left:none;width:65pt'>参数代码</td>
  <td class=xl25 style='border-left:none;width:95pt'>参数名称</td>
  <td class=xl25 style='border-left:none;width:55pt'>参数上限</td>
  <td class=xl26 style='border-left:none;width:55pt'>参数下限</td>
 </tr>
 
 <logic:iterate id="gs" name="T08_GS_BASEList" type="com.ist.platform.dto.Para_export">
  <tr>   
         <td  class=xl27><bean:write  name="gs" property="templatekey"/></td>
         <td  class=xl27><bean:write name="gs" property="gskey"/></td>
         <td  class=xl27><bean:write name="gs" property="levelkey"/></td>
         <td  class=xl27><bean:write name="gs" property="remark"/></td>
         <td  class=xl27><bean:write name="gs" property="party_type"/></td>
         <td  class=xl27><bean:write name="gs" property="granularity"/></td>
        
		          <td  class=xl27><bean:write name="gs" property="t_valparakey"/></td>
				  <td  class=xl27><bean:write name="gs" property="t_para_des"/></span></td>
				  <td  class=xl27><bean:write name="gs" property="t_upper_limit"/></td>
				  <td  class=xl27><bean:write name="gs" property="t_low_limit"/></td>
		      
       </tr>
     
     </logic:iterate>

 </table>

</body>

</html>
