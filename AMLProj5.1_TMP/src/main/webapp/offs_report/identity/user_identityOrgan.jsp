<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function  dosubmit(url){
	   
	   document.forms[0].action=url;
	   document.forms[0].submit();
	}
	</script>
</head>
<body class="mainbg">
<html:form action="/identity/urgeSearchOrgan.do" method="post">
<div id="main">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>机构详情</span> 
	  <span class="buttons">
	  <a href="javascript:window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a> 
	 </span>
 	</div>
   <div class="list">
	  <table>
	   <tr>
         <th>机构代码</th>
         <th>机构名称</th>
         <th>机构负责人</th>
         <th>联系电话</th>
       </tr>
   <logic:present name="organList" >
    <logic:iterate id="user_identity" name="organList" type="com.ist.aml.offs_report.dto.T07_user_identityUrge">
     <tr> 
      <td><bean:write name="user_identity" property="organkey" /></td>
      <td><bean:write name="user_identity" property="organname" /></td>
      <td><bean:write name="user_identity" property="organmanager" /></td>
      <td><bean:write name="user_identity" property="telephone" /></td>
     </tr>
    </logic:iterate>
   </logic:present>
      </table>
  </div>
	<div class="list_page">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
     </div>
</div>
</div>
</html:form>
</body>
</html>
