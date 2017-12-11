<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
培训记录
</logic:equal>
<logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
宣传记录
</logic:equal>
<logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
内控制度
</logic:equal>
<logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
内部审计
</logic:equal>
<logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
打击洗钱活动情况
</logic:equal>
</html>