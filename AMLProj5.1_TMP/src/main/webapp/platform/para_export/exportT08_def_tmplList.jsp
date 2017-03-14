<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%

		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String downloadname = "风险评级积分表" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="公式表之积分.files/filelist.xml">
<link rel=Preview href="公式表之积分.files/preview.wmf">
<link rel=Edit-Time-Data href="公式表之积分.files/editdata.mso">
<link rel=OLE-Object-Data href="公式表之积分.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Created>1996-12-17T01:32:42Z</o:Created>
  <o:LastSaved>2012-07-20T03:10:44Z</o:LastSaved>
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
.xl65
	{mso-style-parent:style0;
	color:black;
	font-size:13.5pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;}
.xl66
	{mso-style-parent:style0;
	font-size:13.5pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#969696;
	mso-pattern:auto none;}
.xl67
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	vertical-align:middle;}
.xl71
	{mso-style-parent:style0;
	font-size:10.0pt;}
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
       <x:ActiveRow>18</x:ActiveRow>
       <x:ActiveCol>3</x:ActiveCol>
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
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1108 style='border-collapse:
 collapse;table-layout:fixed;width:833pt'>
 <col width=92 style='mso-width-source:userset;mso-width-alt:2944;width:69pt'>
 <col width=90 style='mso-width-source:userset;mso-width-alt:2880;width:68pt'>
 <col width=122 style='mso-width-source:userset;mso-width-alt:3904;width:92pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:2912;width:68pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:3776;width:89pt'>
 <col width=393 style='mso-width-source:userset;mso-width-alt:12576;width:295pt'>
 <col width=96 style='mso-width-source:userset;mso-width-alt:3072;width:72pt'>
 <col width=106 style='mso-width-source:userset;mso-width-alt:3392;width:80pt'>
 <tr height=30 style='height:22.5pt'>
  <td colspan=8 height=30 class=xl67 width=1108 style='border-right:.5pt solid black;
  height:22.5pt;width:833pt'>风险评级积分表</td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td height=24 class=xl65 style='height:18.0pt'>模板编码</td>
  
  <td class=xl66 style='border-left:none'>类别编码</td>
  <td class=xl66 style='border-left:none'>类别描述</td>
  <td class=xl66 style='border-left:none'>类别权重</td>
  
  <td class=xl66 style='border-left:none'>要素编码</td>
  <td class=xl66 style='border-left:none'>评级要点</td>
  <td class=xl66 style='border-left:none'>要点权重</td>
  <td class=xl66 style='border-left:none'>基准值</td>
 </tr>
 
 
 
 <logic:iterate id="template" name="template_list" type="com.ist.platform.dto.Para_export">
 <bean:define id="aa" name="template" property="templatekey" type="java.lang.String"/>
 <tr height=24 style='height:18.0pt'>
  <td class=xl70 style='height:114.0pt' x:num><bean:write  name="template" property="templatekey"/></td>
  <td colspan="7">
  	<logic:iterate id="category" name="category_List" type="com.ist.platform.dto.Para_export">
    <bean:define id="bb" name="category" property="categorykey" type="java.lang.String"/>
    <logic:equal value="<%=aa %>" name="category" property="templatekey">
    <table>
    	<tr>
    		<td class=xl70 x:num><bean:write  name="category" property="categorykey"/></td>
    		<td class=xl70><bean:write  name="category" property="category_des"/></td>
    		<td class=xl70 x:num><bean:write  name="category" property="category_occ"/></td>
    		<td colspan="4">
    			<logic:iterate id="basic" name="basic_List" type="com.ist.platform.dto.Para_export">
        		<logic:equal value="<%=bb %>" name="basic" property="categorykey">
        		<table>
        			<tr>
        				<td class=xl71 style='height:14.25pt'><bean:write  name="basic" property="basickey"/></td>
			            <td class=xl71><bean:write  name="basic" property="checkuppoint"/></td>
			            <td class=xl71 align=right x:num><bean:write  name="basic" property="basic_occ"/></td>
			            <td class=xl71 align=right x:num><bean:write  name="basic" property="base_score"/></td>
        			</tr>
        		</table>
        		</logic:equal>
        		</logic:iterate>
    		</td>
    	</tr>
    </table>
    </logic:equal>
    </logic:iterate>
  </td>
 </tr>
 </logic:iterate>
 
 
</table>

</body>

</html>
 