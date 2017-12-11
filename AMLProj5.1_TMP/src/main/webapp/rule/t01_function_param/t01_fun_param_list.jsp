<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<jsp:useBean id="authBean" class="com.ist.common.AuthBean"
	scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link id="skincss"
			href="../../css/aml_<bean:write name="style" scope="session"/>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript">
		
		function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            isSub = true;
        } else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('你真的要删除选择的公共参数吗？')){
                    isSub = true;
                }
            }
        } else if(type=='search' || type=='add'){
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
	<body class="mainbg">
		<html:form action="/t01_fun_param/t01_fun_param_list.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>公共参数维护</span>
						<span class="buttons"> <a id="hdd_display"
							class="bt_hidden"></a> <a href="#" onclick="dosubmit('t01_fun_param_add.do','add')">
								<img src="../../images/blue/b_add.png" />增加</a> <a
							href="#" onclick="dosubmit('t01_fun_param_modify.do','modi')"> <img
									src="../../images/blue/b_edit.png" />修 改</a> <a href="#" onclick="dosubmit('t01_fun_param_delete_do.do','del')"><img
									src="../../images/blue/b_delete.png" />删除</a> </span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									参数代码：
								</td>
								<td>
									<html:text property="paramcd" styleClass="text_white" size="40"/>
								</td>
								<td>
									参数名称：
								</td>
								<td>
									<html:text property="paramname" styleClass="text_white" size="40"/>
								</td>
							</tr>
							<tr>
							<td>
								返回类型：
							</td>
							<td>
								<html:select property="rtntype">
									<html:options collection="rtntypeMap" property="label"
										labelProperty="value" />
									</html:select>
							</td>
							<td>
								<span style="color:#FF0000;">&nbsp;</span>参数类型：
							</td>
							<td>
								<html:select property="parmtype">
									<html:options collection="paramtypeMap" property="label"
										labelProperty="value" />
								</html:select>
								<input type="button" class="in_button1" name="button1"
										value="查 询" onclick="dosubmit('t01_fun_param_list.do?newsearchflag=1','search')" />
							</td>
							</tr>
							

								
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th onclick='selectAllCheckBox(this,document.forms[0])'
								style='cursor: hand;'>
								全部
							</th>
							<th>
								参数代码
							</th>
							<th>
								参数名称
							</th>
							<th>
								返回类型
							</th>
							<th>
								参数类型
							</th>
							<th>
								参数值
							</th>
							<th>
								创建日期
							</th>
						</tr>
						<logic:iterate id="param" name="paramList"
							type="com.ist.aml.rule.dto.T01_function_param">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("paramcd", param.getParamcd());
										pageContext
												.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>
							<tr>
								<!-- 复选框  -->
								<td>
									<html:multibox property="selectedParamcd">
										<bean:write name="param" property="paramcd" scope="page"/>
									</html:multibox>
								</td>
								<!-- 参数代码 -->
								<td>
									<html:link name="map" page="/t01_fun_param/t01_fun_param_disp.do">
										<bean:write name="param" property="paramcd" scope="page"/>
									</html:link>
								</td>
								<!-- 参数名称 -->
								<td>
									<bean:write name="param" property="paramname" scope="page"/>
								</td>
								<!-- 返回类型 -->
								<td>
									<logic:empty name="param" property="rtntype" scope="page">
										&nbsp;
									</logic:empty>
									<logic:equal name="param" property="rtntype" scope="page" value="1">
										文本
									</logic:equal>
									<logic:equal name="param" property="rtntype" scope="page" value="2">
										数值
									</logic:equal>
									<logic:equal name="param" property="rtntype" scope="page" value="3">
										日期
									</logic:equal>
								</td>
								<!-- 参数类型 -->
								<td>
									<logic:empty name="param" property="parmtype" scope="page">
										&nbsp;
									</logic:empty>
									<logic:equal name="param" property="parmtype" scope="page" value="1">
										正常
									</logic:equal>
									<logic:equal name="param" property="parmtype" scope="page" value="2">
										自然日
									</logic:equal>
									<logic:equal name="param" property="parmtype" scope="page" value="3">
										对公节假日
									</logic:equal>
									<logic:equal name="param" property="parmtype" scope="page" value="4">
										对私节假日
									</logic:equal>
								</td>
								<!-- 参数值 -->
								<td>
									<bean:write name="param" property="paramval" scope="page"/>
								</td>
								<!-- 创建日期 -->
								<td>
									<bean:write name="param" property="createdate" scope="page"/>
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>
				<div class="list_page">
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
						<tr>
							<td align="center">
								<bean:write name="pageInfo" scope="request" filter="false" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</html:form>
	</body>
</html>
