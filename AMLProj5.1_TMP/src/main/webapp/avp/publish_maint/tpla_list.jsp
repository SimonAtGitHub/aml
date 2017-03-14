<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!-- 日期插件-->
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
function dosubmit(theUrl,type){
       var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        if(checkRadio(document.forms[0].username)<0){
            	errMsg = "请选择";
            }
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='submit'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
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
    }else if(type=='search' || type=='add'){
        //location.href=theUrl;
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


function checkForm(type){
    if(type=='turnPage'){
        document.document.forms[0].action='user_list.htm';
        document.document.forms[0].submit();
    }
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<html:form method="post" action="/template/tpla_publish_list.do">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="53%" class="td1"> <span class="css014"> <strong><font color="0072BC">发布管理 - 模型发布管理</font></strong></span> </td>
      <td width="47%" align="center" nowrap class="td2">        <div align="right">
          <input type=hidden value="" name=s_newsearchflag >
          <input type=button value="发 布" name=Button22 class="input" onClick="dosubmit('tpla_submit.do?newsearchflag=1','submit');">
          <input type=button value="退 回" name=Button22 class="input" onClick="dosubmit('tpla_recsubmit.do?newsearchflag=1','recsubmit');">
      </div></td>
    </tr>
  </table>
  
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>
  
  <TABLE align=center border=1 cellPadding=0 borderColor=333333
				cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
				<TBODY>
					<TR>
						<TD
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr class="deep">
								    <td width="15%" height="22" align="right">
										模型名称：
									</td>
									<td width="35%" height="22" align="left" bgcolor="F6F9FF">
										<html:text property="tplaname" styleClass="text_white" size="15" />
									</td>	
									<td width="15%" height="22" align="right"  >
										创建人：
									</td>
									<td width="35%" height="22" align="left" bgcolor="F6F9FF">
										<html:text property="creator" styleClass="text_white" size="15" />
									</td>	
								</tr>
								<tr class="deep">
								    <td width="15%" height="22" align="right" >
										创建日期：
									</td>
									<td width="35%" height="22" align="left" bgcolor="F6F9FF">
									<html:text property="createdate_min" styleClass="text_white" size="12" maxlength="10" />
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="弹出日历下拉菜单"
										onClick="fPopUpCalendarDlg(createdate_min)"> 至 
									<html:text property="createdate_max" styleClass="text_white" size="12" maxlength="10" />
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="弹出日历下拉菜单"
										onClick="fPopUpCalendarDlg(createdate_max)">	
									</td>	
									<td width="15%" height="22" align="right" >
										模型状态：
									</td>
									<td width="35%" height="22" align="left" bgcolor="F6F9FF">
										<html:select property="tplareqstat">
											<html:options collection="flagMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>	
								</tr>
								<tr class="deep">		
								       <td height="22" align="right">
										   排序：
										</td>
										<td nowrap class="light">
											<html:select property="sort">
	                  						<html:options collection="sortMap" property="label" labelProperty="value"/>
	               							</html:select>
											&nbsp;
											<html:radio property="sort_type" value="asc">升序</html:radio>
											<html:radio property="sort_type" value="desc">降序</html:radio>
											<html:radio property="sort_type" value="">不排序</html:radio>
										</td>
										<td bgcolor="F6F9FF" colspan="2" >
										<input type="button" name="button11" value="查 询" onClick="dosubmit('tpla_publish_list.do?newsearchflag=1','search')" class="input">
									</td>
								</tr>

							</table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
    <html:errors/>  <html:errors/>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>
  <TABLE width="98%" border=0 align="center" cellpadding="2" cellspacing="1" bgcolor="#000000">
    <TR align=center bgcolor="A3C0EE"> 
    	<TD width=4% height=22 align="center" noWrap>选择</TD>
      <TD width="41%" align="center" nowrap>模板名称</TD> 
      <TD width="14%" nowrap>模板类别</TD>
      <TD width="14%" nowrap>模型状态</TD>
      <TD width="9%" noWrap>创建人</TD>
      <TD width="18%" nowrap>创建日期</TD>
      <TD width="11%" noWrap>发布日期</TD>
    </TR>
	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf">
    <TR align="center" bgcolor="#FFFFFF"> 
       <TD height=22 nowrap>
                           <html:multibox property="tplakeys">
								<bean:write name="binfo" property="tplakey" />
							</html:multibox>
		</TD>
       <TD nowrap><bean:write name="binfo" property="tplaname" scope="page" /></TD> 
       <TD nowrap><bean:write name="binfo" property="tplacatecd" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="tplastat_disp" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="creator" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="createdate" scope="page"/></TD>
       <TD nowrap><bean:write name="binfo" property="publishdate" scope="page"/></TD>
    </TR>
    </logic:iterate>
  </TABLE>
	<table width="98%" border="0" align="center" cellpadding="3"
		cellspacing="3">
		<tr>
			<td align="center">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</td>
		</tr>
	</table>  
</html:form>
</BODY>
</HTML>
