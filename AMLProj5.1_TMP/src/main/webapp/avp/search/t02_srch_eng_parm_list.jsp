<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.avp.search.Constants;"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
	<script src="<%=contextPath%>/js/load_window.js"></script>
</head>
<script language="JavaScript">
 //查询 提交后台
function dosubmit(theUrl) {
	 document.forms[0].action=theUrl;
     document.forms[0].submit();
}

//添加
function add(theUrl){
     document.forms[0].action=theUrl;
     document.forms[0].target='_self';
     document.forms[0].submit();
     event.srcElement.disabled = true;
}
//修改
function update(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num != 1){
		alert("只能选择一条记录");
		return false;
	}else{
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
	
}
//删除
function del(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("至少选择一条记录");
		return false;
	}else{
		if(confirm("您确定要删除所选择的信息吗？")){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}
	}
}

 </script>
<body>
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div id='content'>
		<html:form method="post" action="/search/t02_srch_eng_parm_list.do">
			<html:hidden property="srchengkey"/>
			<!-- 标题区域 -->
			<div class='awp_title'>
		    <table>
	        <tr>
			  <td width="23%"><span class="awp_title_td2">视图管理 - 视图参数列表</span></td>
			  <td align="right">
	            <input type="button" name="btnAdd" value="增 加" onclick="add('t02_srch_eng_parm_add.do');">
	            <input type="button" name="btnModify" value="修 改" onClick="update('t02_srch_eng_parm_modify.do');">
	            <input type="button" name="btnDelete" value="删 除" onClick="del('t02_srch_eng_parm_delete_do.do');">
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
			<div class='awp_list'>
				<table>
					<tr>
						<td>
							 <input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)">
						</td>
						
						<td>
							显示名称
						</td>
						<td>
							参数类型
						</td>
						<td>
							是否必输
						</td>
						<td>
							是否系统参数
						</td>
						
					</tr>
					<logic:iterate id="binfo" name="t02_srch_eng_parmList"
						type="com.ist.avp.search.dto.T02_srch_eng_parm">
						<tr>
							<td align="center">
								<html:multibox property="parmkeys">
									<bean:write name="binfo" property="parmkey" />
								</html:multibox>
							</td>
							
							<td align="left">
								<bean:write name="binfo" property="parmname" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="parmcate_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="isness_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="issysparm_disp" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
