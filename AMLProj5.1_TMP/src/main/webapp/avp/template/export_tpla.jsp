<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<link rel="stylesheet" href="../../css/ist_base.css" type="text/css">
<script src="../../js/title.js"></script>
<script language="javascript" src="../../js/ist_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script src="../../js/load_window.js"></script>





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
<div id="content">
<html:form method="post" action="/template/tpla_publish_list.do">
<div class='awp_title'>
 <table >                
    <tr>
      
      <td width="220" align='left' nowrap>业务追踪模型导出</td>
      
      <td width="*" align="right">
                              <input type=hidden value="" name=s_newsearchflag >
					      	  <input type=button value="导 出" name=Button22 class="input" onClick="dosubmit('exportT02_tpla_all_infoDoc.do','search');">
                            </td>
                          </tr>                                
                                        
          </table>
  </div>
<table width="100" border="0" cellspacing="0" cellpadding="0">
     <tr><td height="8"></td></tr>
  </table>
  <div class='awp_cond' id='awp_cond_div'>
    <table>
		<tr>
			<td width="15%" align="right">
				模型名称：
			</td>
			<td width="35%" align="left">
				<html:text property="tplaname" styleClass="text_white" size="37" />
			</td>	
			<td width="15%" align="right"  >
				创建人：
			</td>
			<td width="35%" align="left">
			    <html:hidden property="creator"/>
				<html:text property="creator_disp" styleClass="text_white" size="30" />
				<input type="button" name="locates" value="定 位" class="text_white" onclick="locate_tree_userorg('<%=request.getContextPath()%>','creator,creator_disp','')"/>			
			</td>	
		</tr>
		<tr>
		<td width="15%" align="right" >
				创建日期：
		</td>
		<td width="35%" align="left">
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
		<td width="15%" align="right" >
				模型状态：
		</td>
		<td width="35%" align="left">
			<html:select property="tplareqstat">
				<html:options collection="flagMap" property="label"	labelProperty="value" />
			</html:select>
		</td>	
	</tr>
	<tr>		
		<td height="22" align="right">
			排序：
		</td>
		<td nowrap align="left">
			<html:select property="sort">
	        <html:options collection="sortMap" property="label" labelProperty="value"/>
	        </html:select>
			&nbsp;
			<html:radio property="sort_type" value="asc">升序</html:radio>
			<html:radio property="sort_type" value="desc">降序</html:radio>
			<html:radio property="sort_type" value="">不排序</html:radio>
		</td>
		<td nowrap align="right">
			业务类别:
		</td>
		<td nowrap align="left">
			<html:select property="busstypecd">
			   <html:options collection="busstypecdMap" property="label" labelProperty="value" />
			</html:select>
		</td>
	</tr>
	<tr>
	  <td></td>
	  <td>
		  <input type="button" name="button11" value="查 询" onClick="dosubmit('getT02_tp_bas_infExportList.do?newsearchflag=1','search')" class="input">
	  </td>	
	  <td></td>
	  <td></td>
	</tr>
	</table>
 </div>
<table width="100" border="0" cellspacing="0" cellpadding="0">
     <tr><td height="8"></td></tr>
  </table>
  <div class="awp_list">
  <table>
    <tr align=center > 
      <td width=4% align="center" noWrap><input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)"></TD>
      <td>序号</TD> 
      <td width="20%" align="center" nowrap>模板名称</TD> 
      <td width="14%" nowrap>模板类别</TD>
      <td width="14%" nowrap>模型状态</TD>
      <td width="9%" noWrap>创建人</TD>
      <td width="18%" nowrap>创建日期</TD>
      <td width="18%" noWrap>发布日期</TD>
    </tr>
    <%
	   int currRecordNum=((Integer)request.getAttribute("currRecordNum")).intValue();
	%>
	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf"  indexId="index">
    <tr id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
       <td height=22 nowrap align="center">
                           <html:multibox property="tplakeys">
								<bean:write name="binfo" property="tplakey" />
							</html:multibox>
		</td>
		<TD  align="center">
			 <%=index.intValue()+1+currRecordNum%>
		</TD>
       <td algin="left" nowrap>
       <a href="javascript:void(0);" onClick="window.open('<%=request.getContextPath()%>/avp/template/tpla_alltmpalt_info_link.do?tplakey=<bean:write name="binfo" property="tplakey" scope="page"/>&busstypecd=<bean:write name="binfo" property="busstypecd" scope="page"/>','','height=600, width=800,left=100,top=100,scrollbars=yes,resizable=yes')">
       <bean:write name="binfo" property="tplaname" scope="page" />
       </a>
       </td> 
       <td nowrap algin="left" ><bean:write name="binfo" property="tplacatecd_name" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="tplastat_disp" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="creator_disp" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="createdate" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="publishdate" scope="page"/></TD>
    </tr>
    </logic:iterate>
  </table>
  </div>

</html:form>
</div>
</body>
</html:html>
