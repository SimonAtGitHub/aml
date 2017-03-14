<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
  <%String url = request.getContextPath();
     String cssurl=url+"/css/aml_"+session.getAttribute("style")+".css";
     String  titlejsurl=url+"/js/aml.js";
     String basefuncurl=url+"/js/basefunc.js";
     String jquery=url+"/js/jquery.js";
   %>
<link rel="stylesheet" href=<%=cssurl%> type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script language="JavaScript" src=<%=titlejsurl%>></script>
<script language="JavaScript" src=<%=basefuncurl%>></script>
<script language="JavaScript" src=<%=jquery%>></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){  
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
function opersubmit(theUrl,obj){
   //form1.oper_id.value=obj.name;
    if(confirm("确认您的操作吗!")){
          dosubmit(theUrl);
    }
}
function opersubmit1(theUrl,obj){
   //form1.oper_id.value=obj.name;
    if(confirm("                请确认已按要求校正上报信息！！！ 否则将会被系统退回！！！                               ")){
   
          dosubmit(theUrl);
    }
}
function tasksubmit(theUrl,task_id){  
  // form1.task_id.value=task_id; 
   dosubmit(theUrl);
}
</SCRIPT>

</HEAD>
<body class="mainbg">
<html:form action="/case/t07_flow_workbench08.do" method="post">
 <div id="main">
 <div class="conditions">
	<div class="cond_t">
	  <span> <strong><font color="0072BC"><bean:write name="title"/>  - 报告信息</font></strong></span>
	  <span class="buttons">
	 <logic:equal value="2" name="t07_case_application" property="cast_type">
		<a href='#' onClick="window.open('<%=request.getContextPath() %>/mfa/mfa_issue/MFA.html?isSave=<%=(String)request.getAttribute("isSave") %>&net_id=<bean:write
				property="application_num" name="t07_case_application" />&isHistory=<bean:write
				property="casesearchtime" name="t07_case_application" />','_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no');" ><img src="../../images/blue/case02.gif" />资金网络</a>
	</logic:equal>
	 <a href="#" onclick="dosubmit('<%=request.getContextPath() %><bean:write name="backUrl"/>')">
							<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a> 
	  </span>
	</div>
  <html:errors/>
	<!-- table content -->
	<div class="cond_c2">
   <table border="0" cellpadding="0" cellspacing="0">
    <TBODY>
      <TR>
        <TD align="center" valign="top" style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
          <table width="100%" border="0" cellpadding="1" cellspacing="1">
             <tr bgcolor="F6F9FF">
              <td width="20%" height="22" align="right" bgcolor="ECF3FF"><%=com.ist.util.Constans.CASE_NAME %>名称：</td>
              <td width="30%" bgcolor="F6F9FF"><bean:write property="case_name" name="t07_case_application" /></td>
              <td width="20%"  height="22" align="right" bgcolor="ECF3FF"><%=com.ist.util.Constans.CASE_NAME %>类型：</td>
              <td width="30%"  bgcolor="F6F9FF">
              <bean:write name="t07_case_application" property="cast_type_disp"/>
              <html:hidden name="t07_case_application" property="cast_type"/>
              </td>
            </tr>
            <tr bgcolor="ECF3FF">
             <td height="22" align="right" bgcolor="ECF3FF" noWrap>报文种类：</td>
              <td bgcolor="F6F9FF"> <bean:write name="t07_case_application" property="case_kind_disp"/>
              						<html:hidden name="t07_case_application" property="case_kind" />
              </td>            
                 <td height="22" align="right" bgcolor="ECF3FF"><%=com.ist.util.Constans.CASE_NAME %>状态：</td>
              <td bgcolor="F6F9FF"><bean:write name="t07_case_application" property="app_state_cd_s"/>
              					   <html:hidden name="t07_case_application" property="app_state_cd"/>
              </td>
            </tr>
             <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF" noWrap>机构名称：</td>
              <td bgcolor="F6F9FF"> <bean:write property="app_org_id"  name="t07_case_application" />
              						<html:hidden property="organkey"  name="t07_case_application" />
              </td>
              <td height="22" align="right" bgcolor="ECF3FF" noWrap>创建日期：</td>
              <td bgcolor="F6F9FF"> <bean:write property="app_dt_disp"  name="t07_case_application" /></td>
            </tr>  
          </table>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
  </div>
  <div class="cond_t">
	  <span>  <strong><font color="0072BC"><%=com.ist.util.Constans.CASE_NAME %>意见</font></strong></span>
	</div>
	<div class="list">
   <table border="0" cellpadding="0" cellspacing="0">

     <TR>
      <th>机构名称</th>
      <th>岗位名称</th>
      <th>操作员</th>
      <th><%=com.ist.util.Constans.CASE_NAME %>意见</th>
    </TR>
     <logic:iterate id="advi" name="getT07_case_adviList" type="com.ist.aml.report.dto.T07_case_application">
     <TR align="center" bgcolor="#FFFFFF">  
      <TD><bean:write name="advi" property="organname" scope="page"/></TD>
      <TD><bean:write name="advi" property="post_name" scope="page"/></TD>
      <TD><bean:write name="advi" property="last_upd_user" scope="page"/></TD>  
      <TD><bean:write name="advi" property="reason" scope="page"/></TD>  
     </TR>  
    </logic:iterate>
   </TABLE>
   <%String root=request.getContextPath();
  String root2=root+"/report/case/case_disp2.do?newsearchflag=1&intPage=1";%>
<%-- 正常 --%>
<logic:equal name="t07_case_application" property="case_kind" value="N"> 
<iframe src=<%=root2 %> scrolling="NO"  width="100%" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<%-- 重报 --%>
<logic:equal name="t07_case_application" property="case_kind" value="A">
 <iframe src=<%=root2%> width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<%-- 纠错 --%>
<logic:equal name="t07_case_application" property="case_kind" value="C">
<logic:equal name="t07_case_application" property="cast_type" value="1">
 <iframe src="<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_list.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<logic:equal name="t07_case_application" property="cast_type" value="2">
  <iframe src="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='t07_case_application' property='application_num'/>&report_time_cd=<bean:write name='t07_case_application' property='casesearchtime'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
</logic:equal> 
<%-- 重报 --%>
<logic:equal name="t07_case_application" property="case_kind" value="R">
<logic:equal name="t07_case_application" property="cast_type" value="1">
 <iframe src="<%=request.getContextPath()%>/pbcreport/validate/nbh_base_info.do?fromcase=1&reported=<bean:write name='t07_case_application' property='casesearchtime'/>&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<logic:equal name="t07_case_application" property="cast_type" value="2">
  <iframe src="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do?newsearchflag=1&report_time_cd=<bean:write name='t07_case_application' property='casesearchtime'/>&fromcase=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
</logic:equal> 
<%-- 删除 --%>
<logic:equal name="t07_case_application" property="case_kind" value="D">
 <iframe src="<%=request.getContextPath()%>/pbcreport/report/dbh_dtdt_list.do?casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<%-- 补正 --%>
<logic:equal name="t07_case_application" property="case_kind" value="I">
<logic:equal name="t07_case_application" property="cast_type" value="1">
 <iframe src="<%=request.getContextPath()%>/pbcreport/report/T07_ibh_tsdt_list.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<logic:equal name="t07_case_application" property="cast_type" value="2">
  <iframe src="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='t07_case_application' property='application_num'/>&report_time_cd=<bean:write name='t07_case_application' property='casesearchtime'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
</logic:equal>
   </div>
   	</div>
   </div>
   </html:form>

</BODY> 


</HTML>



