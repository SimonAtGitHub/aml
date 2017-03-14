<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		<script language="JavaScript" src="../../js/basefunc.js"></script>	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
    <script type="text/javascript">
	function ValidateAndSubmitForm(theUrl){
      document.forms[0].action=theUrl;
	  document.forms[0].submit();
	}
	</script>
</head>

<body leftmargin="0" topmargin="0">
    <div id='content'>
        <html:form method="POST" action="/t21_rule/t03_rule_rettype_set_do.do">
         <div class="conditions">
			<div class="cond_t">
						<span>规则编辑 - 结果主体设置 </span>
						
			</div>
			<input type="hidden" name="tplakey" value="<%=request.getAttribute("tplakey") %>"/>
            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

            <div class="cond_c2">
                <table border="0" cellpadding="0" cellspacing="0">
                    
                    <tr>
                        <td align="right">
                           		 结果主体：
                        </td>
                        <td>
                            <logic:iterate id="subList" name="rtetList">
                                <logic:iterate id="subList_rows" name="subList"
                                    type="org.apache.struts.util.LabelValueBean">
                                    <html:multibox property="rtet_box">
                                        <bean:write name="subList_rows" property="label" />
                                    </html:multibox>
                                    <bean:write name="subList_rows" property="value" />
                                </logic:iterate>
                            </logic:iterate>
                        </td>
                    </tr>
                   <tr>
                        <td align="center">
                        </td>
                        <td>
                            <html:button property="button" value="提  交"
                                onclick="ValidateAndSubmitForm('t03_rule_rettype_set_do.do')" styleClass="in_button1"/>
                            <html:reset styleClass="input" value="重  填" styleClass="in_button1"/>
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </html:form>
    </div>
</body>
</html>
