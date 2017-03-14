<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />

		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_选择字段导出</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>			
		<script language="JavaScript">
		
	function doSubmit(theUrl, type) {
		var theredirtUrl = theUrl;
		var begin_no = document.forms[0].begin_no;
		var end_no = document.forms[0].end_no;
		var showcolnum = document.getElementsByName("showcolnum");
		var isSub = false;

		if (begin_no.value == '') {
			alert('请输入导出起始序号');
			begin_no.focus();
			return false;
		}
		if (end_no.value == '') {
			alert('请输入导出结束序号');
			end_no.focus();
			return false;
		}
		if (parseInt(begin_no.value, 10) <= 0
				|| parseInt(end_no.value, 10) <= 0) {
			alert('导出起始序号和导出结束序号不能小于或等于0');
			return false;
		}
		if (showcolnum.length>0) {
			for ( var i = 0; i < showcolnum.length; i++) {
				if (showcolnum[i].checked) {
					isSub = true;
				}
			}
			if (!isSub) {
				alert('没有可导出的字段，请选择导出的字段');
				return false;
			}
			
		}
		loading.style.visibility = "visible";
		document.forms[0].action = theredirtUrl;
		document.forms[0].submit();

	}

	
</script>

	</head>

	<body>
		<div id="content">
			<html:form method="post" action="/template/tpla_sort_cond.do">
			<input type="hidden" value="<c:out value="${intPage}" />" name="intPage" />
			<input type="hidden" value="<c:out value="${export_audit_flag}" />" name="export_audit_flag" />
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap="nowrap" ><span class="awp_title_td2"><c:out value="${labelStr}"></c:out>- 审核导出条件</span></td>
						<td align="right">
							<c:out value="${buttonHtml}" escapeXml="false"></c:out>&nbsp; </td>
					</tr>
				</table>
			</div>         
			
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<c:if test="${showMsg != '' && showMsg != null}">
					<font color="red"><c:out value="${showMsg}" /></font>
				</c:if>
				<div class='awp_detail'>
					<table>
			            
						<tr id="tr_begin_no" >
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>导出起始序号：
							</td>
							<td width="*" align='left'>
								<html:text property="begin_no" size="20"></html:text>
							</td>
						</tr>
						<tr id="tr_end_no" >
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>导出结束序号：
							</td>
							<td width="*" align='left'>
								<html:text property="end_no" size="20"></html:text>
							</td>
						</tr>
						<tr>
							<td>导出字段：</td>
							<td>
							<c:forEach items="${disList}" var="dis" >
								<span style="float: left;"><input type="checkbox" name="showcolnum" value="<c:out value ="${dis.dispname}"/>" checked="checked"/><c:out value ="${dis.dispname}"/>&nbsp;</span>
							</c:forEach>
							
							</td>
						</tr>											
						<tr id="tr_subbtn" >
							<td width="20%" >
								&nbsp;
							</td>
							<td align="left">
								<input type="hidden" name="new_qry_flag" value="1" />
								<input type="button" value="导 出"
									onclick="doSubmit('tpla_export_field_rslt.do','2')" />
							</td>
						</tr>
												
					</table>
				</div>
				
				<input type="hidden" id="hid_save" name="hid_save" />
				<div id='loading' class='css012'>
					<font color='#FF0000'>正在导出数据，请稍候...</font>
				</div>

				<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
				<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>
				<div class="awp_msgtab">
				  <table>
					<tr> 
			        <td ><p><strong>系统提示：</strong><br></br></p>
				        <ul>
								<li>1、根据选择字段进行导出</li>
								<li>2、默认开始序号和结束序号为当前页</li>
								<LI>3、目前系统单次最大的导出列数为255条，如果列数大于255会默认选择前255列导出</LI>
								<li>4、如果数据量很大，导出花费时间也会相应增加，请分批次进行导出，每次最多导出20000条</li>
						</ul>
			        </td>
			        </tr>
			      </table>
			    </div>
			</html:form>
		</div>
	</body>
</html>
