<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<!-- <link rel="stylesheet" href=<%=cssurl%> type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<!-- <style type="text/css">
.nTab{
float: left;
width: 100%;
margin: 0 auto;
border-bottom:1px #FFFFFF solid;
background:#d5d5d5;
background-position:left;
background-repeat:repeat-y;
margin-bottom:2px;
}
.nTab .TabTitle{
clear: both;
height: 22px;
overflow: hidden;
background:#F6F9FF;
}
.nTab .TabTitle ul{
border:0;
margin:0;
padding:0;
}
.nTab .TabTitle li{
float: left;
width: 80px;
cursor: pointer;
padding-top: 4px;
padding-right: 0px;
padding-left: 0px;
padding-bottom: 2px;
list-style-type: none;
font-size: 12px;
text-align: center;
margin: 0;
}
.nTab .TabTitle .active{background:#fff;border-left:1px #AACCEE solid;border-top:1px #AACCEE solid;border-right:1px #AACCEE solid;border-bottom:1px #fff solid;}
.nTab .TabTitle .normal{background:#EBF3FB;border:1px #AACCEE solid;}
.nTab .TabContent{
width:auto;background:#FFFFFF;
margin: 0px auto;
padding:3px 0 0 0;
}
.none {display:none;}
</style> -->
		<script type="text/javascript">
function nTabs(thisObj,Num){
if(thisObj.className == "active")return;
var tabObj = thisObj.parentNode.id;
var tabList = document.getElementById(tabObj).getElementsByTagName("li");
for(i=0; i <tabList.length; i++)
{
if (i == Num)
{
   thisObj.className = "active"; 
      document.getElementById(tabObj+"_Content"+i).style.display = "block";
}else{
   tabList[i].className = "normal"; 
   document.getElementById(tabObj+"_Content"+i).style.display = "none";
}
} 
}
</script>
		<script language="JavaScript">
function dosubmit(theUrl){
	//前面已经加入是排除还是所为<%=com.ist.util.Constans.CASE_NAME%>查询标记
	//var oSpans = top.leftFrame.document.getElementsByTagName('span');
	//for(var i = 0; i < oSpans.length; i ++) {
		//if(oSpans[i].className == 'selected' && oSpans[i].innerHTML.indexOf('已排除<%=com.ist.util.Constans.CASE_NAME%>') != -1) {
			//theUrl = '<%=request.getContextPath()%>/report/case/t07_case_application_search_removed.do?&intPage=1';
		//}
	//}
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

function Open(url){
   var iframe1 = document.getElementById('down');
   iframe1.src = url;
  // window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
var flag = -1;
function checkonMouseOver(obj){
	var rownum = obj.rowIndex;
	if(flag!=rownum){
		obj.style.cursor='hand';
	}
	obj.style.backgroundColor='#ECF3FF'
}
function checkonmouseout(obj){
	var rownum = obj.rowIndex;
	obj.style.cursor='';
	if(flag!=rownum){
		obj.style.backgroundColor='#FFFFFF';
	}
}
function onclicktr(obj,url){
	obj.style.cursor='';
	var tabnum = document.getElementById("alert_table").rows.length;
	//var stylems = obj.cells[1].childNodes[0].style.cursor;
	var rownum = obj.rowIndex;
	//if(stylems==''){
		for(var i=2;i<tabnum-1;i++){
		   if(i!=rownum){
			  document.getElementById("alert_table").rows(i).style.backgroundColor='#FFFFFF';
		   }
		}
	//}
	if(flag!=rownum){
		obj.cells[0].childNodes[0].checked = true;
		flag = rownum;
		Open(url);
	}	
}
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form method="post" action="/case/caseDetailinfo.do">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><%=com.ist.util.Constans.CASE_NAME%>编号: <bean:write
								property="application_num" name="t07_case_application" /> </span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('<%=request.getContextPath()%><bean:write name="backUrl"/>');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>&nbsp;&nbsp; <!-- <input type="button" value="返  回" class="input" onclick="dosubmit('<%=request.getContextPath()%><bean:write name="backUrl"/>')"/> -->
						</span>
					</div>
					<!-- 选项卡1开始 -->
					<%-- <div class="nTab" style="width: 100%">
						<!-- 标题开始 -->
						<div class="bigTab">
							<dl class="tabm">
								<dd class="tabcur" onclick="nTabs(this,0);">
									<span><%=com.ist.util.Constans.CASE_NAME%>信息</span>
								</dd>
								<logic:equal value="1" name="t07_app_movefate_flag">
									<dd class="tabcur" onclick="nTabs(this,1);">
										<span>处理记录</span>
									</dd>
								</logic:equal>
							</dl>
						</div> --%>
						<!-- 内容开始 -->
						<!-- table content -->
						<div class="cond_c">
							<!-- <%=com.ist.util.Constans.CASE_NAME%>信息开始 -->
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										案例种类：
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="case_kind_disp" />
									</td>
									<td><%=com.ist.util.Constans.CASE_NAME%>类型：
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="cast_type_disp" />
									</td>
								</tr>
								<tr>
									<td><%=com.ist.util.Constans.CASE_NAME%>状态：
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="app_state_cd_s" />
									</td>
									<td>
										归属机构：
									</td>
									<td>
										<bean:write name="t07_case_application" property="app_org_id" />
									</td>
									<!-- <td height="22" align="right" bgcolor="ECF3FF" noWrap>创建日期：</td>
              <td bgcolor="F6F9FF"> <bean:write property="app_dt_disp"  name="t07_case_application" /></td> -->
								</tr>
								<tr>
									<td>
										筛选日期：
									</td>
									<td>
										<bean:write property="app_dt_disp" name="t07_case_application" />
									</td>
									<td>
										交易日期：
									</td>
									<td>
										<bean:write property="case_date_disp"
											name="t07_case_application" />
									</td>
									<!-- <td height="22" align="right" bgcolor="ECF3FF"></td>
              <td bgcolor="F6F9FF"></td> -->
								</tr>
								<logic:equal property="cast_type" name="t07_case_application" value="2">
									<tr>
										<td>
											可疑程度：
										</td>
										<td>
											<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
												<bean:write property="alert_level_disp" name="t07_case_application" />
											</logic:notEqual>
										</td>
										<td>
											采取措施：
										</td>
										<td>
											<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
											    <bean:write property="take_action" name="t07_case_application" />
											</logic:notEqual>
										</td>
									</tr>
									<tr>
										<td>
											可疑行为描述：
										</td>
										<td colspan="3">
											<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
											    <bean:write property="action_descrip" name="t07_case_application" />
											</logic:notEqual>
										</td>
									</tr>
									<tr>
										<td><%=com.ist.util.Constans.CASE_NAME%>处理意见：
										</td>
										<!-- <td bgcolor="F6F9FF" colspan="3"><bean:write property="reason" name="t07_case_application" /></td> -->
										<td>
											<img src="../../images/<%=session.getAttribute("style") %>/b_addreport.png" />
											<a href="<%=request.getContextPath()%>/report/case/case_advice_more.do?application_num=<bean:write property="application_num"  name="t07_case_application" />"
												target="_blank">查看</a>
										</td>
										<td>
											数据性质：
										</td>
										<td>
											<bean:write property="date_status_cd" name="t07_case_application" />
										</td>
									</tr>
								</logic:equal>
							</table>
						</div>
						<!-- <%=com.ist.util.Constans.CASE_NAME%>信息结束 -->
						<!-- 处理记录开始 -->
						<!-- <div id="myTab1_Content1" class="none">
							<logic:equal value="1" name="t07_app_movefate_flag">
								<iframe id="down1"
									src="<%=request.getContextPath()%>/report/case/t07_app_movefate.do?newsearchflag=1&application_num=<bean:write property="application_num" name="t07_case_application" />"
									scrolling="no" width="100%" height="165" name="test1"
									frameborder="0"></iframe>
							</logic:equal>
						</div> -->
						<!-- 处理记录结束 -->
					<!-- </div> -->
					<!-- 内容结束 -->
					<!-- 选项卡1结束 -->
				</div>
				
				<div class="cond_t2">
					<span class="buttons"> 
					   <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><%=com.ist.util.Constans.ALERT_NAME%>信息</strong> 
					</span>
				</div>
				
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0" id='alert_table'>
						<tr>
							<th>
								选择
							</th>
							<th>
								客户号
							</th>
							<th>
								特征代码
							</th>
							<th>
								特征描述
							</th>
							<th>
								处理状态
							</th>
							<th>
								操作
							</th>
						</tr>
						<logic:iterate id="stcr" name="t07_stcrList"
							type="com.ist.aml.report.dto.T07_case_stcr" indexId="number">
							<%
								java.util.HashMap map = new java.util.HashMap();
												map.put("stcr", stcr.getStcr());
												pageContext.setAttribute("map", map,
														PageContext.PAGE_SCOPE);
							%>
							<%
								url = request.getContextPath();
								url = url + "/inves/case/stcr_trans_list_search.do?stcr="
									  + stcr.getStcr() + "&application_num=" + stcr.getApplication_num() + "&party_id=" + stcr.getParty_id() + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
							%>
							<tr onclick="onclicktr(this,'<%=url%>')">
	
								<td>
									<input type="radio" name="rad1" />
								</td>
								<td>
									<bean:write name="stcr" property="party_id" scope="page" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr" scope="page" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr_disp" scope="page" />
								</td>
								
								<td>
									<%--<bean:write name="stcr" property="status_disp" scope="page" /> 
									由于此处查询的是所有状态的案例，特征表中的状态又没有已审批状态，故
									在此处根据案例的状态判断特征的状态，如果案例状态是1,3 特征用自己的状态
									如果案例状态时2,4,5则用案例状态显示 modify by qiuyun 2011-7-17
									
									--%>
									
									<logic:equal value="1" name="t07_case_application" property="app_state_cd">
										<bean:write name="stcr" property="status_disp" scope="page" />
									</logic:equal>
									
									<logic:equal value="2" name="t07_case_application" property="app_state_cd">
										<bean:write name="t07_case_application" property="app_state_cd_s" />
									</logic:equal>
									
									<logic:equal value="3" name="t07_case_application" property="app_state_cd">
										<bean:write name="stcr" property="status_disp" scope="page" />
									</logic:equal>
									
									<logic:equal value="4" name="t07_case_application" property="app_state_cd">
										<bean:write name="t07_case_application" property="app_state_cd_s" />
									</logic:equal>
									
									<logic:equal value="5" name="t07_case_application" property="app_state_cd">
										<bean:write name="t07_case_application" property="app_state_cd_s" />
									</logic:equal>
									
									
								</td>
								<td>
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&party_id=<bean:write name="stcr" property="party_id"/>',width:580,height:360,title:'查看',handler:handler,iframe:true,fixPosition:true,dragOut:false});">查看</a>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				<iframe id="down" src="#" scrolling="no" width="100%" height="500" name="test" frameborder="0"></iframe>
			</html:form>
		</div>
	</body>
</html>