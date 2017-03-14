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
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_导出条件</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>			

		<script language="JavaScript">
		function doSubmit(theUrl){
		    var theredirtUrl = theUrl;
			var begin_no = document.forms[0].begin_no;
			var end_no = document.forms[0].end_no;
			
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
			if(parseInt(end_no.value,10)-parseInt(begin_no.value,10)> 10000){
				alert('单次导出记录数不能超过10000条');
				begin_no.select();
				begin_no.focus();
				return false;
			}

			dispLoadInfo1();
			document.forms[0].action=theredirtUrl;
			document.forms[0].submit();
		}
		
		function chsaveMode(oElement){
			var tr_subbtn = document.getElementById('tr_subbtn');	
			var tr_begin_no = document.getElementById('tr_begin_no');	
			var tr_end_no = document.getElementById('tr_end_no');	
			var tr_curr_subbtn = document.getElementById('tr_curr_subbtn');			

			var hid_save = oElement.value;
			document.getElementById('hid_save').value = hid_save;
			
			if(hid_save == '1'){  //自选数据导出
				tr_begin_no.style.display='block';
				tr_end_no.style.display='block';
				tr_subbtn.style.display='block';
				tr_curr_subbtn.style.display='none';
			}else { //导出当前页数据
				tr_begin_no.style.display='none';
				tr_end_no.style.display='none';				
				tr_subbtn.style.display='none';
				tr_curr_subbtn.style.display='block';
			}
		}	
		
		function exportMyExecl(){
			try{
				var loading = document.getElementById('loading'); 
				loading.style.visibility = "visible";
				event.srcElement.disabled = true;
				exportExecl_avp('data_table','<c:out value="${labelStr}" escapeXml="false"></c:out>');
				loading.style.visibility = "hidden";
				event.srcElement.disabled = false;
				}catch(err){
			}
		}

		</script>

	</HEAD>

	<BODY>
		<div id="content">
			<html:form method="post" action="/template/tpla_sort_cond.do">
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out>- 导出条件</span></td>
						<td align="right">
							<c:out value="${buttonHtml}" escapeXml="false"></c:out>&nbsp; </td>
					</tr>
				</table>
			</div>         
			
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				
				<div class='awp_detail'>
					<table>
						 <tr>
				             <td width="20%"  align="right"><font color="#FF0000">*</font>导出方式：</td>
				             <td align="left">
								<input type='radio' name="isexamsave" value="3" checked onclick="chsaveMode(this)">导出当前页数据
								<input type='radio' name="isexamsave" value="1" onclick="chsaveMode(this)">自选数据导出         
				             </td>
			            </tr> 	
			            
						<tr id="tr_begin_no" style="display:none">
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>导出起始序号：
							</td>
							<td width="*" align='left'>
								<html:text property="begin_no" size="20"></html:text>
							</td>
						</tr>
						<tr id="tr_end_no" style="display:none">
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>导出结束序号：
							</td>
							<td width="*" align='left'>
								<html:text property="end_no" size="20"></html:text>
							</td>
						</tr>											
						<tr id="tr_subbtn" style="display:none">
							<td width="20%" >
								&nbsp;
							</td>
							<td align="left">
								<input type="hidden" name="new_qry_flag" value="1" />
								<input type="button" value="导 出"
									onClick="doSubmit('tpla_export_rslt.do')">
							</td>
						</tr>
						<tr id="tr_curr_subbtn">
							<td width="20%" >&nbsp;</td>
							<td align="left">
								<input type="hidden" name="new_qry_flag" value="1" />
								<input type="button" value="导 出"
									onClick="exportMyExecl()">
								<font color="#FF3300">导出大概需要10秒左右，请耐心等待</font>
							</td>
						</tr>						
												
					</table>
				</div>
				
				<input type="hidden" name="hid_save" id="hid_save"/>
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
							<LI>1、导出的时间与选择的记录条数有关，选择的记录条数越多，需要的导出时间越长
							<LI>2、对于大量数据，可以分为多次导出
							<LI>3、目前系统单次最大的导出列数为255条，如果列数大于255会默认选择前255列导出
							<LI>4、目前系统单次最大的导出记录数为10000条
						</UL>
			        </td>
			        </tr>
			      </table>
			    </div>
			</html:form>
		</div>
	</BODY>
</HTML>
