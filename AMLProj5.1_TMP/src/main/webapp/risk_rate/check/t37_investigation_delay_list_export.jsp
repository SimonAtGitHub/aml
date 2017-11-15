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
  <o:Created>2013-04-11T08:40:26Z</o:Created>
  <o:LastSaved>2013-04-11T08:40:26Z</o:LastSaved>
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
	font-size:12.0pt;
	font-family:仿宋_GB2312, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:仿宋_GB2312, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl27
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
.xl33
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:仿宋_GB2312, monospace;
	mso-font-charset:134;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
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
    <x:Name>t47_transExcel</x:Name>
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
       <x:ActiveRow>20</x:ActiveRow>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1981 style='border-collapse:
 collapse;table-layout:fixed;width:1487pt'>
 <col width=2 style='mso-width-source:userset;mso-width-alt:73;width:2pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col width=100 span=16 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <tr height=50 style='mso-height-source:userset;height:38.1pt'>
  <td height=50 class=xl24 width=2 style='height:38.1pt;width:2pt'>　</td>
  <td colspan=19 class=xl27 width=1906 style='width:1430pt'>延期审查数据</td>
  <td class=xl24 width=73 style='width:55pt'>　</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl25 width=100 style='height:30.0pt;width:76pt'>客户号</td>
  <td class=xl25 width=100 style='width:75pt'>客户名称</td>
  <td class=xl25 width=100 style='width:75pt'>所属机构</td>
  <td class=xl25 width=100 style='width:75pt'>实际跑批日</td>
  <td class=xl25 width=100 style='width:75pt'>系统评级日期</td>
  <td class=xl25 width=100 style='width:75pt'>评级结果</td>
  <td class=xl25 width=100 style='width:75pt'>开户时间</td>
  <td class=xl25 width=100 style='width:75pt'>处理时限</td>
  <td class=xl25 width=100 style='width:75pt'>币种编辑岗柜员号</td>
  <td class=xl25 width=100 style='width:75pt'>编辑岗柜员名</td>
  <td class=xl25 width=100 style='width:75pt'>编辑岗提交时间</td>
  <td class=xl25 width=100 style='width:75pt'>审核岗柜员号</td>
  <td class=xl25 width=100 style='width:75pt'>审核柜员名</td>
  <td class=xl25 width=100 style='width:75pt'>审核时间</td>
  <td class=xl25 width=100 style='width:75pt'>审批岗柜员号</td>
  <td class=xl25 width=100 style='width:75pt'>审批岗柜员名</td>
  <td class=xl25 width=100 style='width:75pt'>审批时间</td>
  <td class=xl24>　</td>
 </tr>
 
 <logic:iterate id="result" name="t37_investigation_delay_List" type="com.ist.aml.risk_rate.dto.T37_party_resultAndT00_organAndT00_user">
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl33 width=100 style='height:30.0pt;width:76pt'><bean:write name="result" property="party_id" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="party_chn_name" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="organname" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="statisticdate" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="statistic_dt" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="fristappralevel" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="create_dt" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="dealmax_dt" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="audit_user" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="audit_realname" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="audit_dt" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="check_user" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="check_realname" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="check_dt" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="rcheck_user" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="rcheck_realname" ignore="true"/></td>
  <td class=xl33 width=100 style='width:75pt'><bean:write name="result" property="rcheck_dt" ignore="true"/></td>
  <td class=xl24>　</td>
 </tr>
 </logic:iterate>
 
</table>

</body>

</html>
