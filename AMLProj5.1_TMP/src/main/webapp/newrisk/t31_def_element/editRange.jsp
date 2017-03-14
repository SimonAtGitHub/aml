<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>

		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style") %>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>


		<SCRIPT LANGUAGE="JavaScript">
		function addRow() {
			var tab=document.getElementById("tab");
			var newTr= tab.insertRow();
			var newTd = newTr.insertCell();
			newTd.innerHTML ="<input type='text' name='min_score' size='10' maxlength='19' />";
			newTd = newTr.insertCell();
			newTd.innerHTML ="<input type='text' name='max_score' size='10' maxlength='19' />";
			newTd = newTr.insertCell();
			newTd.innerHTML ="<input type='text' name='score' size='10' maxlength='19' />";
			newTd = newTr.insertCell();
			newTd.innerHTML ="<input type='text' name='des' size='45' maxlength='1000'/>";
			newTd = newTr.insertCell();
			newTd.innerHTML ="<a href='#' onclick='delRow(this)'><img src='../../images/blue/b_delete.png' title='删除'/></a>";
		
		}

		function delRow(obj) {
			var tab=document.getElementById("tab");
			rowIndex=obj.parentNode.parentNode.rowIndex;
			tab.deleteRow(rowIndex);
		}
		function checkBase_occ(obj)
		{
			if(!formatNum(obj.value,2,0,100)||obj.value==0)
			{
				alert("只能输入数字,且小数点后最多2位!");
				obj.focus();
			}
		}
		
		function dosubmit(theUrl){
			 
			
			 if(min_max()==false)
			 {
				 return;
			 }
			 if(notEmpty_number_point2('score','得分','得分只能输入0到5的数字,且小数点后最多2位!',2,0,5)==false)
			 {
				 return;
			 }
			 var min_scores= document.getElementsByName("min_score");
			 var max_scores= document.getElementsByName("max_score");

			 var rownum=min_scores.length;
			 
			 if(rownum==0)
			 { 
				 alert("请增加要点区间再保存!");
				 return;
			 }

			var lastMax; 
			for(var i=0;i<rownum;i++)
			{
				var minVal=parseFloat(min_scores[i].value);
				var maxVal=parseFloat(max_scores[i].value);
				
				if(minVal>maxVal)
				{
					alert("最小值不能大于最大值!");	
					min_scores[i].focus();
					return ;
				}

				if(i>0&&minVal<lastMax)
				{
					alert("最小值不能小于上一区间的最大值!");	
					min_scores[i].focus();
					return ;
				}
				
				lastMax=parseFloat(max_scores[i].value);
			}

				
		    var randomChar='<%=(String)request.getAttribute("index")%>';
	        var str='window.parent.document.getElementById("'+randomChar+'")';
	        if(eval(str))	
	        {	      
		    	eval(str).value='1'; 
	        }  
			document.forms[0].action=theUrl;
	        document.forms[0].submit();	        
	        window.parent.ymPrompt.close();	
		}


		function notEmpty_number_point2(objName,nameVal,alertVal,n,startNum,endNum)
		{
			 var names= document.getElementsByName(objName);
			
			 for(var i=0;i<names.length;i++)
			 {	
				 
				 if(trim(names[i].value)=='')
				 {	
					 alert(nameVal+"不能为空!");				 
					 names[i].focus();
					 return false;
				 }
				 if(formatNum(names[i].value,n,startNum,endNum)==false)
				 {
					 alert(alertVal);
					 names[i].focus();
					 return false;
				 }
			 }
			 return true;
		}


		function min_max()
		{
			
			 var mins= document.getElementsByName("min_score");
			 var maxs= document.getElementsByName("max_score");
			
			 for(var i=0;i<mins.length;i++)
			 {	
				 
				 if(i!=0&&trim(mins[i].value)=='')
				 {	
					 alert("最小值不能为空!");				 
					 mins[i].focus();
					 return false;
				 }
				 if(formatNum(mins[i].value,2)==false)
				 {
					 alert("最小值只能输入数字,且小数点后最多2位!");
					 mins[i].focus();
					 return false;
				 }
			 }

			 for(var i=0;i<maxs.length;i++)
			 {	
				 
				 if((i!=maxs.length-1)&&trim(maxs[i].value)=='')
				 {	
					 alert("最大值不能为空!");				 
					 maxs[i].focus();
					 return false;
				 }
				 if(formatNum(maxs[i].value,2)==false)
				 {
					 alert("最大值只能输入数字,且小数点后最多2位!");
					 maxs[i].focus();
					 return false;
				 }
			 }

			 if(mins.length==1&&trim(mins[0].value)==''&&trim(maxs[0].value)=='')
			 {
				 alert("最小值和最大值不能同时为空!");
				 mins[0].focus();
				 return false;
			 }
			 
			 return true;
		}
		
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/t31_def_element/t31_def_element_add.do"
			method="post">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
					<span>编辑要点区间</span>
					<span class="buttons"> 
						<a href="javascript:void(0);" onclick="addRow();"><img src="../../images/blue/b_add2.png" />增加区间</a>
						<a href="#" onclick="dosubmit('editRange.do?type=save&index=<%=(String)request.getAttribute("index")%>');"><img src="../../images/blue/b_save.png" />保存</a>
					
					</span>
					</div>
									
					<div class="list">
						<table border="0" cellpadding="0" cellspacing="0" id="tab">
						<tr>
							<th><font color="red">*</font>最小值</th>
							<th><font color="red">*</font>最大值</th>
							<th><font color="red">*</font>得分</th>
							<th>简述</th>
							<th>操作</th>
						</tr>
						<% 
							Map map=(Map)session.getAttribute("t31_def_elementscoreMap");
							String index=(String)request.getAttribute("index");
							List list=(ArrayList)map.get(index);
							if(list==null)
							{
								list= new ArrayList();
							}
							pageContext.setAttribute("list",list,pageContext.PAGE_SCOPE);
						%>
						<logic:iterate id="t31_def_elementscore" name="list" type="com.ist.aml.newrisk.dto.T31_def_elementscore" scope="page">
						
						
							<tr>
								<td >									
									<input type="text" name="min_score" size="10" maxlength="19" value="<bean:write name="t31_def_elementscore" property="min_score"/>"/>
								</td>
								
								<td>
									<input type="text" name="max_score" size="10" maxlength="19" value="<bean:write name="t31_def_elementscore" property="max_score"/>"/>
								</td>							
							
								<td>
									<input type="text" name="score" size="10" maxlength="19" value="<bean:write name="t31_def_elementscore" property="score"/>"/>
								</td>
								<td>
									<input type="text" name="des" size="45" maxlength="200" value="<bean:write name="t31_def_elementscore" property="des"/>"/>
								</td>
								<td><a href="#" onclick="delRow(this)">
										<img src="../../images/blue/b_delete.png" title="删除" /></a>
								</td>
							
							</tr>
						</logic:iterate>
						</table>

					</div>

				</div>

			</div>
		</html:form>
	</BODY>
</HTML>
