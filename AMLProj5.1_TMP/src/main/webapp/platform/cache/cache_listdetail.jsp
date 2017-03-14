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
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='back'){
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
			<html:form action="/cache/cache_manage_listdetail.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 系统管理 - Cache详细信息 </span>
						<bean:define id="type" name="type" scope="request" />
						<span class="buttons"> <a
							href="#" onclick="dosubmit('cache_list.do?type=<%=type%>','back');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> </span>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								对象名
							</th>
							<th>
								Key值
							</th>
							<th>
								Value值
							</th>
						</tr>

						<logic:iterate id="dto" name="cachedetail"
							type="com.ist.platform.dto.Cache_manage_dto">

							<tr>
								<td>
									<bean:write name="dto" property="cacheName" />
								</td>
								<td>
									<bean:write name="dto" property="key" />
								</td>
								<bean:define id="value" name="dto" property="value" />
								<td><%=value%></td>
							</tr>
						</logic:iterate>

					</table>
				</div>
				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>