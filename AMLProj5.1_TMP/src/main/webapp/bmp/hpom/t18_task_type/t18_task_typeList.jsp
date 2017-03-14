<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
		//列表中"全部"/"取消"的切换
		function selectAllCheckBox(objElement,currentForm){
			var strInnerText = "";
			var isSelectAll = false;
			if(currentForm){
				for(var i=0;i<currentForm.elements.length;i++){
					var formElement = currentForm.elements[i];
					if(formElement.type=="checkbox" && !formElement.disabled){
						formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
						isSelectAll = formElement.checked;
					}						
				}
				strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
				objElement.innerText = strInnerText;
			}
		}
		function dosubmit(theUrl,param){
			var errorMsg = "";
			
			if('modify'==param){
				if(checkedNum() < 1){
					errorMsg = "请选择！";
				}
			}
			if(errorMsg==""){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        alert(errorMsg);
		        return false;
		    }
		}
		function checkedNum(){
			var form = document.forms[0];
			var num = 0;
			for (var i = 0; i < form.elements.length; i++) {
				if ((true == form.elements[i].checked) && (form.elements[i].type == "checkbox")) {
					num++;
				}
			}
			return num;
		}
	</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/t18_task_type/t18_task_type_list.do" method="post">
	<div class="conditions">
		<div class="cond_t">
			<span>设置后台计算时间</span>
			<span class="buttons"><a href="#" onclick="dosubmit('t18_task_type_modify.do','modify');"><img src="../../images/blue/b_edit.png"/>修改</a></span>
		</div>
		<div class="cond_c" id="searchtable">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>任务类型：</td>
					<td>
						<html:text property="tasktype" />
					</td>
					<td>是否延时：</td>
					<td>
						<html:select property="isflex">
							<html:options collection="isflexMap" property="label" labelProperty="value" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td>任务名称：</td>
					<td >
						<html:text property="typename" />
					</td>
					<td>任务组：</td>
					<td>
						<html:select property="typegroup">
							<html:options collection="typegroupMap" property="label" labelProperty="value" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<input type="button" name="button1" class="in_button1" value="查 询"
							onclick="dosubmit('t18_task_type_list.do?newsearchflag=1','search');" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="list">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<Th width="5%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</Th>
				<Th>任务类型</Th>
				<Th>任务组</Th>
				<Th>任务名称</Th>
				<Th>任务描述</Th>
				<Th>是否延时</Th>
				<Th>延时天数</Th>
				<Th>当日任务执行允许开始时间</Th>
				<Th>任务执行结束时间</Th>
			</TR>
			<logic:iterate id="t18_task_type" indexId="i"
				name="t18_task_typeList"
				type="com.ist.bmp.hpom.dto.T18_task_type">
				<TR>
					<TD>
						<%
							String tasktype = t18_task_type.getTasktype();
						%>
						<input type="checkbox" name="tasktypes" value=<%=tasktype %> >
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="tasktype"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="typegroup_disp"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="typename"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="typedes"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="isflex_disp"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="flex"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="starttime"/>
					</TD>
					<TD>
						<bean:write name="t18_task_type" property="endtime"/>
					</TD>
				</TR>
			</logic:iterate>
		</TABLE>
	</div>
</html:form>
</div>
</BODY>
</HTML>
