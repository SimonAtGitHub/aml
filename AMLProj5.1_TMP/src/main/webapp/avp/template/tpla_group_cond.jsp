<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
  		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/uc.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/selectbox.js"></script>

		<script language="JavaScript">
		function doSubmit(theUrl){
			var stat_selObj = document.getElementById("groupvalues");
			var grp_selObj = document.getElementById("groupcols");
			 
			if(stat_selObj.length<=0){
				alert("统计内容请至少选择一个");
				return false;
			}
			
			if(grp_selObj.length<=0){
			   alert("分组内容请至少选择一个");
			   return false;
			}
			if(!confirm('未进分组内容的字段将在输出列中被删除，且此操作不可逆，无法取消分组!')){
                return false;
            }
			selectAllOptions(stat_selObj);
			selectAllOptions(grp_selObj);
			document.forms[0].action=theUrl;
        	document.forms[0].submit();
		}
		function doSubmit1(theUrl){
			document.forms[0].action=theUrl;
        	document.forms[0].submit();
		}
		</script>

	</HEAD>

	<BODY>
	  <div id="content">
		<html:form method="post" action="/template/tpla_group_cond.do">
			<html:hidden property="tplakey" />
		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模板统计_定义分组条件</span></td>
						<td align="right">
							&nbsp;					                  </td>
					</tr>
				</table>
			</div>    
		
			<html:messages id="errors" message="true">

			</html:messages>

    <div class="awp_detail">
		 <table>

								<tr>
									<td  nowrap><font color="#FF0000">*</font>统计方式：</td>
									<td nowrap>
										<c:out value="${stat_mode_html}"  escapeXml="false"/>
									</td>
									<td nowrap></td>
									<td colspan='2'>
										
									</td>
								</tr>

								<tr>
									<td width="*">
										<font color="#FF0000">*</font>统计内容：
										<br>
									</td>
									<td >
										<html:select property="stat_disp" size="15"
											style="{width:200px}" multiple="multiple"
											ondblclick="moveAvpSelectedOptions('stat_disp','groupvalues','grp_disp','groupcols')">
											<html:options collection="stat_dispMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</td>

									<td >
										<input type='button'
											onClick="moveAvpSelectedOptions('stat_disp','groupvalues','grp_disp','groupcols')"
											value="&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;">
										<BR>
										<BR>
										<INPUT type='button'
											onClick="moveAvpAllOptions('stat_disp','groupvalues','grp_disp','groupcols')"
											value="全部&gt;&gt;">
										<BR>
										<BR>
										<INPUT type='button'
											onClick="moveSelectedOptions(this.form['groupvalues'] , this.form['stat_disp'])"
											value="&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;">
										<BR>
										<BR>
										<INPUT type='button'
											onClick="moveAllOptions(this.form['groupvalues'],this.form['stat_disp'])"
											value="全部&lt;&lt;">
										<br>
									</td>

									<td >
										<html:select property="groupvalues" size="15"
											multiple="multiple"
											ondblclick="moveSelectedOptions(this.form['groupvalues'] , this.form['stat_disp'])"
											style="{width:200px}">
											<html:options collection="groupvaluesMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</td>

									<td >
										<BR>
										<BR>
										<INPUT type=button
											onClick="moveOptionUp(this.form['groupvalues'])" value="上移↑">
										<BR>
										<BR>
										<BR>
										<BR>
										<INPUT type=button
											onClick="moveOptionDown(this.form['groupvalues'])"
											value="下移↓">
										<br>
									</td>
								</tr>
								<tr>
									<td >
										<font color="#FF0000">*</font>分组内容：
										<br>
									</td>
									<td >
										<br>
										<html:select property="grp_disp" size="15"
											style="{width:200px}" multiple="multiple"
											ondblclick="moveAvpSelectedOptions('grp_disp','groupcols','stat_disp','groupvalues')">
											<html:options collection="grp_dispMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>

									<td >
										<input type='button'
											onClick="moveAvpSelectedOptions('grp_disp','groupcols','stat_disp','groupvalues')"
											value="&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;">
										<BR>
										<BR>
										<INPUT type='button'
											onClick="moveAvpAllOptions('grp_disp','groupcols','stat_disp','groupvalues')"
											value="全部&gt;&gt;">
										<BR>
										<BR>
										<INPUT type='button'
											onClick="moveSelectedOptions(this.form['groupcols'] , this.form['grp_disp'])"
											value="&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;">
										<BR>
										<BR>
										<INPUT type='button'
											onClick="moveAllOptions(this.form['groupcols'],this.form['grp_disp'])"
											value="全部&lt;&lt;">
									</td>

									<td >
										<html:select property="groupcols" size="15"
											multiple="multiple"
											ondblclick="moveSelectedOptions(this.form['groupcols'] , this.form['grp_disp'])"
											style="{width:200px}">
											<html:options collection="groupcolsMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>

									<td >
										<BR>
										<BR>
										<INPUT type=button
											onClick="moveOptionUp(this.form['groupcols'])" value="上移↑">
										<BR>
										<BR>
										<BR>
										<BR>
										<INPUT type=button
											onClick="moveOptionDown(this.form['groupcols'])" value="下移↓">
									</td>
								</tr>
								<tr>
									<td >
										&nbsp;

									</td>
									<td colspan=4>

										<input type="button" value="提 交"
											onClick="doSubmit('tpla_group_cond_add_do.do')">

										<input type="button" value="重 选"
											onClick="avpJumpSubmit('tpla_group_cond.do')">
									</td>
								</tr>
							</table>
						</div>
		</html:form>
	 </div>
	</BODY>
</HTML>
