<%@ page contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new Date());
		String downloadname = "上报交易导出列表" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
	 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="asda.files/filelist.xml">
<link rel=Edit-Time-Data href="asda.files/editdata.mso">
<link rel=OLE-Object-Data href="asda.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Created>1996-12-17T01:32:42Z</o:Created>
  <o:LastSaved>2011-05-26T02:00:39Z</o:LastSaved>
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
	font-size:22.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
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
     <x:CodeName>Sheet1</x:CodeName>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=914 style='border-collapse:
 collapse;table-layout:fixed;width:685pt'>
 <col width=72 style='width:54pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3040;width:71pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:2912;width:68pt'>
 <col width=100 span=2 style='mso-width-source:userset;mso-width-alt:3200;
 width:75pt'>
 <col width=111 span=2 style='mso-width-source:userset;mso-width-alt:3552;
 width:83pt'>
 <col width=120 style='mso-width-source:userset;mso-width-alt:3840;width:90pt'>
 <col width=114 style='mso-width-source:userset;mso-width-alt:3648;width:86pt'>
 <tr height=58 style='mso-height-source:userset;height:43.5pt'>
  <td height=58 width=72 style='height:43.5pt;width:54pt'></td>
  <td colspan=23 class=xl24 width=842 style='width:631pt'>上报交易信息表</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 style='height:15.0pt'></td>
  <td class=xl25 style='border-top:none'>交易号</td>
   <td class=xl25 style='border-top:none;border-left:none'>报告号</td>
    <td class=xl25 style='border-top:none;border-left:none'>交易日期</td>
  <td class=xl25 style='border-top:none;border-left:none'>报送机构号</td>
  <td class=xl25 style='border-top:none;border-left:none'>机构名称</td>
   <td class=xl25 style='border-top:none;border-left:none'>交易机构号</td>
  <td class=xl25 style='border-top:none;border-left:none'>客户号</td>
  <td class=xl25 style='border-top:none;border-left:none'>客户名称</td>
  <td class=xl25 style='border-top:none;border-left:none'>币种</td>
  <td class=xl25 style='border-top:none;border-left:none'>金额</td>
  <td class=xl25 style='border-top:none;border-left:none'>交易类型</td>
  <td class=xl25 style='border-top:none;border-left:none'>交易对手姓名/名称</td>
  <td class=xl25 style='border-top:none;border-left:none'>交易对手账户类型</td>
  <td class=xl25 style='border-top:none;border-left:none'>交易对手账号</td>
  <td class=xl25 style='border-top:none;border-left:none'>交易对手身份证件/证明文件类型</td>
  <td class=xl25 style='border-top:none;border-left:none'>交易对手身份证件/证明文件号码</td>
  <td class=xl25 style='border-top:none;border-left:none'>业务标示号</td>
  <td class=xl25 style='border-top:none;border-left:none'>资金收付标志</td>
  <td class=xl25 style='border-top:none;border-left:none'>资金来源用途</td>
  <td class=xl25 style='border-top:none;border-left:none'>代办人姓名</td>
  <td class=xl25 style='border-top:none;border-left:none'>代办人身份证件/证明文件类型</td>
  <td class=xl25 style='border-top:none;border-left:none'>代办人身份证件/证明文件号码</td>
  <td class=xl25 style='border-top:none;border-left:none'>代办人国籍</td>

 </tr>
 <logic:iterate id="trans" name="list"  type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="ticd" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="reportkey" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tstm_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="finc" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="finn" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="organKey" scope="page"/></td>

  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="csnm" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="ctnm" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="crtp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="crcd_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tstp" scope="page"/></td>
  
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tcnm" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tcat" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tcac" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tcit" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tcid" scope="page"/></td>
  
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="ticd" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tsdr_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="crpp" scope="page"/></td>
  
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tbnm" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tbit" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tbid" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans"  property="tbnt" scope="page"/></td>
 </tr>
 </logic:iterate>


</table>

</body>

</html>
