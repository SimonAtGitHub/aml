<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
<html:form method="post" action="/template/tpla_publish_list.do">
 <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">模型参数检测 - 模型列表</span>
						</td>
						<td align="right">
							&nbsp;</td>
					</tr>
				</table>
			</div>   
 
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
  </html:messages>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>
  
   
<div class="awp_list">
  <TABLE>
    <TR > 
       <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
      <TD width="20%" align="center" nowrap>模板名称</TD> 
      <TD width="14%" nowrap>模板类别</TD>
      <TD width="14%" nowrap>模型申请状态</TD>
      <TD width="14%" nowrap>模型状态</TD>
      <TD width="14%" nowrap>模型类型</TD>
      <TD width="9%" noWrap>创建人</TD>
      <TD width="18%" nowrap>创建日期</TD>
      <TD width="11%" noWrap>发布日期</TD>
    </TR>


	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf">
    <TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
       <TD  nowrap>
                           <html:multibox property="tplakeys">
								<bean:write name="binfo" property="tplakey" />||<bean:write name="binfo" property="tplatype" />
							</html:multibox>
						    <html:hidden name="binfo" property="tplastat_disp" />
		</TD>
       <TD nowrap><bean:write name="binfo" property="tplaname" scope="page" /></TD> 
       <TD nowrap><bean:write name="binfo" property="tplacatecd_name" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="tplareqstat" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="tplastat_disp" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="tplatype_disp" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="creator" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="createdate" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="publishdate" scope="page"/></TD>
    </TR>
    </logic:iterate>
  </TABLE>
</div> 
</html:form>
</div>
</BODY>
</html:html>
