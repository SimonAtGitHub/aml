<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script type="text/javascript">
function dosubmit(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	
}
</script>
</HEAD>
<BODY id="iframecontent">
<html:form action="/cust_identify/t10_checkparty_resultlist.do" method="post">

  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
	  <th>结论编号</th>
	  <th>调查机构</th>
	  <th>识别类型</th>
	  <th>调查结论</th>
	  <th>调查途径</th>
	  <th>结论有效期</th>
      <th>调查日期</th>
      <th>调查人</th>
	 </tr>
    <logic:iterate id="party_relt" name="t10_party_reltlist" indexId="i" type="com.ist.aml.cust_identify.dto.T10_checkparty_fun">
    <tr>
     
       <td>
         <a href="#" onclick="window.open('t10_checkparty_reltdisp.do?check_no=<bean:write name="party_relt" property="check_no" scope="page" />','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><bean:write name="party_relt" property="check_no" scope="page" /></a>
       </td>
	     <td>
         <bean:write name="party_relt" property="checker_org_name" scope="page" />
       </td>
	     <td>
         <bean:write name="party_relt" property="check_type_disp" scope="page" />
       </td>
        <td>
         <bean:write name="party_relt" property="check_result_disp" scope="page" />
       </td> 
       <td>
         <bean:write name="party_relt" property="check_method_disp" scope="page" />
       </td>
        <td>
         <bean:write name="party_relt" property="valid_dt_disp" scope="page" />
       </td>
       <td>
         <bean:write name="party_relt" property="check_dt_disp" scope="page" />
       </td>
        <td>
         <bean:write name="party_relt" property="checker" scope="page" />
       </td>

    </tr>
	</logic:iterate>
	</table>
  </div>
</html:form>
<div class="list_page">
			<logic:present name="pageInfo">
				<table width="98%" align="center" border="0" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</logic:present>
</div> 
</body>
</html>