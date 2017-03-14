<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.platform.dto.Para_export"%>
<%@ page import="com.ist.util.StringUtils"%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%

		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String downloadname = "金融机构反洗钱指标参数表" + nowdate;
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
 collapse;table-layout:fixed;width:924pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:2752;width:65pt'>
 <col width=127 style='mso-width-source:userset;mso-width-alt:4064;width:95pt'>
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
  width:924pt'>金融机构反洗钱指标参数一览表</td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl24 style='height:18.75pt'>规则编码</td>
  <td text-align:center class=xl25 style='border-left:none'>规则描述</td>
  <td class=xl25 style='border-left:none'>系统规则</td>
  <td class=xl25 style='border-left:none'>系统规则描述</td>
  <td class=xl25 style='border-left:none'>指标编码</td>
  <td class=xl25 style='border-left:none'>指标名称</td>
  <td class=xl25 style='border-left:none'>参数代码</td>
  <td class=xl25 style='border-left:none'>参数名称</td>
  <td class=xl25 style='border-left:none'>参数上限</td>
  <td class=xl26 style='border-left:none'>参数下限</td>
  
 </tr>
 <% HashMap  indic_val_map=(HashMap)request.getAttribute("indic_val_map"); %>
 
 <logic:iterate id="pbc" name="pbc_list" type="com.ist.platform.dto.Para_export">
 <bean:define id="aa" name="pbc" property="pbckey" type="java.lang.String"/>
 <tr height=19 style='height:14.25pt'>
  <td  class=xl30 style='height:342.0pt'><bean:write  name="pbc" property="pbckey"/></td>
  <td  class=xl30 style='width:95pt'><bean:write  name="pbc" property="pbc_des"/></td>
  <td colspan="8">
  	<logic:iterate id="rule" name="rule_List" type="com.ist.platform.dto.Para_export">
    <bean:define id="bb" name="rule" property="rulekey" type="java.lang.String"/>
    <logic:equal value="<%=aa %>" name="rule" property="pbckey">
    <table>
    	<tr>
    		<td  class=xl33><bean:write  name="rule" property="rulekey"/></td>
    		<td  class=xl28 width=125 style='width:94pt'><bean:write  name="rule" property="rule_des"/></td>
    		<td colspan="6">
    		   <% 
    		   String pbckey=pbc.getPbckey();
    		   String rulekey=rule.getRulekey();
    		   if(indic_val_map.get(pbckey+rulekey)!=null){
    		   ArrayList indic_val_List=(ArrayList)indic_val_map.get(pbckey+rulekey);
    		   for(int i=0;i<indic_val_List.size();i++){
    		     Para_export indic=(Para_export)indic_val_List.get(i);
    		    
    		    %>
    		
        		<table>
        			<tr>
        				<td class=xl27><%=StringUtils.null2String(indic.getIndickey()) %></td>
			            <td class=xl27><%=StringUtils.null2String(indic.getIndicname()) %></td>
			            <td class=xl27><%=StringUtils.null2String(indic.getValparakey()) %></td>
			            <td class=xl27><%=StringUtils.null2String(indic.getPara_des()) %></td>
			            <td class=xl27><%=StringUtils.null2String(indic.getUpper_limit()) %></td>
			            <td class=xl27><%=StringUtils.null2String(indic.getLow_limit()) %></td>
        			</tr>
        		</table>
        	
        		<% 
        		}
        		}%>
        		
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
