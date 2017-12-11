<%@ page contentType="text/html; charset=GBK"%>
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
         <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script language="JavaScript" src="<%=contextPath%>/js/prototype.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		
		<script type="text/javascript">
			function modifyDo() {
				if (checkform()) {
					awpDoSubmit('t02_tp_cus_action_modify_do.do');
				}
			}
		</script>
	</head>

	<body>
		<!-- 系统总体框架，占页面宽度的98％ -->
		<div id='content'>
			<html:form method="post" action="/template/t02_tp_cus_action_add.do">
				<html:hidden property="actionkey"/>
				<html:hidden property="tplakey"/>
				<html:hidden property="disptype" value="1"/>
				<!-- 标题区域 -->
				
				<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模型管理-修改自定义动作</span></td>
						<td align="right">
							<input type="button" value="保 存" onClick="modifyDo()">
								<input type="button" value="返 回" onClick="awpDoSubmit('t02_tp_cus_action_list.do')">
								
					</tr>
				</table>
			</div>      
				<!-- 错误信息提示区 -->
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<!-- 数据区 -->
				<div class='awp_detail'>
					<table>
						<tr>
							<td nowrap><font color="#FF3300">*</font>动作名称：</td>
							<td>
								<html:text property="actionname" minlength="1" maxlength="64" warning="动作名称" size="20"></html:text>
							</td>
						</tr>
						<tr>
							<td nowrap><font color="#FF3300">*</font>动作地址：</td>
							<td>
								<html:text property="actionurl" minlength="1" maxlength="512" warning="动作地址" size="70"></html:text>
							</td>
						</tr>
						<tr>
							<td nowrap><font color="#FF3300">*</font>位置类型：</td>
							<td>
								<html:select property="locatetype">
									<html:options dictcode="T12303" property="label" labelProperty="value" optional="false"/>
								</html:select>
							</td>
						</tr>
						<tr>
							<td nowrap><font color="#FF3300">*</font>提交类型：</td>
							<td>
								<html:select property="submittype"  onchange="checkSubmitType()">
									<html:options dictcode="T12304" property="label" labelProperty="value" optional="false"/>
								</html:select>
							</td>
						</tr>
						<tr id="widthTr">
							<td nowrap>窗口宽度：</td>
							<td>
								<html:text property="width" maxlength="6" warning="窗口宽度" styleClass="awp_number"></html:text>
							</td>
						</tr>
						<tr id="heightTr">
							<td nowrap>窗口高度：</td>
							<td>
								<html:text property="height" maxlength="6" warning="窗口高度" styleClass="awp_number"></html:text>
							</td>
						</tr>
						<tr>
							<td nowrap>显示顺序：</td>
							<td>
								<html:text property="dispseq" maxlength="6" warning="显示顺序" styleClass="awp_number" size="5"></html:text>
							</td>
						</tr>
						<tr>
							<td nowrap><font color="#FF3300">*</font>动作脚本：</td>
							<td>
								<html:textarea property="scriptcd" cols="80" rows="8"  minlength="1" maxlength="4000" warning="动作脚本"></html:textarea>
							</td>
						</tr>
						<tr>
							<td nowrap>备注：</td>
							<td>
								<html:textarea property="descn" cols="80" rows="5" maxlength="512" warning="备注"></html:textarea>
							</td>
						</tr>
					</table>
				</div>
			</html:form>
			
			<!--数据提示区-->
	     	<div class='awp_msgtab'>
			  	<table>
			   		<tr>
			    		<td>系统提示：</td>
			    		<td>动作脚本的方法名称不能修改，必须要有返回值，返回值类型为Boolean。</td>
			   		</tr>
			  	</table>		
		    </div> 
		</div>
	</body>
	
	<script type="text/javascript">
		function checkSubmitType() {
			if ($("submittype").value == "" || $("submittype").value == "1") {
				$("widthTr").style.display="none";
				$("heightTr").style.display="none";
			} else {
				$("widthTr").style.display="";
				$("heightTr").style.display="";
			}
		}
		checkSubmitType();
	</script>
</html>
