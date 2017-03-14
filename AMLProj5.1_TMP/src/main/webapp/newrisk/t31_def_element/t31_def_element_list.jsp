<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>
		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>

		
		<SCRIPT LANGUAGE="JavaScript">
		var refresh='<%=request.getAttribute("refresh")%>';
		if(refresh=='1')
		{
			parent.leftFrame.location.reload();
		}
		
		
		function selectORClearBox(_form,_setval){
		   for( var i=0; i < _form.elements.length; i++ ){
		        if (_form.elements[i].type == 'checkbox' ){
		            _form.elements[i].checked = _setval;
		        }
		   }
		}	
		
		function dosubmit(theUrl,type){
		   var isSub = false;
		   var errMsg = "";
		   if(type=='modi'){
		        
		        isSub = true;
		    
		    }else if(type=='search' || type=='add' || type=='back'){
		        isSub = true;
		    }else if(type=='del'){
		       
		            if(confirm('你确定要删除当前模板下的所有风险子项吗?')){
		                isSub = true;
		            }
		        }
		   
		
		    if(isSub && errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        if(errMsg!='')
		            alert(errMsg);
		        return false;
		    }
		}
		function selectORClearBox(_form,_setval){
		   for( var i=0; i < _form.elements.length; i++ ){
		        if (_form.elements[i].type == 'checkbox' ){
		            _form.elements[i].checked = _setval;
		        }
		   }
		}
</SCRIPT>
</HEAD>
<body>
	<div id="main">
	<html:form action="/t31_def_element/t31_def_element_list.do" method="post">
	
			<!-- conditions -->
			<div class="conditions">
			<!-- title -->
				<div class="cond_t">
					<span>积分评级模板 - 风险<logic:equal value="-1" name="t31_def_elementActionForm" property="upelementkey">要素</logic:equal><logic:notEqual value="-1" name="t31_def_elementActionForm" property="upelementkey">子项</logic:notEqual>列表</span>
						
					<span class="buttons">
					 
<%--    					 pageContext.setAttribute("size",((List)request.getAttribute("t31_def_elementList")).size() );--%>
						
						<logic:notEmpty name="t31_def_elementActionForm" property="js_type">
							<logic:greaterThan value="1" name="t31_def_elementActionForm" property="js_type">
						<strong>计算方式：<bean:write name="js_type_disp"/></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						
  							</logic:greaterThan>
  						</logic:notEmpty>
  					 <bean:size id="size" name="t31_def_elementList"/>
					
					<logic:equal value="0" name="size" scope="page">					
						<a href="#" onClick="dosubmit('t31_def_element_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />添 加</a> 
					</logic:equal>
					
					<logic:notEqual value="0" name="size" scope="page">
						<a href="#" onClick="dosubmit('t31_def_element_modify.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />修 改</a>
						<a href="#" onClick="dosubmit('t31_def_element_delete_do.do','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删 除</a>
					</logic:notEqual>
						
						
					</span>
				</div>
			</div>
						<html:hidden property="templatekey"/>
						<html:hidden property="upelementkey"/>
						<html:hidden property="treelaye"/>
				
				
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
<%--								<th>--%>
<%--									<input type="checkbox" name="guizbms" value="0"--%>
<%--										onClick="selectORClearBox(forms[0],this.checked)" />--%>
<%--								</th>--%>
								 <th>风险<logic:equal value="-1" name="t31_def_elementActionForm" property="upelementkey">要素</logic:equal><logic:notEqual value="-1" name="t31_def_elementActionForm" property="upelementkey">子项</logic:notEqual></th>
							      <th>风险<logic:equal value="-1" name="t31_def_elementActionForm" property="upelementkey">要素</logic:equal><logic:notEqual value="-1" name="t31_def_elementActionForm" property="upelementkey">子项</logic:notEqual>描述</th>
							     
							     <logic:equal value="1" name="t31_def_elementActionForm" property="js_type">
							     	 <th>权重(%)</th>
								 </logic:equal>
								 
							</tr>
							<logic:present name="t31_def_elementList">
								<logic:iterate id="t31_def_element" name="t31_def_elementList"
									type="com.ist.aml.newrisk.dto.T31_def_element">
									<tr>
<%--										<td>--%>
<%--											<html:multibox property="elementkey">--%>
<%--												<bean:write name="t31_def_element" property="elementkey" />--%>
<%--											</html:multibox>--%>
<%--										</td>--%>
										<td>
										<logic:equal name="t31_def_element" property="is_last" value="1">
											<a href='<%=request.getContextPath()%>/newrisk/t31_def_element/t31_def_element_disp.do?elementkey=<bean:write name="t31_def_element" property="elementkey"/>&templatekey=<bean:write name="t31_def_element" property="templatekey"/>'>
												<bean:write name="t31_def_element" property="elementname" />
												
											</a>
										</logic:equal>
										<logic:notEqual name="t31_def_element" property="is_last" value="1">
											<a href='<%=request.getContextPath()%>/newrisk/t31_def_element/t31_def_element_list.do?newsearchflag=1&upelementkey=<bean:write name="t31_def_element" property="elementkey"/>&templatekey=<bean:write name="t31_def_element" property="templatekey"/>'>
												<bean:write name="t31_def_element" property="elementname" />
												
											</a>
										</logic:notEqual>
										</td>
										<td>
											<bean:write name="t31_def_element" property="des" />
										</td>
										
										<logic:equal value="1" name="t31_def_elementActionForm" property="js_type">
										
											<td>
												<bean:write name="t31_def_element" property="base_occ" />
											</td>
										</logic:equal>
										
									
									</tr>
								</logic:iterate>
							</logic:present>
						</table>
					</div>
					<div class="list_page">
						<logic:present name="pageInfo" scope="request">
							<table width="98%" align="center" border="0" cellpadding="3"
								cellspacing="3">
								<tr>
									<td align="center">									
										<bean:write name="pageInfo" scope="request" filter="false" />								
									</td>
								</tr>
							</table>
						</logic:present>
					</div>
				
				
	</html:form>
	</div>
</BODY>
</HTML>
