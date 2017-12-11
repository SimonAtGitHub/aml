<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js">
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<%
String templatekey= (String)session.getAttribute("t37_risk_result_key");
String url=request.getContextPath()+"/risk_rate/result/result_modify.do?resulekeys="+templatekey+",";
%>
function dosubmit(theUrl,type){
	var errMsg="";
	var isSub = false;
    if(type=='del'){
    	 if(checkRadio(document.forms[0].attachkey)<0){
             errMsg+="请选择要删除的附件信息！";
           }
        if(errMsg==''){
            if(confirm('确认要删除上传的附件吗？')){
                isSub = true;
            }
        }
    }
    else if(type=='add'){
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
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<html:form action="/t37_risk_attach/t37_risk_attach_list.do" method="post">
<input type="hidden" name="resulekey" value="<bean:write name="resulekey"/>"/> 

 <div id="main">
  <div class="list">
	<TABLE border="0" cellspacing="0" cellpadding="0">
    <TR>
      <Th>文件名称</Th>
      <Th>上传时间</Th>
      <Th>上传人</Th>
    </TR>
<logic:iterate id="attach" name="t37_risk_attachList" type="com.ist.aml.risk_rate.dto.T37_risk_attach">
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD><a href="#" onClick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode( attach.getAttach_name() )%>','','height=160, width=300,left=100,top=100');" >
      <bean:write name="attach" property="attach_realname" scope="page"/>
      </a></TD>
      <TD><bean:write name="attach" property="load_date_disp" scope="page"/></TD>
      <TD><bean:write name="attach" property="load_user" scope="page"/></TD>
    </TR>
</logic:iterate>
  </TABLE>
  </div>
  	<div class="list_page">
  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
    <tr>
      <td align="center"><bean:write name="pageInfo" scope="request" filter="false"/></td>
    </tr>
  </table>
  </div>
  </div>
</html:form>
</BODY>
</HTML>


