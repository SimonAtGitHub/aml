<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ist.iap.dto.T09_indic_subitem1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD> 
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/selectbox.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
			function dosubmit(theUrl,type){
				if(type=='test'){
					document.forms[0].target='_blank';
				}
				else{
					document.forms[0].target='_self';
				}
				selectAllOptions(document.forms[0].list2);
				document.forms[0].action=theUrl;
				document.forms[0].submit();
			}
		
			function checkForm(theUrl){				
				document.forms[0].action=theUrl;
				document.forms[0].submit();
			}	
		
		
		</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<div id='main'>
	      <html:form method="post" action="/indicator/indicator_task_depolyDo.do">	
			<input type="hidden" name="deploy" value="<%=request.getAttribute("deploy") %>" />
			<input type="hidden" name="selectedindickey" value="<%=request.getAttribute("selectedindickey") %>" />
			<div class="conditions">
			        <div class="cond_t">
					   <span>指标发布 - 设置依赖</span>
					   <span class="buttons">
					          <a href="javascript:void(0);"
										onClick="dosubmit('<%=request.getContextPath() %>/iap/indicator/indicator_depolyDo.do','product');return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_publish.png" />指标发布</a>
									
			    			  <a href="javascript:void(0);" onClick="dosubmit('<%=request.getContextPath() %>/iap/indicator/indicator_depolylist.do','back');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					   </span>
					</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class="awp_tabpanel">
				<table>
					<tr>
						<td align="left">
							<strong>指标名称：</strong>
							<bean:write name="indicator" property="indickey"  />
							－
							<bean:write name="indicator" property="indicname" />
						</td>
					</tr>
				</table>
			</div>

			<div>
				<TABLE>
					<TR>
						<TD>
							<table id="idTBSQL">
								<tr>	
								<td align="center">
									</td>
									<td align="center">
										SQL表达式
									</td>
								</tr>
								 <%
                                                    ArrayList indicator_mulsqlList = (ArrayList) request
                                                    .getAttribute("indicator_mulsqlList");

                                            for (int i = 0; i < indicator_mulsqlList.size(); i++) {
                                                T09_indic_subitem1 t01_indic_subitem1 = (T09_indic_subitem1) indicator_mulsqlList
                                                        .get(i);                                               
                                %>
								  <tr>
                                    <td align='left' valign='right'>
                                        第
                                        <%=i + 1%>
                                        组SQL
                                     </td>
                                     <td>
                                        <textarea name="selsql<%=i + 1%>" rows="13" cols="60"><%=t01_indic_subitem1.getExecsql()%></textarea>
                                    </td>
                                </tr>
                                <%
                                }
                                %>						
							</table>
						</TD>
						<TD align="center" valign="top">
							<table>

								<tr>
									<td align="left" valign="top">
										<b>依赖表：</b>
										<br>
										  <html:select property="aliasStr" size="15" style="width:220" multiple="true"
											ondblclick="moveSelectedOptions(this.form['aliasStr'],this.form['list2'],true,this.form['hi'].value)"
       										>
											<html:options collection="taskMap" property="label"
												labelProperty="value" />
										</html:select>
										
									</td>	
									<TD vAlign=center align=middle><INPUT name=right type=button class="input" onClick="moveSelectedOptions(this.form['aliasStr'],this.form['list2'])" value=">>">
							        <BR> <BR> <INPUT name=right type=button class="input" onClick="moveAllOptions(this.form['aliasStr'],this.form['list2'])" value="All >>">
							        <BR> <BR> <INPUT name=left type=button class="input" onClick="moveSelectedOptions(this.form['list2'],this.form['aliasStr'])" value="<<">
							        <BR> <BR> <INPUT name=left type=button class="input" onClick="moveAllOptions(this.form['list2'],this.form['aliasStr'])" value="All <<">
							      </TD>						
									<td align="left" valign="top">
										<b>结果表：</b>
										<br>
										 <select name=list2 size=15
								        multiple  style="width:220"
								        ondblclick="moveSelectedOptions(this.form['list2'],this.form['aliasStr'],true,this.form['hi'].value)">
								        </select>
								        <INPUT type="hidden" name=hi>
									</td>
								</tr>
							</table>
						</TD>
					</TR>				
				</TABLE>
			</div>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>
