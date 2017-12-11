<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.avp.search.Constants"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
	String contextPath = request.getContextPath();
%>

<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>

		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">

		<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
		<script language="JavaScript" src="<%=contextPath%>/js/title.js"></script>
		
		<style type="text/css">
			.exist {
				color:"#0072BC";
				margintop:3 px;
			}
			.new {
				color:"#FF0066";
				margintop:3 px;
			}
			.exist select {
				width:120;
			}
			.new select {
				width:120;
			}
			.span {
				font-family: "宋体";
				font-size: 12px;
				text-decoration: none;
				line-height: 15pt;
			}
		</style>
		
		<script language="JavaScript">
			
			var index = <c:out value="${existElementSize}" />;
			var maxElement = <c:out value="${tplaParmElmtSize}" />;
			var divId = "<%=Constants.PREVIOUS_DIV_NAME%>";
			var dotChar = "<%=Constants.DOT_CHAR%>";
			
			var addElementHtml = "<c:out value="${addElementHtml}" escapeXml="false"/>";
			var indexReplaceChar = "<%=Constants.INDEX_REPLACE_CHAR%>";
			var reg = new RegExp(indexReplaceChar,"g");
			
			var compareTypeId = "compareType";
			var tplaParmElmtId = "tplaParmElmt";
			var srchParmElmtId = "srchParmElmt";
			var parmdefvalId = "parmdefval";
			
			function saveAllParmElmts() {
				if (!saveValidate()) {
					return;
				}
				var url = "addT02_parm_elmt_relaDo.do";
				var tempParmvalkey = "";
				var tempParmelmtkey = "";
				var tempIsvalcol = "";
				var tempParmdefval = "";
				
				for (var i = 0; i < index; i++) {
					var oTplaParmElmt = document.getElementById(tplaParmElmtId + i);
					if (oTplaParmElmt == null) {
						continue;
					}
					var oCompareType = document.getElementById(compareTypeId + i);
					var oSrchParmElmt = document.getElementById(srchParmElmtId + i);
					var oParmdefval = document.getElementById(parmdefvalId + i);
					
					tempParmvalkey += oTplaParmElmt.value + dotChar;
					tempIsvalcol += oCompareType.value + dotChar;
					tempParmelmtkey += oSrchParmElmt.value + dotChar;
					tempParmdefval += oParmdefval.value + dotChar;
				}
				document.forms[0].tempParmvalkey.value = tempParmvalkey.length == 0 ? tempParmvalkey : tempParmvalkey.substr(0, tempParmvalkey.length - 1);
				document.forms[0].tempIsvalcol.value = tempIsvalcol.length == 0 ? tempIsvalcol : tempIsvalcol.substr(0, tempIsvalcol.length - 1);
				document.forms[0].tempParmelmtkey.value = tempParmelmtkey.length == 0 ? tempParmelmtkey : tempParmelmtkey.substr(0, tempParmelmtkey.length - 1);
				document.forms[0].tempParmdefval.value = tempParmdefval.length == 0 ? tempParmdefval : tempParmdefval.substr(0, tempParmdefval.length - 1);
				
				awpDoSubmit(url);
			}
			
			function saveValidate() {
				for (var i = 0; i < index; i++) {
					var oTplaParmElmt = document.getElementById(tplaParmElmtId + i);
					if (oTplaParmElmt == null) {
						continue;
					}
					var oCompareTypeId = document.getElementById(compareTypeId + i);
					var oParmdefvalElmt = document.getElementById(parmdefvalId + i);
					if (oCompareTypeId.value == "2" && oParmdefvalElmt.value.length == 0) {
						alert("值方式的传递值不能为空值！");
						return false;
					}
					
					for (var j = 0; j < index; j++) {
						var oTplaParmElmtCurrent = document.getElementById(tplaParmElmtId + j);
						if (oTplaParmElmt == null) {
							continue;
						}
						if (oTplaParmElmt != oTplaParmElmtCurrent && oTplaParmElmt.value == oTplaParmElmtCurrent.value) {
							alert("对不起，同一个模型参数只能设置一个对应关系！");
							return false;
						}
					}
				}
				return true;
			}
			
			function addParmElmtRela(){
				if (index == maxElement) {
					alert("模型所有参数已经设置，删除设置之后再添加！");
					return;
				}
				var divElementsContainer = document.getElementById("divElementsContainer");
				
				var oDiv = document.createElement("div");
				oDiv.className = "new";
				oDiv.id = divId + index;
				
				var innerHtml = addElementHtml.replace(reg, index);
				oDiv.innerHTML = innerHtml + "&nbsp;&nbsp;";
				
				// 添加删除按钮
				appendDeleteButton(oDiv);
				divElementsContainer.appendChild(oDiv);
				index ++;
			}
			
			function appendDeleteButton(oDiv) {
				var divElementsContainer = document.getElementById("divElementsContainer");
				var deleteButton = document.createElement("input");
				deleteButton.type = "button";
				deleteButton.className = "awp_button";
				deleteButton.value = "删 除";
				deleteButton.onclick = function () {
					divElementsContainer.removeChild(oDiv);
					index --;
				};
				oDiv.appendChild(deleteButton);
			}
			
			function deleteCurrentElement(id) {
				var divElementsContainer = document.getElementById("divElementsContainer");
				var oDiv = document.getElementById(id);
				divElementsContainer.removeChild(oDiv);
				index --;
			}
			
			function compareTypeChagne(id) {
				var compareValueType = "<%= Constants.COMPARE_IS_COLUMN %>";
				var oCompareType = document.getElementById(compareTypeId + id);
				var oSelect = document.getElementById(srchParmElmtId + id);
				var oText = document.getElementById(parmdefvalId + id);
				
				if (oCompareType.value == compareValueType) {
					oSelect.style.display = "inline";
					oText.style.display = "none";
				} else {
					oSelect.style.display = "none";
					oText.style.display = "inline";
				}
			}
			
			function displaySrchInfoListView() {
				var url = "t02_srch_info_list.do";
				awpDoSubmit(url);
			}
		</script>
	</head>

	<body>
		<!-- 系统总体框架，占页面宽度的98％ -->
		<div id='content'>
			<html:form method="post" action="/search/addT02_parm_elmt_rela">
				<html:hidden property="tplakey"/>
				<html:hidden property="srchengkey"/>
				<html:hidden property="srchcatekey"/>
				
				<!-- 标题区域 -->
				<div class='awp_title'>
			     	<table>
			      		<tr>
			      			<td width="23%"><span class="awp_title_td2">统一视图 －模型参数对应关系管理</span></td>
				   			<td align="right">
						        <input type="button" value="保 存" onclick="saveAllParmElmts()">
						        <input type="button" value="返 回" onClick="displaySrchInfoListView()">
								&nbsp;
			      			</td>
			      		</tr>
			     	</table>
				</div>

				<!-- 错误信息提示区 -->
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				
				<!-- 数据区 -->
				<div class='awp_list' style="marginBottom:0;overflow-y:visible">
					<table>
						<tr>
							<td>定义模型参数关系</td>
							<td align="right"><input type="button" class="botton" value="添 加" onclick="addParmElmtRela()" /></td>
						</tr>
					</table>
					<div id="divElementsContainer" align="left" style='margintop:0;table-layer:fixed; overflow:visible'>
						<c:out value="${existElementHtml}" escapeXml="false"/>
					</div>
				</div>
				
				<html:hidden property="tempParmvalkey"/>
				<html:hidden property="tempParmelmtkey"/>
				<html:hidden property="tempIsvalcol"/>
				<html:hidden property="tempParmdefval"/>
			</html:form>
		</div>
	</body>
</html>
