<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
	function checkForm(theUrl) {
		var errMsg = "";
		if (getLength(document.forms[0].disctype.value) == 0) {
			errMsg += "类别代码不能为空！";
			document.forms[0].disctype.focus();
		}else if (getLength(document.forms[0].disctype.value) > 10) {
			errMsg += "类别代码不能大于10个字符！";
			document.forms[0].disctype.focus();
		}else if (getLength(document.forms[0].disctypename.value) > 128) {
			errMsg += "类别名称不能大于128个字符！";
			document.forms[0].disctypename.focus();
		}else if (getLength(document.forms[0].disctypename.value) == 0) {
			errMsg += "类别名称不能为空！";
			document.forms[0].disctypename.focus();
		} else if (getLength(document.forms[0].discinfo.value) == 0) {
			errMsg += "码表内容不能为空！";
			document.forms[0].discinfo.focus();
		}
		if (errMsg != "") {
			alert(errMsg);
			return false;
		} else {
			document.forms[0].action = theUrl+"?applytype="+<%=request.getAttribute("applytype") %>;
			document.forms[0].submit();
		}
	}
	function dosubmit(theUrl){
		document.forms[0].action = theUrl;
		document.forms[0].submit();
	}
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form method="post"
			action="/t00_dict/t00_dict_add_do.do">
			<div class="conditions">
		    <!-- title -->
			<div class="cond_t">
			  <span>新建码表</span>
			  <span class="buttons">
	             <%
				   String applytype = (String)request.getAttribute("applytype");
				   if("1".equals(applytype)){
				 %>
				    <a href="#" onclick="dosubmit('t00_dict_list_by_type.do?newsearchflag=1')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
				<%}else{ %>
				    <a href="#" onclick="dosubmit('t00_dict_list_business_type.do?newsearchflag=1')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
				<%} %>
			  
			  </span>
			</div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="cond_c2">
				<table>
					<tr>
						<td>
							<font color="#FF0000">*</font>类别代码：
							<br>
						</td>
						<td>
						<logic:equal value="2" name="applytype">B</logic:equal>
							<html:text property="disctype" size="18" styleClass="text_white"></html:text>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>类别名称：
							<br>
						</td>
						<td>
							<html:text property="disctypename" size="20"
								styleClass="text_white"></html:text>
						</td>
					</tr>
				
					<tr>
						<td>
							<font color="#FF0000">*</font>码表内容：
							<br>
						</td>
						<td>
							<html:textarea property="discinfo" cols="20" rows="10"
								styleClass="text_white"></html:textarea>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
							<br>
						</td>
						<td>
							<html:button property="button" styleClass="in_button1" value="提 交"
								onclick="checkForm('t00_dict_add_do.do')" />
							<html:reset styleClass="in_button1" value="重 填" />
							<br>
						</td>
					</tr>
				</table>
			</div>
			<div class="sys_warning">
				<table>
					<tr>
						<td>
							<p>
								<strong>系统提示：</strong>
								<br>
								<ol>
									<li>
										文本域添加信息格式为码值和码值名称之间要用","逗号分割然后回车再添加下一个
										<li>
											例如 1,正常
											<br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,禁用
											<br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,删除
											<br>
								</ol>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</BODY>
</HTML>
