<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl){
	if(checkRadio(document.forms[0].selectedStcrkey)<0){
        alert("请选择！");
        return false;
 }else{
     document.forms[0].action=theUrl;
     document.forms[0].submit();
     
     var obj = window.parent;
 }
}

function _Commit(theUrl){
	
    if(checkRadio(document.forms[0].selectedStcrkey)<0){
           alert("请选择！");
           return false;
    }
    else{
    	document.forms[0].action=theUrl;
	    document.forms[0].submit();
   	 	window.parent.ymPrompt.close();
   }
}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/module/t23_module_stcr_search.do" method="post">
		<html:hidden property="module_no"/>
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
					  <span>模板规则信息</span>
					  <span class="buttons">
					    <a href="#" onclick="dosubmit('t23_module_stcr_search_result.do');return false"><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />选 定</a>
	                    <a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />关 闭</a>
					  </span>
					</div>
				</div>


				<div class="list">
					<table>
						<tr>
							<th>
								选择
							</th>
							<th>
								特征码
							</th>
							<th>
								特征名称
							</th>
						</tr>
						<logic:iterate id="t21_pubcrule" name="t23_module_stcrList"
							type="com.ist.mfa.dto.T23_module_stcr">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("keystcr", t21_pubcrule.getKeystcr());
										pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<html:multibox property="selectedStcrkey">
										<bean:write name="t21_pubcrule" property="keystcr" />
									</html:multibox>
								</td>
								<td align="center" nowrap>
									<bean:write name="t21_pubcrule" property="keystcr"
										scope="page" />
								</td>
								<td align="center" nowrap>
									<bean:write name="t21_pubcrule" property="pbc_des"
										scope="page" />
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
           </div>
		</html:form>
	</body>
</html>