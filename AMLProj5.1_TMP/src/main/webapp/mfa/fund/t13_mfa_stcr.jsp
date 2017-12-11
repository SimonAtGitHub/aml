<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript">
function _Open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
}
function Open(url){
   var iframe1 = document.getElementById('down');
   iframe1.src = url;
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

function test(ftag){
   var innerhtml = document.getElementById("alert_table").rows(flag).cells[3].innerHTML;
   innerhtml = innerhtml.replace(" ","");
   if((innerhtml == '已排除' && (ftag == '处理中')) || (innerhtml != '已排除' && (ftag == '已排除'))){
	   document.getElementById("alert_table").rows(flag).cells[3].innerHTML=ftag;
	   var k = flag-1;
	   if(ftag == '处理中'){
	       document.getElementById('a'+k).style.display='none';
	       document.getElementById('b'+k).style.display='';
	   }else{
	       document.getElementById('a'+k).style.display='';
	       document.getElementById('b'+k).style.display='none';
	   }
	   
       var url = document.getElementById("alert_table").rows(flag).url;
	   var iframe1 = document.getElementById('down');
       iframe1.src = url;
       window.ymPrompt.close();
   }
}

function dosubmit(url){
   document.forms[0].action=url;
   document.forms[0].submit();
}
</script>
	</head>
<body id="iframecontent">

<html:form method="post" action="/t13_mfa_deal/t13_mfa_stcr_deal.do">
			<html:errors />
	<div class="conditions">
			<div class="cond_t">
				<span>特征信息</strong></span>
				<span class="buttons"> 
<%--				    <a href="#" id="hdd_display" class="bt_hidden"></a>  --%>
					<!-- <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />全 选</a> -->
					<a href="#" onclick="ymPrompt.win({message:'stcrlist_search.do?net_id=<%=request.getAttribute("net_id") %>',width:600,height:400,title:'添加',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
					<img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />添 加</a> 
					
				</span>
			</div>
			<!-- 大选项卡（2）**a.特征信息**内容 -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0" id="alert_table">
					<tr>
						<th>
							选择
						</th>
						<th>
							特征代码
						</th>
						<th>
							特征描述
						</th>
						<th>
							操作
						</th>
					</tr>
					<logic:iterate id="stcr" name="t13_mfa_stcrList"
						type="com.ist.mfa.dto.T13_mfa_deal" indexId="number">
						<%
							java.util.HashMap map = new java.util.HashMap();
											map.put("stcr", stcr.getStcr());
											pageContext.setAttribute("map", map,
													PageContext.PAGE_SCOPE);
						%>
						<%
							url = request.getContextPath();
							//url = url + "/report/case/stcr_trans_list.do?stcr="
								  //+ stcr.getStcr() + "&application_num=" + stcr.getApplication_num() + "&party_id=" + stcr.getParty_id() +"&newsearchflag=1";
						    url = url + "/mfa/t13_mfa_deal/t13_mfa_stcr_trans.do?stcr="
								  + stcr.getStcr() + "&newsearchflag=1&net_id="+stcr.getNet_id();
						%>
						<tr onclick="onclicktr(this,'<%=url%>')" url="<%=url%>">

							<td>
								<input type="radio" name="rad1" />
							</td>
							<td>
								<bean:write name="stcr" property="stcr" scope="page" />
							</td>
							<td>
								<bean:write name="stcr" property="pbc_des" scope="page" />
							</td>
							<td>
								<a href="#" onClick="dosubmit('t13_mfa_stcr_delete.do?pbckey=<bean:write name="stcr" property="stcr"/>&net_id=<bean:write name="stcr" property="net_id"/>')">
								<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
			<iframe id="down" src="#" scrolling="no" height="500" width="100%" name="test" frameborder="0"></iframe>
		</div>
		</html:form>
	
	</body>
</html>
