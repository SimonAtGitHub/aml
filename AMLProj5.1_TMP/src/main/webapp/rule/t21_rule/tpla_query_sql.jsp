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
		
			function checkForm(theUrl){
				document.forms[0].totalSize.value = idTBSQL.rows.length;
				document.forms[0].action=theUrl;
				document.forms[0].submit();
			}

			function addRow() {
				oTR    = idTBSQL.insertRow(idTBSQL.rows.length);
				tmpNum = oTR.rowIndex;
				oTD   = oTR.insertCell(0);
				oTD.innerHTML =
				     " <tr>"
				   + " <td align='left' valign='top'>"
				   + " <input name ='exeseq" + tmpNum + "' size='2' value='" + tmpNum + "' readonly>"
				   + " </td>";

				oTD1   = oTR.insertCell(1);
				oTD1.innerHTML=
				     " <td align='left' valign='top'>"
				   + " <a id = 'textRow" + tmpNum + "'></a> <br>"
				   + " <textarea name ='selsql" + tmpNum + "' onkeydown='savePos(this)' onkeyup='savePos(this)' onmousedown='savePos(this)' onmouseup='savePos(this)' onfocus='savePos(this)' rows='13' cols='60'></textarea>"
				   + " </td>"
				   + " </tr>";
				textRowName = "textRow" + tmpNum;
				eval(textRowName).innerHTML="第" + tmpNum + "组SQL：是否主SQL：<input name='ismainsql' type='radio' value='"+tmpNum+"'>";
				document.forms[0].totalSize.value = idTBSQL.rows.length;
			}

			function delRow() {
				if (!confirm('你真的要删除页面最下方一组SQL吗？')) {
		           return false;
		        } 
				var vIndex = idTBSQL.rows.length - 1;
				if (vIndex == 1){
					alert("最少要有一组SQL！")
					return false;
				}
				idTBSQL.deleteRow(vIndex);
				document.forms[0].totalSize.value = idTBSQL.rows.length;
			}
			function   savePos(oE)   
			  {   
					if(oE.createTextRange){         
						oE.caretPos   =   document.selection.createRange().duplicate(); 
					}
					getTextareaName();
			  } 
		    
			
		
		
		  function   copychar(from ,to)   
		  {   
		  		var to = document.forms[0].textareaName.value;
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
				if(to){
					var textEl = document.getElementById(to);
			        if(textEl.createTextRange   &&   textEl.caretPos)   
			        {   
			              var   caretPos   =   textEl.caretPos;   
			              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
			        }   
			        else   
			              textEl.value     =   text;   
				}
		  } 
		  
		  function  getTextareaName()   
			  {   
			  
					var Texreas = document.getElementById("idTBSQL").getElementsByTagName("textarea");
				         if(Texreas.length>0){
				                 for(var i=0;i<Texreas.length;i++){
				                     Texreas[i].onfocus=function() { 
				                        
									    var getname = this.getAttribute('name');
									    
									    document.forms[0].textareaName.value = getname;
									 }
				                 }
				         } 
			  } 
		</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form method="post" action="/t21_rule/t03_tp_exec_qry_add_do.do">
			<input type="hidden" name="pos" value="0" />
			<input type="hidden" name="textareaName" value="" />
			
			<div class="conditions">
	            <div class='cond_t'>
	              <span>规则管理 - 编辑SQL</span>
				  <span class="buttons">
				    <a href="javascript:void(0);" onClick="dosubmit('<%=request.getContextPath() %>/rule/t21_rule/t03_tp_exec_qry_add_single.do','change');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_excluded.png" />切换模式</a>
				    <a href="javascript:void(0);" onClick="addRow();return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />增加SQL语句</a>
				    <a href="javascript:void(0);" onClick="delRow();return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />删除SQL语句</a>
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
										执行顺序
									</td>
									<td align="left">
										SQL表达式
									</td>
								</tr>
								<%
									ArrayList t03_tp_exec_qryList = (ArrayList) request
													.getAttribute("t03_tp_exec_qryList");
											for (int i = 0; i < t03_tp_exec_qryList.size(); i++) {
											    String ischecked = "";
												T03_tp_exec_qry t03_tp_exec_qry = (T03_tp_exec_qry) t03_tp_exec_qryList
														.get(i);
								%>
								<tr>
									<td align='left' valign='top'>
										<br>
										<input name="exeseq<%=i + 1%>" size='2'
											value="<%=t03_tp_exec_qry.getExecseq()%>" readonly>
									</td>
									<td align='left' valign='top'>
										<textarea name="selsql<%=i + 1%>" onkeydown="savePos(this)"
											onkeyup="savePos(this)" onmousedown="savePos(this)"
											onmouseup="savePos(this)"  onfocus='savePos(this)' rows="13" cols="60"><%=t03_tp_exec_qry.getExecsql()%></textarea>
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
										<b>系统函数：</b>
										<br>
										<html:select property="sysfunctions" style="{width:220px} "
											multiple="true" size="8"
											ondblclick="copychar('sysfunctions','selsql1');">
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
											ondblclick="copychar('parmcd','selsql1')">
											<html:options collection="parMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
							</table>
						</TD>
					</TR>
					<c:if test="${rule.implway ne '2'}" >
					<TR>
						<TD>
							<table>
								<tr>
									<td align="left">
										<input type="hidden" name="totalSize" value="0" />
										<input type="button" name="button" value="提 交"
											onClick="checkForm('<%=request.getContextPath()%>/rule/t21_rule/t03_tp_exec_qry_add_do.do')"  class="in_button1"/>
										<html:reset styleClass="in_button1" value="重 填" />
									</td>
									<td align="left"></td>
								</tr>
							</table>
						</TD>
						<TD>
							&nbsp;
						</TD>
					</TR></c:if>
				</TABLE>
			</div>
		</html:form>
	</div>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
var count = idTBSQL.rows.length;
if(count < 2){
 addRow();
}

</SCRIPT>

</html:html>
