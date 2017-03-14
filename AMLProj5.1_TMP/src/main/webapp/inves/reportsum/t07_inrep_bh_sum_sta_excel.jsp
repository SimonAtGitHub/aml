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
<link rel=File-List href="jsp.files/filelist.xml">
<link rel=Edit-Time-Data href="jsp.files/editdata.mso">
<link rel=OLE-Object-Data href="jsp.files/oledata.mso">
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
	font-size:11.0pt;
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
	font-size:11.0pt;
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
	font-size:11.0pt;
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
.x134{
	border-left:.5pt solid black;
}
.x135{
	border-top:.5pt solid black;
}
-->
</style>

</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1981 style='border-collapse:
 collapse;table-layout:fixed;width:1487pt'>
 <col style='mso-width-source:userset;mso-width-alt:73;width:2pt'>
 <col style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col span=16 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <tr style='mso-height-source:userset;height:38.1pt'>
  <td colspan=10 class=xl27 style='height:20pt;width:700pt'>机构大额汇总统计表(筛选)</td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
  <td colspan=6>　</td>
  <td style='width:70pt'>筛选日期</td>
  <td colspan=2><%=request.getAttribute("reportDt") %></td>
  <td>单位:笔/元/美元</td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
  	<td colspan=2 rowspan=3 class=xl25 style='height:48pt;width:140pt'>机构名称</td>
  	<td colspan="4" class=xl25 style='height:16pt;width:280pt'>单位客户</td>
	<td colspan="4" class=xl25 style='height:16pt;width:280pt'>个人客户</td>
	<td class=x134 style='height:16pt;width:2pt'></td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>人民币</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>外币</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>人民币</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>外币</td>
	<td class=x134 style='height:16pt;width:2pt'></td>
</tr>
<tr style='mso-height-source:userset;height:16pt'>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=x134 style='height:16pt;width:2pt'></td>
	
</tr>
 <logic:iterate id="t07_inrep_bh_sum_sta" name="inrep_list"
							indexId="i" type="com.ist.aml.inves.dto.T07_INREP_BH_sum_sta">
 <tr style='mso-height-source:userset;height:16pt'>
	<td colspan=2 class=xl33 style='height:16pt;width:140pt'><bean:write name="t07_inrep_bh_sum_sta" property="organname" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="trans_dc_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="amt_dc_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="trans_fc_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="amt_fc_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="trans_dc_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="amt_dc_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="trans_fc_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_sum_sta" property="amt_fc_i" ignore="true"/></td>
	<td class=x134 style='height:16pt;width:2pt'></td>
 </tr>
 </logic:iterate>
 <tr>
 	<td colspan=10 class=x135 style='height:2pt'></td>
 </tr>
</table>

</body>

</html>
