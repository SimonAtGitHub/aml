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
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>

		<script language="JavaScript">
   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}
function dosubmit(theUrl,type){
    var errMsg = "";
    if(type=='search'){
    	if(!_compareTwoDateForString(document.forms[0].create_dt_start_disp.value, document.forms[0].create_dt_end_disp.value)) {
   			document.forms[0].create_dt_start_disp.focus();
	 		errMsg = "开始时间不能大于结束时间";		    
		   } 
    }
    else if(type=='release1')//准备发布
    {
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	for(var i=0;i<document.forms[0].select_rulekey.length;i++){
            	var obj = document.forms[0].select_rulekey[i];
            	if(obj.checked){
            		if(document.getElementById("check_"+obj.value).value=='1'){
            			errMsg+="所选系统规则中存在已经处于发布状态的情形！";
            		}
            	}
            }
    }
   
    else if(type=='release2')//准备取消发布
    {
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	for(var i=0;i<document.forms[0].select_rulekey.length;i++){
            	var obj = document.forms[0].select_rulekey[i];
            	if(obj.checked){
            		if(document.getElementById("check_"+obj.value).value=='2'){
            			errMsg+="所选系统规则中存在已经处于未发布状态的情形！";
            		}
            	}
            }
    }
  
  
    if(errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}

function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/t21_rule/t21_rule_release_list.do" method="post">
				<div class="conditions">
					<div class="cond_t">
						<span>部署管理</span>
						<span class="buttons">
							<a href="#" id="hdd_display" class="bt_hidden"></a>
							<a href="#" onclick="dosubmit('modify_t21_rule_flag.do?newsearchflag=1&searchtype=2&flag=1','release1')"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />发布</a>
							<a href="#" onclick="dosubmit('modify_t21_rule_flag.do?newsearchflag=1&searchtype=2&flag=0','release2')"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />取消发布</a>
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
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
								<td>
									规则名称：
								</td>
								<td>
									<html:text property="rule_des" />
								</td>
								
							</tr>
							<tr>
								<td>所属人行规则:</td>
								<td>
									<html:select  property="pbckey" style="width:300px;" onmouseover="FixWidth(this);">
										<html:options collection="pbcruleMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								<td>
									预警主体：
								</td>
								<td>
									<html:select property="party_acct_cd">
										<html:options collection="party_acct_cdMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
								<td>
									状态:
								</td>
								<td>
									<html:select property="flag">
										<html:options collection="rule_release_flagMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<td>归属机构类型:</td>
								<td>
									<html:select property="organkey_type">
										<html:options collection="organ_typeMap" property="label"
											labelProperty="value" />
									</html:select>
									<input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/rule/t21_rule/t21_rule_release_list.do?newsearchflag=1&searchtype=2&intPage=0','search');"/>
								</td>
								
						</tr>

						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
							 <th>选择 </th>
 							 <th>规则编号</th>     
  							 <th>规则名称</th>    
  							 <th>预警主体</th>
 							 <th>主体描述</th>    
  							 <th>归属机构</th>    
 							 <th>状态</th>    
 							 <th>创建日期</th>      

						</TR>
						<logic:iterate id="t21_rule" name="t21_ruleList" indexId="i"
							type="com.ist.aml.rule.dto.T21_rule">
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
								<TD height=22>
									<html:multibox property="select_rulekey">
										<bean:write name="t21_rule" property="rulekey" />
									</html:multibox>
									<input type="hidden"
											id="check_<bean:write name="t21_rule" property="rulekey" />"
											name="check_<bean:write name="t21_rule" property="rulekey" />"
											value="<bean:write name="t21_rule" property="flag" />">
								</TD>
								<TD>
									<bean:write name="t21_rule" property="rulekey" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="rule_des" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="party_acct_cd_disp" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="party_acct_cd_des" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="organkey_type_disp" />
								</TD>
								<TD>
									<bean:write name="t21_rule" property="flag_disp" />
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
			<!--提示块-->
			<div id=div_hint
				style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style =   0, opacity =   80, finishOpacity =   100);"></div>
		</div>
	</BODY>
</HTML>
