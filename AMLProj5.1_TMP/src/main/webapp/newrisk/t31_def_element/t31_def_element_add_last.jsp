<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>

		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>


		<SCRIPT LANGUAGE="JavaScript">
		function addRow() {
			var tab=document.getElementById("tab");
			var newTr= tab.insertRow();
			var newTd = newTr.insertCell();
			newTd.innerHTML ="<select name='caltype' onchange='caltypeChange(this)'>"
								+"<option value=''>--请选择--</option>"
								+"<option value='1'>指标基准值</option>"
								+"<option value='2'>风险事件</option>"
								+"<option value='3'>直接得分</option>"
								+"<option value='4'>指标值</option>"
								+"<option value='5'>指标要点区间</option>"
								+"</select>";
			newTd = newTr.insertCell();			
			newTd = newTr.insertCell();
			newTd.innerHTML ="<a href='#' onclick='delRow(this)'><img src='../../images/blue/b_delete.png' title='删除'/></a>";
			
		}

		function delRow(obj) {
			var tab=document.getElementById("tab");
			rowIndex=obj.parentNode.parentNode.rowIndex;
			tab.deleteRow(rowIndex);
		}
	

		function isEmpty(name)
		{
		  var names=eval('document.getElementsByName("'+name+'")');
			
		  for(var i=0;i<names.length;i++)
		  {  
			  if(names[i].type=='hidden')
				 {
					 continue;
				 }
			 if(trim(names[i].value)=='')
			 {
				 
				 names[i].focus();
				 return true;
			 }
		  }
		  return false;
		}

		function dosubmit(theUrl){
			  var errMsg = '';
		
			  if(isEmpty('caltype'))
			  {
				  alert("请选择要点类型!");
				  return;
			  }


		 	 if(isEmpty('indickey'))
			 {
				 alert("指标编码不能为空!");				
				 return;
			 }
			     
			 if(isEmpty('elementname'))
			 {
				 alert("风险要素名称不能为空!");				
				 return;
			 }

			

			 var valnums= document.getElementsByName("valnum");

			 for(var i=0;i<valnums.length;i++)
			 {	
				 if(valnums[i].type=='hidden')
				 {
					 continue;
				 }
				 if(formatNum(valnums[i].value,0,1)==false)
				 {
					 alert("指标顺序请输入大于1的整数!");
					 valnums[i].focus();
					 return;
				 }
			 }
			 var js_type= document.getElementsByName("js_type")[0].value;
			 
			 if(isEmpty('base_occ')&&js_type=='1')
			 {
				 alert("权重不能为空!");				
				 return;
			 }
			 var base_occs= document.getElementsByName("base_occ");

			 for(var i=0;i<base_occs.length;i++)
			 {	
				 
				 if(base_occs[i].type=='hidden'||js_type!='1')
				 {
					 continue;
				 }
				 if(!formatNum(base_occs[i].value,2,0,100)||base_occs[i].value==0)
					{
						alert("权重只能输入大于0小于等于100,且小数点后最多2位的数字!");
						base_occs[i].focus();
						return;
					}
			 } 
			  
			  var sum=0;
			  for(var i=0;i<base_occs.length;i++)
			  {     
				  var occ=base_occs[i].value;
				  if(trim(occ)=='')
				  {
					  occ=0;  
				  }
				  sum+=parseFloat(occ);
				 
			  }

			  var tab=document.getElementById("tab");
			 
			  if(tab.rows.length==1)
			  {
				  errMsg="请增加要点再保存!";
			  }else  if(sum!=100&&js_type=='1')
			  {
				
				  errMsg="所有权重之和应为100%,请检查!";
			  }

			  if(isEmpty('base_score'))
			 {
				 alert("基准分值不能为空!");				
				 return;
			 }
			  var base_scores= document.getElementsByName("base_score");

				 for(var i=0;i<base_scores.length;i++)
				 {	
					 if(base_scores[i].type=='hidden')
					 {
						 continue;
					 }
					 
					 if(base_scores[i].value=='0'||formatNum(base_scores[i].value,2,0)==false)
					 {
						 alert("基准分值只能为不为0的数字,且小数点后最多2位!");
						 base_scores[i].focus();
						 return;
					 }
				 }

				  if(isEmpty('element_score'))
					 {
						 alert("子项分值不能为空!");				
						 return;
					 }
					  var element_scores= document.getElementsByName("element_score");

						 for(var i=0;i<element_scores.length;i++)
						 {	
							 if(element_scores[i].type=='hidden')
							 {
								 continue;
							 }
							 
							 if(element_scores[i].value=='0'||formatNum(element_scores[i].value,2,0,5)==false)
							 {
								 alert("子项分值只能为大于0小于等于5的数字,且小数点后最多2位!");
								 element_scores[i].focus();
								 return;
							 }
						 }
				var is_edits= document.getElementsByName("is_edit");
				for(var i=0;i<is_edits.length;i++)
				{
					if(is_edits[i].value=='0')
					{
						alert("请编辑要点区间!");
						return;
					}
				}		
			  
			    if(errMsg==''){
			        document.forms[0].action=theUrl;
			        document.forms[0].submit();
			    	
			    }else{
			       
			        alert(errMsg);
			        return false;
			    }
			}

		function isLastChange(val)
		{
			if(val=='1')
			{
				document.forms[0].action='t31_def_element_add.do?is_last=1';
		        
			}else
			{
				document.forms[0].action='t31_def_element_add.do?is_last=0';
			}
			document.forms[0].submit();
		}
		
		function  randomChar(len){
			  var  x="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			  var  tmp="";
			  for(var  i=0;i<len;i++)  {
			  	tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
			  }
			  return  tmp;
		}
		
		function caltypeChange(selObj)
		{
			
			var secondTd=selObj.parentNode.parentNode.getElementsByTagName("td")[1];
			if(selObj.value=='')
			{				
				secondTd.innerHTML="";
			}else if(selObj.value=='1')
			{
				secondTd.innerHTML="<table>"
				+"<tr><td align='right'><font color='red'>*</font>指标编码</td><td align='left'><input type='text' name='indickey' readonly='readonly' value='' />"				
				+"		<a href='#' title='选择' onclick='selectElement(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.rowIndex)'><img "
				+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />选择</a></td>"
				+"<td align='right'><font color='red'>*</font>风险要素名称</td>"				
				+"<td align='left'><input type='text' name='elementname' size='50' maxlength='200' /></tr>"			
				+"<tr><td align='right'><font color='red'>*</font>指标顺序</td>"
				+"		<td align='left' ><input type='text' name='valnum' size='20' maxlength='2' value='1'/></td>"
				+"		<td align='right'>权重（%）</td>"
				+"		<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' />"
				+"		<input type='hidden' name='riskcaltype' value='' /><input type='hidden' name='randomChar' value='' /></td></tr>"
				+"<tr><td align='right'><font color='red'>*</font>基准分值</td>"
				+"		<td align='left'><input type='text' name='base_score' size='20' maxlength='11' /></td>"
				+"		<td align='right'>累计方式</td>"
				+"		<td align='left'><select name='is_sum'><option value='1' selected='selected'>直接取值</option>"
				+"		<option value='2' >求和</option><option value='3' >取平均值</option></select></td></tr>"
				+"<tr><td align='right'><font color='red'>*</font>子项分值</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' /></td>"
				+"      <td align='right'>是否允许调整</td>"
				+"		<td align='left'><select name='is_audit'><option value='1' selected='selected'>是</option>"
				+"		<option value='0' >否</option></select></td></tr>"
				+"<tr><td align='right'>描述</td>"
				+"		<td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
				+"</table>";
				
			}else if(selObj.value=='2')
			{
				secondTd.innerHTML="<table>"
				+"<tr><td align='right'><font color='red'>*</font>风险要素名称</td>"
				+"<td align='left'><input type='hidden' name='indickey' value='' /><input type='hidden' name='valnum' value='0' />"
				+"<input type='text' name='elementname' size='20' maxlength='200' /></td>"
				+"<td align='right'>权重（%）</td>"
				+"<td align='left'><input type='text' name='base_occ' size='20' maxlength='7' /></td></tr>"				
				+"<tr><td align='right'><font color='red'>*</font>子项分值</td>"
				+"<td align='left'><input type='text' name='element_score' size='20'  maxlength='7' />"
				+"<input type='hidden' name='is_sum' value='1' />"
				+"<input type='hidden' name='base_score' value='0' /><input type='hidden' name='randomChar' value='' /></td>"
				+"<td align='right'>风险事件算法</td><td align='left'><select name='riskcaltype'>"
				+"<option value='MIN'>最小值</option><option value='MAX' selected='selected'>最大值</option><option value='AVG'>平均值</option></select></td></tr>"
				+"<tr><td align='right'>是否允许调整</td>"
				+"	  <td align='left' colspan='3'><select name='is_audit'><option value='1' selected='selected'>是</option>"
				+"	  <option value='0' >否</option></select></td></tr>"
				+"<tr><td align='right'>描述</td><td align='left' colspan='3'>"
				+"<textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
				+"</table>";
			}else if(selObj.value=='3')
			{
				secondTd.innerHTML="<table>"
				+"<tr><td align='right'><font color='red'>*</font>风险要素名称</td>"
				+"<td align='left'><input type='hidden' name='indickey' value='' /><input type='hidden' name='valnum' value='0' />"
				+"<input type='text' name='elementname' size='20' maxlength='200' /></td>"
				+"<td align='right'>权重（%）</td>"
				+"<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' /></td></tr>"
				+"<tr><td align='right'><font color='red'>*</font>子项分值</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' />"
				+"<input type='hidden' name='is_sum' value='1' /><input type='hidden' name='base_score' value='0' /><input type='hidden' name='riskcaltype' value='' /><input type='hidden' name='randomChar' value='' /></td>"
				+"    <td align='right'>是否允许调整</td>"
				+"	  <td align='left'><select name='is_audit'><option value='1' selected='selected'>是</option>"
				+"	  <option value='0' >否</option></select></td></tr>"				
				+"<tr><td align='right'>描述</td><td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
				+"</table>";
			}else if(selObj.value=='4')
			{
				secondTd.innerHTML="<table>"
					+"<tr><td align='right'><font color='red'>*</font>指标编码</td><td align='left'><input type='text' name='indickey' readonly='readonly' value='' />"				
					+"		<a href='#' title='选择' onclick='selectElement(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.rowIndex)'><img "
					+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />选择</a></td>"
					+"<td align='right'><font color='red'>*</font>风险要素名称</td>"				
					+"<td align='left'><input type='text' name='elementname' size='50' maxlength='200' /></tr>"
					+"<tr><td align='right'><font color='red'>*</font>指标顺序</td>"
					+"		<td align='left' ><input type='text' name='valnum' size='20' maxlength='2' value='1'/></td>"
					+"		<td align='right'>权重（%）</td>"
					+"		<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' />"
					+"		<input type='hidden' name='riskcaltype' value='' />"
					+"		<input type='hidden' name='base_score' value='0' /><input type='hidden' name='randomChar' value='' /></td></tr>"
					+"<tr><td align='right'><font color='red'>*</font>子项分值</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' />"
					+"		<td align='right'>累计方式</td>"
					+"		<td align='left'><select name='is_sum'><option value='1' selected='selected'>直接取值</option>"
					+"		<option value='2' >求和</option><option value='3' >取平均值</option></select></td></tr>"
					+"<tr><td align='right'>是否允许调整</td>"
					+"	  <td align='left' colspan='3'><select name='is_audit'><option value='1' selected='selected'>是</option>"
					+"		<option value='0' >否</option></select></td></tr>"
					+"<tr><td align='right'>描述</td>"
					+"		<td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
					+"</table>";
			}else if(selObj.value=='5')
			{	var randomChar8=randomChar(8);
				secondTd.innerHTML="<table>"
					+"<tr><td align='right'><font color='red'>*</font>指标编码</td><td align='left'><input type='text' name='indickey' readonly='readonly' value='' />"				
					+"		<a href='#' title='选择' onclick='selectElement(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.rowIndex)'><img "
					+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />选择</a></td>"
					+"<td align='right'><font color='red'>*</font>风险要素名称</td>"				
					+"<td align='left'><input type='text' name='elementname' size='50' maxlength='200' /></tr>"
					+"<tr><td align='right'><font color='red'>*</font>指标顺序</td>"
					+"		<td align='left' ><input type='text' name='valnum' size='20' maxlength='2' value='1'/></td>"
					+"		<td align='right'>权重（%）</td>"
					+"		<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' />"
					+"		<input type='hidden' name='riskcaltype' value='' />"
					+"		<input type='hidden' name='base_score' value='0' />"
					+"      <input type='hidden' name='randomChar' value='"+randomChar8+"' /><input type='hidden' name='is_edit' id='"+randomChar8+"' value='0' /></td></tr>"
					+"<tr><td align='right'><font color='red'>*</font>子项分值</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' /></td>"
					+"		<td align='right'>累计方式</td>"
					+"		<td align='left'><select name='is_sum'><option value='1' selected='selected'>直接取值</option>"
					+"		<option value='2' >求和</option><option value='3' >取平均值</option></select>"
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"					
					+"<font color='red'>*</font><a href='#' title='编辑要点区间' onclick=\"editRange('"+randomChar8+"')\"><img "
					+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />编辑要点区间</a></td></tr>"
					+"<tr><td align='right'>是否允许调整</td>"
					+"	  <td align='left' colspan='3'><select name='is_audit'><option value='1' selected='selected'>是</option>"
					+"	  <option value='0' >否</option></select></td></tr>"				
					+"<tr><td align='right'>描述</td>"
					+"		<td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
					+"</table>";
				
			}
			
		}

		function selectElement(index)
		{
			
			var url='<%=request.getContextPath()%>/rule/t21_indic/indic_search.do?mark=2&dispatcher=radio&newsearchflag=1&index='+(index-1);
			ymPrompt.win({message:url,width:650,height:420,title:'选择',handler:handler,iframe:true,fixPosition:true,dragOut:false});
		}
		function editRange(randomChar)
		{
			
			var url='<%=request.getContextPath()%>/newrisk/t31_def_element/editRange.do?index='+randomChar+'&type=edit';
			ymPrompt.win({message:url,width:650,height:420,title:'',handler:handler,iframe:true,fixPosition:true,dragOut:false});
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
						<span>积分评级模板 - 添加风险要点</span><span class="buttons"><strong>是否最后一层：</strong>
						<select name="is_last" onchange="isLastChange(this.value)">
								<option value="1" selected="selected">
									是
								</option>
								<option value="0">
									否
								</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>计算方式：</strong><select name="js_type" >
										
										<option value="1" selected="selected">权重</option>										
										<option value="2"  >最大值</option>
										<option value="3"  >最小值</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
							<a href="javascript:void(0);" onclick="addRow();"><img
									src="../../images/blue/b_add2.png" />增加要点</a> <a
							href="###"
							onclick="dosubmit('t31_def_element_add_do.do');"><img
									src="../../images/blue/b_save.png" />保存</a> <a
							href='t31_def_element_list.do?upelementkey=<bean:write name="t31_def_elementActionForm" property="upelementkey"/>&templatekey=<bean:write name="t31_def_elementActionForm" property="templatekey"/>&treelaye=<bean:write name="t31_def_elementActionForm" property="treelaye"/>'><img
									src="../../images/blue/b_back.png" />返回</a>
						</span>
					</div>
					<!-- table content -->
					<html:hidden property="templatekey" />
					<html:hidden property="upelementkey" />
					<html:hidden property="treelaye" />
					<div class="list">
						<table border="0" cellpadding="0" cellspacing="0" id="tab">
							<tr>
								<th>
									<font color="red">*</font>要点类型
								</th>
								<th>
									要点详情
								</th>

								<th>
									操作
								</th>


							</tr>

							<tr>
							<td>
									<select name="caltype" onchange="caltypeChange(this)">
										<option value="">
											--请选择--
										</option>
										<option value="1">
											指标基准值
										</option>
										<option value="2">
											风险事件
										</option>
										<option value="3">
											直接得分
										</option>
										<option value="4">
											指标值
										</option>
										<option value="5">
											指标要点区间
										</option>
									</select>
								</td>
								<td></td>
								<td>
									<a href="#" onclick="delRow(this);"><img
											src="../../images/blue/b_delete.png" title="删除" /></a>
								</td>
							</tr>

							
						</table>

					</div>

				</div>

			</div>
		</html:form>
	</BODY>
</HTML>
