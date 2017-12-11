<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>添加输入参数</title>
		
	    <%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	    
		<SCRIPT LANGUAGE="JavaScript">
		function dosubmit(theUrl,type){
			if(type=="add"){
				if (document.forms[0].disColList.value.length<=0){
					alert("请按照说明添加输出列！");
					
					return false;
				}
			}
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
</SCRIPT>
	</HEAD>
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_disp_rst_list.do">
			<html:hidden property="tplakey" />
	<div class='awp_title'>
				<table>
					<tr>
					
						<td width="23%" nowrap>
							<span class="awp_title_td2">模板管理 - 调整输出结果 - 批量添加</span>
						</td>
						<td align="right">
							<input type=button value="返 回" name=Button223  
							onClick="dosubmit('t02_tp_disp_rst_list.do','')"></td>
					</tr>
				</table>
			</div> 
			
			<div class="awp_detail">
				<table>
								<tr>
									<td align="left">
										<html:textarea property="disColList" rows="20"  style="width:95%"
											styleClass="text_white">
										</html:textarea>
									</td>
								</tr>
								<tr>
									<td  align="left">
										<html:button property=""  styleClass="input"
											value="批量添加"
											onclick="dosubmit('t02_tp_disp_rst_addList_do.do','add')">
										</html:button>
									</td>
								</tr>
							</table>
						</div>
			<div class="awp_msgtab">
			  <table>
				<tr> 
		        <td ><p><strong>输入格式提示：</strong><br>
		        	<ol>
						<li>每行输入项包括：列英文名、列中文名,列中间用';'隔开。
						<li>列英文名、列中文名不可以为空，中间的';'不可省略。
						<li>输入多行时使用'回车'换行。
						<li>列英文名必须是第一列的列英文名，不可以改变。
					</ol>
		        </td>
		        </tr>
		      </table>
		    </div>

		</html:form>
		</div>
	</BODY>
</HTML>
