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
		String downloadname = "可疑程度统计表" + nowdate;
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
<!--
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
.xl71 {
	mso-style-parent: style0;
	font-size: 10.0pt;
	text-align: right;
	border-top: none;
	border-right: .5pt solid windowtext;
	border-bottom: .5pt solid windowtext;
	border-left: .5pt solid windowtext;
}	
.xl72 {
	mso-style-parent: style0;
	font-size: 16.0pt;
	text-align: center;
	vertical-align: middle;
	border-top: none;
	border-right: .5pt solid windowtext;
	border-bottom: .5pt dashed windowtext;
	border-left: .5pt solid windowtext;
}
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

		<table border=0 cellpadding=0 cellspacing=0 width=790
			style='border-collapse: collapse; table-layout: fixed; width: 596pt'>
			<col width=154
				style='mso-width-source: userset; mso-width-alt: 6570; width: 116pt'>
			<col width=106 span=6
				style='mso-width-source: userset; mso-width-alt: 4522; width: 80pt'>
			<col width=64 span=3
				style='mso-width-source: userset; mso-width-alt: 2730; width: 48pt'>
			<tr height=33 style='mso-height-source: userset; height: 24.95pt'>
				<td colspan=22 height=33 class=xl27 width=1430 style='height:24.95pt;
					width:1078pt'>
					可疑程度统计表
				</td>
			</tr>
			<tr  height=16 style='height:16.0pt'>
				<td colspan=19 height=16  style='height:12.0pt'></td>
				<td style='border-left:none'>报送日期:</td>
				<td style='border-left:none'>
					<bean:write name="t07_inrep_bs_level" property="statistic_dt_start"
						format="yyyy-MM-dd" />
				至
					<bean:write name="t07_inrep_bs_level" property="statistic_dt_end"
						format="yyyy-MM-dd" />
				</td>
				<td style='border-left:none'>单位:份</td>
			</tr>
			<tr  height=16 style='height: 16.0pt'>
				<td rowspan=3 height=48 class=xl25 style='height: 48.0pt'>
					机构
				</td>
				<td rowspan=3 class=xl25 width=65 style='width: 49pt'>
					可疑报
					<br>
					告份数
					<span style='mso-spacerun: yes'>&nbsp;</span>
				</td>
				<td colspan=5 class=xl25 >
					重点可疑
				</td>
				<td colspan=5 class=xl25 >
					重点可疑且同时报告当地人行
				</td>
				<td colspan=5 class=xl25 >
					重点可疑且报告当地公安
				</td>
				<td colspan=5 class=xl25 >
					重点可疑且报告当地公安和人行
				</td>
				<td class=x134 style='width:2pt'></td>
			</tr>
			<tr  height=16 style='height: 16.0pt'>
				<td rowspan=2 height=32 class=xl25
					style='height: 32.0pt'>
					份数
				</td>
				<td colspan=2 class=xl25 >
					人民币
				</td>
				<td colspan=2 class=xl25 >
					外币
				</td>
				<td rowspan=2 class=xl25 >
					份数
				</td>
				<td colspan=2 class=xl25 >
					人民币
				</td>
				<td colspan=2 class=xl25 >
					外币
				</td>
				<td rowspan=2 class=xl25 >
					份数
				</td>
				<td colspan=2 class=xl25 >
					人民币
				</td>
				<td colspan=2 class=xl25 >
					外币
				</td>
				<td rowspan=2 class=xl25 >
					份数
				</td>
				<td colspan=2 class=xl25 >
					人民币
				</td>
				<td colspan=2 class=xl25 >
					外币
				</td>
				<td class=x134 style='width:2pt'></td>
			</tr>
			<tr  height=16 style='height: 16.0pt'>
				<td height=16 class=xl25
					style='height: 16.0pt'>
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=xl25 >
					笔数
				</td>
				<td class=xl25 >
					金额
				</td>
				<td class=x134 style='width:2pt'></td>
			</tr>



			<logic:iterate id="trans" name="t07_inrep_bs_levelList"
				type="com.ist.aml.inves.dto.T07_INREP_BS_level">
				<tr >
					<td class=xl33 style='height: 16.0pt'>
						<bean:write name="trans" property="organname" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="sum_mount" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="case_02" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_dc_02" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_dc_02" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_fc_02" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_fc_02" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="case_03" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_dc_03" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_dc_03" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_fc_03" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_fc_03" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="case_04" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_dc_04" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_dc_04" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_fc_04" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_fc_04" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="case_05" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_dc_05" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_dc_05" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="trans_fc_05" ignore="true" />
					</td>
					<td class=xl33 >
						<bean:write name="trans" property="amt_fc_05" ignore="true" />
					</td>
					<td class=x134 style='width:2pt'></td>
				</tr>
			</logic:iterate>
			<tr>
			 	<td colspan=22 class=x135 style='height:2pt'></td>
			 </tr>
			
		</table>

	</body>

</html>