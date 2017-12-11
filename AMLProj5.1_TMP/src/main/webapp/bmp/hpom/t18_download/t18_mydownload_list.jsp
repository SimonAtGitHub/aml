<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">		
		<script language="JavaScript"  src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	    <script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='modi'){ 
				 errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
				 if(errMsg==""){
				 	isSub = true;
				 }
			  }
		    else if(type=='del'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('是否删除？')){
		                isSub = true;
		            }
        		}
		    }
		    else if(type=='batchdownload'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('确定要生成选择的文件吗？')){
		                isSub = true;
		            }
        		}
		    }
		    else if(type=='add' ){
		    	openWin(theUrl,'');
		    }
		    else if(type=='search' || type=='download'){
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
	<BODY>
	<div id='content'>
		<html:form action="/hpom/t18_download/t18_mydownload_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2">我的下载
								- 列表</span></td>
						<td align="right">
							<input type="button" name="btsearch2"
							value="查  找" onclick="btnDisplayHidden(this, 'searchtable')" />
<%--							<input type="button" name="btsearch2"--%>
<%--							value="批量生成下载文件" onclick="dosubmit('<%=request.getContextPath() %>/bmp/hpom/t18_download/t18_mydownload_execDo.do?newsearchflag=1', 'batchdownload')" />--%>
							</td>
							
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class='awp_cond' id="searchtable" style="display:none">
				<TABLE>

					<tr>
						<td>下载名称：</td>
						<td><html:text property="dloadname" styleClass="text_white"
								size="30" /></td>
						<td>申请时间：</td>
						<td><html:text property="app_begintime" size="10" styleClass="awp_date" />
                                <img src="../../../images/calendar.gif" id="img1"
                                    style="cursor:hand;" width="16" height="16" border="0"
                                    align="absmiddle" alt="弹出日历下拉菜单"
                                    onclick="new Calendar().show(document.forms[0].app_begintime);">
                                -
                                <html:text size="10" property="app_endtime" styleClass="awp_date" />
                                <img src="../../../images/calendar.gif" id="img1"
                                    style="cursor:hand;" width="16" height="16" border="0"
                                    align="absmiddle" alt="弹出日历下拉菜单"
                                    onclick="new Calendar().show(document.forms[0].app_endtime);">
                       </td>
					</tr>
					<tr>

						<td></td>
						<td></td>
						<td></td>
						<td><input type="button" name="button" value="查 询"
							onClick="dosubmit('<%=request.getContextPath() %>/bmp/hpom/t18_download/t18_mydownload_list.do?newsearchflag=1','search')" class="input">
						</td>
					</tr>
				</TABLE>
			</div>
			<div class="awp_list">
				<TABLE>
					<TR align=center>
						<TD width="2%">操作</TD>
						<TD noWrap>下载名称</TD>
						<TD noWrap>申请说明</TD>
						<TD noWrap>申请人</TD>
						<TD noWrap>申请时间</TD>
						<TD noWrap>状态</TD>
					</TR>
					<logic:notEmpty name="t18_downloadList">
						<logic:iterate id="dto" name="t18_downloadList"
							type="com.ist.common.download.dto.T18_download">
							<TR align="center">
								<TD noWrap>
									<c:if test="${dto.calstatus eq '4'}">
										<a href="javascript:void(0)" onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/t18_download/t18_mydownload_downloadDo.do?dloadkey=<bean:write name="dto" property="dloadkey" />','download');return false;"><img alt="下载" src="<%=request.getContextPath()%>/skin/<%=style %>/images/download.png" /></a>
									</c:if>
								</TD>
								<TD noWrap><bean:write name="dto" property="dloadname" />
								</TD>
								<TD noWrap><bean:write name="dto" property="appdesc" />
								<TD noWrap><bean:write name="dto" property="appname" />
								<TD noWrap><bean:write name="dto" property="apptime" />
								</TD>	
								<TD noWrap>
									<c:if test="${dto.calstatus eq '0'}">
										<img alt="失败" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon4.gif" title="失败"/>
									</c:if>
									<c:if test="${dto.calstatus eq '2'}">
										<img alt="未计算" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon1.gif" title="未计算"/>
									</c:if>
									<c:if test="${dto.calstatus eq '3'}">
										<img alt="正在计算" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon2.gif" title="正在计算"/>
									</c:if>
									<c:if test="${dto.calstatus eq '4'}">
										<img alt="已计算" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon3.gif"  title="已计算"/>
									</c:if>
								</TD>
							</TR>
						</logic:iterate>
					</logic:notEmpty>

				</TABLE>
			</div>

			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<c:out value="${pageInfo}" escapeXml="false"/>	
							</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</BODY>
</HTML>
