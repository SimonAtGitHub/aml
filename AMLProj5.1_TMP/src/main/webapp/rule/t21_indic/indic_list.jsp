<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

<script language="JavaScript">
function dosubmit(theUrl){
	 
    　　  document.forms[0].action=theUrl;
      document.forms[0].submit();
}
function _Commit(theUrl){

	errMsg = CheckBoxMustChecked(document.forms[0]);
	

    if(errMsg!='')
    {
    	alert(errMsg);
        return false;
    }
           
	else{
		// document.forms[0].action=theUrl;
      	//document.forms[0].submit();
      	//添加行
      	var length=document.forms[0].indickey1.length;
      	if(length>1){
      	   for(i=0;i<length;i++){
      	     if(document.forms[0].indickey1[i].checked){
      	       var value=document.forms[0].indickey1[i].value;
      	       var values=value.split("-");
      	       window.parent.document.forms[0].hid_indickey.value=values[0];
      	       window.parent.document.forms[0].hid_indicname.value=values[1];
      	       window.parent.document.forms[0].hid_indic_attr.value=values[2];
      	       window.parent.addrow();
      	     }
      	   }
      	}else{
      	   var value=document.forms[0].indickey1.value;
      	       var values=value.split("-");
      	       window.parent.document.forms[0].hid_indickey.value=values[0];
      	       window.parent.document.forms[0].hid_indicname.value=values[1];
      	       window.parent.document.forms[0].hid_indic_attr.value=values[2];
      	       window.parent.addrow();
      	}
      	
   	 	 window.parent.ymPrompt.close();
   }
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<html:form action="/t21_indic/indic_search.do" method="post">
			<input type="hidden" name="input_name"
					value="<%=(String) request.getAttribute("input_name")%>" />
				<div class="conditions">
					<div class="cond_t">
						<span>指标表维护 </span>
						<span class="buttons">
						<a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/blue/b_shut.png" />关闭</a>
	  					<a href="#" onclick="javascript:_Commit('indic_search_result.do?rulekey=<%=(String)request.getAttribute("rulekey")%>');"><img src="../../images/blue/b_choose.png" />选定</a>
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									指标编码：
								</td>
								<td>
									<html:text property="indickey" size="24" maxlength="12" />
								</td>
								<td>
									指标名称：
								</td>
								<td>
									<html:text property="indicname_str" size="24" maxlength="12" />
								</td>
								<td>
									<html:button property="button3" value="查 询" styleClass="in_button1" onclick="dosubmit('indic_search.do?newsearchflag=1&dispatcher=checkbox')" />
									<html:hidden property="indickey" />
									</td>
								</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
							<th>
								选择
							</th>


							<th>
								指标编码
							</th>


							<th>
								指标名称
							</th>
							<th>
								指标类型
							</th>

							<th>
								计算频度
							</th>



						</TR>
						<logic:iterate id="indic" name="t21_indicList" indexId="i"
							type="com.ist.aml.rule.dto.T21_indic">
							<TR>
								<td>
									<html:multibox property="indickey1">
										<bean:write name="indic" property="indickey" />-<bean:write name="indic" property="indicname" />-<bean:write name="indic" property="indic_attr" />
									</html:multibox>
								</td>
								<TD>
									<bean:write name="indic" property="indickey" />
								</TD>
								<TD>
									<bean:write name="indic" property="indicname" scope="page" />
								</TD>
								<TD>
									<bean:write name="indic" property="indic_attr_disp" scope="page" />
								</TD>
								
								<TD>
									<bean:write name="indic" property="granularitys" scope="page" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
			<!--提示块-->
		</div>
	</BODY>
</HTML>
