<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/uc.js"></script>
				<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
			<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			var path = '<%=request.getContextPath()%>';
		</script>
		<SCRIPT LANGUAGE="JavaScript">
		
		function dosubmit(theUrl,type){
		
		    var errMsg = "";
		    var isSub = false;
		    if(type == 'add'){
		    	isSub = true;
		    }
		    if(type == 'modi'){
		    	errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
		    	isSub = true;
			}
		    if(type=='del'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		    	if(!errMsg &&　confirm('你真的要删除吗？')){
		            isSub = true;
		        }
		    }
		    if(type=='search'){
		        if(errMsg==''){
					isSub = true;
		        }
		    }
		    if(isSub && errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        if(errMsg!='')
		            alert(errMsg);
		        return false;
		    }
		}
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
			<html:form action="/template/t02_tp_report_list.do" method="post">
			<html:hidden property="tplakey"/>
			<div class='awp_title'>
				<table>
					<tr>						
						<td width="23%" nowrap><span class="awp_title_td2">模板报表 - 列表 </span></td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
									onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:button value="新 建" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_report_add.do','add')" />
							<html:button value="修 改" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_report_modify.do','modi')" />
							<html:button value="删 除" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_report_delete_do.do','del')" />
						</td>
					</tr>
				</table>
			</div> 			
			
			
			

				<div class='awp_cond' id="searchtable" style="display:none">
					<table>
						<tr>
							<td>
								报表编码：
							</td>
							<td>
								<html:text property="reportkey"></html:text>
							</td>
							<td>
								报表名称：
							</td>
							<td>
								<html:text property="reportname"></html:text>
							</td>				
						</tr>
						<tr>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
									<html:button value="查 询" property="Buttondel" styleClass="input"
								onclick="dosubmit('t02_tp_report_list.do?newsearchflag=1','search')" />
							</td>
						</tr>
									
					</table>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class='awp_list'>
					<TABLE>
						<TR align=center>
							<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor: pointer;'>全部</td>
							<TD noWrap>
								报表名称
							</TD>
							<TD noWrap>
								行区域
							</TD>
							<TD noWrap>
								列区域
							</TD>
							<TD noWrap>
								数据区域
							</TD>
							<TD noWrap>
								是否行汇总
							</TD>
							<TD noWrap>
								是否列汇总
							</TD>
						</TR>
						<logic:iterate id="t02_tp_report" name="t02_tp_reportList"
							type="com.ist.avp.template.dto.T02_tp_report" indexId="index">
								<TR align=center>
								<TD  nowrap>
									<html:multibox property="selectreportkeys">
										<bean:write name="t02_tp_report" property="reportkey" />
									</html:multibox>
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_report" property="reportname" />
								</TD>
								<td noWrap>
									<bean:write name="t02_tp_report" property="row_cond" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_report" property="disp_cond" />
								</TD>
								<td noWrap>
									<bean:write name="t02_tp_report" property="data_cond" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_report" property="colsum_disp" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_report" property="rowsum_disp" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
