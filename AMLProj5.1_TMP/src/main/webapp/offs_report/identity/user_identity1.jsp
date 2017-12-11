<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/jquery-1.2.3.pack.js"></script>	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		
		<script language="JavaScript">
			var tag=true;
			var flag=0;
			function dosubmit(theUrl){
			var errMsg = myValidate();
				 if(!errMsg){
			        return false; 
			    }
			   if(flag!=0){
			    alert("请输入正确的整数!")
			    	return false;
			    }
			   document.forms[0].action=theUrl;
			   document.forms[0].submit();
			}
			
			function   myValidate()   
		    {     
		    	var flag=true;
		    	$.each( [0,1,2,3], function(i, n){
		    	var val=0;
		    	str2="cptotal"+i;
		    	 for (j = 1; j <= 5; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="a";
						       break;
						   case 2 :
						       mark="b";
						       break;
						   case 3 :
						       mark="c";
						       break;
						   case 4 :
						       mark="d";
						       break;
						   case 5 :
						       mark="e";
						       break; 
						}
		    			str3="cp"+mark+i;
		    			if($("#"+str3).val().length>0){
		    				val=val+parseInt($("#"+str3).val())
		    			}
		    		}
		    		if($("#"+str2).val().length<=0 && parseInt(val)>0){
		    			    $("#"+str2).css("background-color","silver");
		    			  	alert("各分项之和应小于等于对公客户总数之和!");
						    flag=false;
		    		}else if(parseInt($("#"+str2).val())<parseInt(val))
		    			{
		    			    $("#"+str2).css("background-color","silver");
		    			   	alert("各分项之和应小于等于对公客户总数之和!");
						    flag=false;
		    			}
		    	str2="idtotal"+i;
		    	val=0;
		    	 for (j = 1; j <= 3; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="a";
						       break;
						   case 2 :
						       mark="b";
						       break;
						   case 3 :
						       mark="e";
						       break;
						}
		    			str3="id"+mark+i;
		    			if($("#"+str3).val().length>0){
		    				val=val+parseInt($("#"+str3).val())
		    			}
		    		}
		    			if($("#"+str2).val().length<=0 && parseInt(val)>0)
		    			{
		    			    $("#"+str2).css("background-color","silver");
		    			   	alert("代理行识别数、第三方识别数与发现问题合计数三者\n之和应小于等于对私客户居民与非居民总数之和!");
						    flag=false;
		    			}else if(parseInt($("#"+str2).val())<parseInt(val))
		    			{
		    			    $("#"+str2).css("background-color","silver");
		    			   	alert("代理行识别数、第三方识别数与发现问题合计数三者\n之和应小于等于对私客户居民与非居民总数之和!");
						    flag=false;
		    			}
				}); 
				return flag;
		    }
			
			
			function checkNum(obj){
				var str=myTrim(obj.value);
				if(str==null || str.length==0){
					obj.value=str;
					if(tag==false){
					  flag=flag-1;
					  tag=true;
					}
					return true;
				}else{
					if(str.match(/\D/)==null){
						obj.value=Math.floor(str);
						if(tag==false){
						  flag=flag-1;
						  tag=true;
						}
						return true;
					}else{
						alert("请输入正确的整数!");
						flag=flag+1;
						tag=false;
						return false;
					}
				}
			}
			function   myTrim(str)   
		    {     
		          if(str.replace(/\s/g,"").length==0){
		          	str="";
		          } else{
		          	str=str.replace(/(^\s*)|(\s*$)/g, "");
		          }
		          return  str;
		    }
		    function   myChange(obj,flag)   
		    {
		    	if(!checkNum(obj)){
		    	 	obj.focus();
					obj.value=obj.value;
		    	 	return;
		    	 }
		    	 if(flag=="0"){
		    	 	myChange0(obj);
		    	 }
		    	if(flag=="1"){
		    	 	myChange1(obj);
		    	 }
		    	myChange2(obj);
		    }
		    function   myChange0(obj)   
		    {     
		    	 val=0;
		    	 str=obj.id.substr(0,2);//前缀 id,cp
		    	 str1=obj.id.substr(3,2);//后缀 0,1,2
		    	 str2=str+"e"+str1;//合计 ide cpe
		    	 for (j = 1; j <= 6; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="f";
						       break;
						   case 2 :
						       mark="g";
						       break;
						   case 3 :
						       mark="h";
						       break;
						   case 4 :
						       mark="i";
						       break;
						   case 5 :
						       mark="j";
						       break; 
						   case 6 :
						       mark="k";
						       break; 
						}
		    			str3=str+mark+str1;
		    			if($("#"+str3).val().length>0){
		    				val=val+parseInt($("#"+str3).val())
		    			}
		    			$("#"+str2)[0].value=val;
		    		}
		    }
		    function   myChange1(obj)   
		    {     
		    	 val=0;
		    	 str=obj.id.substr(0,2);//前缀 id,cp
		    	 str1=obj.id.substr(3,2);//后缀 0,1,2
		    	 str2=str+"total"+str1;//合计 ide1 cpe2 ...
		    	 for (j = 1; j <= 2; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="c";
						       break;
						   case 2 :
						       mark="d";
						       break;
						}
		    			str3=str+mark+str1;
		    			if($("#"+str3).val().length>0){
		    				val=val+parseInt($("#"+str3).val())
		    			}
		    			$("#"+str2)[0].value=val;
		    		}
		    }
		    function   myChange2(obj)   
		    {     
		    	 val=0;
		    	 str=obj.id.substr(3,2);//后缀 0,1,2
		    	 if(str=="ot"){
		    	 str=obj.id.substr(7,1);
		    	 }
		    	 str1="total"+str;//合计 total0  ...
		    	 
    			 if($("#"+"cptotal"+str).val().length>0){
    				val=val+parseInt($("#"+"cptotal"+str).val())
    			 }
    			 if($("#"+"idtotal"+str).val().length>0){
    				val=val+parseInt($("#"+"idtotal"+str).val())
    			 }
    			 $("#"+str1)[0].value=val;
		    }
		    function   validate_cp(obj)   
		    {    
		    	 var val=0;
		    	 str=obj.id.substr(0,2);//前缀 id,cp
		    	 str1=obj.id.substr(3,2);//后缀 0,1,2
                 if(str1=="ot")
                 {
                 str2=obj.id;
                 str1=obj.id.substr(7,1);
                 }else{
		    	 str2=str+"total"+str1;//合计 idtotal1 cptotal2 ...
		    	 }
		    	 for (j = 1; j <= 5; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="a";
						       break;
						   case 2 :
						       mark="b";
						       break;
						   case 3 :
						       mark="c";
						       break;
						   case 4 :
						       mark="d";
						       break;
						   case 5 :
						       mark="e";
						       break; 
						}
		    			str3=str+mark+str1;
		    			if($("#"+str3).val().length>0){
		    				val=val+parseInt($("#"+str3).val())
		    			}
		    		}
		    			if($("#"+str2).val().length>0){
		    			   if(parseInt($("#"+str2).val())<parseInt(val))
		    			   {
		    			   	alert("各分项之和应小于等于对公客户总数之和!");
						    return false;
		    			   }
		    			}
		    }
		    function   validate_id(obj)   
		    {    
		    	 var val=0;
		    	 str=obj.id.substr(0,2);//前缀 id,cp
		    	 str1=obj.id.substr(3,2);//后缀 0,1,2
                 if(str1=="ot")
                 {
                 str2=obj.id;
                 str1=obj.id.substr(7,1);
                 }else{
		    	 str2=str+"total"+str1;//合计 idtotal1 cptotal2 ...
		    	 }
		    	 for (j = 1; j <= 3; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="a";
						       break;
						   case 2 :
						       mark="b";
						       break;
						   case 3 :
						       mark="e";
						       break;
						}
		    			str3=str+mark+str1;
		    			if($("#"+str3).val().length>0){
		    				val=val+parseInt($("#"+str3).val())
		    			}
		    		}
		    			if($("#"+str2).val().length>0){
		    			   if(parseInt($("#"+str2).val())<parseInt(val))
		    			   {
		    			   	alert("代理行识别数、第三方识别数与发现问题合计数三者\n之和应小于等于对私客户居民与非居民总数之和!");
						    return false;
		    			   }
		    			}
		    }
		    function  mycheck_zc(detail,total)
		    {
                var deta=eval('document.forms[0].'+detail);
	            var sum=eval('document.forms[0].'+total);

                var detavalue=deta.value;
                var sumvalue=sum.value;
                if(!checkNum(deta))
                {
                  deta.focus();
                  deta.value=deta.value;
                  return false;
                }else
                if(detavalue.length>0 && sumvalue.length>0)
                {
                    if(parseInt(detavalue)>parseInt(sumvalue))
                    {
                    alert("他人代理数不能大于合计数！");
                    deta.focus();
                    deta.value=deta.value;
                    return false;
                   }
                }else if(detavalue.length>0 && sumvalue.length==0)
                {
                   alert("请先输入合计数！");
                   sum.focus();
                   return false;
                }
            }
			// -->
		</script>
		
	</head>
	<body class="mainbg">
		<div id="main">
		<html:form action="/identity/t07_user_identityAdd_do.do" method="post">
		<html:errors />
			 <div class="conditions">
			    <!-- title -->
				<div class="cond_t">
			<span>客户身份统计--识别客户</span>
			 <span class="buttons">
					<%if(request.getAttribute("editflag").equals("edit") || request.getAttribute("editflag").equals("add")){ %>
					<a href="#" onclick="dosubmit('t07_user_identityAdd_do.do?status_cd=0');"><img src="../../images/<%=session.getAttribute("style") %>/b_draft.png" />草 稿</a>
					<a href="#" onclick="dosubmit('t07_user_identityAdd_do.do?status_cd=1');"><img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />完 成</a>
					<!-- <input name="button" type="button" class="in_button1" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=0");' value="草 稿"/>
					<input name="button" type="button" class="in_button1" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=1");' value="完 成"/> -->
					<%}else{ %>
					<!-- <a href="#" onclick='dosubmit("gett07_user_identity_xls.do");'> -->
					<a href="#" onclick="dosubmit('exportT07_user_identitylist.do');">
					<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
					<%} %>
					<a href="#" onclick="history.back();"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					<!-- <input name="button" type="button" class="input" onclick="history.back();" value="返 回"/></td> -->
			 	</span>
			  </div>
			</div>
			<input type="hidden" name="editflag" value="<%=request.getAttribute("editflag")%>" />
			<input type="hidden" name="identitykey" value="<%=request.getAttribute("identitykey")%>" />
			<input type="hidden" name="identitytype" value="1" />
			<html:hidden property="organkey"/>
			 <div class="cond_c3">
           <table border="0" cellspacing="3" cellpadding="0">
			 <tr>
		        <td colspan="2" align="center" class="big_tl">
					<h3>金融机构客户身份识别统计情况表</h3>
					<strong>（识别客户）</strong>
				</td>
		      </tr>
			<tr><td  align="left">&nbsp;&nbsp;填报单位:<html:text property="organName" maxlength="30" styleClass="tt"/></td>
			<td align="right"><html:text property="startyear" size="5" styleClass="tt"/>年<html:text property="startseason" size="5" styleClass="tt"/>季度&nbsp;&nbsp;</td></tr>
			 
      
			<tr><td colspan="2" align="right">单位  家&nbsp;&nbsp;</td></tr>
			<tr><td colspan="2" valign="top">
			 <div class="list2 biglist">
				<table border="0" cellspacing="1" cellpadding="0">
					<tr><th colspan="3">项目</th>
						<th>新客户</th>
						<th>一次性交易</th>
						<th>跨境汇兑</th>
						<th>其他情形</th>
					</tr>
					<tr align="center" valign="middle">
						<td rowspan="12">对<p/>公<p/>客<p/>户</td>
						<td colspan="2">总数</td>
						<td><html:text property="cp_total1" styleId ="cptotal0" size="15" onkeyup="myChange(this);validate_cp(this)" maxlength="15"/></td> 
						<td><html:text property="cp_total2" styleId ="cptotal1" size="15" onkeyup="myChange(this);validate_cp(this)" maxlength="15"/></td> 
						<td><html:text property="cp_total3" styleId ="cptotal2" size="15" onkeyup="myChange(this);validate_cp(this)" maxlength="15"/></td> 
						<td><html:text property="cp_total4" styleId ="cptotal3" size="15" onkeyup="myChange(this);validate_cp(this)" maxlength="15"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td colspan="2">通过代理行识别数</td>
						<td><html:text property="cp_proxy1" styleId ="cpa0" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_proxy2" styleId ="cpa1" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_proxy3" styleId ="cpa2" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_proxy4" styleId ="cpa3" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td colspan="2">通过第三方识别数</td>
						<td><html:text property="cp_thparty1" styleId ="cpb0" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_thparty2" styleId ="cpb1" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_thparty3" styleId ="cpb2" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_thparty4" styleId ="cpb3" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td colspan="2">与离岸中心有关的</td>
						<td><html:text property="cp_disembark1" styleId ="cpc0" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_disembark2" styleId ="cpc1" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_disembark3" styleId ="cpc2" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_disembark4" styleId ="cpc3" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td colspan=2>受益人数</td>
						<td><html:text property="cp_benefit1" styleId ="cpd0" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_benefit2" styleId ="cpd1" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_benefit3" styleId ="cpd2" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
						<td><html:text property="cp_benefit4" styleId ="cpd3" size="15" onkeyup="myChange(this);validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td rowspan="7">发现<p/>问题</td>
						<td>合计</td>
						<td><html:text property="cp_questotal1" styleId ="cpe0" size="15" styleClass="tt" /></td> 
						<td><html:text property="cp_questotal2" styleId ="cpe1" size="15" styleClass="tt" /></td> 
						<td><html:text property="cp_questotal3" styleId ="cpe2" size="15" styleClass="tt" /></td> 
						<td><html:text property="cp_questotal4" styleId ="cpe3" size="15" styleClass="tt" /></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>匿名、假名&nbsp;&nbsp;</td>
						<td><html:text property="cp_anonymous1" styleId ="cpf0" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_anonymous2" styleId ="cpf1" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_anonymous3" styleId ="cpf2" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_anonymous4" styleId ="cpf3" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>证件造假&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><html:text property="cp_falsecard1" styleId ="cpg0" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_falsecard2" styleId ="cpg1" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_falsecard3" styleId ="cpg2" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_falsecard4" styleId ="cpg3" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>证件失效&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><html:text property="cp_failurecard1" styleId ="cph0" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_failurecard2" styleId ="cph1" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_failurecard3" styleId ="cph2" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_failurecard4" styleId ="cph3" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>利用他人证件</td>
						<td><html:text property="cp_otherscard1" styleId ="cpi0" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_otherscard2" styleId ="cpi1" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_otherscard3" styleId ="cpi2" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_otherscard4" styleId ="cpi3" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>犯罪嫌疑人&nbsp;&nbsp;</td>
						<td><html:text property="cp_suspects1" styleId ="cpj0" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_suspects2" styleId ="cpj1" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_suspects3" styleId ="cpj2" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_suspects4" styleId ="cpj3" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>其他情形&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><html:text property="cp_othercase1" styleId ="cpk0" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_othercase2" styleId ="cpk1" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_othercase3" styleId ="cpk2" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
						<td><html:text property="cp_othercase4" styleId ="cpk3" size="15" onkeyup="myChange(this,'0');validate_cp(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td rowspan="14">对<p/>私<p/>客<p/>户</td>
						<td colspan="2">总数</td>
						<td><html:text property="id_total1" styleId ="idtotal0" size="15" styleClass="tt" /></td> 
						<td><html:text property="id_total2" styleId ="idtotal1" size="15" styleClass="tt" /></td> 
						<td><html:text property="id_total3" styleId ="idtotal2" size="15" styleClass="tt" /></td> 
						<td><html:text property="id_total4" styleId ="idtotal3" size="15" styleClass="tt" /></td> 
					</tr>
					<tr align="center" valign="middle" bgcolor=white>
						<td colspan="2">通过代理行识别数</td>
						<td><html:text property="id_proxy1" styleId ="ida0" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
						<td><html:text property="id_proxy2" styleId ="ida1" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
						<td><html:text property="id_proxy3" styleId ="ida2" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
						<td><html:text property="id_proxy4" styleId ="ida3" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle" bgcolor=white>
						<td colspan="2">通过第三方识别数</td>
						<td><html:text property="id_thparty1" styleId ="idb0" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
						<td><html:text property="id_thparty2" styleId ="idb1" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
						<td><html:text property="id_thparty3" styleId ="idb2" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
						<td><html:text property="id_thparty4" styleId ="idb3" size="15" onkeyup="myChange(this);validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td rowspan="2">居民</td>
						<td>合计</td>
						<td><html:text property="id_residents1" styleId ="idc0" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_resiproxy1','id_residents1')"/></td> 
						<td><html:text property="id_residents2" styleId ="idc1" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_resiproxy2','id_residents2')"/></td> 
						<td><html:text property="id_residents3" styleId ="idc2" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_resiproxy3','id_residents3')"/></td> 
						<td><html:text property="id_residents4" styleId ="idc3" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_resiproxy4','id_residents4')"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>其中他人代理的</td>
						<td><html:text property="id_resiproxy1" styleId ="idc01" size="15" onkeyup="mycheck_zc('id_resiproxy1','id_residents1')"/></td> 
						<td><html:text property="id_resiproxy2" styleId ="idc11" size="15" onkeyup="mycheck_zc('id_resiproxy2','id_residents2')"/></td> 
						<td><html:text property="id_resiproxy3" styleId ="idc21" size="15" onkeyup="mycheck_zc('id_resiproxy3','id_residents3')"/></td> 
						<td><html:text property="id_resiproxy4" styleId ="idc31" size="15" onkeyup="mycheck_zc('id_resiproxy4','id_residents4')"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td rowspan="2">非居民</td>
						<td>合计</td>
						<td><html:text property="id_nonresidents1" styleId ="idd0" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_nonresiproxy1','id_nonresidents1')"/></td> 
						<td><html:text property="id_nonresidents2" styleId ="idd1" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_nonresiproxy2','id_nonresidents2')"/></td> 
						<td><html:text property="id_nonresidents3" styleId ="idd2" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_nonresiproxy3','id_nonresidents3')"/></td> 
						<td><html:text property="id_nonresidents4" styleId ="idd3" size="15" onkeyup="myChange(this,'1');mycheck_zc('id_nonresiproxy4','id_nonresidents4')"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>其中他人代理的</td>
						<td><html:text property="id_nonresiproxy1" styleId ="idd01" size="15" onkeyup="mycheck_zc('id_nonresiproxy1','id_nonresidents1')"/></td> 
						<td><html:text property="id_nonresiproxy2" styleId ="idd11" size="15" onkeyup="mycheck_zc('id_nonresiproxy2','id_nonresidents2')"/></td> 
						<td><html:text property="id_nonresiproxy3" styleId ="idd21" size="15" onkeyup="mycheck_zc('id_nonresiproxy3','id_nonresidents3')"/></td> 
						<td><html:text property="id_nonresiproxy4" styleId ="idd31" size="15" onkeyup="mycheck_zc('id_nonresiproxy4','id_nonresidents4')"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td rowspan="7">发现<p/>问题</td>
						<td>合计</td>
						<td><html:text property="id_questotal1" styleId ="ide0" size="15" styleClass="tt" /></td> 
						<td><html:text property="id_questotal2" styleId ="ide1" size="15" styleClass="tt" /></td> 
						<td><html:text property="id_questotal3" styleId ="ide2" size="15" styleClass="tt" /></td> 
						<td><html:text property="id_questotal4" styleId ="ide3" size="15" styleClass="tt" /></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>匿名、假名&nbsp;&nbsp;</td>
						<td><html:text property="id_anonymous1" styleId ="idf0" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_anonymous2" styleId ="idf1" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_anonymous3" styleId ="idf2" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_anonymous4" styleId ="idf3" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>证件造假&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><html:text property="id_falsecard1" styleId ="idg0" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_falsecard2" styleId ="idg1" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_falsecard3" styleId ="idg2" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_falsecard4" styleId ="idg3" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>证件失效&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><html:text property="id_failurecard1" styleId ="idh0" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_failurecard2" styleId ="idh1" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_failurecard3" styleId ="idh2" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_failurecard4" styleId ="idh3" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>利用他人证件</td>
						<td><html:text property="id_otherscard1" styleId ="idi0" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_otherscard2" styleId ="idi1" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_otherscard3" styleId ="idi2" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_otherscard4" styleId ="idi3" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>犯罪嫌疑人&nbsp;&nbsp;</td>
						<td><html:text property="id_suspects1" styleId ="idj0" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_suspects2" styleId ="idj1" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_suspects3" styleId ="idj2" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_suspects4" styleId ="idj3" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td>其他情形&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><html:text property="id_othercase1" styleId ="idk0" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_othercase2" styleId ="idk1" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_othercase3" styleId ="idk2" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
						<td><html:text property="id_othercase4" styleId ="idk3" size="15" onkeyup="myChange(this,'0');validate_id(this)"/></td> 
					</tr>
					<tr align="center" valign="middle">
						<td colspan="3">合计</td>
						<td><html:text property="all_total1" styleId ="total0" size="15" styleClass="tt" /></td> 
						<td><html:text property="all_total2" styleId ="total1" size="15" styleClass="tt" /></td> 
						<td><html:text property="all_total3" styleId ="total2" size="15" styleClass="tt" /></td> 
						<td><html:text property="all_total4" styleId ="total3" size="15" styleClass="tt" /></td> 
					</tr>
				</table>
				</div>
			</td></tr>
			<tr></tr>
			</table>
			</div>
			</div>
		</html:form>
		</div>
	</body>
</html>