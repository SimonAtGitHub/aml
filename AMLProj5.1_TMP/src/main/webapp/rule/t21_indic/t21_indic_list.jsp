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
		<script type="text/javascript" src="../../js/awp_base.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    
  	if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('你真的要删除吗？')){
                isSub = true;
            }
        }
        
    }
    else if(type=='add'){
       isSub=true;
    }
    else if(type=='modi')
	{
	 	isSub = true;
	}
	else if(type=='search')
	{
		if(checkChinese(document.forms[0].indickey.value)){
     		errMsg="指标编码不能含有汉字！";
     		document.forms[0].indickey.focus();
    	}
    	else
    		isSub=true;
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
function dosubmit1(theUrl)
{
	 var isSub = false;
	    if(confirm('你真的要删除吗？')){
	 	  isSub = true;
	 	}
	 if(isSub)
	 {
	 	document.forms[0].action=theUrl;
    	document.forms[0].submit();
	 }else{
	    return false;
	 }
	
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<html:form action="/t21_indic/t21_indic_list.do" method="post">
			<html:hidden name="t21_indicActionForm" property="mark" />
			<html:hidden name="t21_indicActionForm" property="release" />
				<div class="conditions">
					<div class="cond_t">
						<span><logic:equal name="t21_indicActionForm" property="mark" value="1">指标表维护</logic:equal>
							  <logic:equal name="t21_indicActionForm" property="mark" value="2">配置管理 - 评级指标维护</logic:equal>
						</span>
						<span class="buttons">
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onclick="dosubmit('t21_indic_add.do','add')"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />添加</a>
						<a href="#" onclick="dosubmit('t21_indic_delete_do.do?newsearchflag=1','del')"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />删除</a> 
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									指标编码：
								</td>
								<td>
									<html:text property="indickey" size="24" maxlength="12" />
								</td>
								<td width="10%">指标名称：</td>
								<td width="40%"><html:text property="indicname_str" size="39" maxlength="80" /></td>
								</tr>
								<tr>
								<td>
									计算频度：
								</td>
								<td>
									<html:select property="granularitys">
										<html:options collection="granularitysMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									指标类型：
								</td>
								<td>
									<html:select property="indic_attr">
										<html:options collection="indic_attrMap" property="label"
											labelProperty="value" />
									</html:select>
									&nbsp;&nbsp;
									<input type="button" value="查 询" class="in_button1"
										onclick="dosubmit('t21_indic_list.do?newsearchflag=1&newenterflag=1', 'search');"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
							<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</th>


							<th>
								指标编码
							</th>


							<th>
								指标名称
							</th>
							<th>
								指标类型
							</th>

							<th>
								计算频度
							</th>

							<th>
								指标类别
							</th>



							<th>
								指标事实表
							</th>

							<logic:equal name="t21_indicActionForm" property="mark" value="1">
							<th>
								指标交易事实表
							</th>
							</logic:equal>

							<th>
								创建日期
							</th>


							<th>
								操作
							</th>


						</TR>
						<logic:iterate id="info" name="t21_indicList" indexId="i"
							type="com.ist.aml.rule.dto.T21_indic">
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
								<TD height=22>
									<html:multibox property="indickey1">
										<bean:write name="info" property="indickey" />
									</html:multibox>
									<input type="hidden"
											id="indic_<bean:write name="info" property="indickey" />-<bean:write name="info" property="indic_table" scope="page" />-<bean:write name="info" property="granularitys" scope="page" />"
											name="indic_<bean:write name="info" property="indickey" />"
											value="<bean:write name="info" property="flag" />">
								</TD>
								<TD>
									<bean:write name="info" property="indickey" />
								</TD>
								<TD>
									<bean:write name="info" property="indicname" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="indic_attr_disp" scope="page" />
								</TD>
								
								<TD>
									<bean:write name="info" property="granularitys_disp" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="indictype" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="indic_table" scope="page" />
								</TD>
								<logic:equal name="t21_indicActionForm" property="mark" value="1">
								<TD>
									<bean:write name="info" property="transtable" scope="page" />
								</TD>
								</logic:equal>
								<TD>
									<bean:write name="info" property="create_dt_disp" scope="page" />
								</TD>
								<TD>
									<logic:equal name="info" property="flag" value="0">
									<a href="#" onclick="dosubmit('t21_indic_modify.do?indickey=<bean:write name="info" property="indickey" />','modi')">
											<img src="../../images/<%=session.getAttribute("style")%>/modify.gif" title="修改" /></a>&nbsp;&nbsp;
									</logic:equal>
									<a href="#" onclick="dosubmit1('t21_indic_delete_do.do?indickey=<bean:write name="info" property="indickey" />&mark_d=1')">
											<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
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
