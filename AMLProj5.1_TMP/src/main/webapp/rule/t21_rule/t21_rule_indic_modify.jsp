<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		

<script language="JavaScript">

function _Click(obj){
  
    var k= obj.parentElement.parentElement.rowIndex-1;
	var gs_des = document.forms[0].gs_des.value;
	var hid_gs_des = document.forms[0].hid_gs_des.value;
	var flag=getFlag(hid_gs_des);
	 //alert("falg:"+flag);
  if(flag=="1"){
    var length=document.forms[0].selectedIndic.length;
    var indickey,min,max,type,indicname,valnum;
 
    if(length>=1){
	 indicname = document.forms[0].selectedIndic[k].value+"(第"+document.forms[0].valnum[k].value+"值)";
	 indickey = document.forms[0].indickey[k].value;
	 type = document.forms[0].valtype[k].value;
	 valnum = document.forms[0].valnum[k].value;
	 min = document.forms[0].valparamin[k].value;
	  if(type=="BETWEEN")
	 max = document.forms[0].valparamax[k].value;
	 
     }else{
       indicname = document.forms[0].selectedIndic.value;
	 indickey = document.forms[0].indickey.value;
	 type = document.getElementById("valtype").value;
	 valnum = document.getElementById("valnum").value;
	 min = document.getElementById("valparamin").value;
	  if(type=="BETWEEN")
	 max = document.getElementById("valparamax").value;

     }
    // alert("check:"+obj.checked);
    if (obj.checked) 
    {
       if(type=="BETWEEN"){
         if(max==""){
           alert("请输入最大值");
           obj.checked=false;
           return;
         }
       }
       if(min==""){
          alert("请输入最小值");
           obj.checked=false;
          return;
       }
		//出现冗余
		if(gs_des.indexOf(indicname)>= 0)
		{
			//alert("replicate!");
			isReplace(obj,'1')
		}
		else
		{ 
		   hid_gs_des=hid_gs_des+indickey+","+valnum;
			if (type == 'BETWEEN')
			{
			indicname=" "+min+"=<"+indicname+"<="+max;
			
			}
			else
			indicname = " "+indicname  + type + min;
			
				gs_des = gs_des +indicname;
		}
		
	}
	else
	{
		//alert("unchecked success!");
	    //gs_des = gs_des.substring(0, gs_des.indexOf(indicname));
	}
	document.forms[0].gs_des.value = gs_des;
	document.forms[0].hid_gs_des.value = hid_gs_des;
	}else{
	  if (obj.checked) 
	  alert("前面必须有链接符号");
	}
    
}

function getFlag(hid_gs_des){
	var flag="0";
	if(hid_gs_des!=""){
	//alert("hid_gs_des.length:"+hid_gs_des.length);
	//alert("hid_gs_des.lastIndexOf(AND):"+hid_gs_des.lastIndexOf("AND"));
	  if(hid_gs_des.lastIndexOf("AND")==hid_gs_des.length-3){
	    flag="1";
	  }
	   if(hid_gs_des.lastIndexOf("OR")==hid_gs_des.length-2){
	    flag="1";
	  }
	   if(hid_gs_des.lastIndexOf("(")==hid_gs_des.length-1){
	    flag="1";
	  }  
	}else{
	 flag="1";
	}
	return flag;
}



function dosubmit(theUrl) {
		document.forms[0].action = theUrl;
		document.forms[0].submit();
}
	
function RegExp(item) {
		var val = document.forms[0].gs_des.value;
	    var hid_gs_des = document.forms[0].hid_gs_des.value;
		var indix1=val.lastIndex
		if (item != 'backspace'){
		  var flag=getFlag(hid_gs_des);	 
		  if(flag=="0"){  
			val += ' ' + item;
			hid_gs_des=hid_gs_des+item;
		   }else{
		     alert("前面已经有链接符号");
		   }
		  
		}
		else
		{	var mm = val.lastIndexOf('AND');
			var ll = val.indexOf('OR');
			var index=hid_gs_des.lastIndexOf('AND');
			var index1=hid_gs_des.lastIndexOf('OR');
			if(mm>ll){
				val = val.substring(0, mm);
				hid_gs_des=hid_gs_des.substring(0, index);
				}
			else{ 
			    if(mm<ll){
				val = val.substring(0, ll);
                hid_gs_des=hid_gs_des.substring(0, index1);
                }else{
                  val="";
                  hid_gs_des="";
                }
             }
		}
		 	document.forms[0].gs_des.value = val;
		    document.forms[0].hid_gs_des.value = hid_gs_des;
		
		
	}
	function RegExp1(item) {
		var val = document.forms[0].gs_des.value;
	    var hid_gs_des = document.forms[0].hid_gs_des.value;
	    var index=hid_gs_des.lastIndexOf(')');
	
	    if(index==hid_gs_des.length-1&&val!=""){
	      alert("前面不能是链接符号)");
	      return;
	    }
	     var flag=getFlag(hid_gs_des);	 
		  if(flag=="1"||val==""){ 
	        val += ' ' + item;
			hid_gs_des=hid_gs_des+item;
		 
		 	document.forms[0].gs_des.value = val;
		    document.forms[0].hid_gs_des.value = hid_gs_des;
		   }else{
		     alert("前面必须是链接符号");
		   }
		
		
	}




function addrow(){
         var tab=document.getElementById("tableid");
			var n=tab.rows.length;
           var indickey=document.forms[0].hid_indickey.value;
           var hid_indicname= document.forms[0].hid_indicname.value
           var nexvalnum="1";
           var flag="1";  
          // alert("n:"+n);  
       if(n!=1){
          var obj=document.forms[0].indickey;
          var length=obj.length;
          //alert(obj+length);
          if(length>=1){
           for(k=0;k<length;k++){
             var selindickey= document.forms[0].indickey[k].value;
              var selvalnum= document.forms[0].valnum[k].value;
             if(selindickey==indickey){
              // flag="0";
              // break;
              nexvalnum=parseInt(selvalnum)+1;
             }
           }
          }else{
               var selindickey= document.forms[0].indickey.value;
               var selvalnum= document.forms[0].valnum.value;
             if(selindickey==indickey){
               //flag="0";
                nexvalnum=parseInt(selvalnum)+1;
              }
          }
       }
       if(flag=="1"){
	       
			var del="delRow(this)"			
			var newRow = tab.insertRow(); 	
			
				var cell0 = newRow.insertCell();
			cell0.innerHTML="<input type=\"checkbox\" name=\"selectedIndic\" id=\"selectedIndic\" value=\""+hid_indicname+"\"  onClick=\"_Click(this)\"/>";
			
				
		   	var cell1 = newRow.insertCell();
		   	var newval=indickey+"<input type=\"hidden\"  name=\"indickey\" id=\"indickey\" value=\""+indickey+"\" />";
			cell1.innerHTML=newval;
			
		   	var cell2 = newRow.insertCell();
			cell2.innerHTML=document.forms[0].hid_indicname.value;	
			
			 var cell3 = newRow.insertCell();
			 var indicattrvalue=document.forms[0].hid_indic_attr.value;	
			 var indic_attr=indicattrvalue+"<input type=\"hidden\"  name=\"indic_attr\" value=\""+indicattrvalue+"\" />";
			cell3.innerHTML=indic_attr;	
			
			var cell4 = newRow.insertCell();
			//cell4.style.nowrap="true";
			//cell4.innerHTML="<select name=\"valtype\" id=\"valtype\"  onchange=\"isShow(this)\"><option value=\"<\">小于</option><option value=\"<=\">小于等于</option><option value=\"BETWEEN\">区间</option></select>"
			 cell4.innerHTML='<%=request.getAttribute("setAttribute")%>'
			  //document.getElementById("tabkey").id = "valtype" + (n-1);
		
			var cell5= newRow.insertCell();
			
			cell5.innerHTML="<input type=\"text\" size=\"10\" name=\"valparamin\" id=\"valparamin\" onBlur=\"isReplace(this,'1')\" /> "
			             +"<span id=\"valmaxid\"  >-<input type=\"text\" size=\"10\" name=\"valparamax\" id=\"valparamax\"  onBlur=\"isReplace(this,'2')\"/></span>";
			cell5.style.nowrap="true";
			
				var cell6 = newRow.insertCell();
			
			cell6.innerHTML="<input type=\"text\" size=\"10\" name=\"valnum\" id=\"valnum\" value=\""+nexvalnum+"\" /> ";
			// cell6.innerHTML='<%=request.getAttribute("setAttribute")%>'
			  
			
			var cell7 = newRow.insertCell();	
			var bule='<%=session.getAttribute("style")%>';
		
			var dp="<img src=\"../../images/"+bule+"/b_delete.png\" title=\"删除\" />"
			cell7.innerHTML="<a href='#' onclick='"+del+"' >"+dp+"</a>";
			
			//刷新样式
			//setdynamicListStyle();
			//setInputStyle();      
		}	
                
	   }
		
	    
     function delRow(obj) {//删除一行
        //var row = obj.parentElement.parentNode;
        //row.style.display = "none";
        var row = obj.parentElement.parentElement.rowIndex-1;
          var length=document.forms[0].indickey.length;
    var min,max;
   
     if(length>=1){
	 indicname = document.forms[0].selectedIndic[row].value;
	 indickey = document.forms[0].indickey[row].value;
	 // alert("indickey:"+indickey);
     }else{
       indicname = document.forms[0].selectedIndic.value;
	   indickey = document.forms[0].indickey.value;
	  // alert("indickey:"+indickey);
	 
     }
     var gs_des = document.forms[0].gs_des.value;
	 var hid_gs_des = document.forms[0].hid_gs_des.value;
        var index=gs_des.indexOf(indicname);
        var index1=hid_gs_des.indexOf(indickey);
       // alert(hid_gs_des+":"+indickey+":"+index1);
        if(index!=-1){
         document.forms[0].gs_des.value=gs_des.substring(0,index);
        }
         if(index1!=-1){
          document.forms[0].hid_gs_des.value=hid_gs_des.substring(0,index1);
        }
         var tab=document.getElementById("tableid");
         tab.deleteRow(row+1);
         
     }
     
    function isShow(obj) {
        var row = obj.parentElement.parentElement.rowIndex-1;
        var objtab=document.all.valmaxid;
          var length=document.forms[0].selectedIndic.length;
    var min,max;
    if(length>=1){
	 min = document.forms[0].valparamin[row].value;
	 max = document.forms[0].valparamax[row].value;
     }else{
      min = document.getElementById("valparamin").value;
	 max = document.getElementById("valparamax").value;
	
     }
        if(obj.value == "BETWEEN"){
           if(objtab.length>=1){
            var objtabkey =eval("document.all.valmaxid["+row+"]"); 
             objtabkey.style.display = "";  
            }else{
             objtab.style.display = ""; 
            }
            
       
           if(min==""){
           alert("请输入最小值");
          return;
          }
           if(max==""){
           alert("请输入最大值");
           return;
           }
           
        }else{
          if(objtab.length>=1){
            var objtabkey =eval("document.all.valmaxid["+row+"]"); 
             objtabkey.style.display = "none";
            }else{
             objtab.style.display = "none";
            }
             if(min==""){
              alert("请输入参数值");
             return;
            }
            if(length>=1){
	        document.forms[0].valparamax[row].value="";
           }else{
           document.getElementById("valparamax").value="";
           }
         
        }
      isReplace(obj,'1');  
     }
     
      function isShow1(obj) {
        var row = obj.parentElement.parentElement.rowIndex-1;
 
          var length=document.forms[0].selectedIndic.length;
    var min,max;
       var tabobj= document.getElementById("tableid");
       var rowobj=tabobj.rows(row+1);
         var cell5 = rowobj.cells(5);
			var htmval=cell5.innerHTML;
		
        if(obj.value == "BETWEEN"){    
			htmval=htmval+"-<input type=\"text\" size=\"10\" name=\"valparamax\" id=\"valparamax\"  onBlur=\"isReplace(this,'2')\"/>";
            cell5.innerHTML=htmval;
            
            // rowobj.deleteCell(5);
            //  cell5= rowobj.insertCell();
			//cell5.innerHTML=htmval;
		
             if(length>=1){
	              min = document.forms[0].valparamin[row].value;
	               max = document.forms[0].valparamax[row].value;
               }else{
              min = document.getElementById("valparamin").value;
	           max = document.getElementById("valparamax").value;
	          } 
           if(min==""){
           alert("请输入最小值");
          return;
          }
           if(max==""){
           alert("请输入最大值");
           return;
           }
           
        }else{
           if(htmval.indexOf("-")!=-1){
             htmval=htmval.substring(0,htmval);
              cell5.innerHTML=htmval;
           }
             if(length>=1){
	              min = document.forms[0].valparamin[row].value;   
               }else{
              min = document.getElementById("valparamin").value;
	          } 
             if(min==""){
              alert("请输入参数值");
             return;
            }
            if(length>=1){
	        document.forms[0].valparamax[k].value="";
           }else{
           document.getElementById("valparamax").value="";
           }
         
        }
      isReplace(obj,'1');  
     }
     
     
     
     
   function isReplace(obj,flag){
     var k 
     if(flag=="1"){
     k= obj.parentElement.parentElement.rowIndex-1;
     }else{
       k= obj.parentElement.parentElement.parentElement.rowIndex-1;
     }
      var length=document.forms[0].selectedIndic.length;
    var indickey,min,max,type,indicname;
    // alert("length"+length+"k:"+k);
    if(length>=1){
	 indicname = document.forms[0].selectedIndic[k].value;
	 indickey = document.forms[0].indickey[k].value;
	  type = document.forms[0].valtype[k].value;
	 min = document.forms[0].valparamin[k].value;
	 if(type=="BETWEEN")
	 max = document.forms[0].valparamax[k].value;
     
     }else{
       indicname = document.forms[0].selectedIndic.value;
	 indickey = document.forms[0].indickey.value;
	 type = document.getElementById("valtype").value;
	 min = document.getElementById("valparamin").value;
	  if(type=="BETWEEN")
	 max = document.getElementById("valparamax").value;
	 
     }
	
	  	var val = document.forms[0].gs_des.value;
	  var  index=val.indexOf(indicname);
	 // alert(index);
	  if(index!=-1){
	     var str=val.substring(index);   
	     var prestr=val.substring(0,index);  
	     //后窜
	        var index1=str.indexOf("AND");
	        var index2=str.indexOf("OR");
	        var index3=str.indexOf(")");
	        var relindex;
	        if(index1<index2){
	         relindex=index1; 
	        }else{
	         relindex=index2; 
	        }
	        if(relindex>index3){
	         relindex=index3;
	        }
	        if(relindex=="-1"){
	         relindex=val.length;
	        }
	        
	     //前窜
	         index1=prestr.lastIndexOf("AND");
	         index2=prestr.lastIndexOf("OR");
	         index3=prestr.lastIndexOf("(");
	        var prerelindex;
	        if(index1>index2){
	         prerelindex=index1;
	        }else{
	         prerelindex=index2;
	        }
	        if(prerelindex<index3){
	         prerelindex=index3;
	        }
	        if(prerelindex=="-1"){
	         prerelindex=0;
	        }else{
	          if(prerelindex==index1) prerelindex=prerelindex+3;
	          if(prerelindex==index2) prerelindex=prerelindex+2;
	          if(prerelindex==index3) prerelindex=prerelindex+1;
	          }
	         
          var oldval=val.substr(prerelindex,relindex);
        
          var newval;
			if (type == 'BETWEEN')
			{
			newval=" "+min+"=<"+indicname+"<="+max;
			}
			else
			newval = indicname + ' ' + type + '' + min;
			
		
			val=val.replace(oldval,newval);
		
			 document.forms[0].gs_des.value=val;
	   
	  }
      
   }
</script>
<style type="text/css">
#valmaxid div 
{
   float:left;
    white-space:nowrap;
}

</style>

</head>
<body class="mainbg">
<div id="main">
	<html:form method="post" action="/t21_rule/modify_rule_indic.do">
	<input type="hidden" name="hid_indickey"/>
	<input type="hidden" name="hid_indicname"/>
	<input type="hidden" name="hid_indic_attr"/>
	<input type="hidden" name="hid_gs_des" value="<bean:write name="t21_rule" property="gs_val"/>"/>
		<div class="conditions">
			<div class="cond_t">
						<span> 指标信息 </span>
						<span class="buttons"> 
						<a href="#" title="添加" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_indic/indic_search.do?rulekey=<%=(String)request.getAttribute("rulekey")%>&dispatcher=checkbox&newsearchflag=1',width:650,height:420,title:'添加',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/<%=session.getAttribute("style")%>/b_add2.png" />添加</a>
						<%--<a href="#" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_indic/indic_add.do?rulekey=<%=(String)request.getAttribute("rulekey")%>',width:700,height:430,title:'增加',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />新增</a>
						--%></span>
			</div>
			<html:errors />
			<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1" id="tableid">
						<TR>
							 <th>选择 </th>
 							 <th>指标编号</th>     
  							 <th>指标名称</th>    
  							 <th>指标类型</th>
 							 <th>比较符</th>    
  							 <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;参数值&nbsp;&nbsp;&nbsp;&nbsp;</th> 
  							  <th>值序列</th>   
 							 <th>操作</th>    

						</TR>
						
						<logic:iterate id="indic" name="t21_rule_indic_List" indexId="i"
							type="com.ist.aml.rule.dto.T21_rule">
							<TR>
								<TD height=22>
									<input type="checkbox" name="selectedIndic" id="selectedIndic"  checked="true" value="<bean:write name="indic" property="indicname" />"  onClick="_Click(this)"/>
								</TD>
								
								<TD>
									<bean:write name="indic" property="indickey" />
									<input type="hidden"  name="indickey" id="indickey" value="<bean:write name="indic" property="indickey" />"/>
								</TD>
								<TD>
									<bean:write name="indic" property="indicname" />
								</TD>
								<TD>
									<bean:write name="indic" property="indic_attr"  />
									<input type="hidden"  name="indic_attr" id="indic_attr" value="<bean:write name="indic" property="indic_attr" />"/>
								</TD>
								<TD >
								<%  LinkedHashMap map=(LinkedHashMap)request.getAttribute("valtypeMap");
	                              Iterator iter=map.keySet().iterator();
	                              String typevalue=indic.getValtype();
							%>
									<select name="valtype"  onchange="isShow(this)">
									<% while(iter.hasNext()){
		                                   String key=(String)iter.next();
		                                      String value=(String)map.get(key);
	                                     %>
	                                    <option value="<%=key%>" <% if(key.equals(typevalue)){ %> selected <%} %>><%=value%></option>
						                <%  } %>
									</select>
								</TD>
								
								<TD  >
									<input type="text" name="valparamin" size="10" value="<bean:write name="indic" property="valparamin" />"/>
									<% if(typevalue.equals("BETWEEN")){ %>
									<span id="valmaxid"> 
									<%}else{ %>
									<span id="valmaxid" style="display:none"> 
									<%}%>
									-
									<input type="text" name="valparamax" size="10" value="<bean:write name="indic" property="valparamax" />"/>
									</sapn>
									
								</TD>
									<TD>
									<input type="text" name="valnum" size="10" value="<bean:write name="indic" property="valnum"  />"/>
								</TD>
								
								<TD>
								<!--  	<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/rule/t21_indic/t21_indic_modify.do?indickey=<bean:write name="indic" property="indickey" />')">
											<img src="../../images/<%=session.getAttribute("style")%>/modify.gif" title="修改" /></a>&nbsp;&nbsp;-->
									<a href="#" onclick="delRow(this)">
											<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="删除" /></a>
								</TD>      
							</TR>
						</logic:iterate>
					</TABLE>
			</div>
			
			<div class="cond_c">
			<table width="100%">
      			<tr>
        		<td width="10%"> 公式编辑： </td>
        		<td width="50%">
        		
        		<html:textarea  cols="80" rows="7" name="t21_rule"  property="gs_des" readonly="true"></html:textarea>
        	
        		</td>
      			</tr>
      
    		</table>
			</div>
			
			<div class="cond_c2">
				<table>
		
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;选择操作符：
							<input type="button" name="button" value="(" class="input" onClick="RegExp1('(')">
							&nbsp;
							<input type="button" name="button" value=")" class="input" onClick="RegExp(')')">
							&nbsp;
							<input type="button" name="button" value=" 并且 " class="input" onClick="RegExp('AND')">
							&nbsp;
							<input type="button" name="button" value="  或  " class="input" onClick="RegExp('OR')">
							<input type="hidden" name="calsymbol" value="">
							<input type="button" name="button" value="<<后 退" class="input" onClick="RegExp('backspace')">
							&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
							<input type="button" name="button" value="保 存" class="in_button1" onClick="dosubmit('modify_rule_indic_do.do?rulekey=<bean:write name="rulekey" />')" >
						</td>
					</tr>	
	  
				</table>
			</div>
			
			<td></td>
		</div>
	</html:form>
	</div>
</BODY>
</HTML>
