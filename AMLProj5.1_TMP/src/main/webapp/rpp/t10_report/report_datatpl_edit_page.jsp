<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.rpp.report.dto.*"%>

<html>
	<head>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp"%>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/report.css"
			rel="stylesheet" type="text/css">


		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript">
			jQuery.noConflict();
			(function($){ 
			  $(function(){
				$(document).ready(function(){	
				    $('.report_title span a:first').css('background','none');
					$('.report_table_t div[name=slide]').toggle(function(){
					      $(this).removeClass().addClass('btndown').parent().next().slideUp();
					   },
					   function(){
					      $(this).removeClass().addClass('btnup').parent().next().slideDown();
					});
					
					$('.report_table_t div.btndelete').click(function(){
					      $(this).parent().parent().remove();
					});
				
				});
			// All End
			  });
			})(jQuery);
			</script>
		<SCRIPT LANGUAGE="JavaScript"> 
    function dosubmit(theUrl){
        document.forms[0].actiontype.value="";
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
    }
    
	function checkForm(theUrl){
	    var errMsg ="";
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	        parent.xmlFrame.dosubmit();
	    }
	}
	
	</SCRIPT>
	</HEAD>
	<body class="report_body_bg">
		<div id="report_wrap">
			<html:form method="post" action="/t10_report/editreportdatatpl.do">
				<!--大标题区域-->
			    <div class="report_title">
				  <strong>属性</strong>
				  <span>
				     <a href="#" onClick="dosubmit('editreportdatatpl_des.do','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />报表描述</a>
					 <a href="#" onClick="dosubmit('editreportdatatpl_page.do','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />报表参数</a>
					 <a href="#" onClick="dosubmit('editreportdatatpl_table.do?actiontype=table_add','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />建数报表</a>
					 <a href="#" onClick="dosubmit('editreportdatatpl_chart.do','add')"><img src="<%=request.getContextPath()%>/skin/blue/images/icon/portal_icon01.gif" />报表图形</a>
				  </span>
				</div>
				
				<div class='report_btn'>
					<table>
						<tr>
							<td align="right">
								<%
									String[] tableids = (String[]) request
												.getAttribute("dataTpl_tableids");
										for (int i = 0; tableids != null && i < tableids.length; i++) {
											String id = (String) tableids[i];
								%>
								<input type="button" name="mdi" value="<%=id%>"
									onClick="dosubmit('editreportdatatpl_table.do?actiontype=&tableid=<%=id%>','modi')"
									class="input">
								<%
									}
								%>
							</td>
						</tr>
					</table>
				</div>
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<%
					ArrayList mParamList = (ArrayList) request
								.getAttribute("mParamList");
						ArrayList fParamList = (ArrayList) request
								.getAttribute("fParamList");
						HashMap paramTypes = (HashMap) request
								.getAttribute("paramTypes");
						HashMap typeMap = (HashMap) request.getAttribute("typeMap");
				%>
				<div class='report_cond'>
					<table>
						<tr>
							<td>
								参数类型
							</td>
							<td>
								参数名
							</td>
						</tr>
						<%
							Iterator mIter = mParamList.iterator();
								while (mIter.hasNext()) {
									T10_reportParm _t10_reportParm = (T10_reportParm) mIter
											.next();
									String dispname = _t10_reportParm.getDispname();
									String sysinparmcd = _t10_reportParm.getSysinparmcd();
									String type = (String) paramTypes.get(sysinparmcd);
						%>
						<tr>
							<td align="center">
								<select name="type_<%=sysinparmcd%>">
									<%
										Iterator tIter = typeMap.keySet().iterator();
												while (tIter.hasNext()) {
													String _type = (String) tIter.next();
													String selected = "";
													if (type.equalsIgnoreCase(_type))
														selected = "selected";
									%>
									<option value="<%=_type%>" <%=selected%>><%=_type%></option>
									<%
										}
									%>
								</select>
							</td>
							<td>
								<%=sysinparmcd%>(<%=dispname%>)
							</td>
						</tr>
						<%
							}
						%>

						<%
							Iterator fIter = fParamList.iterator();
								while (fIter.hasNext()) {
									String paramName = (String) fIter.next();
									String type = (String) paramTypes.get(paramName);
						%>
						<tr>
							<td align="center">
								<%=type%>
							</td>
							<td>
								<%=paramName%>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<html:hidden property="actiontype" value="page_edit" />
								<html:hidden property="p_reportkey" />
								<input type="button" value="提 交"
									OnClick=
	checkForm('editreportdatatpl_page.do');
>
								<html:reset styleClass="input" value="重 填" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>
	</body>

</html>
