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
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1981 style='border-collapse:
 collapse;table-layout:fixed;width:1487pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:4200;width:100pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col width=100 span=16 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <!--  <tr height=50 style='mso-height-source:userset;height:38.1pt'>
  <td height=50 class=xl24 width=98 style='height:38.1pt;width:98pt'>　</td>
  <td colspan=22 class=xl27 width=1906 style='width:1430pt'>客户重新识别</td>
  <td class=xl24 width=73 style='width:55pt'>　</td>
 </tr>-->
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td class=xl25 width=100 style='width:75pt'>客户号</td>
  <td class=xl25 width=100 style='width:75pt'>客户名称</td>
  <td class=xl25 width=100 style='width:75pt'>客户类型</td>
  <td class=xl25 width=100 style='width:75pt'>归属机构</td>
  <td class=xl25 width=100 style='width:75pt'>识别类型</td>
  <td class=xl25 width=100 style='width:75pt'>证件类型</td>
  <td class=xl25 width=100 style='width:75pt'>证件号</td>
  <td class=xl25 width=100 style='width:75pt'>状态</td>
  <td class=xl24>　</td>
 </tr>
 
 <logic:iterate id="trans" name="t10_checkparty_relist" type="com.ist.aml.cust_identify.dto.T10_checkparty">
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="party_id" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="party_chn_name" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="party_class_cd_disp" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="organname" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="recheck_type_disp" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="card_type_disp" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="card_no" ignore="true"/></td>
  <td class=xl25 width=100 style='width:75pt'><bean:write name="trans" property="party_class_cd" ignore="true"/></td>
  <td class=xl24>　</td>
 </tr>
 </logic:iterate>
 
</table>

</body>

</html>
