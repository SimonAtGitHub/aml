<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gbk">

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script src="<%=request.getContextPath()%>/js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function CheckBoxMustCheckedAndTplaStat(objCheckBox,objTplstat) {
	var errMsg='';
	var num = 0;
	for (var i = 0; i < objCheckBox.length; i++) {
		if ((true == objCheckBox.item(i).checked) && (objCheckBox[i].type == "checkbox")) {
			if (objTplstat[i].value == '禁用'){
			    errMsg='选择的模板中包含禁用模板，请测试通过再发布！';
				return errMsg;
			}
		}
	}
	return errMsg;
}

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


function dosubmit_openFullWin(theUrl,type){
    var busstypecd=document.forms[0].busstypecd.value;
    theUrl=theUrl+"&busstypecd="+busstypecd;
    var errMsg = "";
    var isSub = false;
    if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(errMsg==''){
            
            theUrl=theUrl+"&tplakeys="+getOnlyOneSelectValue("tplakeys");
        }
        isSub = true;
    }else if(type=='add'){
        isSub = true;
    }
    if(isSub && errMsg==''){
        //document.forms[0].action=theUrl;
        //document.forms[0].submit();
        //openFullWin(theUrl,'theUrl_only_one_mode');
        avpPopUp(theUrl,'800','500');
    }else{
        if(errMsg!='')
        alert(errMsg);
        return false;
    }

}


 function getOnlyOneSelectValue(selectName){
                        var elements = document.getElementsByName(selectName);
                        for(var i=0;i<elements.length;i++){
                                if(elements[i].checked==true){
                                        return elements[i].value;
                                }
                        }
                }

 function copy(theUrl){
    var  errMsg = 'export.do';
    errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
    if(errMsg==''){
        if(confirm('你要复制选中的模板吗？')){
        	document.forms[0].action=theUrl;
        	document.forms[0].submit();
        }
    }else{
        if(errMsg!='')
        alert(errMsg);
        return false;
    }
 }
 	
 	//模板导出验证
 	function tplaExport() {
 		var url = "export.do";
 		var errMsg = CheckBoxMustChecked(document.forms[0]);
 		if (errMsg == "") {
 			document.forms[0].action=url;
        	document.forms[0].submit();
 		} else {
 			alert(errMsg)
 		}
 	}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id='content'>
<html:form method="post" action="/template/tpla_maint_product_list.do">
<div class='awp_title'>
				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">查证模型 - 投产列表
							</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="查 找"
									onclick="btnDisplayHidden(this, 'searchtable')" />	
		           <input type=button value="撤销投产" name="back"  onClick="dosubmit('tpla_maint_tplareqstat2request.do','recsubmit');"></td>
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
									<td   >
										创建人：
									</td>
									<td >
										<html:hidden property="creator"/>
				<html:text property="creator_disp" styleClass="text_white" size="30"  readonly="true"/>
				<input type="button" name="locates" value="多 选" class="text_white" onclick="locate_pop_window('<%=request.getContextPath()%>','t00_userLocation','checkbox','forms[0]','creator,creator_disp','flag=\'1\'');"/>			
			
									</td>	
								</tr>
								<tr >
								    <td  >
										创建日期：
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
								</tr>
								<tr >		
								    <td ></td>   
									 <td ></td> 	
									<td >
										
										</td>
										<td nowrap >
											<input type="button" name="button11" value="查 询" onClick="dosubmit('tpla_maint_product_list.do?newsearchflag=1','search')" >
										</td>
								</tr>
								
								

							</table>
	</div>					
 
<div class="awp_list">
  <TABLE  >
    <TR align=center > 
      <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
      <TD width="18%" align="center" nowrap>模型名称</TD> 
      <TD width="10%" nowrap>模型类别</TD>
      <TD width="10%" nowrap>模型申请状态</TD>
      <TD width="10%" nowrap>模型状态</TD>
      <TD width="10%" nowrap>模型类型</TD>
      <TD width="12%" noWrap>创建人</TD>
      <TD width="13%" nowrap>创建日期</TD>
      <TD width="13%" noWrap>发布日期</TD>
       <TD width="10%" noWrap>发布路径</TD>
    </TR>


	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf">
    <TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
       <TD height=22 nowrap>
                           <html:multibox property="tplakeys">
								<bean:write name="binfo" property="tplakey" />
							</html:multibox>
						    <html:hidden name="binfo" property="tplastat_disp" />
		</TD>
       <TD align="left">
          <a	href="javascript:openWin('tpla_chk_main_test.do?newsearchflag=1&pop_win_flag=1&tplakey=<bean:write name="binfo" property="tplakey" scope="page"/>','','600','800')">
            <bean:write name="binfo" property="tplaname" scope="page" />
          </a> 
       </TD> 
       <TD align="left"><bean:write name="binfo" property="tplacatecd_name" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="tplareqstat" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="tplastat_disp" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="tplatype_disp" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="creator_disp" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="createdate" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="publishdate" scope="page"/></TD>
        <TD noWrap align="left"><bean:write name="binfo" property="structure" scope="page"/></TD>
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
