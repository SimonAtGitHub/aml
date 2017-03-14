<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ist.aml.rule.dto.T03_tp_exec_qry"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<HEAD> 
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		<script language="JavaScript" src="../../js/basefunc.js"></script>	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/selectbox.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
			function dosubmit(theUrl,type){
				if(type=='test'){
					document.forms[0].target='_blank';
				}
				else{
					document.forms[0].target='_self';
				}
				selectAllOptions(document.forms[0].selectedrulekey);
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
		<html:form method="post" action="/t21_rule/t03_rule_task.do">

		    <div class="conditions">	
		 		<div class='cond_t'>
		 		     <span>规则管理 - 设置依赖</span>
		 		     <span class="buttons">
		 		       <a href="javascript:void(0);" onClick="dosubmit('<%=request.getContextPath() %>/rule/t21_rule/t03_rule_apply_do.do','product');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />提交验证</a>
								 	
					   <a href="javascript:void(0);"  onClick="dosubmit('t21_rule_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
		 		     </span>
					</div>  
			    </div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="left">
							<html:hidden property="tplakey" name="rule"/>
							<html:hidden property="rulekey"  name="rule" />
							<html:hidden property="granulairty"  name="rule" />
							<html:hidden property="gs_type"  name="rule" />
							<html:hidden property="pbckey"  name="rule" />
							<strong>规则名称：</strong>
							<bean:write name="rule" property="rulekey" scope="request" />
							－
							<bean:write name="rule" property="rule_des" scope="request" />
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
									<td align="left">
										SQL表达式
									</td>
								</tr>
								  <%
                                            ArrayList t03_tp_exec_qryList = (ArrayList) request
													.getAttribute("t03_tp_exec_qryList");
								 		    if(t03_tp_exec_qryList == null) t03_tp_exec_qryList = new ArrayList();
                                            String selsql = "";
                                            for (int i = 0; i < t03_tp_exec_qryList.size(); i++) {
                                               	T03_tp_exec_qry t03_tp_exec_qry = (T03_tp_exec_qry) t03_tp_exec_qryList
														.get(i);
                                                selsql = selsql + ";" + t03_tp_exec_qry.getExecsql();
                                            }
                                            if (t03_tp_exec_qryList.size() > 0) {
                                                selsql = selsql.substring(1);
                                            }
                                %>
								  <tr>
                                    <td align='left' valign='top'>
                                        <textarea name="selsql" rows="25" cols="60" readonly="readonly"><%=selsql%></textarea>
                                    </td>
                                </tr>							
							</table>
						</TD>
						<TD align="center" valign="top">
							<table>
								<tr>
									<td align="left" valign="top">
										<b>依赖表：</b>
										<br>
										  <html:select property="rule_des" size="15" style="width:220" multiple="true"
											ondblclick="moveSelectedOptions(this.form['rule_des'],this.form['selectedrulekey'],true,this.form['hi'].value)"
       										>
											<html:options collection="taskMap" property="label"
												labelProperty="value" />
										</html:select>
										
									</td>	
									<td vAlign=center align=middle><INPUT name=right type=button class="input" onClick="moveSelectedOptions(this.form['rule_des'],this.form['selectedrulekey'])" value=">>">
							        <BR> <BR> <INPUT name=right type=button class="input" onClick="moveAllOptions(this.form['rule_des'],this.form['selectedrulekey'])" value="All >>">
							        <BR> <BR> <INPUT name=left type=button class="input" onClick="moveSelectedOptions(this.form['selectedrulekey'],this.form['rule_des'])" value="<<">
							        <BR> <BR> <INPUT name=left type=button class="input" onClick="moveAllOptions(this.form['selectedrulekey'],this.form['rule_des'])" value="All <<">
							        </td>						
									<td align="left" valign="top">
										<b>结果表：</b>
										<br>
										 <select name=selectedrulekey size=15
									        multiple  style="width:220"
									        ondblclick="moveSelectedOptions(this.form['selectedrulekey'],this.form['rule_des'],true,this.form['hi'].value)">
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
</html>
