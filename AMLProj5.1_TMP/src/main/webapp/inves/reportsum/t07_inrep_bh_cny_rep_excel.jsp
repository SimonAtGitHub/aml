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
table
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

</style>

</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1981 style='border-collapse:
 collapse;table-layout:fixed;width:2400pt'>
 <col style='mso-width-source:userset;mso-width-alt:73;width:70pt'>
 <col style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col span=16 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <tr style='mso-height-source:userset;height:38.1pt'>
  <td colspan=34 class=xl27 style='height:20pt;width:2380pt'>机构人民币大额统计表(报送)</td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
  <td colspan=30>　</td>
  <td style='width:70pt'>报送日期</td>
  <td colspan=2><%=request.getAttribute("reportDt") %></td>
  <td>单位:笔/元/美元</td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
  	<td colspan=2 rowspan=4 class=xl25 style='height:64pt;width:140pt'>机构名称</td>
  	<td colspan="16" class=xl25 style='height:16pt;width:1120pt'>单位客户</td>
	<td colspan="16" class=xl25 style='height:16pt;width:1120pt'>个人客户</td>
	<td class=x134 style='height:16pt;width:2pt'></td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
  	<td colspan="8" class=xl25 style='height:16pt;width:560pt'>系统生成</td>
	<td colspan="8" class=xl25 style='height:16pt;width:560pt'>人工新增</td>
	<td colspan="8" class=xl25 style='height:16pt;width:560pt'>系统生成</td>
	<td colspan="8" class=xl25 style='height:16pt;width:560pt'>人工新增</td>
	<td class=x134 style='height:16pt;width:2pt'></td>
 </tr>
 <tr style='mso-height-source:userset;height:16pt'>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额01</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额02</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额03</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额04</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额01</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额02</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额03</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额04</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额01</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额02</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额03</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额04</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额01</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额02</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额03</td>
	<td colspan="2" class=xl25 style='height:16pt;width:140pt'>大额04</td>
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
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
	<td class=xl25 style='height:16pt;width:70pt'>笔数</td>
	<td class=xl25 style='height:16pt;width:70pt'>金额</td>
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
 <logic:iterate id="t07_inrep_bh_cny_rep" name="inrep_list"
							indexId="i" type="com.ist.aml.inves.dto.T07_INREP_BH_cny_rep">
 <tr style='mso-height-source:userset;height:16pt'>
	<td colspan=2 class=xl33 style='height:16pt;width:140pt'><bean:write name="t07_inrep_bh_cny_rep" property="organname" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_01_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_01_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_02_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_02_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_03_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_03_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_04_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_04_sys_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_01_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_01_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_02_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_02_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_03_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_03_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_04_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_04_man_c" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_01_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_01_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_02_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_02_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_03_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_03_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_04_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_04_sys_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_01_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_01_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_02_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_02_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_03_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_03_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="trans_04_man_i" ignore="true"/></td>
	<td class=xl33 style='height:16pt;width:70pt'><bean:write name="t07_inrep_bh_cny_rep" property="amt_04_man_i" ignore="true"/></td>
	<td class=x134 style='height:16pt;width:2pt'></td>
 </tr>
 </logic:iterate>
 <tr>
 	<td colspan=34 class=x135 style='height:2pt'></td>
 </tr>
</table>

</body>

</html>
