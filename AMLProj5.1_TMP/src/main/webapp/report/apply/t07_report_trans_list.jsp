<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<HTML>
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
<html:form method="post" action="/apply/t07_report_trans_list.do">
	<div class="list" >
		<TABLE border=0 cellpadding= "2" cellspacing ="1">
          		<TR align=center class="tdhead">
					<th>交易序号</th>
					<th>流水号</th>
					<th>交易日期</th>
					<th>币种</th>
					<th>交易金额</th>
					<th>验证状态</th>
				</TR>
				<logic:iterate id="trans" name="t07_report_transList" indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbs_rpdi">
					<TR align="center" class="interval">
						<TD><bean:write name="trans" property="rpdi_seqno" /></TD>
						<TD><bean:write name="trans" property="ticd" /></TD>
						<TD><bean:write name="trans" property="tstm_disp" /></TD>
						<TD><bean:write name="trans" property="crtp_disp" /></TD>
						<TD><bean:write name="trans" property="crat_disp" /></TD>
						<TD><bean:write name="trans" property="validate_ind_disp" /></TD>
					</TR>
				</logic:iterate>
        </TABLE>
	</div>
	<div class="list_page">
		<bean:write name="pageInfo" scope="request" filter="false" />
	</div>
</html:form>
</div>
</BODY>
</HTML>
