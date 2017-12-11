<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>

		<script language="JavaScript">
		/**列表中"选择"/"全部"的切换**/
		function selectAllCheckBox(objElement,currentForm){
			var strInnerText = "";
			var isSelectAll = false;
			if(currentForm){
				for(var i=0;i<currentForm.elements.length;i++){
					var formElement = currentForm.elements[i];
					if(formElement.type=="checkbox" && !formElement.disabled){
						formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
						isSelectAll = formElement.checked;
					}						
				}
				strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
				objElement.innerText = strInnerText;
			}
		}
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='search'){
    	if(!_isDateSpaceComplete(document.forms[0].create_dt_start_disp.value, document.forms[0].create_dt_end_disp.value)){
    	    document.forms[0].create_dt_start_disp.focus();
	 		errMsg = "请填写完整的起始时间范围！";
          } 
    	else if(!_compareTwoDateForString(document.forms[0].create_dt_start_disp.value, document.forms[0].create_dt_end_disp.value)) {
   			document.forms[0].create_dt_start_disp.focus();
	 		errMsg = "开始时间不能大于结束时间";		    
		   } 
		   isSub = true;
    }
    else if(type=='revokePro' || type=='product'){
       errMsg = CheckBoxMustChecked(document.forms[0]);
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


</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/t21_rule/t21_rule_list.do" method="post">
				<div class="conditions">
					<div class="cond_t">
						<span>规则投产</span>
						<span class="buttons">
							<a href="#" id="hdd_display" class="bt_hidden"></a>
							<a href="#" onclick="dosubmit('revokeProT03_rule.do?deployflag=0','revokePro')"><img src="../../images/<%=session.getAttribute("style")%>/b_re_refused.png" />撤销投产</a>
							<a href="#" onclick="dosubmit('t03_rules_product.do?deployflag=3','product')"><img src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />投产</a>
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								 <td>
									规则编号：
								</td>
								<td>
									<html:text property="rulekey" maxlength="20"/>
								</td>
								<td>
									规则名称：
								</td>
								<td>
									<html:text property="rule_des" maxlength="128"/>
								</td>
								
							</tr>
							<tr>
								<td>所属人行规则：</td>
								<td>
									<html:select  property="pbckey" style="width:300px;" onmouseover="FixWidth(this);">
										<html:options collection="pbcruleMap" property="label" labelProperty="value"/>
									</html:select>
								</td>
								<td width="15%" height="22" align="right" bgcolor="ECF3FF">
									创建日期：
								</td>
								<td>

								<html:text property="create_dt_start_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />
								--
								<html:text property="create_dt_end_disp" size="12"
									onclick="calendar.show(this);" readonly="true"
									styleClass="calimg" />

								</td>
								
							</tr>
                            <tr>
                               <td>
                                                                                            计算方式：
                               </td>
                               <td>
                                  <html:select property="gs_type">
										<html:options collection="calculateMap" property="label" labelProperty="value" />
									</html:select>
                               </td>
                               <td>
									粒度：
								</td>
								<td>
									<html:select property="granulairty">
										<html:options collection="granularityMap" property="label" labelProperty="value" />
									</html:select>
								</td>
                            </tr>
                            <tr>
                               <td>
                                                                                            投产状态：
                               </td>
                               <td>
                                  <html:select property="product_flag">
										<html:options collection="product_flagMap" property="label" labelProperty="value" />
									</html:select>
                               </td>
                               <td></td>
                               <td>
                                 <input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/rule/t21_rule/t21_rule_product_list.do?newsearchflag=1&deployflag=2','search');"/>
                               </td>
                            </tr>
						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
							 <TH width="3%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</TH>
 							 <th>规则编号</th>     
  							 <th>规则名称</th> 
  							 <th>计算方式</th>
  							 <th>粒度</th>   
 							 <th>投产状态</th>    
 							 <th>创建日期</th>      

						</TR>
						<logic:iterate id="t21_rule" name="t21_ruleList" indexId="i"
							type="com.ist.aml.rule.dto.T21_rule">
							<% 
							java.util.HashMap map = new java.util.HashMap();
							map.put("tplakey",t21_rule.getTplakey());
							pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
								<TD height=22>
									<html:multibox property="select_rulekey">
										<bean:write name="t21_rule" property="tplakey" />,<bean:write name="t21_rule" property="rulekey" />
									</html:multibox>
								</TD>
								<TD>
								<logic:equal value="1" property="gs_type" name="t21_rule">
								     <html:link name="map" page="/t21_rule/rule_indic_disp.do?deployflag=2">
										<bean:write name="t21_rule" property="rulekey" />
									</html:link>
								</logic:equal>
								<logic:equal value="2" property="gs_type" name="t21_rule">
									<html:link name="map" page="/t21_rule/t03_rule_all_info_disp.do?deployflag=2">
										<bean:write name="t21_rule" property="rulekey" />
									</html:link>
								</logic:equal>
								</TD>
								<TD>
									<bean:write name="t21_rule" property="rule_des" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="gs_type_disp" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="granulairty_disp" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="deployflag_disp" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="create_dt_disp" />
								</TD>
							
								      
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
		</div>
	</BODY>
</HTML>
