<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<title>详细信息</title>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>		
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	  
	
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" styleId="form0"
			action="/attention/t07_attention_lib_disp.do">
			
			<html:hidden name="t07_attention_lib" property="atten_id"/>
			
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>详细信息</span>
						<span class="buttons"> <a href="t07_attention_lib_list.do?is_his=<bean:write name="t07_attention_libActionForm"  property="is_his"/>&atten_post=<%=request.getAttribute("atten_post") %>" ><img
									src="../../images/blue/b_back.png" />返 回</a></span>
					</div>
					
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">

                            <html:hidden property="atten_id"/>
							<tr>
								<td>
									客户名称：
								</td>
								<td>
							       <bean:write name="t07_attention_lib"  property="party_chn_name"/>								
								</td>
							
								<td>
									客户号：
								</td>
								<td>
								    <bean:write name="t07_attention_lib"  property="party_id"/>									
								</td>
							</tr>

							<tr>
								<td>
									客户类型：
								</td>
								<td>
								   <bean:write name="t07_attention_lib"  property="party_class_cd_disp"/>
								</td>
							
								<td>
									证件类型：
								</td>
								<td>
								   <bean:write name="t07_attention_lib"  property="card_type_disp"/>									
								</td>
							</tr>
								<tr>
								<td>
									证件号码：
								</td>
								<td>
								    <bean:write name="t07_attention_lib"  property="card_no"/>
								    
								</td>
							
								<td>
									归属机构：
								</td>
								<td>
								    <bean:write name="t07_attention_lib"  property="organname"/>									
								</td>
							</tr>
							<tr>
								<td>
									关注类型：
								</td>
								<td>
									 <bean:write name="t07_attention_lib"  property="atten_type_disp"/>	
									
								</td>
							    <td>关注来源：</td>
								<td>
									<bean:write name="t07_attention_lib"  property="atten_source_disp"/>
								</td>
								
							</tr>
							<tr>
								<td>
									创建日期：
								</td>
								<td>
									<bean:write name="t07_attention_lib"  property="create_dt"/>								
								
								</td>
								<td>
									失效日期：
								</td>
								<td>
									<bean:write name="t07_attention_lib"  property="invalid_dt"/>								
								
								</td>
							</tr>
							
							<tr>
								<td>
									关注状态：
								</td>
								<td>
									<bean:write name="t07_attention_lib"  property="status_disp"/>								
								
								</td>
								<td> 
								</td>
								<td>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							   
								<Th width=10% >
									操作名称
								</Th>
								<Th width=10% >
									操作人
								</Th>
								<Th width=15% >
									操作时间
								</Th>
								<Th width=50% >
									原因
								</Th>
								
							</TR>
							<logic:iterate id="t07_attention_log" indexId="i"
								name="t07_attention_libList"
								type="com.ist.aml.report.dto.T07_ATTENTION_log">
								
								<TR>
									<TD>
										<bean:write name="t07_attention_log" property="op_name"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_log" property="op_person"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_log" property="op_time"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_log" property="op_reason"
											scope="page" />
									</TD>
									
								</TR>

							</logic:iterate>
						</TABLE>
					</div>

			</div>
		</html:form>
		
	</body>
</html>
