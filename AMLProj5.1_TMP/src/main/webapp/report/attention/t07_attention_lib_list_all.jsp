<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.Map"%>
<%@page import="com.ist.aml.report.controller.T07_ATTENTION_libActionForm"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv="Content-Type" content="text/html; charset=GBK">

		<link id="skincss"
				href="../../css/aml_<%=session.getAttribute("style")%>.css"
				rel="stylesheet" type="text/css" />

		    <script type="text/javascript" src="../../js/jquery.js"></script>
			<script type="text/javascript" src="../../js/aml.js"></script>
			<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
			<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
			<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
			<SCRIPT LANGUAGE="JavaScript">
		

</SCRIPT>
			
	</HEAD>
	<BODY leftmargin="0" topmargin="0" >
		<div id="main">
			<html:form action="/attention/t07_attention_lib_list.do"
				method="post" styleId="form0" enctype="multipart/form-data">
              

					
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							    
								
								<Th width=10% noWrap>
									客户号
								</Th>
								<Th width=20% noWrap>
									客户名称
								</Th>
								<Th width=8% noWrap>
									客户类型
								</Th>
								<Th width=22% noWrap>
									客户归属机构
								</Th>
								<Th width=10% noWrap>
									关注类型
								</Th>
								<Th width=10% noWrap>
									关注状态
								</Th>
								
								<Th width=10% noWrap>

									失效时间
								</Th>
								<Th width=10% noWrap>

									关注来源
								</Th>
								
							</TR>
							<logic:iterate id="t07_attention_lib" indexId="i"
								name="t07_attention_libList"
								type="com.ist.aml.report.dto.T07_ATTENTION_lib">
								<%java.util.HashMap map = new java.util.HashMap();
								T07_ATTENTION_libActionForm form= (T07_ATTENTION_libActionForm)request.getAttribute("t07_attention_libActionForm");
									map.put("atten_id", t07_attention_lib.getAtten_id());
									map.put("atten_post", request.getAttribute("atten_post"));
									map.put("is_his", form.getIs_his());
									pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);%>
								<TR>
				
								

									<TD>
										<html:link name="map"
											page="/attention/t07_attention_lib_disp.do">
											<bean:write name="t07_attention_lib" property="party_id" />
										</html:link>
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="party_chn_name"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="party_class_cd_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="organname"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="atten_type_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="status_disp"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="invalid_dt"
											scope="page" />
									</TD>
									<TD>
										<bean:write name="t07_attention_lib" property="atten_source_disp"
											scope="page" />
									</TD>
									

								</TR>

							</logic:iterate>
						</TABLE>
					</div>
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
						<tr>
							<td align="center">
								<bean:write name="pageInfo" scope="request" filter="false" />
							</td>
						</tr>
					</table>
					
			</html:form>
		</div>
		
	
	</BODY>
</HTML>
