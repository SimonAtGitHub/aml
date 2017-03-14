<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_审核导出条件</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>			

		<script language="JavaScript">
		
		function doSubmit(theUrl,type){
		    var theredirtUrl = theUrl;
			var begin_no = document.forms[0].begin_no;
			var end_no = document.forms[0].end_no;
			var isSub = false; 
			
			if (type=='1') {
				begin_no.value = "";
				end_no.value = "";
				if(confirm('下载需要相关领导审批通过后才可以进行下载，是否继续？')){
					isSub = true;
				}
			}else if (type=='2') {
					if(begin_no.value == ''){
						alert('请输入导出起始序号');
						begin_no.focus();
						return false;
					}
					if(end_no.value == ''){
						alert('请输入导出结束序号');
						end_no.focus();
						return false;
					}
					if(parseInt(begin_no.value,10)<=0 || parseInt(end_no.value,10)<=0){
					    alert('导出起始序号和导出结束序号不能小于或等于0');
					    return false;
					}
					if(parseInt(end_no.value,10)-parseInt(begin_no.value,10)<0){
						alert('导出结束序号不能小于导出起始序号');
						begin_no.select();
						begin_no.focus();
						return false;
					}
					if(getLength(document.forms[0].appdesc.value) == 0){
						alert('申请说明不能为空');
						document.forms[0].appdesc.focus();
						return false;
					}
					if(getLength(document.forms[0].appdesc.value)>2000){
						alert('申请说明不能大于2000汉字');
						document.forms[0].appdesc.focus();
						return false;
					}
					
					if(confirm('下载需要相关领导审批通过后才可以进行下载，是否继续？')){
						isSub = true;
					}
				}
			if (isSub) {
				dispLoadInfo1();
				document.forms[0].action=theredirtUrl;
				document.forms[0].submit();
			}
			
		}
		</script>

	</HEAD>

	<BODY>
		<div id="content">
			<html:form method="post" action="/template/tpla_sort_cond.do">
			<input type="hidden" value="<c:out value="${intPage}" />" name="intPage" />
			<input type="hidden" value="<c:out value="${export_audit_flag}" />" name="export_audit_flag" />
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out>- 审核导出条件</span></td>
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
			            
						<tr  >
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>导出起始序号：
							</td>
							<td width="*" align='left'>
								<html:text property="begin_no" size="20"></html:text>
							</td>
						</tr>
						<tr>
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>导出结束序号：
							</td>
							<td width="*" align='left'>
								<html:text property="end_no" size="20"></html:text>
							</td>
						</tr>	
						<tr >
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>申请说明：
							</td>
							<td width="*" align='left'>
								<html:textarea property="appdesc" cols="40"
									rows="5" styleClass="text_white"></html:textarea>
							</td>
						</tr>											
						<tr>
							<td width="20%" >
								&nbsp;
							</td>
							<td align="left">
								<input type="hidden" name="new_qry_flag" value="1" />
								<input type="button" value="导 出"
									onClick="doSubmit('tpla_export_audit_rslt.do','2')">
							</td>
						</tr>
												
					</table>
				</div>
				
				<input type="hidden" id="hid_save" name="hid_save" />
				<div id='loading' class='css012'>
					<font color='#FF0000'>正在导出当前页数据，请稍候...</font>
				</div>

				<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
				<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>
				<div class="awp_msgtab">
				  <table>
					<tr> 
			        <td ><p><strong>系统提示：</strong><br>
			        <UL>
							<LI>1 、审计数据不可以随便下载，导出审计数据要进行审核</LI>
							<LI>2 、默认开始序号和结束序号为当前页</LI>
						</UL>
			        </td>
			        </tr>
			      </table>
			    </div>
			</html:form>
		</div>
	</BODY>
</HTML>