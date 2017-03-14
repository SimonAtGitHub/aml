<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ist.aml.rule.dto.T03_tp_exec_qry"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    
    <script src="<%=request.getContextPath()%>/js/load_window.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
			function dosubmit(theUrl,type){
					if(type=='test'){
						document.forms[0].target='_blank';
					}
					else{
						document.forms[0].target='_self';
					}
					document.forms[0].totalSize.value = idTBSQL.rows.length;
					document.forms[0].action=theUrl;
					document.forms[0].submit();
			}
			function checkForm(theUrl,type){
				var errMsg ="";
				if(errMsg!=""){
					alert(errMsg);
					return false;
				}
				dosubmit(theUrl,type);
			}

			function   savePos(oE)   
			  {   
					if(oE.createTextRange){         
						oE.caretPos   =   document.selection.createRange().duplicate(); 
					}
			  } 

			
		  function   copychar(from ,to)   
		  {   
				
				var parvalueStr = document.getElementById(from).value;
			    var parlength=getLength(parvalueStr);
			    var parvalue=parvalueStr.substr(0, parlength);
			    var partype=parvalueStr.substr(0, 1);
			    var text;
						
				if(partype=="@"){
					text = parvalue;
		        }
		        else {
					text = '<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>' ;
		        }
		
				var textEl = document.getElementById(to);
		        if(textEl.createTextRange   &&   textEl.caretPos)   
		        {   
		              var   caretPos   =   textEl.caretPos;   
		              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
		        }   
		        else   
		              textEl.value     =   text;   
		  } 
		  
		  
		  
		</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form method="POST" action="/t21_rule/t03_tp_exec_qry_add_do.do">
			<input type="hidden" name="pos" value="0" />
			<div class="conditions">
	            <div class='cond_t'>
	              <span>规则编辑 - 编辑SQL</span>
				  <span class="buttons">
				    <a href="javascript:void(0);" onClick="dosubmit('<%=request.getContextPath() %>/rule/t21_rule/t03_tp_exec_qry_list_add.do','change');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_excluded.png" />切换模式</a>
				    
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
							<html:hidden property="tplakey" />
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
                                        <textarea name="selsql" rows="25" cols="60" onkeydown="savePos(this)"
											onkeyup="savePos(this)" onmousedown="savePos(this)"
											onmouseup="savePos(this)" onfocus="savePos(this)"><%=selsql%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align='left' valign='top'>
                                        <FONT color="#ff0000"> 注:请用";"（分号）分割sql;</FONT>
                                    </td>
                                </tr>
                            </table>
                        </TD>
					
						<TD align="center" valign="top">
							<table>

								<tr>
									<td align="left" valign="top">
										<b>系统函数：</b>
										<br>
										<html:select property="sysfunctions" style="{width:220px} "
											multiple="true" size="8"
											ondblclick="copychar('sysfunctions','selsql');">
											<html:options collection="sysfunctionMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>

								<tr>
									<td align="left" valign="top">
										<b>参数：</b>
										<br>
									<html:select property="parmcd" size="15" style="{width:220px} "
											ondblclick="copychar('parmcd','selsql')">
											<html:options collection="parMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
							</table>
						</TD>
					</TR>
					<TR>
						<TD>
							<table>
								<tr>
									<td align="left">
										<input type="hidden" name="totalSize" value="0" />

										<input type="button" name="button" value="提 交"
											class="in_button1" onClick="checkForm('<%=request.getContextPath()%>/rule/t21_rule/t03_tp_exec_qry_single_do.do')"
											class="input" >
										<html:reset styleClass="in_button1" value="重 填" />
									</td>
									<td align="left">
									</td>
								</tr>
							</table>
						</TD>
						<TD>
							&nbsp;
						</TD>
					</TR>
				</TABLE>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>
