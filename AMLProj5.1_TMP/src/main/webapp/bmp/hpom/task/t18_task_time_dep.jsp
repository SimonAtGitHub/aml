<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
    <html:base />
    <META http-equiv=Content-Type content="text/html; charset=GBK">
    <link  href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	   var url;
	   url =  '<%=request.getContextPath()%>/bmp/t18_tasklist/'+theUrl;
       document.forms[0].action=url;
       document.forms[0].submit();
	}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
    <div id='content'>
        <html:form method="POST" action="/t18_tasklist/t18_task_time_dep.do" >
            <div class='awp_title'>
                <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
                    <tr>
                        <td>
                            <span class="awp_title_td2">任务 - 时间依赖</span>
                        </td>
                        <td align="right">
                            <html:button property="closebutton" value="返 回" onclick="dosubmit('t18_tasklist_list.do');" />
                        </td>
                    </tr>
                </table>
				<html:hidden property="businesskey"/>
				<html:hidden property="tasktype"/>
                <div class="awp_detail">
                    <table>
                        <tr>
                            <td width="100px" align="right">
                                <FONT color="#ff0000">*</FONT>业务编码：
                            </td>
                            <td>
                                <bean:write name="t18_tasklist" property="businesskey" scope="request" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                任务类别：
                            </td>
                            <td>
                                <bean:write name="t18_tasklist" property="tasktype_disp" scope="request" />
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="right">
                                
                            </td>
                            <td>
                               <input type="button" name="btn1" value="设置依赖" onclick="dosubmit('t18_task_time_dep_do.do?type=depend');"/> 
                               <input type="button" name="btn1" value="取消依赖" onclick="dosubmit('t18_task_time_dep_do.do?type=notdepend');" /> 
                            </td>
                        </tr>
                    </table>
                </div>

                
        </html:form>
    </div>
</body>

</html:html>
