<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<bean:define id="keys" name="keys"/>
<bean:define id="values" name="values"/>
<bean:define id="allkeys" name="allkeys"/>
<bean:define id="allvalues" name="allvalues"/>
<head>
<title>Untitled Document</title>
<script language="javascript">
orgkey=[ <%=keys%> ];
orgname=[ <%=values%> ];
//all
allorgkey=[ <%=allkeys%> ];
allorgname=[ <%=allvalues%> ];

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
    window.parent.getOrgInfo(window.parent.categoryhiddenFrame, orgkey.length, window.parent.document.all.categoryleftlist, window.parent.document.all.categoryrightlist);
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" onload="getOrgInfo()">
<html:form action="/common/category_hidden.do" method="post">
<html:hidden property="uporgankey" value="-1"/>
</html:form>
</body>
</html:html>