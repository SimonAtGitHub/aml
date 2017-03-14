<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<meta http-equiv="refresh" content="60"> 
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl,type){
       var errMsg = "";
    var isSub = false;
    if(type=='modi'){
         isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你要删除选择模板吗？')){
                isSub = true;
            }
        }
    }else if(type=='submit'){
    	var objTplstat = document.getElementsByName('tplastat_disp');
    	var objCheckBox = document.getElementsByName('tplakeys');
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg==''){
        	errMsg = CheckBoxMustCheckedAndTplaStat(objCheckBox,objTplstat);
        }
        
        if(errMsg==''){
            if(confirm('你要发布选择模板吗？')){
               isSub = true;
           }
        }
    }else if(type=='recsubmit'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你要退回选择模板吗？')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要激活选择的功能吗？')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add' || type=='view'){
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
<BODY leftmargin="0" topmargin="0">
<div id='content'>
<html:form method="post" action="/template/tpla_backexec_mylist.do">
<div class='awp_title'>
				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">后台执行- 我的查证
							</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
									onclick="btnDisplayHidden(this, 'searchtable')" />	
							<input type="button" name="btsearch2" value="删 除"
									onclick="dosubmit('<%=request.getContextPath() %>/avp/template/tpla_backexec_deleteDo.do?newsearchflag=1&back=0', 'del')" />	
					</tr>
				</table>
			</div>      


  
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
  </html:messages>
 
  
  <div class='awp_cond' id="searchtable"  style="display:none"> 
  <table>
								<tr >
								    <td >
										模型名称：
									</td>
									<td >
										<html:text property="tplaname" styleClass="text_white" size="30" />
									</td>	
									<td  >
										数据日期：
									</td>
									<td >
									<html:text property="createdate_min" styleClass="text_white" size="10" maxlength="10"  readonly="true"/>
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="弹出日历下拉菜单"
										onclick="new Calendar().show(document.forms[0].createdate_min);"> 至 
									<html:text property="createdate_max" styleClass="text_white" size="10" maxlength="10"  readonly="true"/>
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="弹出日历下拉菜单"
										onclick="new Calendar().show(document.forms[0].createdate_max);">	
									</td>	
								</tr>
								<tr >
								    <td >
									   模型类型：
									</td>
									<td nowrap >
										<html:select property="tplatype">
										<html:options collection="tplatypeMap" property="label"
											labelProperty="value" />
									    </html:select>
									</td>
									<td  >
										模型申请状态：
									</td>
									<td >
										<html:select property="tplareqstat">
											<html:options collection="flagMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>	
								</tr>
								<tr >		
								        <td >
										   排序：
										</td>
										<td >
										<html:select property="sort">
	                  						<html:options collection="sortMap" property="label" labelProperty="value"/>
	               							</html:select>
											&nbsp;
											<html:radio property="sort_type" value="asc">升序</html:radio>
											<html:radio property="sort_type" value="desc">降序</html:radio>
											<html:radio property="sort_type" value="">不排序</html:radio>
										
									</td>
										 <td >
										</td>
										<td >
										
									</td>
								</tr>
								
								<tr >		
								       <td >
										
										</td>
										<td nowrap>
											
										</td>
										 <td >
										 
										</td>
										<td > <input type="button" name="button11" value="查 询" onClick="dosubmit('<%=request.getContextPath() %>/avp/template/tpla_backexec_mylist.do?newsearchflag=1','search')" ></td>
								</tr>

							</table>
	</div>					
  <input type="hidden" name="busstypecd" value=<%=request.getAttribute("busstypecd") %>>
 
<div class="awp_list">
  <TABLE  >
    <TR align=center > 
      <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
      <TD width="18%" align="center" nowrap>模型名称</TD> 
      <TD width="10%" nowrap>模型类别</TD>
      <TD width="10%" nowrap>模型申请状态</TD>
      <TD width="10%" nowrap>模型状态</TD>
      <TD width="10%" nowrap>模型类型</TD>
      <TD width="10%" noWrap>数据日期</TD>
      <TD width="10%" nowrap>开始时间</TD>
      <TD width="10%" nowrap>结束时间</TD>
      <TD width="10%" noWrap>计算用时</TD>
       <TD width="10%" noWrap>状态</TD>
    </TR>


	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf">
    <TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
	       <TD height=22 nowrap>
	            <html:multibox property="taskkeys">
					<bean:write name="binfo" property="taskkey" />
				</html:multibox>
		    <html:hidden name="binfo" property="tplastat_disp" />
			</TD>
			<TD align="left">
				<c:choose>
					<c:when test="${binfo.calstatus eq '4'}">
						<a href="javascript:void(0);" onclick="avpSubmitPopUp('','<%=request.getContextPath() %>/avp/template/tpla_backexec_resultView_do.do?newsearchflag=1&tplakey=<bean:write name="binfo" property="tplakey" scope="page" />&taskkey=<bean:write name="binfo" property="taskkey" scope="page" />','900','600');return false;"><bean:write name="binfo" property="tplaname" scope="page" /></a>
					</c:when>
					<c:otherwise>
						<bean:write name="binfo" property="tplaname" scope="page" />
					</c:otherwise>
				</c:choose>
			</TD>
			<TD align="left">
				<bean:write name="binfo" property="tplacatecd_name" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="tplareqstat" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="tplastat_disp" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="tplatype_disp" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="statisticdate" scope="page" />
			</TD>
			<TD align="left" noWrap>
				<bean:write name="binfo" property="begintime" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="endtime" scope="page" />
			</TD>
			<td>
				<bean:write name="binfo" property="usetime" scope="page" />
			</td>
			<td>
				<c:if test="${binfo.calstatus eq '0'}">
					<img alt="失败" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon4.gif" title="失败"/>
				</c:if>
				<c:if test="${binfo.calstatus eq '2'}">
					<img alt="未计算" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon1.gif" title="未计算"/>
				</c:if>
				<c:if test="${binfo.calstatus eq '3'}">
					<img alt="正在计算" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon2.gif" title="正在计算"/>
				</c:if>
				<c:if test="${binfo.calstatus eq '4'}">
					<img alt="已计算" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon3.gif"  title="已计算"/>
				</c:if>
			</td>

		</TR>
    </logic:iterate>
  </TABLE>
  </div>
  <div class='awp_page_bottom'>
	<table width="98%" border="0" align="center" cellpadding="3"
		cellspacing="3">
		<tr>
			<td align="center">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</td>
		</tr>
	</table>  
	</div>
</html:form>
</div>
</BODY>
</html:html>
