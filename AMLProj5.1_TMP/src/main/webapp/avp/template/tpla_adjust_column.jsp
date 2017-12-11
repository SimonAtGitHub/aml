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

	
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_调整列顺序页面</title>
		<script language="javascript"
			src="../../js/basefunc.js"></script>
		<script language="JavaScript"
			src="../../js/uc.js"></script>
		<script language="JavaScript"
			src="../../js/selectbox.js"></script>
		<script language="JavaScript"
			src="../../js/avpfunc.js"></script>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="JavaScript">
		function doSubmit(theUrl){
			var selObj = document.getElementById("adjustcolumn");
			
			var adjustcolumn = "序号,";
			for (var i = 0; i < selObj.length; i++) {
		       adjustcolumn = adjustcolumn + selObj[i].text;
               if(selObj.length - 1 > i ) {
                   adjustcolumn = adjustcolumn + ",";
               }
	        }
			//selectAllOptions(sortSelObj);
			//alert("adjustcolumn:"+adjustcolumn);
            document.getElementById("userShowColumnSort").value = adjustcolumn;
			avpJumpSubmit(theUrl);
		}
		</script>
			
	</HEAD>

	<BODY >
		<html:form method="post" action="/template/tpla_sort_cond.do">
		    <input type="hidden" name="userShowColumnSort"  />
			<div class='awp_title'>
				<table>
					<tr>
						<td width="2%"><span class="title_img"></span></td>
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out> - 调整列顺序页面</span></td>
						<td align="right">
							<c:out value="${returnButtonHtml}" escapeXml="false"></c:out>  </td>
					</tr>
				</table>
			</div> 
			

		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
		
		<div class='awp_detail'>
			<table>
				<tr >
					<td width="*" align='right' nowrap="nowrap">调整列顺序：</td>					
					
					<td align='left' width="20%">
						<select name="adjustcolumn" style="{width:300px}" size="15"  multiple="multiple" >
							<c:forEach var="disp_col" items="${selColMap}">
								<option value='<c:out value="${disp_col.key}"/>'>
									<c:out value="${disp_col.value.DISPNAME}"/>
								</option>
							</c:forEach>
						</select>						 
					</td>	
					
					<td  colspan="3" align="left" >
						 <INPUT type=button onClick="moveOptionUp(this.form['adjustcolumn'])" value="上移↑">
                		<BR><BR>  
						<INPUT type=button onClick="moveOptionDown(this.form['adjustcolumn'])" value="下移↓"> 
					</td>		
    
				</tr>
 		       <tr>
					<td >&nbsp;</td>
            		<td align="left" colspan=4> 
                		<input type="button" value="提 交" onClick="doSubmit('tpla_adjust_column_rslt.do?new_qry_flag=1&intPage=1&wherefrom=trunpage')">	                			 
                		<input type="reset"  value="重 选"  >  
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
	</BODY>
</HTML>
