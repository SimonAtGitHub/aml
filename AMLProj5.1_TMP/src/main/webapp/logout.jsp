<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<script src="js/title.js"></script>
<script type="text/javascript">
	window.close();
	window.location.href = 'login.do';
</script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK REL="stylesheet" TYPE="text/css" HREF="css/css_all.css">
</head>

<body bgcolor="CBC9C9" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6" align="center"> <table width="600" border="0" cellpadding="0" cellspacing="1" bgcolor="#000000">
        <tr>
          <td valign="top" bgcolor="E5EEF7">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="18" align="right"><img src="images/bank_login_01.gif" width="598" height="18"></td>
              </tr>
              <tr>
                <td height="65" align="center"><img src="images/logo_ist_little.jpg" width="250" height="60"></td>
              </tr>
              <tr>
                <td height="80" align="center"><strong><font color="CC0000" size="4">你已经成功地退出!</font></strong></td>
              </tr>
              <tr>
                <td height="60" align="center" valign="top" class="css014">感谢您使用<bean:message key="system.info.name.zh"/></td>
              </tr>
              <tr>
              <%
              String url = request.getContextPath();
              String loginurl=url+"/login.do";
               %>
                <td height="71" align="center" valign="top"><span class="css014">你可以再次</span><a href=<%=loginurl%> class="blue2"><font size="6">登录</font></a></td>
              </tr>
              <tr>
                <td height="40" align="center">
                <bean:message key="system.info.companyname.zh"/> <bean:message key="system.info.rights.zh"/><br>
                <bean:message key="system.info.copyright.en"/> <bean:message key="system.info.companyname.en"/> <bean:message key="system.info.rights.en"/></td>
              </tr>
            </table>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>

