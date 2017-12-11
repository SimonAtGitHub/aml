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
		
		<SCRIPT LANGUAGE="JavaScript"><!--
			
			function dosubmit(theUrl){
			var errMsg = myValidate();
				 if(!errMsg){
			        alert("存在不规范数据!");
			        return false; 
			         }
			   document.forms[0].action=theUrl;
			   document.forms[0].submit();
			}
			function checkNum(obj){
				var str=myTrim(obj.value);
				if(str==null || str.length==0){
					obj.value=str;
					return true;
				}else{
					if(str.match(/\D/)==null){
						obj.value=Math.floor(str);
						return true;
					}else{
						alert("请输入正确的整数!");
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
		    	 idstr=obj.id;
		    	 mark=idstr.substr(0,1);
		         var str="",str1="",str2="",str3="";
		         val=0;
		         if(idstr.substr(1,3).length==1){//a0
		         	str=mark+"2";
		         	str1=mark+"3";
		         	str2=mark+"4";
		         	str3="2";
		         }
		         else{//a01]
		         	str=mark+"21";
		         	str1=mark+"31";
		         	str2=mark+"41";
		         	str3="21";
		         }
		         if($("#"+str1).val().length>0){
		         		val=val+parseInt($("#"+str1).val())
		         	}
		         	if($("#"+str2).val().length>0){
		         		val=val+parseInt($("#"+str2).val())
		         	}
		         	$("#"+str)[0].value=val;
		         	if(flag!="0"){
		         		myChange2(obj);
		         		myChange2(obj,str3);
		         	}
		    }
		    
		    function   myChange2(obj,tag)   
		    {     
		    	 if(tag=="0"){
			    	 if(!checkNum(obj)){
			    	 	obj.focus();
						obj.value=obj.value;
			    	 	return;
			    	 }
		    	 }
		    	 idstr=obj.id;
		         var str="";
		         val=0;
		         if(tag!="21" && tag!="2"){
		         	idstr2=idstr.substr(1,3);
		         }else{
		         	idstr2=tag;
		         }
		         totalid="total"+idstr2;
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
		    			str=mark+idstr2;
		    			if($("#"+str).val().length>0){
		    				val=val+parseInt($("#"+str).val())
		    			}
		    		}
		         	$("#"+totalid)[0].value=val;
		    }
		    
			function   myValidate()   
		    {     
		    	var flag=true;
		    	$.each( [0,1,2,3,4], function(i, n){
		    		for (j = 1; j <= 6; j++)
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
						   case 6 :
						       mark="f";
						       break;    
						}
		    			str=mark+i;
						str1=str+"1";//和
						if($("#"+str1).val().length<=0 && $("#"+str).val().length>0){
							$("#"+str).css("background-color","silver");
	  						$("#"+str1).css("background-color","silver");
	  						flag=false;
						}else if(parseInt($("#"+str1).val())<parseInt($("#"+str).val())){
	  						$("#"+str).css("background-color","silver");
	  						$("#"+str1).css("background-color","silver");
	  						flag=false;
	  					}else{
	  						$("#"+str).css("background-color","white");
	  						$("#"+str1).css("background-color","white");
	  					}
		    		}
				}); 
				if(!flag){
					return flag;
				}
				for (j = 1; j <= 6; j++)
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
						   case 6 :
						       mark="f";
						       break;    
						}
						str=mark+"0";
						str1=mark+"1";
						if($("#"+str).val().length<=0 && $("#"+str1).val().length>0){
	  						$("#"+str).css("background-color","silver");
	  						$("#"+str1).css("background-color","silver");
	  						flag=false;
	  					}else if(parseInt($("#"+str).val())<parseInt($("#"+str1).val())){
	  						$("#"+str).css("background-color","silver");
	  						$("#"+str1).css("background-color","silver");
	  						flag=false;
	  					}else{
	  						$("#"+str).css("background-color","white");
	  						$("#"+str1).css("background-color","white");
	  					}
	  					str3=str+"1";
	  					str4=str1+"1";
	  					if($("#"+str3).val().length<=0 && $("#"+str4).val().length>0){
	  						$("#"+str3).css("background-color","silver");
	  						$("#"+str4).css("background-color","silver");
	  						flag=false;
	  					}else if(parseInt($("#"+str3).val())<parseInt($("#"+str4).val())){
	  						$("#"+str3).css("background-color","silver");
	  						$("#"+str4).css("background-color","silver");
	  						flag=false;
	  					}else{
	  						$("#"+str3).css("background-color","white");
	  						$("#"+str4).css("background-color","white");
	  					}
				}
				return flag;
		    }
		    function  mycheck_zc(detail,total,flag)
		    {
                var deta=eval('document.forms[0].'+detail);
	            var sum=eval('document.forms[0].'+total);

                var detavalue=deta.value;
                var sumvalue=sum.value;
                if(detavalue.length>0 && sumvalue.length>0)
                {
                    if(parseInt(detavalue)>parseInt(sumvalue))
                    {
                    if(flag=='0')
                    alert("查实数不能大于总数！");
                    else if(flag=='1')
                    alert("涉及受益人数不能大于总数！");
                    else 
                    alert("证件更新数不能大于失效总数！");
                    deta.focus();
                    deta.value=deta.value;
                    return false;
                   }
                }
            }
			// 
		--></SCRIPT>
	</HEAD>
	<body class="mainbg">
		<div id="main">
		<html:form action="/identity/t07_user_identityAdd_do.do" method="post">
		 <div class="conditions">
			    <!-- title -->
				<div class="cond_t">
		
			
						<span> 客户身份统计-重新识别客户
		
						</span>
					
					 <span class="buttons">
					
					<%if(request.getAttribute("editflag").equals("edit") || request.getAttribute("editflag").equals("add")){ %>
					<a href="#" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=0");'> <img src="../../images/<%=session.getAttribute("style") %>/b_draft.png" />草 稿</a>
					<a href="#" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=1");'><img src="../../images/<%=session.getAttribute("style") %>/b_complete.png" />完 成</a>
					<%}else{ %>
					<!-- <a href="#" onclick='dosubmit("gett07_user_identity_xls.do");'> -->
					<a href="#" onclick="dosubmit('exportT07_user_identitylist.do');">
					<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />导出Excel</a>
					<%} %>
					<a href="#" onclick="history.back();"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
				</span>
			   </div>
			
			<html:errors />
			<input type="hidden" name="editflag" value="<%=request.getAttribute("editflag")%>">
			<input type="hidden" name="identitykey" value="<%=request.getAttribute("identitykey")%>">
			<input type="hidden" name="identitytype" value="2">
			<html:hidden property="organkey"/>
			 <div class="cond_c3">
             <table border="0" cellspacing="3" cellpadding="0">
     
			<tr><td COLSPAN=2  align=center class="big_tl"><h3>金融机构客户身份识别统计情况表</h3></td></tr>
			<tr><td COLSPAN=2  align=center class="big_tl"><h4>（重新识别客户）</h4></td></tr>
			<tr><td  align=left>&nbsp;&nbsp;填报单位:<html:text property="organName" styleClass="tt"/></td>
			<td align=right><html:text property="startyear" size="5" styleClass="tt"/>年<html:text property="startseason" size="5" styleClass="tt"/>季度&nbsp;&nbsp;</td></tr>
			<tr><td COLSPAN=2 align=right>单位  家&nbsp;&nbsp;</td></tr>
			<tr><td COLSPAN=2 valign=top>
			 <div class="list2 biglist">
				<table border="0" cellspacing="1" cellpadding="0">
					<tr align=center  ><td rowspan=2>重新识别原因</td>
						<td COLSPAN=2>对公客户</td>
						<td COLSPAN=3>对私客户</td>
					</tr>
					<tr align=center  ><td >总数</td>
						<td>涉及受益人的</td>
						<td>总数</td>
						<td>居民</td>
						<td>非居民</td>
					</tr>
					<tr align=center  ><td >变更重要信息</td>
						<td><html:text property="changeinfo1" styleId ="a01" size="15" onkeyup="myChange2(this,'0')" maxlength="15"/></td>
						<td><html:text property="changeinfo2" styleId ="a11" size="15" onkeyup="myChange2(this,'0');mycheck_zc('changeinfo2','changeinfo1','1')"/></td>
						<td><html:text property="changeinfo3" styleId ="a21" styleClass="tt" size="15"/></td>
						<td><html:text property="changeinfo4" styleId ="a31" size="15" onkeyup="myChange(this)"/></td>
						<td><html:text property="changeinfo5" styleId ="a41" size="15" onkeyup="myChange(this)"/></td>
					</tr>
					<tr align=center ><td >其中查实的</td>
						<td><html:text property="info_verified1" styleId ="a0" size="15" onkeyup="myChange2(this,'0');mycheck_zc('info_verified1','changeinfo1','0')" maxlength="15"/></td>
						<td><html:text property="info_verified2" styleId ="a1" size="15" onkeyup="myChange2(this,'0');mycheck_zc('info_verified2','changeinfo2','0');mycheck_zc('info_verified2','info_verified1','1')"/></td>
						<td><html:text property="info_verified3" styleId ="a2" styleClass="tt" size="15"/></td>
						<td><html:text property="info_verified4" styleId ="a3" size="15" onkeyup="myChange(this);mycheck_zc('info_verified4','changeinfo4','0')"/></td>
						<td><html:text property="info_verified5" styleId ="a4" size="15" onkeyup="myChange(this);mycheck_zc('info_verified5','changeinfo5','0')"/></td>
					</tr>
					<tr align=center  ><td >行为异常的</td>
						<td><html:text property="behavior1" styleId ="b01" size="15" onkeyup="myChange2(this,'0')" maxlength="15"/></td>
						<td><html:text property="behavior2" styleId ="b11" size="15" onkeyup="myChange2(this,'0');mycheck_zc('behavior2','behavior1','1')"/></td>
						<td><html:text property="behavior3" styleId ="b21" styleClass="tt" size="15"/></td>
						<td><html:text property="behavior4" styleId ="b31" size="15" onkeyup="myChange(this)"/></td>
						<td><html:text property="behavior5" styleId ="b41" size="15" onkeyup="myChange(this)"/></td>
					</tr>
					<tr align=center  ><td >其中查实的</td>
						<td><html:text property="beha_verified1" styleId ="b0" size="15" onkeyup="myChange2(this,'0');mycheck_zc('beha_verified1','behavior1','0')" maxlength="15"/></td>
						<td><html:text property="beha_verified2" styleId ="b1" size="15" onkeyup="myChange2(this,'0');mycheck_zc('beha_verified2','behavior2','0');mycheck_zc('beha_verified2','beha_verified1','1')"/></td>
						<td><html:text property="beha_verified3" styleId ="b2" styleClass="tt" size="15"/></td>
						<td><html:text property="beha_verified4" styleId ="b3" size="15" onkeyup="myChange(this);mycheck_zc('beha_verified4','behavior4','0')"/></td>
						<td><html:text property="beha_verified5" styleId ="b4" size="15" onkeyup="myChange(this);mycheck_zc('beha_verified5','behavior5','0')"/></td>
					</tr>
					<tr align=center  ><td >犯罪嫌疑人</td>
						<td><html:text property="suspects1" styleId ="c01" size="15" onkeyup="myChange2(this,'0')" maxlength="15"/></td>
						<td><html:text property="suspects2" styleId ="c11" size="15" onkeyup="myChange2(this,'0');mycheck_zc('suspects2','suspects1','1')"/></td>
						<td><html:text property="suspects3" styleId ="c21" styleClass="tt" size="15"/></td>
						<td><html:text property="suspects4" styleId ="c31" size="15" onkeyup="myChange(this)"/></td>
						<td><html:text property="suspects5" styleId ="c41" size="15" onkeyup="myChange(this)"/></td>
					</tr>
					<tr align=center  ><td >其中查实的</td>
						<td><html:text property="suspe_verified1" styleId ="c0" size="15" onkeyup="myChange2(this,'0');mycheck_zc('suspe_verified1','suspects1','0')" maxlength="15"/></td>
						<td><html:text property="suspe_verified2" styleId ="c1" size="15" onkeyup="myChange2(this,'0');mycheck_zc('suspe_verified2','suspects2','0');mycheck_zc('suspe_verified2','suspe_verified1','1')"/></td>
						<td><html:text property="suspe_verified3" styleId ="c2" styleClass="tt" size="15"/></td>
						<td><html:text property="suspe_verified4" styleId ="c3" size="15" onkeyup="myChange(this);mycheck_zc('suspe_verified4','suspects4','0')"/></td>
						<td><html:text property="suspe_verified5" styleId ="c4" size="15" onkeyup="myChange(this);mycheck_zc('suspe_verified5','suspects5','0')"/></td>
					</tr>
					<tr align=center ><td >涉及可疑交易</td>
						<td><html:text property="suspicious1" styleId ="d01" size="15" onkeyup="myChange2(this,'0')" maxlength="15"/></td>
						<td><html:text property="suspicious2" styleId ="d11" size="15" onkeyup="myChange2(this,'0');mycheck_zc('suspicious2','suspicious1','1')"/></td>
						<td><html:text property="suspicious3" styleId ="d21" styleClass="tt" size="15"/></td>
						<td><html:text property="suspicious4" styleId ="d31" size="15" onkeyup="myChange(this)"/></td>
						<td><html:text property="suspicious5" styleId ="d41" size="15" onkeyup="myChange(this)"/></td>
					</tr>
					<tr align=center  ><td >其中查实的</td>
						<td><html:text property="suspi_verified1" styleId ="d0" size="15" onkeyup="myChange2(this,'0');mycheck_zc('suspi_verified1','suspicious1','0')" maxlength="15"/></td>
						<td><html:text property="suspi_verified2" styleId ="d1" size="15" onkeyup="myChange2(this,'0');mycheck_zc('suspi_verified2','suspicious2','0');mycheck_zc('suspi_verified2','suspi_verified1','1')"/></td>
						<td><html:text property="suspi_verified3" styleId ="d2" styleClass="tt" size="15"/></td>
						<td><html:text property="suspi_verified4" styleId ="d3" size="15" onkeyup="myChange(this);mycheck_zc('suspi_verified4','suspicious4','0')"/></td>
						<td><html:text property="suspi_verified5" styleId ="d4" size="15" onkeyup="myChange(this);mycheck_zc('suspi_verified5','suspicious5','0')"/></td>
					</tr>
					<tr align=center ><td >其他情形</td>
						<td><html:text property="othercase1" styleId ="e01" size="15" onkeyup="myChange2(this,'0')" maxlength="15"/></td>
						<td><html:text property="othercase2" styleId ="e11" size="15" onkeyup="myChange2(this,'0');mycheck_zc('othercase2','othercase1','1')"/></td>
						<td><html:text property="othercase3" styleId ="e21" styleClass="tt" size="15"/></td>
						<td><html:text property="othercase4" styleId ="e31" size="15" onkeyup="myChange(this)"/></td>
						<td><html:text property="othercase5" styleId ="e41" size="15" onkeyup="myChange(this)"/></td>
					</tr>
					<tr align=center  ><td >其中查实的</td>
						<td><html:text property="other_verified1" styleId ="e0" size="15" onkeyup="myChange2(this,'0');mycheck_zc('other_verified1','othercase1','0')" maxlength="15"/></td>
						<td><html:text property="other_verified2" styleId ="e1" size="15" onkeyup="myChange2(this,'0');mycheck_zc('other_verified2','othercase2','0');mycheck_zc('other_verified2','other_verified1','1')"/></td>
						<td><html:text property="other_verified3" styleId ="e2" styleClass="tt" size="15"/></td>
						<td><html:text property="other_verified4" styleId ="e3" size="15" onkeyup="myChange(this);mycheck_zc('other_verified4','othercase4','0')"/></td>
						<td><html:text property="other_verified5" styleId ="e4" size="15" onkeyup="myChange(this);mycheck_zc('other_verified5','othercase5','0')"/></td>
					</tr>
					<tr align=center  ><td >合计</td>
						<td><html:text property="total1" styleId ="total01" styleClass="tt" size="15" maxlength="15"/></td>
						<td><html:text property="total2" styleId ="total11" styleClass="tt" size="15"/></td>
						<td><html:text property="total3" styleId ="total21" styleClass="tt" size="15"/></td>
						<td><html:text property="total4" styleId ="total31" styleClass="tt" size="15"/></td>
						<td><html:text property="total5" styleId ="total41" styleClass="tt" size="15"/></td>
					</tr>
					<tr align=center ><td >查实合计数</td>
						<td><html:text property="total_verified1" styleId ="total0" styleClass="tt" size="15" maxlength="15"/></td>
						<td><html:text property="total_verified2" styleId ="total1" styleClass="tt" size="15"/></td>
						<td><html:text property="total_verified3" styleId ="total2" styleClass="tt" size="15"/></td>
						<td><html:text property="total_verified4" styleId ="total3" styleClass="tt" size="15"/></td>
						<td><html:text property="total_verified5" styleId ="total4" styleClass="tt" size="15"/></td>
					</tr>
					<tr align=center  ><td >留存证件失效</td>
						<td><html:text property="failurecard1" styleId ="f01" size="15" onkeyup="myChange2(this,'0')" maxlength="15"/></td>
						<td><html:text property="failurecard2" styleId ="f11" size="15" onkeyup="myChange2(this,'0');mycheck_zc('failurecard2','failurecard1','1')"/></td>
						<td><html:text property="failurecard3" styleId ="f21" styleClass="tt" size="15"/></td>
						<td><html:text property="failurecard4" styleId ="f31" size="15" onkeyup="myChange(this,'0')"/></td>
						<td><html:text property="failurecard5" styleId ="f41" size="15" onkeyup="myChange(this,'0')"/></td>
					</tr>
					<tr align=center ><td >已更新数</td>
						<td><html:text property="updatecard1" styleId ="f0" size="15" onkeyup="myChange2(this,'0');mycheck_zc('updatecard1','failurecard1','2')" maxlength="15"/></td>
						<td><html:text property="updatecard2" styleId ="f1" size="15" onkeyup="myChange2(this,'0');mycheck_zc('updatecard2','failurecard2','2');mycheck_zc('updatecard2','updatecard1','1')"/></td>
						<td><html:text property="updatecard3" styleId ="f2" styleClass="tt" size="15"/></td>
						<td><html:text property="updatecard4" styleId ="f3" size="15" onkeyup="myChange(this,'0');mycheck_zc('updatecard4','failurecard4','2')"/></td>
						<td><html:text property="updatecard5" styleId ="f4" size="15" onkeyup="myChange(this,'0');mycheck_zc('updatecard5','failurecard5','2')"/></td>
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