<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
             <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script src="../../js/title.js" ></script>
             <SCRIPT language=JavaScript src="../../js/selectbox.js" ></SCRIPT>
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script LANGUAGE="JavaScript" src="../../js/uc.js"></ script>
             <script type="text/javascript" src="../../js/jquery.js" ></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
<SCRIPT LANGUAGE="JavaScript" >
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin= "0">
<div id= "iframecontent">
<html:form method="post" action="/apply/t07_report_party_list.do">
	<div class="list">
          	<TABLE border=0 cellpadding= "2" cellspacing ="1">
          		<TR align=center class="tdhead">
					<th>客户序号</th>
					<th>客户名称</th>
					<th>客户号</th>
					<th>客户类型</th>
					<th>验证状态</th>
				</TR>
				<logic:present name="t07_report_partyList">
				<logic:iterate id="party" name="t07_report_partyList" type="com.ist.aml.pbcreport.dto.T07_nbs_ctif">
					<TR align="center" class="interval">
						<TD><bean:write name="party" property="ctif_seqno" /></TD>
						<TD><bean:write name="party" property="ctnm" /></TD>
						<TD><bean:write name="party" property="csnm" /></TD>
						<TD><bean:write name="party" property="cttp_disp" /></TD>
						<TD><bean:write name="party" property="validate_ind_disp" /></TD>
					</TR>
				</logic:iterate>
				</logic:present>
            </TABLE>
     </div>
    <div class="list_page">
		<bean:write name="pageInfo" scope="request" filter="false" />
	</div>
</html:form>
</div>
</BODY>
</HTML>
