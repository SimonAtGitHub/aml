<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
	
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_temp_common.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	 var intPage=1;
	 var commited = true;

	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type == 'modi'){		
		 
		 if(CheckBoxMustChecked(document.forms[0])){				
			 errMsg = "请选择";
		}
		 isSub = true;
	}   
    else if(type=='search'){
		var begin = document.forms[0].statisticdate_begin.value;
		var end = document.forms[0].statisticdate_end.value;
		if(begin != "" && end != ""){
	        if(begin > end){
				alert("数据时间区间错误！");
				return false;
	        }
		}
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
	
	 var	 t18_task_list=null;
	//获得页面某一个对象的Y坐标
	function   getAbsPoint(obj)      
	{      
		var   x,y;      
			oRect   =   obj.getBoundingClientRect();      
			x=oRect.left      
			y=oRect.top      
		
		return	y;    
	} 
	
	 jQuery(document).ready(function(){
			changeimg();
			t18_task_list=<%=request.getAttribute("t18_task_factList")%>;
			
			var	 objArray=init_page_param(t18_task_list);
			total_num=Number(objArray.split("-")[0]);
			total_page=Number(objArray.split("-")[1]);
			
			load_data(page_num);
			cal_div_position();
			
			//alert("总页数："+total_page+"总记录数:"+total_num);
	   });	
	  
	   //  将指定页数据添加到数据列表末尾
	   function	load_data(intpage){
	   		var	 objArray=getStartAndEndIndex(intpage,page_size,total_page,total_num);
	   		var	start_index=Number(objArray.split("-")[0]);
	   		var	end_index=Number(objArray.split("-")[1]);
	   		var	task_size=t18_task_list.length;
	   	 if(task_size>0){
	   		
	   		for(var i=start_index;i<=end_index;i++){
	   					var	typename=t18_task_list[i]["typename"]; 
						var	businesskey=t18_task_list[i]["businesskey"];
						var	dskey=t18_task_list[i]["dskey"];
						var	dsname=t18_task_list[i]["dsname"];
						var	granularity_diap=t18_task_list[i]["granularity_diap"];
						var	statisticdate=t18_task_list[i]["statisticdate"];
						var taskkey = t18_task_list[i]["taskkey"];	
						var begintime = t18_task_list[i]["begintime"];	
						var endtime =  t18_task_list[i]["endtime"];	
						var usetime = t18_task_list[i]["usetime"];	
						var calstatus = t18_task_list[i]["calstatus"];	
						var calstatus_disp = t18_task_list[i]["calstatus_disp"];	
						var iscall =  t18_task_list[i]["iscall"];	
						var iserror =  t18_task_list[i]["iserror"];	
						var businesskey =  t18_task_list[i]["businesskey"];
						var tasktype =  t18_task_list[i]["tasktype"];
						 var  htmlstr="<tr align='center'>  "
						 htmlstr+="<td nowrap><input type=\"checkbox\" name=\"selecttaskkey\" value='"+taskkey+"' onclick=\"changcol(this)\" ></td>"
						 htmlstr+="<td nowrap>"+tasktype+"-"+typename+"</td>"
						 htmlstr+="<td nowrap>"+businesskey+"</td>"
						 htmlstr+="<td nowrap>"+dskey+"-"+dsname+"</td>"
						 
						  htmlstr+="<td nowrap>"+granularity_diap+"</td>"
						  htmlstr+="<td nowrap>"+statisticdate+"</td>"
						 
						 htmlstr+= "<td nowrap>" + begintime + "</td> <td nowrap>" +  endtime + "</td> <td nowrap>" + usetime + "</td>";
						 htmlstr += "<td nowrap><img alt=\""+calstatus_disp+"\" src=\"\" name=\""+calstatus+"\"/></TD>"; 
						
						
			
						 htmlstr += "<td nowrap>";
						 if(iscall){
							htmlstr += "<a href=\"#\" onclick=\"getHistory('"+taskkey+"');return false;\">计算历史</a>&nbsp;";
							}
						if(iserror){
							 htmlstr +=	"<a href=\"#\" onclick=\"getErrorlog('"+taskkey+"');return false;\">错误日志</a>&nbsp;";
							}
						 htmlstr += "<a href=\"#\" onclick=\"taskanalysis('"+businesskey+"','"+tasktype+"');return false;\">任务分析</a></TD></tr>";
						
						 
						jQuery("#data_list_tab").append(htmlstr);
						
	   			}
	   		}else{
	   			jQuery("#bottom_div_msg").hide();
	   		}
	   		if(end_index>=total_num-1){
	   			jQuery("#bottom_div_msg").hide();
	   			
	   		}
	   		
	   		changeimg();
	      	setListStyle();
	      
	   }
	   
	   
		function  cal_div_position(){
			var	  divobj=document.getElementById("data_list_div");
			divobj.attachEvent("onscroll",printp);
		}
		function  printp(){
			//alert("div位置发生了变化!!!");
			//向table中添加下一页的15条记录
			var	bottom_divobj=document.getElementById("bottom_div");
			//alert(bottom_divobj);
			var  bottom_y=getAbsPoint(bottom_divobj);//获得底部div的y坐标
			//alert(bottom_y);
			//alert(bottom_y);
		  	if(bottom_y<=487){
		  		++page_num;
				ajax_refresh(page_num);
				return false;
		   }
		}
  	  
	   function callAjax() {
			if (commited) {
				commited = false;
				ajax_demo();
			}
	   }

	//更新图片
		function changeimg(){
			var flag = false;
			jQuery(".awp_list img").each(function(i){
				var imagename="";
				if(this.name=='0'){
					imagename = "stutas_icon0.gif";//失败
				}else if(this.name=='2'){
					imagename = "stutas_icon1.gif"
					//imagename = "stutas_icon2.gif";//正在
				}else if(this.name=='3'){
					imagename = "stutas_icon2.gif";//成功
				}else if(this.name=='4'){
					imagename = "stutas_icon3.gif";//失败
				}
				//stutas_icon1.gif //等待
			  	this.src = "<%=request.getContextPath()%>/skin/blue/images/"+imagename;
			  	
			});			
	}
		
		function ajax_demo()
		{			
			var begin = document.forms[0].statisticdate_begin.value;
			var end = document.forms[0].statisticdate_end.value;
			var tasktype = 	document.forms[0].tasktype.value;	
			var businesskey = 	document.forms[0].businesskey.value;
			var dskey = 	document.forms[0].dskey.value;
			var granularity = 	document.forms[0].granularity.value;
			var calstatus = 	document.forms[0].calstatus.value;	
			jQuery.ajax({
					url:'<%=request.getContextPath()%>/bmp/t18_task_fact/t18_task_fact_list_ajax.do?'
						+'newsearchflag=1&statisticdate_begin='+begin+'&statisticdate_end='+end+'&tasktype='+tasktype
						+'&businesskey='+businesskey+'&dskey='+dskey + '&granularity='+granularity +'&calstatus='+calstatus,
					type: 'POST',
					dataType: 'xml',
					error: function(xml){
						alert("任务失败");
						commited = true;
					},				
					success: function(xml){
						jQuery(xml).find("task").each(function(){
						var taskkey = jQuery(this).find("taskkey").text();	
						var begintime = jQuery(this).find("begintime").text();	
						var endtime = jQuery(this).find("endtime").text();	
						var usetime = jQuery(this).find("usetime").text();	
						var calstatus = jQuery(this).find("calstatus").text();	
						var calstatus_disp = jQuery(this).find("calstatus_disp").text();	
						var iscall = jQuery(this).find("iscall").text();	
						var iserror = jQuery(this).find("iserror").text();	
						var businesskey = jQuery(this).find("businesskey").text();
						var tasktype = jQuery(this).find("tasktype").text();

						 var htmlstr = "<td nowrap>" + begintime + "</td> <td nowrap>" +  endtime + "</td> <td nowrap>" + usetime + "</td>";
						 htmlstr += "<td nowrap><img alt=\""+calstatus_disp+"\" src=\"\" name=\""+calstatus+"\"/></TD>"; 
						 htmlstr += "<td nowrap>";
						 if(iscall){
							htmlstr += "<a href=\"#\" onclick=\"getHistory('"+taskkey+"');return false;\">计算历史</a>&nbsp;";
							}
						if(iserror){
							 htmlstr +=	"<a href=\"#\" onclick=\"getErrorlog('"+taskkey+"');return false;\">错误日志</a>&nbsp;";
							}
						 htmlstr += "<a href=\"#\" onclick=\"taskanalysis('"+businesskey+"','"+tasktype+"');return false;\">任务分析</a></TD>";

						jQuery("#"+taskkey).html(htmlstr);
						jQuery("#"+taskkey).show();				
						});
						
						changeimg();
	      				setListStyle();
	      				commited = true;
					}
						
				});

		}
		
	function ajax_refresh(pageNum)//采用ajax向页面添加数据
		{			
			load_data(pageNum);
		}


		function getHistory(taskkey){			
			var theUrl = '<%=request.getContextPath()%>/bmp/t18_task_fact/getT18_task_fact_history.do?taskkey='+taskkey;
			  document.forms[0].action=theUrl;
		      document.forms[0].submit();
	
		}
		function getErrorlog(taskkey){
			var theUrl = '<%=request.getContextPath()%>/bmp/t18_task_fact/getT18_task_fact_error.do?taskkey='+taskkey;			
			   document.forms[0].action=theUrl;
		      document.forms[0].submit();	
		}

		function taskanalysis(businesskey,tasktype){
			var theUrl = '<%=request.getContextPath()%>/bmp/t18_task_fact/taskanalysis.do?businesskey='+businesskey+'&tasktype='+tasktype;
			//alert(theUrl);
			//openWin(theUrl,'',600,500);
			   document.forms[0].action=theUrl;
		      document.forms[0].submit();	

		}
</SCRIPT>	
</head>

<body >
<div id='mainbg'>
	<html:form action="/t18_task_fact/t18_task_fact_list.do" method="POST">
    <div class='main'>
    <div class='conditions'>
    	<div class="cond_t">
    	<span>批处理进度管理</span>
    	<span class="buttons">
    		<!--<input type="button" name="btsearch2" value="查 找"
							onclick="btnDisplayHidden(this, 'searchtable')" />	
			--><input type="button" value="设置重新计算" onClick="dosubmit('restart_calculation.do','modi')"/>
    	</span>
    </div>
  	<div class='cond_c' id="searchtable">
 	
  		<table>	
  					<tr>
  						<td>任务类别：</td>
  						<td>
  							<html:select property="tasktype">
								<html:options collection="task_typeMap" property="label"
										labelProperty="value" />
								</html:select>
  						</td>
  						<td>业务编码：</td>
  						<td>
  							<html:text property="businesskey" styleClass="text_white" size="30" />
  						</td>
  					</tr>
  					<tr>
  						<td>数据源名称：</td>
  						<td>
  							<html:select property="dskey">
								<html:options collection="datasourceMap" property="label"
										labelProperty="value" />
							</html:select>
  						</td>
  						<td>粒度：</td>
  						<td>
  							<html:select property="granularity">
								<html:options collection="granularityMap" property="label"
										labelProperty="value" />
							</html:select>
  						</td>
  					</tr>
					<tr>
						<td height="8">
							数据时间：
							</td>
							<td>
							<html:text property="statisticdate_begin" styleClass="text_white" size="12" readonly="true" 
								maxlength="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].statisticdate_begin);">
									&nbsp;-
							<html:text property="statisticdate_end" styleClass="text_white" size="12" readonly="true"
								maxlength="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif" id="img2"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="弹出日历下拉菜单"
								onClick="new Calendar().show(document.forms[0].statisticdate_end);">							
							
						</td>
						<td>状态：</td>
						<td>
							<html:select property="calstatus">
								<html:options collection="calstatusMap" property="label"
										labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td></td><td></td><td></td>
						<td><input type="button" value="查 询" onclick="dosubmit('t18_task_fact_list.do?newsearchflag=1','search')" /></td>
					</tr>
				</table>
		</div>
	</div>
	<div class='list' id="data_list_div">
		
	 	<table	id="data_list_tab">
			<tr align="center">
				<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>全部</td>
				<td width="10%" nowrap>
					任务类别			
				</td>
				<td width="10%" nowrap>
					业务编码				
				</td>
				<td width="10%" nowrap>
					数据源名称			
				</td>
				<td width="2%" nowrap>
					粒度			
				</td>
				<td width="5%" nowrap>
					数据时间			
				</td>				
				<td width="10%" nowrap>
					开始时间			
				</td>
				<td width="10%" nowrap>
					结束时间				
				</td>
				<td width="5%" nowrap>
					实际耗时（秒）	
				</td>
				<td width="5%" nowrap>
					状态			
				</td>
				
				<td width="15%" nowrap>
					操作			
				</td>
			</tr>
			
		</table>
		
		<div  id="bottom_div">
			&nbsp;
		</div>
		
	</div>
	<!--<div  id="bottom_div_msg">
			要显示更多，请拖动滚动条！
	</div>
	--></div>
	</html:form>
	</div>
</body>

</html>