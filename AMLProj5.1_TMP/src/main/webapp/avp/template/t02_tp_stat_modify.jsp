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

		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_统计条件</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="javascript" src="<%=request.getContextPath() %>/js/basefunc.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath() %>/js/uc.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath() %>/js/selectbox.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath() %>/js/avpfunc.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath() %>/js/avp_statis.js"></script>
		
		<script language="JavaScript">
		function doSubmit(theUrl){
			var stat_selObj = document.getElementById("stat_sel");
			var grp_selObj = document.getElementById("grp_sel");
			selectAllOptions(stat_selObj);
			selectAllOptions(grp_selObj);
			document.forms[0].action=theUrl;
  	        document.forms[0].submit();
		}

		</script>

	</HEAD>

	<BODY>
	  <div id="content">
		<html:form method="post" action="/template/t02_tp_stat_add.do">
		<html:hidden property="tplakey"/>
		<html:hidden property="satakey"/>
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out>_统计条件</span></td>
						<td align="right">
							<input type=button value="返 回" name=Button52 class="input"	onClick="awpDoSubmit('t02_tp_manager_list.do')" />
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
						<td align='right'><font color="#FF0000">*</font>统计方式：</td>
						<td align='left'  nowrap>
							<c:out value="${stat_mode_html}"  escapeXml="false"/>
						</td>
						<td align='right'><font color="#FF0000">*</font>是否总计：</td>
						<td align='left' colspan='2'>
							<c:out value="${count_all_html}" escapeXml="false" />
						</td>
					</tr>
	
					<tr>
						<td width="*" align='right'>
							<font color="#FF0000">*</font>统计内容：
						</td>
						<td width="250" align='center'>
							<select id="stat_disp"  style="{width:250px}" size="15"
								multiple="multiple"
								ondblclick="moveAvpSelectedOptions('stat_disp','stat_sel','grp_disp','grp_sel')">
								<c:forEach var="stat_col" items="${selColMap}">
									<c:if test="${stat_col.value.COLDATATYPE=='2'}">
										<option value='<c:out value="${stat_col.key}"/>'>
											<c:out value="${stat_col.value.DISPNAME}" />
										</option>
									</c:if>
								</c:forEach>
							</select>
						</td>

						<td align='center'>
							<input type='button'
								onClick="moveAvpSelectedOptions('stat_disp','stat_sel','grp_disp','grp_sel')"
								value="&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;">
							<BR>
							<BR>
							<INPUT type='button'
								onClick="moveAvpAllOptions('stat_disp','stat_sel','grp_disp','grp_sel')"
								value="全部&gt;&gt;">
							<BR>
							<BR>
							<INPUT type='button'
								onClick="moveSelectedOptions(this.form['stat_sel'] , this.form['stat_disp'])"
								value="&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;">
							<BR>
							<BR>
							<INPUT type='button'
								onClick="moveAllOptions(this.form['stat_sel'],this.form['stat_disp'])"
								value="全部&lt;&lt;">
						</td>

						<td width="250" align='center'>
							
							<select id="stat_sel" name="stat_sel" size="15" min_len='1' warning='请选择至少一个统计列'
								multiple="multiple"
								ondblclick="moveSelectedOptions(this.form['stat_sel'] , this.form['stat_disp'])"
								style="{width:250px}">
								<c:forEach var="stat_col" items="${selSumMap}">
									<option value='<c:out value="${stat_col.key}"/>'>
										<c:out value="${stat_col.value.DISPNAME}" />
									</option>
								</c:forEach>
							</select>
						</td>

						<td align='center'>
							<BR>
							<BR>
							<INPUT type=button onClick="moveOptionUp(this.form['stat_sel'])"
								value="上移↑">
							<BR>
							<BR>
							<BR>
							<BR>
							<INPUT type=button
								onClick="moveOptionDown(this.form['stat_sel'])" value="下移↓">
						</td>
					</tr>
					<tr>
						<td width="*" align='right'>
							分组内容：
						</td>
						<td width="250" align='center'>
							<select id="grp_disp" style="{width:250px}" size="15"
								multiple="multiple" 
								ondblclick="moveAvpSelectedOptions('grp_disp','grp_sel','stat_disp','stat_sel')">
								<c:forEach var="disp_col" items="${selColMap}">
									<option value='<c:out value="${disp_col.key}"/>'>
										<c:out value="${disp_col.value.DISPNAME}" />
									</option>
								</c:forEach>
							</select>
						</td>

						<td align='center'>
							<input type='button'
								onClick="moveAvpSelectedOptions('grp_disp','grp_sel','stat_disp','stat_sel')"
								value="&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;">
							<BR>
							<BR>
							<INPUT type='button'
								onClick="moveAvpAllOptions('grp_disp','grp_sel','stat_disp','stat_sel')"
								value="全部&gt;&gt;">
							<BR>
							<BR>
							<INPUT type='button'
								onClick="moveSelectedOptions(this.form['grp_sel'] , this.form['grp_disp'])"
								value="&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;">
							<BR>
							<BR>
							<INPUT type='button'
								onClick="moveAllOptions(this.form['grp_sel'],this.form['grp_disp'])"
								value="全部&lt;&lt;">
						</td>

						<td width="250" align='center'>
							<select id="grp_sel" name="grp_sel" size="15" multiple="multiple" min_len='0' warning='请选择至少一个分组列'
								ondblclick="moveSelectedOptions(this.form['grp_sel'] , this.form['grp_disp'])"
								style="{width:250px}">
								<c:forEach var="stat_col" items="${selGrpMap}">
									<option value='<c:out value="${stat_col.key}"/>'>
										<c:out value="${stat_col.value.DISPNAME}" />
									</option>
								</c:forEach>
							</select>
						</td>

						<td align='center'>
							<BR>
							<BR>
							<INPUT type=button onClick="moveOptionUp(this.form['grp_sel'])"
								value="上移↑">
							<BR>
							<BR>
							<BR>
							<BR>
							<INPUT type=button onClick="moveOptionDown(this.form['grp_sel'])"
								value="下移↓">
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td align="left" colspan=4>

							<input type="button" value="提 交"
								onClick="doSubmit('t02_tp_stat_modify_do.do')">

							<input type="button" value="重 选"
								onClick="avpJumpSubmit('t02_tp_stat_modify.do')">
						</td>
					</tr>
				</table>
			</div>
			
			<div class="awp_msgtab">
			  <table>
				<tr> 
		        <td ><p><strong>系统提示：</strong><br>
		       		&nbsp;&nbsp;数据统计时最多显示2000条记录
		        </td>
		        </tr>
		      </table>
		    </div>
			

			<div id='loading' class='css012'>
				<font color='#FF0000'>正在加载数据，请稍候...</font>
			</div>
			
			
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>

		</html:form>
	  </div>
	</BODY>
</HTML>
