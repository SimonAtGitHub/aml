<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
		
			String basefuncurl = url + "/js/basefunc.js";
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script type="text/javascript">
jQuery.noConflict();
(function($) { 
  $(function() {
		$("span#aml_ifmm01").click(function loadCompleted(){
							 $("#aml_ifcc01").css("display","block");
							 $("#aml_ifcc02").css("display","none");
							  var ifcus1 = $("iframe#iframe_cus01");
							  var url =ifcus1.attr("src");
							 ifcus1.attr("src",url);
							 ifcus1.height(ifcus1.contents().find("#iframecontent").height() + 10);
							 $("#aml_ifcc01 .cond_t2 span a:eq(0)").css({"font-weight":"bold","color":"#ff6600"});
							 });
		$("span#aml_ifmm02").click(function loadCompleted2(){
							 $("#aml_ifcc02").css("display","block");
							 $("#aml_ifcc01").css("display","none"); 
							 var ifcus2 = $("iframe#iframe_cus02");
							 var url =ifcus2.attr("src");
							 ifcus2.attr("src",url);
							 ifcus2.height(ifcus2.contents().find("#iframecontent").height() + 10);
							 $("#aml_ifcc02 .cond_t2 span a:eq(0)").css({"font-weight":"bold","color":"#ff6600"});
							 });
							 
		$(document).ready(function(){ 	
				$("iframe[id*='iframe']").load(function(){//alert($(this).contents().find("#iframecontent"));
					$(this).height($(this).contents().find("#iframecontent").height() + 10);
			   });				
		});
		
		$(document).ready(function(){
		    $("#aml_ifcc01 .cond_t2 span a,#aml_ifcc02 .cond_t2 span a").click(function(){
				$(this).css({"font-weight":"bold","color":"#ff6600"});
				$(this).siblings().removeAttr("style");
			}); 
		 });		
		 $(document).ready(function(){
		    var list_m = $(".list tr:gt(0)");
			var list_c = $("div[id*='alerttrans']");
		    list_m.click(function(){
			    $(this).contents().find("input:radio").attr("checked","checked");
				var index = list_m.index($(this)[0]); 
				list_c.hide("500");
				$(list_c.get(index)).show("500");
			}); 
		 });	
		 $("#cusnew a:eq(0)").css({"color":"#ED0000"});
		$("#cusnew a").click(function(){
									 $("#cusnew a").removeAttr('style');
									 $(this).css({"color":"#ED0000"});
		});	
  });
})(jQuery);
</script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<%
			String root = request.getContextPath();
			
			//大选项卡URL地址
			String root2 = root + "/report/case/case_disp2.do?newsearchflag=1&intPage=1"; //first
			String root3 = root + "/report/case/stcr_disp.do?intPage=1"; //second
			String root1 = root + "/report/case/partyriskresult_list.do?newsearchflag=1"; //third
			String root4 = root + "/report/custcheck/t10_trans_analysis_case_main.do";
						
			//小选项卡URL地址			
		    String root6 = root + "/report/custcheck/t10_trans_analysis_case.do?newsearchflag=1&analy_type_flag=0&analy_from=2"; //交易分析 第一个页签的链接
			String root7 = root + "mfa/mfa_issue/MFA.html?fromCase=1&isView=1"; //资金网络
			String root8 = root + "/report/case/envi_analysis.do?newsearchflag=1&intPage=1";//场景分析
						
		%>
		<style>
		html{_overflow-y:scroll}
		</style>
		<script language="JavaScript">
function dosubmit(theUrl){  
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
function _chengeUrl(url){
	   var ifram=document.all.down0;
	   ifram.src=url;
	}
function _chengeUrl3(url){
	   var ifram=document.all.down3;
	   ifram.src=url;
	}
function tasksubmit(theUrl,task_id){  
  // form1.task_id.value=task_id; 
   dosubmit(theUrl);
}
function _open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');      
}

function test1(){

   window.document.getElementById("maskLevel").style.zIndex="-20000";
   window.document.getElementById("ym-window").style.zIndex="-10000";
   window.ymPrompt.close();
   document.forms[0].action='t07_flow_workbench.do';
   document.forms[0].submit();
}

  		function load0(num){
			var url_Array=["<%=root2%>","<%=root3%>","<%=root1%>","<%=root4%>"];
			if(num == "3"){
				var ifram=document.all.down3;
				//ifram.height = 1000;  
			    	
			}else if(num != "4"){
			    document.getElementById("down" + num).src=url_Array[num];
			}
		}
		function load1(num){
			var url_Array=["<%=root4%>","<%=root6%>","<%=root7%>","<%=root8%>"];
				
			    <logic:equal name="credittask" property="cast_type" value="1">
			
			  num=num+1;
			    </logic:equal>
			   
			document.getElementById("sub_down" + num).src=url_Array[num];
		}
	 function aa(){
		document.getElementById("maskLevel").style.zIndex="10000";
        document.getElementById("ym-window").style.zIndex="10001";
	 }
</script>
<script type="text/javascript">
jQuery.noConflict();
(function($) { 
  $(function() {
		$("span#aml_ifmm01").click(function loadCompleted(){
							 $("#aml_ifcc01").css("display","block");
							 $("#aml_ifcc02").css("display","none");
							  var ifcus1 = $("iframe#iframe_cus01");
							  var url =ifcus1.attr("src");
							 ifcus1.attr("src",url);
							 ifcus1.height(ifcus1.contents().find("#iframecontent").height() + 10);
							 $("#aml_ifcc01 .cond_t2 span a:eq(0)").css({"font-weight":"bold","color":"#ff6600"});
							 });
		$("span#aml_ifmm02").click(function loadCompleted2(){
							 $("#aml_ifcc02").css("display","block");
							 $("#aml_ifcc01").css("display","none"); 
							 var ifcus2 = $("iframe#iframe_cus02");
							 var url =ifcus2.attr("src");
							 ifcus2.attr("src",url);
							 ifcus2.height(ifcus2.contents().find("#iframecontent").height() + 10);
							 $("#aml_ifcc02 .cond_t2 span a:eq(0)").css({"font-weight":"bold","color":"#ff6600"});
							 });
							 
		$(document).ready(function(){ 	
				$("iframe[id*='iframe']").load(function(){//alert($(this).contents().find("#iframecontent"));
					$(this).height($(this).contents().find("#iframecontent").height() + 10);
			   });				
		});
		
		$(document).ready(function(){ 
			   $("iframe[id*='down']").height($("iframe[id*='down']").contents().find("#iframecontent").height() + 10);
		       $("iframe[id*='down']").load(function(){
		      // var nnn=$("iframe#down1").contents().find("#iframecontent").height();
		       //alert($("iframe#down1").height()+"+"+nnn);	

					$(this).height($(this).contents().find("#iframecontent").height() + 10);
					//alert($("iframe[id*='down']").contents().find("#iframecontent"));
			   });
				
		});
		
		$(document).ready(function(){
		    $("#aml_ifcc01 .cond_t2 span a,#aml_ifcc02 .cond_t2 span a").click(function(){
				$(this).css({"font-weight":"bold","color":"#ff6600"});
				$(this).siblings().removeAttr("style");
			}); 
		 });		
		 $(document).ready(function(){
		    var list_m = $(".list tr:gt(0)");
			var list_c = $("div[id*='alerttrans']");
		    list_m.click(function(){
			    $(this).contents().find("input:radio").attr("checked","checked");
				var index = list_m.index($(this)[0]); 
				list_c.hide("500");
				$(list_c.get(index)).show("500");
			}); 
		 });		
  });
})(jQuery);

function _verifyOper(theUrl0,theUrl,theType){
    jQuery.ajax({
 			type:"post",
			url:theUrl0,
			dataType:"text",
			success:function(msg){
				if(msg == ''){
					if(theType=='normal'){
						if(confirm("确认您的操作吗？")){
					          dosubmit(theUrl);
					    }
					}
					if(theType=='restate'){
						if(confirm("请确认已按要求校正上报信息，否则将会被系统退回！")){
					          dosubmit(theUrl);
					    }
					}
				  }else{
					    alert(msg);
					}
			 }
	 });
}
</script>
	</head>
	<body class="mainbg">
	<!--简单按钮浮动层-->
<!--  
<div class="floatdiv floatbtnbg" style="right:4px; top:40px;*top:expression(this.offsetParent.scrollTop+40); ">
<a href="#" title="添加报告处理意见信息" onClick="ymPrompt.win({message:'t07_case_advi.htm',width:550,height:280,title:'添加报告处理意见信息',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_addreport.png" /></a>
<a href="#" title="案例处理 -上传附件" onClick="ymPrompt.win({message:'t07_alert_attach.htm',width:420,height:150,title:'案例处理 -上传附件',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_upfile.png" /></a>
<a href="#" title="添加可疑信息" onClick="ymPrompt.win({message:'t07_case_ky_msg.htm',width:550,height:400,title:'添加可疑信息',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_addsusreport.png" /></a>
<a href="#" title="发起协查" onClick="ymPrompt.win({message:'t07_case_check_add_do.htm',width:550,height:300,title:'发起协查',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_inves.png" /></a>
</div>-->
		<html:form action="/case/t07_flow_list.do" method="post">
		<logic:present  name="checkbackurl">
		<input type="hidden" name="checkbackurl" value="<bean:write name="checkbackurl"/>"/>
		</logic:present>
			<bean:define id="credittask" name="credittask"
				type="com.ist.aml.report.dto.CreditTask"></bean:define>
			<html:hidden property="post_id" />
			<html:hidden property="application_num"
				value="<%=credittask.getApplication_num()%>" />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>
						    <%=com.ist.util.Constans.CASE_NAME%>信息
							    - <bean:write name="currpost" />工作台
						</span>
						<span class="buttons">
						<%
						String flow_id2 = (String) request.getAttribute("flow_id");
						if (flow_id2.equals("10")) 
						{
						%>
						<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/case_advi_add.do?',width:580,height:360,title:'添加案例处理意见',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
                             <img src="../../images/<%=session.getAttribute("style") %>/b_addreport.png" />添加案例处理意见
                        </a>
						<%
						}
						%>
						
						   <logic:iterate id="operlist" name="workbench_operlist" type="com.ist.aml.report.dto.T07_n_move">

								<%
									String op = operlist.getOper_id();
									if (op.equalsIgnoreCase("B12011") || op.equalsIgnoreCase("B15011")) {
								%>
								<a href="#" name="<%=operlist.getOper_desc ()%>"
									onclick="_verifyOper('verify_T07_oper.do?oper_id=<%=operlist.getOper_id()%>&oper_type=<%=operlist.getOper_type()%>','t07_flow_workbench_oper.do?oper_id=<%=operlist.getOper_id()%>&oper_type=<%=operlist.getOper_type()%>','restate');">
									<img src="../../<%=operlist.getImage_path()%>" /><%=operlist.getOper_desc()%>
								</a>
								<%
									} else {
								%>
								<a href="#" name="<%=operlist.getOper_desc ()%>"
									onclick="_verifyOper('verify_T07_oper.do?oper_id=<%=operlist.getOper_id()%>&oper_type=<%=operlist.getOper_type()%>','t07_flow_workbench_oper.do?oper_id=<%=operlist.getOper_id()%>&oper_type=<%=operlist.getOper_type()%>','normal');">
									<!-- <img src="../../images/<%=session.getAttribute("style") %>/b_sus.png" /><%=operlist.getOper_desc()%> -->
									<img src="../../<%=operlist.getImage_path()%>" /><%=operlist.getOper_desc()%>
								</a>
								<%
									}
								%>
							</logic:iterate> 
							<%
							String application_num = (String)request.getAttribute("application_num");
							String burl="t07_flow_list.do?newsearchflag=2&app_numBack="+application_num;
							String checkbackurl=(String)request.getAttribute("checkbackurl");
							String post_id=(String)credittask.getPost_id();
							if(checkbackurl!=null&&!checkbackurl.equals("")){
							  burl=request.getContextPath()+"/"+checkbackurl+"?batchtype=batch&newsearchflag=2&post_id="+post_id+"&app_numBack="+application_num;
							}
							 %>
							<a href="#" onclick="dosubmit('<%=burl%>')">
							<img src="../../images/blue/b_back.png" />返 回</a> 
						</span>
					</div>
				</div>
				<html:errors/>
				<!-- 大选项卡开始 -->
				<div id="bigTab">
					<!-- 大选项卡菜单 -->
					<%
						String flow_id = (String) request.getAttribute("flow_id");
						if (flow_id != null && !flow_id.equals("10") && !flow_id.equals("11") 
						       && !flow_id.equals("12") && !flow_id.equals("15")) {
					%>
					<dl class="tabm">
						<dd class="tabcur">
							<span>案例处理</span>
						</dd>
						<dd>
							<span>交易处理</span>
						</dd>
						<dd>
							<span>客户视图</span>
						</dd>
						<dd>
							<span>调查分析</span>
						</dd>
						<%
								ArrayList list = (ArrayList) request.getAttribute("worklist");
								if (list != null && list.size() > 0) {
						%>
						<dd style='background:none;float:right;'>
								   <logic:iterate id="worklist" name="worklist" type="com.ist.aml.report.dto.T07_n_task">
										<%
											java.util.HashMap map = new java.util.HashMap();
															map.put("task_id", worklist.getTask_id());
															pageContext.setAttribute("map", map,
																	PageContext.PAGE_SCOPE);
										%>
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_flow_workbench_task.do?task_id=<bean:write name="worklist" property="task_id"/>',width:680,height:360,title:'<bean:write name="worklist" property="href_des"/>',handler:handler,iframe:true,fixPosition:true,dragOut:false});aa();">
                                       <img src="../../images/<%=session.getAttribute("style") %>/b_addreport.png" /><bean:write name="worklist" property="href_des"/>
                                    </a>
                                    </logic:iterate>
                        </dd>
                         <%
                        }
					%>
					</dl>
					
					<!-- 大选项卡内容开始 -->
					<dl class="tabc">
						<!-- 大选项卡（1）****案例处理****选项卡<dd>对应菜单<dd> 只有第一个选项卡dd有class -->
						<dd class="tabshow">
						
							
							<!-- 大选项卡（1）列表标题：新样式cond_t2 -->
							<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
								
                         	<%
						
						if (flow_id != null && !flow_id.equals("10") && !flow_id.equals("11") 
						       && !flow_id.equals("12") && !flow_id.equals("15")) {
					%>
                         <span  style="float:left"> 
                         	<a href='#' onClick="_chengeUrl('case_disp2.do?newsearchflag=1&intPage=1')" title="案例信息"><img src="../../images/blue/b_caseinfo.png" />案例信息</a> &nbsp;&nbsp;&nbsp;&nbsp;
					      	<a href='#' onClick="_chengeUrl('case_advice_more.do?newsearchflag=1&fromcase=1')" title="案例意见"><img src="../../images/blue/b_addreport.png" />案例意见</a> &nbsp;&nbsp;&nbsp;&nbsp;
					    	<a href='#' onClick="_chengeUrl('trans_more.do?newsearchflag=1&state=1&casesearchtime=0&application_num=<bean:write property="application_num" name="credittask" />&cast_type=<bean:write property="cast_type" name="credittask" />')" title="交易信息"><img src="../../images/blue/b_risktranc.png" />交易信息</a>
				         </span>
                               
                        	<%
                        }
					%> 
                                 
							</div>
							<%
								}
									if (flow_id != null
											&& (flow_id.equals("10") || flow_id.equals("11")
													|| flow_id.equals("12") || flow_id.equals("15"))) {
							%>

							<!-- 大选项卡（1）列表表格内容 -->
							<div class="cond_c2">
								<table border="0" cellpadding="0" cellspacing="0">
								  <tr>
									<td><%=com.ist.util.Constans.CASE_NAME%>名称：</td>
									<td>
										<bean:write property="case_name" name="credittask" />
									</td>
									<td><%=com.ist.util.Constans.CASE_NAME%>类型：</td>
									<td>
										<bean:write name="credittask" property="cast_type_disp" />
									</td>
									</tr>
									<tr>
										<td><%=com.ist.util.Constans.CASE_NAME%>种类：</td>
										<td>
											<bean:write name="credittask" property="case_kind_disp" />
										</td>
										<td><%=com.ist.util.Constans.CASE_NAME%>状态：</td>
										<td>
											<bean:write name="credittask" property="app_state_cd_disp" />
										</td>
									</tr>
									<tr>
										<td>
											机构名称：
										</td>
										<td>
											<bean:write property="app_org_id_disp" name="credittask" />
										</td>
										<td>
											创建日期：
										</td>
										<td>
											<bean:write property="app_dt_disp" name="credittask" />
										</td>
									</tr>
								</table>
							</div>
							<%
								}
							%>

							<logic:equal name="credittask" property="flow_id" value="01">

								<iframe src="<%=root2%>" id="down0" scrolling="no" width="100%" height="600"   name="test" frameborder="0"></iframe>

							</logic:equal>
							<logic:equal name="credittask" property="flow_id" value="02">

								<iframe src="<%=root2%>" id="down0" width="100%" scrolling="no" height="600"  name="test" frameborder="0"></iframe>

							</logic:equal>
							<logic:equal name="credittask" property="flow_id" value="03">
								<iframe src="<%=root2%>" id="down0" width="100%" scrolling="no" name="test" frameborder="0"></iframe>
							</logic:equal>
							<logic:equal name="credittask" property="flow_id" value="04">

								<iframe src="<%=root2%>" id="down0" width="100%" scrolling="no" name="test" frameborder="0"></iframe>

							</logic:equal>
							<logic:equal name="credittask" property="flow_id" value="05">

								<iframe src="<%=root2%>" id="down0" width="100%" scrolling="no" name="test" frameborder="0"></iframe>

							</logic:equal>
							<%-- 纠错 --%>
							<logic:equal name="credittask" property="flow_id" value="10">
								<logic:equal name="credittask" property="cast_type" value="1">
									<iframe
										src="<%=request.getContextPath()%>/pbcreport/report/cbh_tsdt_list.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='credittask' property='application_num'/>"
										width="100%" scrolling="no" height="1400" name="test"
										frameborder="0"></iframe>
								</logic:equal>
								<logic:equal name="credittask" property="cast_type" value="2">
									<iframe
										src="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='credittask' property='application_num'/>"
										width="100%" scrolling="no" height="1200" name="test"
										frameborder="0"></iframe>
								</logic:equal>
							</logic:equal>
							<%-- 重报 补报--%>
							<logic:equal name="credittask" property="flow_id" value="12">
								<logic:equal name="credittask" property="cast_type" value="1">
									<iframe
										src="<%=request.getContextPath()%>/pbcreport/validate/nbh_base_info.do?fromcase=1&casekey=<bean:write name='credittask' property='application_num'/>"
										width="100%" scrolling="no" height="1200" name="test" frameborder="0">
									</iframe>
								</logic:equal>
								<logic:equal name="credittask" property="cast_type" value="2">
									<iframe
										src="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='credittask' property='application_num'/>"
										width="100%" scrolling="no" height="1200" name="test"
										frameborder="0">
								    </iframe>
								</logic:equal>
							</logic:equal>
							<%-- 删除 --%>
							<logic:equal name="credittask" property="flow_id" value="11">
								<iframe
									src="<%=request.getContextPath()%>/pbcreport/report/dbh_dtdt_list.do?casekey=<bean:write name='credittask' property='application_num'/>"
									width="100%" scrolling="no" height="1200" name="test"
									frameborder="0"></iframe>
							</logic:equal>

							<%-- 补正<%=com.ist.util.Constans.CASE_NAME %> cast_type:1大额，2可疑--%>
							<logic:equal name="credittask" property="flow_id" value="15">
								<logic:equal name="credittask" property="cast_type" value="1">
									<iframe
										src="<%=request.getContextPath()%>/pbcreport/report/T07_ibh_tsdt_list.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='credittask' property='application_num'/>&tag=<bean:write name='credittask' property='post_id'/>"
										width="100%" scrolling="no" height="1200" name="test"
										frameborder="0"></iframe>
								</logic:equal>
								<logic:equal name="credittask" property="cast_type" value="2">
									<iframe
										src="<%=request.getContextPath()%>/pbcreport/report/nbs_base_info1.do?newsearchflag=1&fromcase=1&casekey=<bean:write name='credittask' property='application_num'/>"
										width="100%" scrolling="no" height="1200" name="test"
										frameborder="0"></iframe>
								</logic:equal>
							</logic:equal>
						</dd>
						<dd>
						    <iframe src="#" id="down1" scrolling="no" width="100%"  name="down1" frameborder="0"></iframe>
						</dd>
					<dd>
						    <iframe src="#" id="down2" scrolling="no" width="100%" height="600"   name="down2" frameborder="0"></iframe>
						</dd>
						<%
						
						if (flow_id != null && !flow_id.equals("10") && !flow_id.equals("11") 
						       && !flow_id.equals("12") && !flow_id.equals("15")) {
					%>
						<dd>
						<div class="cond_t2" id="cusnew">
							<span  class="buttons"> 
							<a href='#' onClick="_chengeUrl3('<%=root8%>')" title="场景分析"><img src="../../images/blue/case03.gif" />场景分析</a>
                         	<a href='#' onClick="_chengeUrl3('<%=root4%>')" title="交易分析" ><img src="../../images/blue/case01.gif" />交易分析</a> &nbsp;&nbsp;&nbsp;&nbsp;
                         	
                         	<logic:lessThan name="credittask" property="trans_count" value="1000">
					      	<a href='#' onClick="window.open('<%=request.getContextPath() %>/mfa/mfa_issue/MFA.html?isSave=<%=(String)request.getAttribute("isSave") %>&net_id=<bean:write name="t07_case_applicationActionForm" property="application_num"/>','_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no');" ><img src="../../images/blue/case02.gif" />资金网络</a> &nbsp;&nbsp;&nbsp;&nbsp;
					    	</logic:lessThan>
					    	
				         	</span>
				         </div>
				         <iframe src="<%=root8%>" id="down3" scrolling="auto" width="100%" height="600"   name="down3" frameborder="0"></iframe>
						</dd>
					<%
						}
					%>
					</dl>
				</div>
			</div>
		</html:form>
	</body>
</html>
