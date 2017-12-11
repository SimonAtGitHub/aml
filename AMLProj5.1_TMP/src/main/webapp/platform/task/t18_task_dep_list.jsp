<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <META http-equiv=Content-Type content="text/html; charset=GBK">
    <META content="MSHTML 6.00.2600.0" name=GENERATOR>
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script language="JavaScript" src="../../js/selectbox.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
    <SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
       document.forms[0].action=theUrl;
       document.forms[0].submit();
	}
	function init_lastPage(){
		   var buskeyEle = parent.document.getElementById('businesskey_d');
		   var diplayEle = parent.document.getElementById('tasktype_diplay');
		   var typeEle = parent.document.getElementById('tasktype_d');
		   var granudiplayEle = parent.document.getElementById('granularity_diplay');
		   var granuEle = parent.document.getElementById('granularity_d');

		   document.forms[0].last_buskeyEle.value=buskeyEle.value;
		   document.forms[0].last_diplayEle.value=diplayEle.value;
		   document.forms[0].last_typeEle.value=typeEle.value;
		   document.forms[0].last_granudiplayEle.value=granudiplayEle.value;
		   document.forms[0].last_granuEle.value=granuEle.value;
		   
		}
	
	function selectTask() {
		// var aaEle = listfrm.document.getElementById('aa');

		var val;
		var busval = "";
		var displayval = "";
		var typeval = "";
		var granudiplayEleval = "";
		var granuEleval = "";
		var buskeyEle = parent.document.getElementById('businesskey_d');
		var diplayEle = parent.document.getElementById('tasktype_diplay');
		var typeEle = parent.document.getElementById('tasktype_d');
		var granudiplayEle = parent.document
				.getElementById('granularity_diplay');
		var granuEle = parent.document.getElementById('granularity_d');
		//alert(buskeyEle);
		var elements = document.getElementsByName('selectbuskey');
		//alert(elements.length);
		var last_buskeyEle = document.forms[0].last_buskeyEle.value;
		var last_diplayEle = document.forms[0].last_diplayEle.value;
		var last_typeEle = document.forms[0].last_typeEle.value;
		var last_granudiplayEle = document.forms[0].last_granudiplayEle.value;
		var last_granuEle = document.forms[0].last_granuEle.value;

		for ( var i = 0; i < elements.length; i++) {
			//   alert("D----"+elements[i].value);
			if (elements[i].checked) {
				val = elements[i].value.split("||");

				if (busval != "") {
					busval += "," + val[0];
					displayval += "," + val[1];
					typeval += "," + val[2];
					granudiplayEleval += "," + val[3];
					granuEleval += "," + val[4];
				} else {
					if (last_buskeyEle != '') {
						busval = "," + val[0];
						displayval = "," + val[1];
						typeval = "," + val[2];
						granudiplayEleval = "," + val[3];
						granuEleval = "," + val[4];
					} else {
						busval = val[0];
						displayval = val[1];
						typeval = val[2];
						granudiplayEleval = val[3];
						granuEleval = val[4];
					}

				}
			}

			buskeyEle.value = busval;
			diplayEle.value = displayval;
			typeEle.value = typeval;
			granudiplayEle.value = granudiplayEleval;
			granuEle.value = granuEleval;
		}

		if (last_buskeyEle != '') {
			buskeyEle.value = last_buskeyEle + busval;
			diplayEle.value = last_diplayEle + displayval;
			typeEle.value = last_typeEle + typeval;
			granudiplayEle.value = last_granudiplayEle + granudiplayEleval;
			granuEle.value = last_granuEle + granuEleval;
		}

	}

	/**列表中"选择"/"全部"的切换**/
	function selectAllCheckBox(objElement, currentForm) {
		var strInnerText = "";
		var isSelectAll = false;
		if (currentForm) {
			for ( var i = 0; i < currentForm.elements.length; i++) {
				var formElement = currentForm.elements[i];
				if (formElement.type == "checkbox" && !formElement.disabled) {
					formElement.checked = objElement.innerText == "\u5168\u90e8" ? true
							: false;
					isSelectAll = formElement.checked;
				}
			}
			strInnerText = isSelectAll == true ? "\u53d6\u6d88"
					: "\u5168\u90e8";
			objElement.innerText = strInnerText;
		}
	}
</SCRIPT>
</head>

<body class="mainbg">
	<html:form method="POST" action="/t18_tasklist/t18_task_dep_list.do" >
	    <input type="hidden" name="last_buskeyEle"/>
	    <input type="hidden" name="last_diplayEle"/>
	    <input type="hidden" name="last_typeEle"/>
	    <input type="hidden" name="last_granudiplayEle"/>
	    <input type="hidden" name="last_granuEle"/>
    	<div id="main">
              <div class='conditions'>
              	<div style="display: none">
              		<span>任务依赖列表</span>
              		<span class="buttons">
              			<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
              		</span>
              	</div>
                </div>
                <div class="cond_c" style="display: none">
				<table border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
							任务类别：
						</td>
						<td>
							<html:select property="tasktype">
								<html:options collection="tasktypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
						<td>
							数据源编码：
						</td>
						<td>
							<html:select property="dskey">
								<html:options collection="dsMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							粒度：
						</td>
						<td>
							<html:select property="granularity">
								<html:options collection="granMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
						<td>
							业务编码：
						</td>
						<td>
							  <html:text property="businesskey" size="30" />
							  <input type="button" value="查 询" class="in_button1"
								onclick="dosubmit('t18_task_dep_list.do?newsearchflag=1&selfbusinesskey=<%=request.getAttribute("selfbusinesskey")%>&selftasktype=<%=request.getAttribute("selftasktype")%>&selfgranularity=<%=request.getAttribute("selfgranularity")%>');"/>
						</td>
					</tr>
				</table>
				</div>
				
				<div class='list'>
					<table>
						<tr align="center">
						<th width="5%" noWrap
							onclick='selectAllCheckBox(this,document.forms[0]);selectTask();'
							style='cursor: hand;'>
							全部
						</th>
							<th width="15%" nowrap>
								业务编码
							</th>
							<th width="15%" nowrap>
								任务类别
							</th>
							<th width="15%" nowrap>
								粒度
							</th>
							<th width="15%" nowrap>
								数据源编码
							</th>
							<!-- 
							<td width="8%" nowrap>
								是否时间依赖
							</td>
							<td width="8%" nowrap>
								是否任务依赖
							</td>
							 -->
						</tr>
						<logic:iterate id="dto" name="list"
							type="com.ist.platform.dto.T18_tasklist">
							<TR align="center">
								<TD noWrap>
								<%
								  String taskval = dto.getBusinesskey()+"||"+dto.getTasktype_disp()+"||"+dto.getTasktype()+"||"+dto.getGranularity_disp()+"||"+dto.getGranularity();
								   if("1".equals(dto.getDepflag())){
								 %>
									<input type="checkbox" checked name="selectbuskey" value="<%=taskval %>" onclick="selectTask()">
								<%}else{ %>
									<input type="checkbox"  name="selectbuskey" value="<%=taskval %>" onclick="selectTask()">
								<%} %>
								</TD>
								<TD noWrap align="left">
										<bean:write name="dto" property="businesskey" />
									</TD>
									<TD noWrap align="left">
										<bean:write name="dto" property="tasktype" /> - <bean:write name="dto" property="tasktype_disp" />
									</TD>
									<TD noWrap>
										<bean:write name="dto" property="granularity_disp" />
									</TD>
									<TD noWrap align="left">
										<bean:write name="dto" property="dskey" />
									</TD>
									<!-- 
									<TD noWrap>
										<logic:equal name="dto" property="timedepflag" value="0">
											否 
                               			</logic:equal>
                               			<logic:equal name="dto" property="timedepflag" value="1">
                               				是
                               			</logic:equal>									
									</TD>
									<TD noWrap>
										<bean:write name="dto" property="taskdepflag" />
									</TD>
									 -->
							</TR>
						</logic:iterate>
					</table>
				</div>
				
				<div class="list_page">
						<table width="98%" border="0" align="center" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
			    </div>
			</div>
        </html:form>
     <SCRIPT LANGUAGE="JavaScript"> 
     init_lastPage();selectTask();
     </SCRIPT>
</body>
</html>
