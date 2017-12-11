<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<script src="js/title.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/css_all.css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50"></td>
  </tr>
</table>
<table width="319" height="254" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/tishi1.gif">
  <tr>
    <td width="100" height="100">&nbsp;</td>
    <td height="100">&nbsp;</td>
    <td width="50" height="100">&nbsp;</td>
  </tr>
  <tr>
    <td width="100">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" class="css034"><strong><font color="B80000" face="黑体">超时</font></strong></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
        </tr>
        <tr>
          <!-- <td align="center" class="css014">您还没有登录<br>或者SESSION已经超时<BR>请<strong><a href="/login.do" target="_top">重新登录</a></strong></td> -->
          <td align="center" class="css014">SESSION已经不存在<br>或者SESSION已经超时<BR>请<strong><a href="<%=request.getContextPath()%>/login.do" target="_top">重新登录</a></strong></td>
        </tr>
      </table></td>
    <td width="50">&nbsp;</td>
  </tr>
  <tr>
    <td height="28">&nbsp;</td>
    <td height="28" valign="top">&nbsp;</td>
    <td height="28">&nbsp;</td>
  </tr>
</table>
</body>
</html>
