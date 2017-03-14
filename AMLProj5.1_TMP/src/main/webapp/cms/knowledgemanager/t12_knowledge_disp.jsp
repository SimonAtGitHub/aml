<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
		function showContentOrFile(value) {
		    //alert("dddddddddd:"+value);
		    if(value == "1") {//显示文章内容
		        //alert("dhhhhhhhh:");
		        document.getElementById("content").style.display = "block";
		        document.getElementById("file").style.display = "none";
		    }else {//显示附件上传
		        document.getElementById("content").style.display = "none";
		        document.getElementById("file").style.display = "block";
		    }
		}
		
		function onLoadDo() {//加载
		    var programakey = document.getElementById("programakey").value;//栏目编码
		    var savetype = eval("document.all."+"D_SAVET_"+programakey);//保存方式
		    
		    var value = "";
		    for(var i=0;i<savetype.length;i++) {
		        if(savetype[i].checked) {
		           value = savetype[i].value;
		        }
		    }
		    showContentOrFile(value);
		}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" onload="onLoadDo();">
	<html:form method="POST" action="/knowledgemanager/t12_knowledge_disp.do">
	    <html:hidden property="articlekey" /> 
	    <html:hidden property="programakey" /> 
		<table width="98%" border="0" align="center" cellpadding="2"
			cellspacing="0" id="title_table">
			<tr>
				<td>
					<span class="css014"> <strong><font color="0072BC">文章管理
								- 文章详情 </font> </strong> </span>
				</td>
				<td align="right">
					<html:button property="backbutton" value="收 藏" styleClass="input"
						onclick="awpDoSubmit('t12_knowledge_collect.do','add')" />
				</td>
			</tr>
		</table>
		
		<table class="split" width="100%">
			<tr>
				<td height="8">
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
				</td>
			</tr>
		</table>
		
		<table width="100" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="8"></td>
			</tr>
		</table>


		<TABLE align=center border=1 cellPadding=0 borderColor=333333
			cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
			<TBODY>
				<TR>
					<TD align="center" valign="top"
						style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
						<table width="100%" border="0" cellpadding="1" cellspacing="1" id="query_table">
						   <tr>
								<td width="160" align="right">
									栏目名称：
								</td>
								<td>
								    <bean:write property="programaname" name="t12_programa"/> 
								</td>
							</tr>
							
						    <%
						    Map map = (Map)request.getAttribute("resultMap");
						    if(map == null) {
						        map = new HashMap();
						    }
						     %>
						     
						     <logic:iterate id="col" name="t12_programa_colsList"
				                                    type="com.ist.cms.dto.T12_programa_cols">
				               <%
				                  String colkey = col.getColkey();
				                  String value = (String)map.get(colkey);
				                  if(value == null) value = "";
				                 %>
				                 
				               <!-- 保存形式 -->
								<logic:match value="D_SAVET" name="col" property="colkey">
								   <bean:define id="saveType" value="<%=value %>"></bean:define>
								   <tr>
								       <td width="160" align="right">
										<bean:write property="colname" name="col"/>：
									   </td>
									   <td>
									      <logic:equal value="1" name="saveType">
									          <input type="radio" name="<bean:write property="colkey" name="col"/>" 
										       value="1" checked="checked" onclick="showContentOrFile(this.value);" disabled="disabled">文本
										       <input type="radio" name="<bean:write property="colkey" name="col"/>" 
										       value="0" onclick="showContentOrFile(this.value);" disabled="disabled">附件
									      </logic:equal>
									      
									       <logic:notEqual value="1" name="saveType">
									          <input type="radio" name="<bean:write property="colkey" name="col"/>" 
										       value="1" onclick="showContentOrFile(this.value);" disabled="disabled">文本
										       <input type="radio" name="<bean:write property="colkey" name="col"/>" 
										       value="0" checked="checked" onclick="showContentOrFile(this.value);" disabled="disabled">附件
									       </logic:notEqual>
									       
									   </td>
								   </tr>
								</logic:match>
								
								<!-- 文章内容 -->
								<logic:match value="D_ATCONT" name="col" property="colkey">
								   <tr id="content">
								       <td width="160" align="right">
										   <bean:write property="colname" name="col"/>：
									   </td>
									   <td  >
									       <textarea rows="18" cols="60" readonly="readonly" >
									          <%=(String)request.getAttribute("articleContent") %>
									       </textarea>
								       </td>
								   </tr>
								   <tr id="file" style="display:none">
								       <td width="160" align="right">
										   附件：
									   </td>
									   <td >
									       <jsp:include page="../../cmp/attachment/attach_include.jsp" />
								       </td>
								   </tr>
								</logic:match>
							
							<logic:notMatch value="D_SAVET" name="col" property="colkey">
				              <logic:notMatch value="D_ATCONT" name="col" property="colkey">
				                 <tr>
									<td width="160" align="right">
										<bean:write property="colname" name="col"/>：
									</td>

								    <td>
									    <logic:greaterThan value="64" property="collength" name="col">
									        <textarea rows="18" cols="60" readonly="readonly" >
									          <%=value %>
									        </textarea>
									    </logic:greaterThan>
									    <logic:lessEqual value="64" property="collength" name="col">
									        <%=value %>       
									    </logic:lessEqual>
									    
								    </td>
							     </tr>
							   
							   </logic:notMatch>
							 </logic:notMatch>
				            </logic:iterate>
						     
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</html:form>
</body>
<script>
	setTableStyle("title_table","title");
	setTableStyle("query_table","condition");
</script>
</html:html>
