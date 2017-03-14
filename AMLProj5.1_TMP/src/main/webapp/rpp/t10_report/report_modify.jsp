<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
	<head>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
    function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
    }
    
	function checkForm(theUrl){
	    var errMsg ="";
	    /**if(getLength(document.forms[0].reportkey.value)==0){
	        errMsg="报表编号不能为空！";
	        document.forms[0].reportkey.focus();
	    }else if(getLength(document.forms[0].reportkey.value)!=6){
	        errMsg="报表编号必须为6位！";
	        document.forms[0].reportkey.focus();
	    }*/
	    if(getLength(document.forms[0].reportname.value)==0){
	        errMsg="报表名称不能为空！";
	        document.forms[0].reportname.focus();
	    }else if(getLength(document.forms[0].reportname.value)>64){
	        errMsg="报表名称不能多于64个字符！";
	        document.forms[0].reportname.focus(); 
	    }else if(getLength(document.forms[0].parampage.value)==0){
	        errMsg="条件页面不能为空！";
	        document.forms[0].parampage.focus();
	    } else if(getLength(document.forms[0].tplsheet_name.value)==0){
	        errMsg="模板名称不能为空！";
	        document.forms[0].tplsheet_name.focus();
	    }else if(getLength(document.forms[0].tplsheet_name.value)> 256){
	        errMsg="模板名称不能多于256个字符！";
	        document.forms[0].tplsheet_name.focus();
	    }else if(getLength(document.forms[0].reportdes.value)> 256){
	        errMsg="报表描述不能多于256个字符！";
	        document.forms[0].reportdes.focus();
	    } 
	 
	    if(errMsg ==""){
	    	var datavalue = '<bean:write name="t10_reportActionForm" property="datatpl_file"/>';
	      	if(datavalue == "" && document.forms[0].data_file.value == ""){
	    		errMsg="数据模板不能为空！";
	    	}else if(document.forms[0].data_file.value != ""){
	    		var val = document.forms[0].data_file.value;
	    		var type = val.substring(val.lastIndexOf("."),val.length);
	    		if(type!=".xml"){
	    			errMsg="数据模板必须为xml文件！";
	    		}
	    	}
	    	
	    }
	    if(errMsg ==""){
	    	var excelvalue = '<bean:write name="t10_reportActionForm" property="exceltpl_file"/>';
	    	if(excelvalue == "" && document.forms[0].excel_file.value == ""){
	    		 errMsg="展现模板不能为空！";
	    	}else if(document.forms[0].excel_file.value != ""){
	    		var val = document.forms[0].excel_file.value;
	    		var type = val.substring(val.lastIndexOf("."),val.length);
	    		if(type!=".xls" && type!=".xlsx"){
	    			errMsg="展现模板必须为excel文件！";
	    		}
	    	}
	    	
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	function showFile(theUrl){
	  var reportkey = '<bean:write name="t10_reportActionForm" property="reportkey"/>';
	  theUrl = theUrl +"&reportkey="+reportkey;
	  window.open(theUrl,"");
   }
   function locationrole(){
		locate_pop_window('<%=request.getContextPath()%>','t02_tp_bas_inf_location','radio','forms[0]','parampage,parampage_disp','');
	}
	</SCRIPT>
	</HEAD>
	<div id='content'>
		<body>
			<html:form method="post" enctype="multipart/form-data"
				action="/t10_report/t10_report_modify.do">

				<div class='awp_title'>
					<table>
						<tr>
							<td width="2%">
								<span class="title_img"></span>
							</td>
							<td width="23%">
								<span class="awp_title_td2">报表管理 - 修 改</span>
							</td>
							<td align="right">
								<input type="button" value="返 回" name=Button2 class="input"
									onClick="dosubmit('t10_report_list.do')">

							</td>
						</tr>
					</table>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>


				<div class='awp_detail'>
					<table>

						<tr>
							<td>
								<font color="red">*</font>报表编号：
							</td>
							<td>
								<html:text property="reportkey" size="30" readonly="true" />
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>报表名称：
							</td>
							<td>
								<html:text property="reportname" size="30" />
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>所属子系统：
							</td>
							<td>
								<html:select property="reportsys">
									<html:options collection="sysMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>报表类别：
							</td>
							<td>
								<html:select property="reportype">
									<html:options collection="reportTypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								是否菜单显示：
							</td>
							<td>
								<html:select property="ismenudisp">
									<html:options collection="commonMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								是否允许导出：
							</td>
							<td>
								<html:select property="isexport">
									<html:options collection="commonMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>条件页面：
							</td>
							<td>
								<html:hidden property="parampage" />
								<html:text property="parampage_disp" size="20" readonly="true" />
								<html:button property="Button52" styleClass="text_white"
									onclick="locationrole()">定 位</html:button>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>数据模板：
							</td>
							<td>
								<html:hidden property="datatpl_file" />
								<html:file property="data_file" />
								<c:if test="${t10_reportActionForm.datatpl_file !=''}">
									<a href="javascript:void(0);"
										onclick="showFile('<%=request.getContextPath()%>/rpp/t10_report/get_file_disp.do?type=1');return false;">
										数据模板 </a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>展现模板：
							</td>
							<td>
								<html:hidden property="exceltpl_file" />
								<html:file property="excel_file" />
								<c:if test="${t10_reportActionForm.exceltpl_file !=''}">
									<a href="javascript:void(0);"
										onclick="showFile('<%=request.getContextPath()%>/rpp/t10_report/get_file_disp.do?type=2');return false;">
										展现模板 </a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>模板名称：
							</td>
							<td>
								<html:text property="tplsheet_name" size="30" />
								注：模板对应的sheet名字
							</td>
						</tr>
						<tr>
							<td>
								报表描述：
							</td>
							<td>
								<html:textarea property="reportdes" cols="60" rows="6" />
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<input type="button" value="提 交"
									OnClick="checkForm('t10_report_modify_do.do')">
								<html:reset styleClass="input" value="重 填" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</body>
	</div>
</html>
