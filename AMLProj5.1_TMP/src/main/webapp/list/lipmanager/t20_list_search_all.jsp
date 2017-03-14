<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
	
	<script type="text/javascript">
	
	   function _dosubmit2(theurl)
	   {
	     document.forms[0].action=theurl;
	     document.forms[0].submit();
	   }
	
		//去左空格; 
		function ltrim(s){ 
		return s.replace( /^\s*/, ""); 
		} 
		//去右空格; 
		function rtrim(s){ 
		return s.replace( /\s*$/, ""); 
		} 
		//去左右空格; 
		function trim(s){ 
		return rtrim(ltrim(s)); 
		} 
		
		function _dosubmit()
		{
		 var search_all= document.getElementsByName("search_all")[0];
		 var search=trim(search_all.value);
		 if(search=='')
		 {
		 	search_all.value=search;
		 	alert("请输入搜索内容！")
		 	return;
		 }
		//dosubmit('t20_list_search_all.do?newsearchflag=1','search')	
		 _dosubmit2('t20_list_search_all.do?newsearchflag=1');
	   
		}
		
		//页面加载完成调用
		 document.onreadystatechange=function changeselect(){
  	 			 if(document.readyState=="complete"){
		  		document.getElementsByName('search_all')[0].focus()
		  			          
			}
		}
			
	</script>
		
</HEAD>
<BODY >
<div id="main">
	<html:form method="POST"
			action="/lipmanager/t20_list_search_all.do">
			<html:hidden property="tablecode"/>
			<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>名单检索服务 - <%=(String)request.getAttribute("title") %></span>
					</div>
			</div>
			
		<div id="bigTab">
										
					<dl class="tabm">
						<dd class="tabcur">
							<span>全文检索</span>
						</dd>
						<dd >
							<span onclick="_dosubmit2('t20_list_search_type.do?newsearchflag=2')">分类检索</span>
						</dd>
				  </dl>
		 </div>
	
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="false"/>
			</html:messages>
			
			<div class="cond_c2">
				
				<table>
					<tr>
					<td align="center">
						<html:text property="search_all"   size="45" style="height:22px;line-height:22px"></html:text>
				
						<html:button property="button" styleClass="in_button1" value="搜 索"
									 onclick="_dosubmit()" />
					</td>
					</tr>
					
				</table>
				
			</div>
			
			<div class="list">
				<table>
				 	<tr>
						<th>操作</th>
						<logic:iterate id="col" name="showColList"
							type="com.ist.aml.lip.dto.T00_list_cols">
						
									<Th align="center" nowrap >
										<bean:write name="col" property="colname" />
									</Th>
							
						</logic:iterate>
						
					</tr>
					
					
					
				 	<logic:iterate id="result" name="resultList" type="java.util.List"
						indexId="seq">
						
						
						<% String pk=(String)result.get(0);%>
						
						<TR>
						
							<logic:iterate id="value" name="result" type="java.lang.String"
								indexId="i">
								
							<bean:define id="ii" value="<%=i.toString()%>"></bean:define>
							<logic:equal value="0" name="ii" >
							<td align="center" nowrap>
								 <% String url=request.getContextPath()+"/list/lipmanager/t20_list_details.do?party_id="+pk+"&tablecode="+(String)request.getAttribute("tablecode");%>
								<a href="javascript:void(0)" onclick="window.open('<%=url%>','明细','height=600,width=600,left=300,top=100,scrollbars=yes,resizable=yes');">明细</a> 
							 </td>
							
							</logic:equal>
							
							
							<logic:notEqual  value="0" name="ii">
									<TD align="center" nowrap >
										<bean:write name="value" scope="page" />
									</TD>
							</logic:notEqual>
							
							</logic:iterate>
							
							
							
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
			
			<div class='list_page'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
		
	</html:form>
</div>
	
</BODY>

</HTML>

