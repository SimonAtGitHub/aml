<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='export'){
        isSub = true;
    }
    
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
</script>
</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/function/t10_mt_download_list.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">

						<span> 元数据包下载管理 </span>
						<span class="buttons"> 
						</span>			
					</div>
					<div class="cond_c" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>数据包创建日期：</td>
								<td>
									<html:text property="create_time_start" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
									-
									<html:text property="create_time_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
								</td>
								<td></td>
								<td>
									<html:button property="button" styleClass="in_button1" value="查  询" onclick="dosubmit('t10_mt_download_list.do?newsearchflag=1','search')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								数据包名称
							</th>
							<th>
								创建时间
							</th>
							<th>
								创建人
							</th>
						</tr>
					<logic:present name="t01_mt_downloadList">
						<logic:iterate id="t01_mt_download" name="t01_mt_downloadList" type="com.ist.common.metadata.dto.T01_mt_download">
							<TR align="left">
								<TD>
									<a href="#"
											onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode(t01_mt_download.getPacket_filepath()) %>','','height=160, width=300,left=100,top=100');">
									<bean:write name="t01_mt_download" property="packetname" />
									</a>
								</TD>
								<TD><bean:write name="t01_mt_download" property="create_time" /></TD>
								<TD><bean:write name="t01_mt_download" property="create_user" /></TD>
							</TR>
						</logic:iterate>
					</logic:present>
				</table>
			</div>
			
			<div class="list_page">
						<logic:present name="pageInfo">
							<table width="98%" align="center" border="0" cellpadding="3"
								cellspacing="3">
								<tr>
									<td align="center">
									<logic:present name="pageInfo" scope="request">
										<bean:write name="pageInfo" scope="request" filter="false" />
									</logic:present>
									</td>
								</tr>
							</table>
						</logic:present>
			</div>
					
			</html:form>
		</div>
	</body>
</html>
