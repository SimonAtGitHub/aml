<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
				<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script language="JavaScript" src="../../js/jquery-1.2.3.pack.js"></script>
		<script language="JavaScript">
			<!--
			function dosubmit(theUrl){
			
			    //add lixx 2010.11.2
			    var validatefale = validate4();
			    if(!validatefale){
			       return false;
			    }
			    //end add
			
				var errMsg = myValidate2();
				if(!errMsg){
			        alert("存在不规范数据!");
			        return false; 
			    }
			   document.forms[0].action=theUrl;
			   document.forms[0].submit();
			}
			//new Frame
			function   myValidate2()   
		    {     
		    	var flag=true;
		    	$.each( [0,1], function(i, n){
		    		for (j = 1; j <= 4; j++)
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
						}
		    			str=mark+i;//和
						str1=str+"1";
						if($("#"+str1).val().length>0 && $("#"+str).val().length<=0){
							$("#"+str).css("background-color","silver");
	  						$("#"+str1).css("background-color","silver");
	  						flag=false;
						}else if($("#"+str1).val().length>0 && $("#"+str).val().length>0){//都有数据才判断大小
							if(mark=="a" || mark=="c"){//份数
							   if(parseInt($("#"+str).val())<parseInt($("#"+str1).val())){
									$("#"+str).css("background-color","silver");
		  							$("#"+str1).css("background-color","silver");
		  							flag=false;
								}
							}else if (mark=="b" || mark=="d"){//金额
								if(parseFloat($("#"+str).val())<parseFloat($("#"+str1).val())){
									$("#"+str).css("background-color","silver");
		  							$("#"+str1).css("background-color","silver");
		  							flag=false;
								}
							}
						}
		    		}
				}); 
				return flag;
		    }
			//old Frame
			function   myValidate()   
		    {     
		    	var flag=true;
		    	$.each( [0,1], function(i, n){
		    		for (j = 1; j <= 2; j++)
					{
						var mark="";
						switch (j) {
						   case 1 :
						       mark="a";
						       break;
						   case 2 :
						       mark="b";
						       break;  
						}
		    			str=mark+i;//和
						str1=str+"1";
						if($("#"+str1).val().length>0 && $("#"+str).val().length<=0){
							$("#"+str).css("background-color","silver");
	  						$("#"+str1).css("background-color","silver");
	  						flag=false;
						}else if($("#"+str1).val().length>0 && $("#"+str).val().length>0){//都有数据才判断大小
							strs=$("#"+str).val().split("/");
							strs1=$("#"+str1).val().split("/");
							if(parseInt(strs[0])<parseInt(strs1[0])){
								$("#"+str).css("background-color","silver");
		  						$("#"+str1).css("background-color","silver");
		  						flag=false;
							}else if(parseFloat(strs[1])<parseFloat(strs1[1])){
								$("#"+str).css("background-color","silver");
		  						$("#"+str1).css("background-color","silver");
		  						flag=false;
							}
						}
		    		}
				}); 
				return flag;
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
		    function   init(obj)   
		    {    
		    <%if(request.getAttribute("editflag").equals("edit") || request.getAttribute("editflag").equals("add")){%>
		    	str=myTrim(obj.value);
		          if(str.length==0){
		          	obj.value="/";
		          } 
		    <%}%>
		    }
		    
		    //new Frame
		    function myChange2(obj,type)
		    {
		    <%if(!request.getAttribute("editflag").equals("edit") && !request.getAttribute("editflag").equals("add")){%>
		    	return;
		    <%}%>
		    	str=myTrim(obj.value);
		    	if(type=='1'){//份数
		    		if(!volidate1(str)) return;
		    	}else if(type=='2'){//金额
		    		str=volidate2(str);
		    		if(str=="-1"){
		    			obj.focus();
		    			return;
		    		}
		    	}
		    	obj.value=str;
		    }
		    //old Frame
		    function myChange(obj)
		    {
		    <%if(!request.getAttribute("editflag").equals("edit") && !request.getAttribute("editflag").equals("add")){%>
		    	return;
		    <%}%>
		    	str=myTrim(obj.value);
		    	if(str=="/"){
		    		obj.value="";
		    	}else{
		    		strs=str.split("/");
		    		if(strs.length>2){
		    			alert("请输入正确的数据!");
		    			obj.focus();
		    			return;
		    		}
		    		strs[0]=myTrim(strs[0]);
		    		strs[1]=myTrim(strs[1]);
		    		if(strs[0].length==0){
		    			alert("请输入正确的份数!");
		    			obj.focus();
		    			return;
		    		}else if(strs[1].length==0){
		    			alert("请输入正确的金额!");
		    			obj.focus();
		    			return;		    		
		    		}else if(volidate1(strs[0])){
		    			strs[1]=volidate2(strs[1]);
		    			if(strs[1]=="-1"){
		    				obj.focus();
		    				return;
		    			}
		    		}else{
		    			alert("请输入正确的份数!");
		    			obj.focus();
		    			return;
		    		}
		    		obj.value=strs[0]+"/"+strs[1];
		    	}
		    }
		    function volidate1(str){//判断整数
				if(str.match(/\D/)==null){
					return true;
				}else{
					alert("请输入正确的份数!");
					obj.focus();
					return false;
				}
		    }
		    function volidate2(str){//判断金额
		    	strRef = "1234567890.";
		    	for (i=0;i<str.length;i++) {
		    		tempChar=str.substring(i,i+1);
		    		if(strRef.indexOf(tempChar,0)==-1){
		    			alert("金额格式不规范!");
		    			str= "-1";
		    		}
				}
	    		tempLen=str.indexOf(".");
	    		if(tempLen!=-1){
	    			strLen=str.substring(tempLen+1,str.length);
	    			if(strLen.length>2){
	    				alert("金额格式不规范!");
	    				str="-1";
	    			}else if(myTrim(strLen).length==0){
	    				str=str.substring(0,tempLen);
	    			}
	    		}
	    		return str;
		    }
			// -->
			
	//add by lixx  2010.11.1
	function validate4(){
	     var errMsg1 = "";
	     var validateflag = true;
	     if (getLength(document.forms[0].cp_reportNum3.value)==0 || getLength(document.forms[0].id_reportNum3.value)==0 ||
	         getLength(document.forms[0].cp_reportAmt3.value)==0 || getLength(document.forms[0].id_reportAmt3.value)==0) {
		     errMsg1+= "人民币、外币重点可疑交易报告份数、金额不能为空！\n";
	     }else{
		     if(!checkNum(document.forms[0].cp_reportNum3.value) || !checkNum(document.forms[0].id_reportNum3.value)){
		        errMsg1+= "人民币、外币重点可疑交易报告份数必须是数字！\n";
		     }
		     if(!checkPrice(document.forms[0].cp_reportAmt3.value) || !checkPrice(document.forms[0].id_reportAmt3.value)){
		        errMsg1+= "人民币、外币重点可疑交易报告金额必须符合小数点后两位的格式（如：0.00）！\n";
		     }
		 }
		 if(errMsg1 != ""){
		    alert(errMsg1);
		    validateflag = false;
		 }
		 return validateflag;
	}
	//end add		
			
	</script>
	</HEAD>
	<body leftmargin="0" topmargin="0">
	<html:form action="/identity/t07_user_identityAdd_do.do"method="post">
		
		<div class="conditions">
			   
				<div class="cond_t">
						<span> 金融机构可疑交易报告统计表
						</span>
					 <span class="buttons">
					<%if(request.getAttribute("editflag").equals("edit") || request.getAttribute("editflag").equals("add")){ %>
					<a href="#" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=0");'><img src="../../images/<%=session.getAttribute("style") %>/b_draft.png" />草 稿</a>
					<a href="#" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=1");'  ><img src="../../images/<%=session.getAttribute("style") %>/b_complete.png" />完 成</a>
					<%}else{ %>
					<!-- <a href="#" onclick='dosubmit("gett07_user_identity_xls.do");'> -->
					<a href="#" onclick="dosubmit('exportT07_user_identitylist.do');">
					<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
					<%} %>
					<a href="#" onclick="history.back();"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					  </span>
					 </div>
			
  <html:errors />
			<input type="hidden" name="editflag" value='<%=request.getAttribute("editflag")%>'>
			<input type="hidden" name="identitykey" value='<%=request.getAttribute("identitykey")%>'>
			<input type="hidden" name="identitytype" value="4">
			<html:hidden property="organkey"/>
			 <div class="cond_c3">
         <table border="0" cellspacing="3" cellpadding="0">
			<table border="0" cellspacing="3" cellpadding="0">
		    <tr><td COLSPAN=2  align=center><h3>金融机构可疑交易报告统计表</h3></td></tr>
			<tr><td  align=left>&nbsp;&nbsp;填报单位：<html:text property="organName" /></td>
				<td ><html:text property="startyear" size="10" />年<html:text property="startseason" size="5" />季度&nbsp;&nbsp;</td>
				
			</tr>
			
			<tr>
			   <td COLSPAN=2 valign=top>
			     <div class="cond_t2"><span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />向当地人民银行报送</strong></span></div>
			      <div class="cond_c2" style="margin:0">
			     <table border="0" cellpadding="0" cellspacing="0">
			         <tr>
					   
					   <td align="right" width="20%"> 人民币重点可疑交易报告份数：</td>
					   <td align="left" width="10%"><html:text property="cp_reportNum3" styleId ="a2" size="15" maxlength="6" /></td>
					   <td align="right" width="20%">金额(万元)：</td>
					   <td align="left"><html:text property="cp_reportAmt3" onblur="setNumber(this,2)" styleId ="b2" size="15" maxlength="11"/></td>
					</tr>
					<tr>
					   <td align="right">外币重点可疑交易报告份数：</td>
					   <td align="left"><html:text property="id_reportNum3"  styleId ="c2" size="15" maxlength="6"/></td>
					   <td align="right">金额(万美元)：</td>
					   <td align="left"><html:text property="id_reportAmt3" onblur="setNumber(this,2)" styleId ="d2" size="15" maxlength="11"/></td>
					</tr>
				  </table>
			  </div>
		 <div class="list2 listnew">
			<table border="0" cellspacing="1" cellpadding="0">
			  <tr>
				<th width="30">&nbsp;</th>
				<th colspan="4">当期可疑交易报告</th>
				<th colspan="5">其中向当地公安机关报告</th>
			  </tr>
			  <tr>
					<td class="st03">交<br/>
				  易<br/>
				  类<br/>
				  型</td>
				  <td class="st03">单位可疑交易报告(份数)</td>
				<td class="st03">单位可疑交易报告(金额)(人民币万元/外汇万美元)</td>
				<td class="st03">个人可疑交易报告(份数)</td>
				<td class="st03">个人可疑交易报告(金额)(人民币万元/外汇万美元)</td>
				<td class="st03">单位可疑交易报告(份数)</td>
				<td class="st03">单位可疑交易报告(金额)(人民币万元/外汇万美元)</td>
				<td class="st03">个人可疑交易报告(份数)</td>
				<td class="st03">个人可疑交易报告(金额)(人民币万元/外汇万美元)</td>
				<td class="st03">公安机关反馈情况</td>
				</tr>
			    <tr>
				<td class="st03">人<br/>
				  民<br/>
				  币<br/>
				  可<br/>
				  疑<br/>
				  交<br/>
				  易</td>
				<td><html:text property="cp_reportNum1" styleId ="a0" size="6" maxlength="6" /></td>
				<td><html:text property="cp_reportAmt1" styleId ="b0" size="11" maxlength="11" /></td>
				<td><html:text property="id_reportNum1" styleId ="c0" size="6" maxlength="6" /></td>
				<td><html:text property="id_reportAmt1" styleId ="d0" size="11" maxlength="11" /></td>
				<td><html:text property="cpl_reportNum1" styleId ="a01" size="6" maxlength="6" onblur="myChange2(this,'1')"/></td>
				<td><html:text property="cpl_reportAmt1" styleId ="b01" size="11" maxlength="11" onblur="myChange2(this,'2')"/></td>
				<td><html:text property="idl_reportNum1" styleId ="c01" size="6" maxlength="6" onblur="myChange2(this,'1')"/></td>
				<td><html:text property="idl_reportAmt1" styleId ="d01" size="11" maxlength="11" onblur="myChange2(this,'2')"/></td>
				<td><html:text property="des1" size="20"/></td>
			</tr>
			 <tr>
				<td class="st03">外<br/>
				  汇<br/>
				  可<br/>
				  疑<br/>
				  交<br/>
				  易</td>
				<td><html:text property="cp_reportNum2" styleId ="a1" size="6" maxlength="6" /></td>
				<td><html:text property="cp_reportAmt2" styleId ="b1" size="11" maxlength="11" /></td>
				<td><html:text property="id_reportNum2" styleId ="c1" size="6" maxlength="6" /></td>
				<td><html:text property="id_reportAmt2" styleId ="d1" size="11" maxlength="11" /></td>
				<td><html:text property="cpl_reportNum2" styleId ="a11" size="6" maxlength="6" onblur="myChange2(this,'1')"/></td>
				<td><html:text property="cpl_reportAmt2" styleId ="b11" size="11" maxlength="11" onblur="myChange2(this,'2')"/></td>
				<td><html:text property="idl_reportNum2" styleId ="c11" size="6" maxlength="6" onblur="myChange2(this,'1')"/></td>
				<td><html:text property="idl_reportAmt2" styleId ="d11" size="11" maxlength="11" onblur="myChange2(this,'2')"/></td>
				<td><html:text property="des2" size="20"/></td>
			</tr>
				</table>
				</div>
			
			  <div class="cond_c">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr><td width=70>制表人:</td>
							<td><html:text property="updateUser" size="20" /></td>
							<td width=70>联系电话:</td>
							<td><html:text property="phone" size="20" /></td>
							<td width=70>填表日期:</td>
							<td><html:text property="updatetime_disp"  size="20"/></td>						
						</tr>
					</table>
			 </div>
		</td>
      </tr>
    </table>
   </div>
</html:form>
</body>
</html>