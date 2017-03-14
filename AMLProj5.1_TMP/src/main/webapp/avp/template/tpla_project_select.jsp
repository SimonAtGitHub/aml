<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/css_all.css" type="text/css">  -->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/style.css" type="text/css">
		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script src="<%=request.getContextPath()%>/js/prototype.js"></script>
		<LINK rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/css/tab.css">
		<SCRIPT src="<%=request.getContextPath()%>/css/tabpane.js"
			type=text/javascript></SCRIPT>



		<SCRIPT LANGUAGE="JavaScript"> 
			function dosubmit(type){
				var isSubmit = true;
				var actionUrl = "";		
				var mappingfield = document.forms[0].mappingfield.value;
				var projectid = document.forms[0].projectid.value;

				if (type=="search"){
					if(document.forms[0].projectid.value==''){
					  alert("请选择项目名称！");
					  isSubmit = false;
					}else{					  
					  actionUrl="<%=request.getContextPath()%>/avp/template/tpla_sampleintegration_List.do?newsearchflag=1&projectid="+projectid+"&mappingfield="+mappingfield;
					}					  
				}		
				
				if (type=="select"){
					isSubmit = checkRadiosHasChecked();
					var sampleid  = document.forms[0].sampleid.value;					
					actionUrl="<%=request.getContextPath()%>/avp/template/insert_Tpla_sampleintegration.do?sampleid="+sampleid+"&projectid="+projectid+"&mappingfield="+mappingfield;										  					
				}	
				
				if (type=="back"){
					isSubmit = true;
					actionUrl = "<%=request.getContextPath()%>/avp/template/tpla_samp_cond.do?filter_audit_flag=1";
				}
				
				if(isSubmit){
					document.forms[0].action = actionUrl;
					document.forms[0].submit();
				}
			}
			
			function checkRadiosHasChecked(){
				var radios = document.getElementsByName("sampleids");
				for(var i=0;i<radios.length;i++){
					if(radios[i].checked){
						document.forms[0].sampleid.value=radios[i].value;
						return true;
					}
				}
				alert("请选择要导入数据的抽样测试表！");
				return false;
			}
			
			function goModify(theUrl,parm){
				document.forms[0].sampleid.value=parm;

				var url = theUrl+"?sampleid="+document.forms[0].sampleid.value;	
				openFullWin(url,"sampe_page");
			}	
			
			
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form method="post" action="/template/tpla_sampleintegration_List.do">
			<input type="hidden" name="projectid" value='<c:out  value="${projectid}"  />'/>
			<input type="hidden" name="mappingfield" value='<c:out  value="${mappingfield}"  />'/>			
			<input type="hidden" name="sampleid" >
            <input type="hidden" name="filter_audit_flag" value='<c:out  value="${filter_audit_flag}"  />'>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2">
					</td>
				</tr>
			</table>
			<table width="99%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="44"><img src="<%=request.getContextPath()%>/images/cebimages/dqwz.jpg" width="61" height="27" /></td>
					<td width="200" align="left" background="<%=request.getContextPath()%>/images/cebimages/dqwz2.jpg" class="fontbold" nowrap>选择抽样测试表</td>
					<td width="47"><img src="<%=request.getContextPath()%>/images/cebimages/dqwz3.jpg" width="47" height="27" /></td>
					<td align="right" background="<%=request.getContextPath()%>/images/cebimages/dqwz4.jpg">
						<input type="button" value="上一步" class="botton"
							onClick="dosubmit('back')">					
						<input type="button" value="选  择" class="botton"
							onClick="dosubmit('select')">
						<input type="button" value="关  闭" class="botton"
							onClick="window.close();">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2">
						&nbsp;
					</td>
				</tr>
			</table>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2">
					</td>
				</tr>
			</table>
			<div class='avp_cond'>
				<table class="cond_tab">
					<tr>
						<td height="22" align="right" nowrap="nowrap">
							<font color="#FF3300">*</font>项目编号：
						</td>
						<td align="left">
						    <input type="text" name="projectname" size="30" value='<c:out  value="${projectname}"  />'/>						 
						    <input type="button" name="locate1" value="定 位" class="botton"   onclick="locate_pop_window('<%=request.getContextPath()%>','t11_my_porjectInfoLocation' ,'radio1' ,'forms[0]','projectid,projectname','t2.username=\'<c:out value="${username}"></c:out>\' ')">
						</td>
						<td height="22" align="right" nowrap="nowrap">
						</td>
						<td align="left">
							<input type="button" value="查 询" class="botton"
								onclick="dosubmit('search')" />
						</td>
					</tr>
				</table>
			</div>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="98%" align="center" class="list_tab">
				<tr align=center>
					<td width="5%" nowrap>
						全部
					</td>
					<td width="5%" nowrap>
						顺序号
					</td>
					<td nowrap>
						抽样测试名称
					</td>
					<td nowrap>
						样本总体名称
					</td>
					<td nowrap>
						样本总量
					</td>
					<td nowrap>
						抽样数量
					</td>
					<td nowrap>
						抽样方法
					</td>
					<td nowrap>
						已录样本量
					</td>
					<!-- 
					<td nowrap>
						测试方案编号
					</td>
					 -->
					<td nowrap>
						创建人
					</td>
					<td nowrap>
						创建时间
					</td>
				</tr>
				<logic:iterate id="sampleTestInfo" name="t11_sample_testList"
					type="com.ist.sam.dto.T11_sample_test" indexId="index">
					<tr align="center">
						<td nowrap id="t1">
							<input type="radio" name="sampleids" value="<c:out value="${sampleTestInfo.sampleid}" />"/>			
						</td>
						<td align="center">
							<%=index.intValue() + 1%>
						</td>
						<td align="left"
							title="<c:out value='${sampleTestInfo.samplename}'/>">
							<a href="javascript:goModify('<%=request.getContextPath()%>/sam/sample/sample_testnote_add_base_read.do','<c:out value="${sampleTestInfo.sampleid}" />')" title='<c:out value="${sampleTestInfo.samplename}" />'>						
								<c:out value="${sampleTestInfo.samplename}" />
							</a>							
							
						</td>
						<td nowrap align="left"
							title="<c:out value='${sampleTestInfo.swatchcollectivity}'/>">
							<c:out value="${sampleTestInfo.swatchcollectivity}" />
						</td>
						<td align="right">
							<c:out value="${sampleTestInfo.swatchgross}" />
						</td>

						<td align="right">
							<c:out value="${sampleTestInfo.sampleamount}" />
						</td>
						<td align="center" nowrap>
							<c:out value="${sampleTestInfo.samplemeans}" />
						</td>
						<td>
							<c:out value="${sampleTestInfo.currentsamplecount}" />
						</td>
						<!-- 						
						<td align="center" nowrap title="<c:out value='${sampleTestInfo.schemeidshow}'/>">
							<c:out value="${sampleTestInfo.schemeidshow}"/>
						</td>
						-->
						<td align="center">
							<c:out value="${sampleTestInfo.creator}" />
						</td>
						<td align="center" nowrap>
							<c:out value="${sampleTestInfo.createdate}" />
						</td>
					</tr>
				</logic:iterate>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>			
			
		</html:form>
	</BODY>
</HTML>

