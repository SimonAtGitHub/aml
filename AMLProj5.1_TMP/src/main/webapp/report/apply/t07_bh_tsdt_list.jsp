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
<html:form method="post" action="/apply/t07_bh_tsdt_list.do">
<html:hidden property="apply_no"/>
<html:hidden property="status_cd"/>
	<div class="list">
          	<TABLE border=0 cellpadding= "2" cellspacing ="1">
          		<TR align=center class="tdhead">
					<th>业务标识号</th>
					<th>客户号</th>
					<th>大额交易特征代码</th>
					<th>大额交易发生日期</th>
					<th>申请类型</th>
					<th>申请原因</th>
				</TR>
				<logic:present name="t07_bh_tsdtList">
				<logic:iterate id="trans" name="t07_bh_tsdtList" type="com.ist.aml.report.dto.T07_bh_tsdt_p">
					<TR align="center" class="interval">
						<TD>
							<a href="#" onclick="window.open('tsdt_detail.do?ticd=<bean:write name="trans" property="ticd"/>&reportkey=<bean:write name="trans" property="reportkey"/>&tsdt_seqno=<bean:write name="trans" property="tsdt_seqno"/>&apply_type=<bean:write name="trans" property="apply_type"/>&status_cd=<bean:write name="t07_cd_applyActionForm" property="status_cd"/>','enter2','height=500,width=800,left=100,top=100,scrollbars=yes,resizable=yes');">
				          	<bean:write name="trans" property="ticd" />
				          	</a>
				        </TD>
						<TD><bean:write name="trans" property="party_id" /></TD>
						<TD><bean:write name="trans" property="stcrkey" /></TD>
						<TD><bean:write name="trans" property="tx_dt_disp" /></TD>
						<TD><bean:write name="trans" property="apply_type_disp" /></TD>
						<TD><bean:write name="trans" property="apply_reason" /></TD>
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
