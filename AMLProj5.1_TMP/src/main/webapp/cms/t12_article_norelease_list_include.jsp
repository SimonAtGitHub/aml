<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ist.cms.common.constant.CmsConstant" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%@ include file="../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/jquery-ui.css" rel="stylesheet" type="text/css">


<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>
			<SCRIPT LANGUAGE="JavaScript"
	src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
<html:messages id="errors" message="true">
	<bean:write name="errors" filter="fasle" />
</html:messages>

<input type="hidden" name="categorykey" value="<bean:write name="categorykey"/>"/>
<div class='awp_cond' id="searchtable" style="display:none">
	<table>
		<tr>
			<TD>

				<%
				           String searchPath = (String)request.getAttribute("searchPath");
				            if(searchPath == null) {
				                searchPath = "/businessmanager/t12_article/t12_article_norelease_list";
				            }
				            searchPath = request.getContextPath() + "/cms" + searchPath + ".do?newsearchflag=1";
							
							String listLength = "0";
							List list = (List)request.getAttribute("condList");
							if(list != null) listLength = list.size() + "";						
							
							Map condValueMap = (Map)request.getAttribute("condValueMap");
							if(condValueMap == null) {
						        condValueMap = new HashMap(); 
						    }
							 %>
				<bean:define id="length" value="<%=listLength %>"></bean:define>
				<logic:iterate id="cond" name="condList"
					type="com.ist.cms.dto.T12_programa_cols" indexId="i">
					<%
							    int my_i = i.intValue()%2;
							    String currLength = (i.intValue() + 1) + "";
							    String my_str = (new Integer(my_i) ).toString();
							     %>
					<bean:define id="index" value="<%=my_str %>"></bean:define>
					<%
							    String colkey = cond.getColkey();
							    Object obj =  condValueMap.get(colkey);
							    String value = "";
							     if(obj != null){
							    	value = obj.toString();
							    }
							    String locate_disp = "";
							    Object obj2 = condValueMap.get(CmsConstant.LOCATE_DISP_VALUE_PRE+colkey);
							    if(obj2!=null){
							    	locate_disp = obj2.toString();
							    }
							    String locationName = "";
							    String condition = "";
							    /** 日期情况：最小值 */
							    String value_min = "";
							    if(condValueMap.containsKey(colkey+"_min")) {
							        value_min = (String)condValueMap.get(colkey+"_min");
							    }
							    
							    /** 日期情况：最大值 */
							    String value_max = "";
							    if(condValueMap.containsKey(colkey+"_max")) {
							        value_max = (String)condValueMap.get(colkey+"_max");
							    }
							     %>
					<!--  查询条件为单数情况-->
					<logic:equal value="0" name="index">
						<logic:notEqual value="0" name="i">
		</tr>
		</logic:notEqual>
		<tr>
			<td>
				<bean:write name="cond" property="colname" />
				：
			</td>

			<!-- 不是排序情况 -->
			<logic:notEqual value="ORDER_BY" name="cond" property="colkey">
				<td>
					<!-- 时间 -->
					<logic:match value="DATE" name="cond" property="colkey">
						<input type="text"
							name="<bean:write name="cond" property="colkey"/>_min"
							value="<%=value_min %>" size="10">
						<img src="<%=request.getContextPath()%>/images/calendar.gif"
							style="cursor:hand;" width="16" height="16" border="0"
							alt="弹出日历下拉菜单"
							onclick="new Calendar().show(document.forms[0].<bean:write name="cond" property="colkey"/>_min);" />
											至
											<input type="text"
							name="<bean:write name="cond" property="colkey"/>_max"
							value="<%=value_max %>" size="10">
						<img src="<%=request.getContextPath()%>/images/calendar.gif"
							style="cursor:hand;" width="16" height="16" border="0"
							alt="弹出日历下拉菜单"
							onclick="new Calendar().show(document.forms[0].<bean:write name="cond" property="colkey"/>_max);" />
					</logic:match>
					<!-- 非时间 -->
					<logic:notMatch value="DATE" name="cond" property="colkey">
						<c:choose>
										<c:when test="${cond.parmtype eq '1'}">
											<c:if test="${cond.sysinparmkey eq '140'}">
												<input type="text" readonly name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" size="32">
												<img src="<%=request.getContextPath() %>/images/calendar.gif"
														style="cursor:hand;" width="16" height="16" border="0"
														alt="弹出日历下拉菜单"
														onclick="new Calendar().show(document.forms[0].<c:out value="${cond.colkey }" />)" />
											</c:if>
										   <c:if test="${cond.sysinparmkey ne '140'}">
										   		<input type="text" name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" size="32">
										   </c:if>
										</c:when>
										<c:when test="${cond.parmtype eq '2'}">
											<input type="hidden"  name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
											 
								     			<c:if test="${cond.sysinparmkey ne '250'}">
								     				<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" readonly value="<%=locate_disp %>" size="32" />
								     			</c:if>
								     			<c:if test="${cond.sysinparmkey eq '250'}">
								     				<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" value="<%=locate_disp %>" size="32" />
								     			</c:if>
								     			<c:if test="${cond.sysinparmkey eq '210'}">
						               				<input type="button" name="locate_" value="单 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','radio','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','');"/>
						               			</c:if>
						               			<c:if test="${cond.sysinparmkey eq '220'}">
						               				<input type="button" name="locate_" value="多 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','checkbox','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','');"/>
						               			</c:if>
						               			<c:if test="${cond.sysinparmkey eq '230'}">
						               				<input type="button" name="locate_" value="单 选" class="text_white" onclick="locate_tree_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','radio','');"/>
						               			</c:if>
						               			<c:if test="${cond.sysinparmkey eq '240'}">
						               				<input type="button" name="locate_" value="多 选" class="text_white" onclick="locate_tree_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','checkbox','');"/>
						               			</c:if>
								     		 
										</c:when>
										<c:when test="${cond.parmtype eq '3'}">											
											<%
						               			if(com.ist.common.util.StringUtils.null2String(cond.getTargetcde()).startsWith("T")){
						               				locationName = "t00_dictLocation";
						               				condition = "disctype=\\'"+cond.getTargetcde()+"\\'";
						               			}else{
						               				locationName = "t00_categoryLocation";
						               				condition = "categorytype=\\'"+cond.getTargetcde()+"\\'";
						               			}
						               		%>
						               		<c:choose>
						               			<c:when test="${cond.sysinparmkey eq '310'}">
						               				<%
									     				Map dictMap = cond.getDictMap();
									     				request.setAttribute("dictMap",dictMap);
									     				if(value == "") value=" ";
										     		%>
										     		<c:forEach var="item" items="${dictMap }">								     			
										     			<logic:match value="<%=value %>" name="item" property="key">
										     				<input type="radio" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" checked="checked"/><c:out value="${item.value }" />
										     			</logic:match>
										     			<logic:notMatch value="<%=value %>" name="item" property="key">
										     				<input type="radio" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" /><c:out value="${item.value }" />
										     			</logic:notMatch>
										     		</c:forEach>
										     	</c:when>
										     	<c:when test="${cond.sysinparmkey eq '320'}">
										     		<%
										     			Map dictMap = cond.getDictMap();
										     			request.setAttribute("dictMap",dictMap);
										     			String[] values = value.split(",");
										     			Map rMap = new HashMap();
										     			for(int j=0; j<values.length; j++){
										     				rMap.put(values[j],values[j]);
										     			}
										     		%>
										     		<c:forEach var="item" items="${dictMap }">	
										     			<bean:define id="aa" name="item" property="key"></bean:define>							     							     								     			
										     				<% if (rMap.containsKey(aa.toString())) {%>
										     					<input type="checkbox" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" checked="checked"/><c:out value="${item.value }" />
										     				<% }else {
										     					%>							     				
										     					<input type="checkbox" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" /><c:out value="${item.value }" />
										     					<%} %>	
										     		</c:forEach>
										     	</c:when>
										     	<c:when test="${cond.sysinparmkey eq '330'}">
										     		<%
										     			Map dictMap = cond.getDictMap();
										     			request.setAttribute("dictMap",dictMap);
										     			if(value == "") value=" ";
										     		%>
										     		<select name="<c:out value="${cond.colkey }" />">
										     			<option value="" selected="selected">请选择</option>										     								     		
										     			<c:forEach var="item" items="${dictMap }">
										     				<logic:match value="<%=value %>" name="item" property="key">
										     					<option value="<c:out value="${item.key }" />" selected="selected"><c:out value="${item.value }" /></option>
										     				</logic:match>
										     				<logic:notMatch value="<%=value %>" name="item" property="key">
										     					<option value="<c:out value="${item.key }" />"><c:out value="${item.value }" /></option>
										     				</logic:notMatch>
										     			</c:forEach>
										     		</select>
										     	</c:when>	
										     	<c:when test="${cond.sysinparmkey eq '340'}">
										     		<input type="hidden"  name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
										     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" readonly  value="<%=locate_disp %>" size="32"/>
										     		<input type="button" name="locate_" value="单 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<%=locationName %>','radio','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','<%=condition %>');"/>
										     	</c:when>
										     	<c:when test="${cond.sysinparmkey eq '350'}">
										     		<input type="hidden"  name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
										     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" readonly  value="<%=locate_disp %>" size="32"/>
										     		<input type="button" name="locate_" value="多 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<%=locationName %>','checkbox','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','<%=condition %>');"/>
										     	</c:when>
										     </c:choose> 
										</c:when>
										<c:when test="${cond.parmtype eq '5'}">
											<%
								     			Map dictMap = cond.getDictMap();
						                		StringBuffer str = new StringBuffer();
						                		Iterator it = dictMap.entrySet().iterator();
								     			while(it.hasNext()){
								     				Map.Entry en = (Map.Entry)it.next();
								     				String dictkey = (String)en.getKey();
								     				String dictvalue = (String)en.getValue();
								     				str.append("{\"key\":\"");
								     				str.append(dictkey);
								     				str.append("\",\"value\":\"");
								     				str.append(dictkey);
								     				str.append("-");
								     				str.append(dictvalue);
								     				str.append("\"},");
								     			}
								     			String a  = str.substring(0,str.length() - 1);
								     			String b = "[" + a + "]";
								     			request.setAttribute("b",b);
								     		%>
								     		<input type="hidden"  id="<c:out value="${cond.colkey }" />" name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
								     		<%if(value == "") {%>
								     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" id="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" value=""  size="30"/>								     		
 								     		<%}else{ %>
 								     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" id="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" value="<%=locate_disp %>"  size="30"/>
 								     		<%} %>
 								     		<script> 
 								     		jQuery.noConflict();
									 		jQuery(document).ready(function(){										 		
									 			var p=<%=request.getAttribute("b") %>;
									 			jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").autocomplete({
									 				minLength:0,
									 				source:p,
									 				focus:function(event, ui){
									 					jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").val(ui.item.value);
									 					return false;}
									 				,select:function(event, ui){
									 					jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").val(ui.item.value);
									 					jQuery("#<c:out value="${cond.colkey }" />").val( ui.item.key);
									 					return false;}
									 					});
									 		jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").data("autocomplete")._renderItem=function(ul,item){
									 			return jQuery("<li></li>").data("item.autocomplete",item).append("<a>"+item.value+"</a>").appendTo(ul);};
									 			});
										 </script>
										</c:when>
										<c:otherwise>
											<input type="text" name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" size="32">
										</c:otherwise>
									</c:choose>
					</logic:notMatch>

				</td>
			</logic:notEqual>

			<!-- 排序情况 -->
			<logic:equal value="ORDER_BY" name="cond" property="colkey">
				<td>
					<html:select property="sort_column">
						<html:options collection="sortColumnList" property="label"
							labelProperty="value" />
					</html:select>
					&nbsp;
					<html:radio property="sort_type" value="asc">升序</html:radio>
					<html:radio property="sort_type" value="desc">降序</html:radio>
					<html:radio property="sort_type" value="">不排序</html:radio>

				</td>
			</logic:equal>

			<!-- 最后一个查询条件，带上查询按钮 -->
			<logic:equal value="<%=currLength %>" name="length">
				<td>
					&nbsp;
				</td>
				<td>
					<input type="button" value="查 询" class="input" 
					onclick="awpDoSubmit('<%=searchPath %>','search')"/>
				</td>
			</logic:equal>
		</logic:equal>

		<!--  查询条件为双数情况-->
		<logic:notEqual value="0" name="index">
			<td>
				<bean:write name="cond" property="colname" />
				：
			</td>
			<!-- 不是排序情况 -->
			<logic:notEqual value="ORDER_BY" name="cond" property="colkey">
				<td>
					<!-- 时间 -->
					<logic:match value="DATE" name="cond" property="colkey">
						<input type="text"
							name="<bean:write name="cond" property="colkey"/>_min"
							value="<%=value_min %>" size="10">
						<img src="<%=request.getContextPath()%>/images/calendar.gif"
							style="cursor:hand;" width="16" height="16" border="0"
							alt="弹出日历下拉菜单"
							onclick="new Calendar().show(document.forms[0].<bean:write name="cond" property="colkey"/>_min);" />
							
											至
											<input type="text"
							name="<bean:write name="cond" property="colkey"/>_max"
							value="<%=value_max %>" size="10">
						<img src="<%=request.getContextPath()%>/images/calendar.gif"
							style="cursor:hand;" width="16" height="16" border="0"
							alt="弹出日历下拉菜单"
							onclick="new Calendar().show(document.forms[0].<bean:write name="cond" property="colkey"/>_max);" />
					</logic:match>
					<!-- 非时间 -->
					<logic:notMatch value="DATE" name="cond" property="colkey">
						<c:choose>
										<c:when test="${cond.parmtype eq '1'}">
											<c:if test="${cond.sysinparmkey eq '140'}">
												<input type="text" readonly name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" size="32">
												<img src="<%=request.getContextPath() %>/images/calendar.gif"
														style="cursor:hand;" width="16" height="16" border="0"
														alt="弹出日历下拉菜单"
														onclick="new Calendar().show(document.forms[0].<c:out value="${cond.colkey }" />)" />
											</c:if>
										   <c:if test="${cond.sysinparmkey ne '140'}">
										   		<input type="text" name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" size="32">
										   </c:if>
										</c:when>
										<c:when test="${cond.parmtype eq '2'}">
											<input type="hidden"  name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
											 
								     			<c:if test="${cond.sysinparmkey ne '250'}">
								     				<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" readonly value="<%=locate_disp %>" size="32" />
								     			</c:if>
								     			<c:if test="${cond.sysinparmkey eq '250'}">
								     				<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" value="<%=locate_disp %>" size="32" />
								     			</c:if>
								     			<c:if test="${cond.sysinparmkey eq '210'}">
						               				<input type="button" name="locate_" value="单 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','radio','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','');"/>
						               			</c:if>
						               			<c:if test="${cond.sysinparmkey eq '220'}">
						               				<input type="button" name="locate_" value="多 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','checkbox','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','');"/>
						               			</c:if>
						               			<c:if test="${cond.sysinparmkey eq '230'}">
						               				<input type="button" name="locate_" value="单 选" class="text_white" onclick="locate_tree_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','radio','');"/>
						               			</c:if>
						               			<c:if test="${cond.sysinparmkey eq '240'}">
						               				<input type="button" name="locate_" value="多 选" class="text_white" onclick="locate_tree_window('<%= request.getContextPath() %>','<c:out value="${cond.targetcde }" />','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','checkbox','');"/>
						               			</c:if>
								     		 
										</c:when>
										<c:when test="${cond.parmtype eq '3'}">											
											<%
						               			if(com.ist.common.util.StringUtils.null2String(cond.getTargetcde()).startsWith("T")){
						               				locationName = "t00_dictLocation";
						               				condition = "disctype=\\'"+cond.getTargetcde()+"\\'";
						               			}else{
						               				locationName = "t00_categoryLocation";
						               				condition = "categorytype=\\'"+cond.getTargetcde()+"\\'";
						               			}
						               		%>
						               		<c:choose>
						               			<c:when test="${cond.sysinparmkey eq '310'}">
						               				<%
									     				Map dictMap = cond.getDictMap();
									     				request.setAttribute("dictMap",dictMap);
									     				if(value == "") value=" ";
										     		%>
										     		<c:forEach var="item" items="${dictMap }">								     			
										     			<logic:match value="<%=value %>" name="item" property="key">
										     				<input type="radio" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" checked="checked"/><c:out value="${item.value }" />
										     			</logic:match>
										     			<logic:notMatch value="<%=value %>" name="item" property="key">
										     				<input type="radio" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" /><c:out value="${item.value }" />
										     			</logic:notMatch>
										     		</c:forEach>
										     	</c:when>
										     	<c:when test="${cond.sysinparmkey eq '320'}">
										     		<%
										     			Map dictMap = cond.getDictMap();
										     			request.setAttribute("dictMap",dictMap);
										     			String[] values = value.split(",");
										     			Map rMap = new HashMap();
										     			for(int j=0; j<values.length; j++){
										     				rMap.put(values[j],values[j]);
										     			}
										     		%>
										     		<c:forEach var="item" items="${dictMap }">	
										     			<bean:define id="aa" name="item" property="key"></bean:define>							     							     								     			
										     				<% if (rMap.containsKey(aa.toString())) {%>
										     					<input type="checkbox" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" checked="checked"/><c:out value="${item.value }" />
										     				<% }else {
										     					%>							     				
										     					<input type="checkbox" name="<c:out value="${cond.colkey }" />" value="<c:out value="${item.key }" />" /><c:out value="${item.value }" />
										     					<%} %>	
										     		</c:forEach>
										     	</c:when>
										     	<c:when test="${cond.sysinparmkey eq '330'}">
										     		<%
										     			Map dictMap = cond.getDictMap();
										     			request.setAttribute("dictMap",dictMap);
										     			if(value == "") value=" ";
										     		%>
										     		<select name="<c:out value="${cond.colkey }" />">
										     			<option value="" selected="selected">请选择</option>										     								     		
										     			<c:forEach var="item" items="${dictMap }">
										     				<logic:match value="<%=value %>" name="item" property="key">
										     					<option value="<c:out value="${item.key }" />" selected="selected"><c:out value="${item.value }" /></option>
										     				</logic:match>
										     				<logic:notMatch value="<%=value %>" name="item" property="key">
										     					<option value="<c:out value="${item.key }" />"><c:out value="${item.value }" /></option>
										     				</logic:notMatch>
										     			</c:forEach>
										     		</select>
										     	</c:when>	
										     	<c:when test="${cond.sysinparmkey eq '340'}">
										     		<input type="hidden"  name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
										     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" readonly  value="<%=locate_disp %>" size="32"/>
										     		<input type="button" name="locate_" value="单 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<%=locationName %>','radio','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','<%=condition %>');"/>
										     	</c:when>
										     	<c:when test="${cond.sysinparmkey eq '350'}">
										     		<input type="hidden"  name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
										     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" readonly  value="<%=locate_disp %>" size="32"/>
										     		<input type="button" name="locate_" value="多 选" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','<%=locationName %>','checkbox','forms[0]','<c:out value="${cond.colkey }" />,<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />','<%=condition %>');"/>
										     	</c:when>
										     </c:choose> 
										</c:when>
										<c:when test="${cond.parmtype eq '5'}">
											<%
								     			Map dictMap = cond.getDictMap();
						                		StringBuffer str = new StringBuffer();
						                		Iterator it = dictMap.entrySet().iterator();
								     			while(it.hasNext()){
								     				Map.Entry en = (Map.Entry)it.next();
								     				String dictkey = (String)en.getKey();
								     				String dictvalue = (String)en.getValue();
								     				str.append("{\"key\":\"");
								     				str.append(dictkey);
								     				str.append("\",\"value\":\"");
								     				str.append(dictkey);
								     				str.append("-");
								     				str.append(dictvalue);
								     				str.append("\"},");
								     			}
								     			String a  = str.substring(0,str.length() - 1);
								     			String b = "[" + a + "]";
								     			request.setAttribute("b",b);
								     		%>
								     		<input type="hidden"  id="<c:out value="${cond.colkey }" />" name="<c:out value="${cond.colkey }" />" value="<%=value %>" />
								     		<%if(value == "") {%>
								     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" id="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" value=""  size="30"/>								     		
 								     		<%}else{ %>
 								     		<input type="text"  name="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" id="<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />" value="<%=locate_disp %>"  size="30"/>
 								     		<%} %>
 								     		<script> 
 								     		jQuery.noConflict();
									 		jQuery(document).ready(function(){										 		
									 			var p=<%=request.getAttribute("b") %>;
									 			jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").autocomplete({
									 				minLength:0,
									 				source:p,
									 				focus:function(event, ui){
									 					jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").val(ui.item.value);
									 					return false;}
									 				,select:function(event, ui){
									 					jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").val(ui.item.value);
									 					jQuery("#<c:out value="${cond.colkey }" />").val( ui.item.key);
									 					return false;}
									 					});
									 		jQuery("#<%=CmsConstant.LOCATE_DISP_VALUE_PRE %><c:out value="${cond.colkey }" />").data("autocomplete")._renderItem=function(ul,item){
									 			return jQuery("<li></li>").data("item.autocomplete",item).append("<a>"+item.value+"</a>").appendTo(ul);};
									 			});
										 </script>
										</c:when>
										<c:otherwise>
											<input type="text" name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" size="32">
										</c:otherwise>
									</c:choose>
					</logic:notMatch>

					<!-- 最后一个查询条件，带上查询按钮 -->
					<logic:equal value="<%=currLength %>" name="length">
						<input type="button" value="查 询" class="input" 
					onclick="awpDoSubmit('<%=searchPath %>','search')"/>
					</logic:equal>

				</td>
			</logic:notEqual>

			<!-- 排序情况 -->
			<logic:equal value="ORDER_BY" name="cond" property="colkey">
				<td>
					<html:select property="sort_column">
						<html:options collection="sortColumnList" property="label"
							labelProperty="value" />
					</html:select>
					&nbsp;
					<html:radio property="sort_type" value="asc">升序</html:radio>
					<html:radio property="sort_type" value="desc">降序</html:radio>
					<html:radio property="sort_type" value="">不排序</html:radio>

					<!-- 最后一个查询条件，带上查询按钮 -->
					<logic:equal value="<%=currLength %>" name="length">
					<input type="button" value="查 询" class="input" 
					onclick="awpDoSubmit('<%=searchPath %>','search')"/>
						
					</logic:equal>
				</td>
			</logic:equal>

		</logic:notEqual>

		</logic:iterate>

		</TD>
		</TR>
		
	</TABLE>
</div>


<div class="awp_list">
	<TABLE>
		<TR>
			<logic:iterate id="col" name="showColList" type="com.ist.cms.dto.T12_programa_cols">
				 <%
	                  String colkey = col.getColkey();
	                  request.setAttribute("colkey" , colkey);
				 %>
				 <logic:equal value="D_ARTICLENUM" name="col" property="colkey">
					<TD align="center" nowrap>
						<bean:write name="col" property="colname" />
					</TD>	
				</logic:equal>	
			     </logic:iterate>
			
			
			<logic:iterate id="col" name="showColList" type="com.ist.cms.dto.T12_programa_cols">
				 <%
				                  String colkey = col.getColkey();
				                  request.setAttribute("colkey" , colkey);
				 %>
				 <logic:notEqual value="D_ARTICLENUM" name="col" property="colkey">
				<logic:notEqual value="D_ARTICLECON" name="col" property="colkey">
					<logic:equal value="D_ARTICLENAM" name="col" property="colkey">
							<TD align="center" nowrap>
								<bean:write name="col" property="colname" />
							</TD>
					</logic:equal>

					<logic:notEqual value="D_ARTICLENAM" name="col" property="colkey">
								<TD align="center" nowrap>
									<bean:write name="col" property="colname" />
								</TD>
					</logic:notEqual>
				</logic:notEqual>
				</logic:notEqual>
			</logic:iterate>
			<TD>
				操作
			</TD>
		</TR>

		<logic:iterate id="result" name="resultList" type="java.util.List"
			indexId="seq">
			<%
				java.util.HashMap map = new java.util.HashMap();
				
				//map.put("rad",""+(new java.util.Date()).getTime() );
				pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
			%>
			<TR>
				<%String articlekey = ""; %>

				<logic:iterate id="value" name="result" type="java.lang.String"
					indexId="i">
						
					<logic:equal value="0" name="i">
						<%
							articlekey = value; 
						%>
						
						
					</logic:equal>

					<logic:equal value="1" name="i">
						<TD align="center" nowrap>
							<a
								href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/myknowledge/t12_myarticle/t12_myarticle_disp.do?articlekey=<%=articlekey %>&programakey=<bean:write name="t12_articleActionForm" property="programakey" />')">
									<bean:write name="value" scope="page" />
							</a>
						</TD>
					</logic:equal>

					<logic:notEqual value="0" name="i">
						<logic:notEqual value="1" name="i">
							<TD align="center" nowrap>
								<bean:write name="value" scope="page" filter="false" />
							</TD>
						</logic:notEqual>
					</logic:notEqual>

				</logic:iterate>

				<TD align="center" nowrap>
					<a
						href="javascript:awpDoSubmit('<%=request.getContextPath()%>/cms<%=(String)request.getAttribute("path") %>.do?articlekey=<%=articlekey %>&programakey=<bean:write name="t12_articleActionForm" property="programakey" />','add')">
						发布 </a> &nbsp;&nbsp;
					<a
						href="javascript:awpDoSubmit('<%=request.getContextPath()%>/cms<%=(String)request.getAttribute("deletePath") %>.do?articlekey=<%=articlekey %>&programakey=<bean:write name="t12_articleActionForm" property="programakey" />','add')">
						删除 </a>
				</TD>
			</TR>
		</logic:iterate>
	</TABLE></div>

	<div class='awp_page_bottom'>
		<table>
			<tr>
				<td align="center">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</td>
			</tr>
		</table>
	</div>