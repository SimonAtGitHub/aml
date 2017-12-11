<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.avp.search.Constants;"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
	<script src="<%=contextPath%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"	src="<%=contextPath%>/js/Calendar.js"></script>
	 <script type="text/javascript">
	 	var path = "<%=contextPath %>";
	 </script>
</head>
<script language="JavaScript">
 //查询 提交后台
function dosubmit(theUrl) {
	 document.forms[0].action=theUrl;
     document.forms[0].submit();
}

//弹出页面
function openFullWin(theUrl){
    	openWindow(theUrl,'900','600');
}
//修改
function update(theUrl){
	var val= CheckboxConfirm(document.forms[0],'#');
	if(val==false){
		return;
	}else{
		var num=val.split('#').length;
		if(num!=1){
			alert("只能选择一条记录");
			return false;
		}else{
		    theUrl=theUrl+"&engkeys="+val;
			dosubmit(theUrl)
		}
	}
}
//删除
function del(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("至少选择一条记录");
		return false;
	}else{
	if(confirm("您确定要删除所选择的信息吗？")){
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
	
	}

}
//申请发布 要求引擎状态为正常的
function reqState(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("至少选择一条记录");
		return false;
	}else{
	
		  	
  		var checkbox = document.forms[0].engkeys;
  		if (!checkbox.length) {
		  		checkbox = new Array(checkbox);
		  	}
        	for (var i=0; i < checkbox.length; i++) {
        		var oCheck = checkbox[i];
            	//如果被选中则处理
              	if (oCheck.checked) {
                  	var engkeys= document.getElementsByName("engkeys")[i].value;//主键
	                var state = document.getElementsByName("state")[i].value;//引擎状态
	                if(state!=<%=Constants.ENG_SRCHENGSTAT_YES%>){//如果不引擎状态不是正常 则直接返回
	                  alert("引擎状态不是正常状态!!");
	                  return false;
	                }
	           }
         }
        //申请发布请求
       if(confirm("您确定要申请发布吗？")){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
	   }
	  }
         
}
 	//引擎导出验证
 	function srchEngExport() {
 		var url = "srchEngExport.do";
 		var errMsg = CheckBoxMustChecked(document.forms[0]);
 		if (errMsg == "") {
 			document.forms[0].action=url;
        	document.forms[0].submit();
 		} else {
 			alert(errMsg)
 		}
 	}

 </script>
<body>
	<!-- 系统总体框架，占页面宽度的98％ -->
	<div id='content'>
		<html:form method="post" action="/search/t02_srch_eng_inf_list.do">
			<!-- 标题区域 -->
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%"><span class="awp_title_td2">统一视图 － 管理列表</span></td>
						<td align="right">
							<input type="button" name="btsearch" value="查 找" onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type="button" value="增 加" onclick="dosubmit('main_add.do?type=add');">
							<input type="button" value="修 改" onClick="update('main_add.do?type=modify');">
							<input type="button" value="申请发布" onClick="reqState('performReqIssueT02_srch_eng_inf.do')">
							<input type="button" value="删 除" onClick="del('t02_srch_eng_inf_del.do');">
							<input type=button value="导 入" name="btnSrchEngImport"  onClick="dosubmit('srchEngImport.do')">
							<input type=button value="导 出" name="btnSrchEngExport"  onClick="srchEngExport();">
						</td>
					</tr>
				</table>
			</div>
			<!-- 错误信息提示区 -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<!-- 查询条件区 -->
			<div class='awp_cond' id='searchtable' style="display: none">
				<table>
					<tr>
						<td>
							视图名称：
						</td>
						<td>
							<html:text property="srchengname" size="33" />
						</td>
						<td>
							创建人：
						</td>
						<td>
							<html:hidden property="creator" />
							<html:text property="creator_disp" size="30" readonly="true" />							
							<html:button property="button1" onclick="locate_pop_window(path,'t00_userLocation' ,'radio' ,'forms[0]', 'creator,creator_disp','flag=\\'1\\'')" value="定 位"/>
						</td>
					</tr>
					<tr>
						<td>
							创建日期：
						</td>
						<td>
							<html:text property="createdate_min" size="10" maxlength="10" />
							<img src="../../images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="弹出日历下拉菜单"
								onclick="new Calendar().show(document.forms[0].createdate_min);">
							至
							<html:text property="createdate_max" size="10" maxlength="10" />
							<img src="../../images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="弹出日历下拉菜单"
								onclick="new Calendar().show(document.forms[0].createdate_max);">
						</td>
						<td>
							视图状态：
						</td>
						<td>
							<html:select property="srchengstat">
								<html:options collection="flagMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							排序：
						</td>
						<td>
							<html:select property="sort">
								<html:options collection="sortMap" property="label"
									labelProperty="value" />
							</html:select>
							&nbsp;
							<html:radio property="sort_type" value="asc">升序</html:radio>
							<html:radio property="sort_type" value="desc">降序</html:radio>
							<html:radio property="sort_type" value="">不排序</html:radio>
						</td>
						<td>
							申请状态：
						</td>
						<td>
							<html:select property="reqstat">
								<html:options collection="reqMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>

					</tr>
					<tr>
						<td>
						</td>
					<td>
						<input type="button" name="button" value="查 询"
							onClick="dosubmit('t02_srch_eng_inf_list.do?newsearchflag=1')">
						<input type="button" value="重 置" onClick="searchReset();">
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</table>
			</div>
			<!-- 数据区 -->
			<div class='awp_list'>
				<table>
					<tr>
						<td>
							 <input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)">
						</td>
						<td>
							视图名称
						</td>
						<td>
							视图状态
						</td>
						<td>
							申请状态
						</td>
						<td>
							创建人姓名
						</td>
						<td>
							创建时间
						</td>
						<td>
							修改人姓名
						</td>
						<td>
							修改时间
						</td>
					</tr>
					<logic:iterate id="binfo" name="t02_srch_eng_infList"
						type="com.ist.avp.search.dto.T02_srch_eng_inf">
						<tr>
							<td align="center">
								<html:multibox property="engkeys"  >
									<bean:write name="binfo" property="srchengkey" />
								</html:multibox>
							</td>
							<input type="hidden" name="state" value="<bean:write name='binfo' property='srchengstat' />"/>
							<td align="left">
								<bean:write name="binfo" property="srchengname" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="srchengstat_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="reqstat_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="creator_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="createdate" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="modifier_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="modifydate" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<!--分页显示区 -->
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
		</html:form>
	</div>
</body>
</html:html>
