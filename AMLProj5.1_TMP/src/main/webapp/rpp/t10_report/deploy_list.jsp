<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html>
<head>
	<title></title>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<script src="<%=request.getContextPath()%>/js/fdp_rules.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
   function dosubmit(theUrl,type){
  
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('您真的要删除操作符吗？')){
                isSub = true;
            }
        }
    }
    else if(type=='deploy'){
    	errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
                isSub = true;
        }
    }
    else if(type=='search' || type=='add'){
        isSub = true;
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
<body>
	<div id='content'>

		<html:form method="post" action="/t10_report/t10_report_list.do">
			<div class='awp_title'>

				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">报表发布 - 列 表</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type="button" name="add" value="发 布"
								onClick="dosubmit('deploy_report_do.do','deploy')" class="input">
							<input type="button" name="delete" value="撤销发布"
								onclick="dosubmit('repeal_report_do.do?deployflag=2&type=deploy','deploy')"
								class="input">
							<input type="button" name="delete" value="撤销申请"
								onclick="dosubmit('t10_report_deploy.do?deployflag=1&type=deploy','deploy')"
								class="input">
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class='awp_cond' id="searchtable" style="display:none">
				<table>
					<tr>
						<td>
							报表编号：
						</td>
						<td>
							<html:text property="reportkey" styleClass="text_white" size="30"
								maxlength="10" onkeyup="value=value.replace(/[\W]/g,'')" />

						</td>

						<td>
							报表名称：
						</td>
						<td>
							<html:text property="reportname" size="30"
								styleClass="text_white" />
					</tr>
					<tr>
						<td>
							报表类别：
						</td>
						<td>
							<html:select property="reportype">
								<html:options collection="reportTypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" name="button" value="查 询"
								onClick="dosubmit('t10_report_deploy_list.do?newsearchflag=1','search')"
								class="input">
						</td>

					</tr>
				</table>
			</div>

			<div class="awp_dynamic_list">
				<table>
					<tr>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
						<td align="center" nowrap>
							报表编号
						</td>
						<td align="center" nowrap>
							报表名称
						</td>
						<td align="center" nowrap>
							报表类别
						</td>
						<td align="center" nowrap>
							所属子系统
						</td>
						<td align="center" nowrap>
							发布状态
						</td>
						<td align="center" nowrap>
							报表链接
						</td>
						<!--  
				 <td  align="center">是否允许导出</td>
				 <td  align="center">条件页面</td>
				 <td  align="center">数据模板</td>
				 <td  align="center">展现模板</td>
 				 <td  align="center">报表描述</td> -->
					</tr>
					<logic:iterate id="report" name="t10_reportList"
						type="com.ist.rpp.report.dto.T10_report" indexId="i">
						<tr>
							<td align="center" nowrap>
								<logic:notEmpty name="report" property="reportkey">
									<html:multibox property="selectReportkeys" disabled="false"
										onclick="changcol(this)">
										<bean:write name="report" property="reportkey" />
									</html:multibox>
								</logic:notEmpty>
							<td align="left" nowrap>
								
								<logic:notEqual value="1" name="report" property="ishavepara">
								<a
									href="javascript:openWin('/<%=request.getContextPath()%>/rpp/showReport.do?new_qry_flag=1&jump_rslt_flag=1&fast_qry=1&reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>','','600','800')">
									<bean:write name="report" property="reportkey" scope="page" />
								</a>
							    </logic:notEqual>
							    <logic:equal value="1" name="report" property="ishavepara">
							    <a
									href="javascript:openWin('t10_report_test.do?reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>','','600','800')">
									<bean:write name="report" property="reportkey" scope="page" />
								</a>
							    </logic:equal>
							</td>
							<td align="left" nowrap>		
									<bean:write name="report" property="reportname" scope="page" />	
							</td>
							<td align="center" nowrap>
								<bean:write name="report" property="reportype_disp" scope="page" />
							</td>
							<td align="center" nowrap>
								<bean:write name="report" property="reportsys_disp" scope="page" />
							</td>
							<td align="center" nowrap>
								<bean:write name="report" property="deployflag_disp"
									scope="page" />
							</td>
							<td align="left" >
							<logic:notEqual value="1" name="report" property="ishavepara">
							<%=request.getContextPath()%>/rpp/showReport.do?new_qry_flag=1&jump_rslt_flag=1&fast_qry=1&reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>
							</logic:notEqual>
							<logic:equal value="1" name="report" property="ishavepara">
							<%=request.getContextPath()%>/rpp/t10_report/t10_report_test.do?reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>
							</logic:equal>
							
							</td>
							<!-- 
				 <td align="center"><bean:write name="report" property="isexport_disp" scope="page" /></td>
				 <td align="center"><bean:write name="report" property="parampage" scope="page" /></td>
				 <td align="center" style="word-wrap: break-word;word-break:break-all;"><bean:write name="report" property="datatpl_file" scope="page" /></td>
				 <td align="center" style="word-wrap: break-word;word-break:break-all;"><bean:write name="report" property="exceltpl_file" scope="page" /></td>
				 <td align="center" style="word-wrap: break-word;word-break:break-all;"><bean:write name="report" property="reportdes" scope="page" /></td>
			  -->
						</tr>
					</logic:iterate>

				</table>
				<br>
			</div>
			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>

</html:html>
