<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
              <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script src="../../js/title.js" ></script>
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
             <script type="text/javascript" src="../../js/jquery.js" ></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
<SCRIPT LANGUAGE="JavaScript" >
function _chengeUrl(url)
{
	var ifram=document.getElementById("report_detail");
	ifram.src=url;
}
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<div id= "main">
<html:form method="post" action="/apply/t07_cd_apply_detail.do">
	<div class="conditions" >
    	<div class="cond_t" >
             	<span>申请详情</span >
                   <span class="buttons" ><a href ="#" onclick="dosubmit('<bean:write name="backUrl"/>')"><img src="../../images/blue/b_back.png" />返  回</a>
                 </span>
         </div>
         <div class="cond_c2" >
         	<table border="0" cellpadding= "0" cellspacing ="0">
            	<tr>
				<td align="right">报告机构名称：</td>
				<td align="left">
					<bean:write property="rinm" name="t07_cd_apply" />
				</td>
				<td align="right">报告机构编码：</td>
				<td align="left">
					<bean:write name="t07_cd_apply" property="ricd"/>
				</td>
				</tr>
				<tr>
				<td align="right">报告类型：</td>
				<td align="left">
					<bean:write property="msg_type_disp" name="t07_cd_apply" />
				</td>
				<td align="right">操作类型：</td>
				<td align="left">
					<bean:write name="t07_cd_apply" property="apply_type_disp"/>
				</td>
				</tr>
				<tr>
				<td align="right">创建人:</td>
				<td align="left" >
					<bean:write name="t07_cd_apply" property="create_user"/>
				</td>
				<td align="right">填表时间:</td>
				<td align="left" >
					<bean:write name="t07_cd_apply" property="create_dt_disp"/>
				</td>
			</tr>
            </table>
         </div>
	<div id="bigTab">
	<dl class="tabc">
		<logic:equal name="t07_cd_apply" property="msg_type" value="2">
		 <iframe frameborder="0" width="100%" height="500px" src="<%=request.getContextPath()%>/report/apply/t07_bs_report_list.do?newsearchflag=1&apply_no=<bean:write name="t07_cd_apply" property="apply_no"/>" scrolling="no"  id="report_detail" name="report_detail"></iframe>
		</logic:equal>
		<logic:equal name="t07_cd_apply" property="msg_type" value="1">
		 <iframe frameborder="0" width="100%" height="500px" src="<%=request.getContextPath()%>/report/apply/t07_bh_tsdt_list.do?newsearchflag=1&apply_no=<bean:write name="t07_cd_apply" property="apply_no"/>&status_cd=<bean:write name="t07_cd_apply" property="status_cd"/>" scrolling="no"  id="report_detail" name="report_detail"></iframe>
		</logic:equal>
	</dl>
    </div>
</html:form>
</div>
</BODY>
</HTML>
