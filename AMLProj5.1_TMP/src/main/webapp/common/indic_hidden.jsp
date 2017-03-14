<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<bean:define id="indickeys" name="indickeys"/>
<bean:define id="indicvalues" name="indicvalues"/>
<bean:define id="indicallkeys" name="indicallkeys"/>
<bean:define id="indicallvalues" name="indicallvalues"/>
<head>
<title>Untitled Document</title>
<script language="javascript">
orgkey=[ <%=indickeys%> ];
orgname=[ <%=indicvalues%> ];
//all
allorgkey=[ <%=indicallkeys%> ];
allorgname=[ <%=indicallvalues%> ];

function getOkey(i){
    return orgkey[i];
}
function getOvalue(i){
    return orgname[i];
}
//all
function getAllOkey(i){
    return allorgkey[i];
}
function getAllOvalue(i){
    return allorgname[i];
}

function getOrgInfo(){
    window.parent.getOrgInfo(window.parent.indichiddenFrame, orgkey.length, window.parent.document.all.indicleftlist, window.parent.document.all.indicrightlist);
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" onload="getOrgInfo()">
<html:form action="/common/indic_hidden.do" method="post">
<html:hidden property="uporgankey" value="-1"/>
</html:form>
</body>
</html:html>