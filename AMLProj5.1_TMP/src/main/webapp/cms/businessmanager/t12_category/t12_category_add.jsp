<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
   <SCRIPT LANGUAGE="JavaScript"> 
	function checkForm(theUrl){
	    var errMsg ="";
	    if(getLength(document.forms[0].categorytypename.value)>64){
	        errMsg="类别类型名称不能大于64个字符！";
	        document.forms[0].categorytypename.focus();
	    }else if(getLength(document.forms[0].categorytypename.value)==0){
	        errMsg="类别类型名称不能为空！";
	        document.forms[0].categorytypename.focus();
	    }if(getLength(document.forms[0].categorytype.value)>32){
	        errMsg="类别类型编码不能大于32个字符！";
	        document.forms[0].categorytype.focus();
	    }else if(getLength(document.forms[0].categorytype.value)==0){
	        errMsg="类别类型编码不能为空！";
	        document.forms[0].categorytype.focus();
	    }else if(getLength(document.forms[0].desc.value)> 256){
	        errMsg="描述不能大于256个字符！";
	        document.forms[0].desc.focus();
	    }
		
	    if(errMsg == ""){
		    if(document.forms[0].isquote.value == "0"){
				var true_level = parseInt(document.getElementById("true_level").value);
				var level = parseInt(document.getElementById("level").value);
				if(true_level != level){
					errMsg="设定的层级与输入的层级不符！";
	       			document.forms[0].level.focus();
				}else{
					var digits = document.getElementsByName('digit');
				    if(digits.length > 0){
				    	 for(var i = 0;i < digits.length; i++){
				          if(digits[i].value == ""){
				             	errMsg="位数不能为空！";
				                break;
				           } 
				           if (isNaN(digits[i].value))
				            {   errMsg="位数必须为数字！";
				                break;
				            }
				           if (!checkNum(digits[i].value))
				            {   errMsg="位数只能是0及正整数！";
				                break;
				            } 
				        }
				    }
				}
	       }
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	       document.forms[0].action=theUrl;
	       document.forms[0].submit();
	    }
	}
	
	function checkNum(val)
	{
	     var str = "";
	     var re = /^[0-9]\d*$/;
	     if (!re.test(val))
	    {
	        return false;
	     }else{
	     	return true;
	     }
	     
	} 
	function quotechange(val){
		var obj = document.getElementById("levelarea");
	    var quoteObj = document.getElementById("quote");
	    var codeObj = document.getElementById("levelcode");//层级
		//引用
		if(val == '1'){
			quoteObj.style.display="";
			obj.style.display="none";
			codeObj.style.display="none";
			
		}else{
			obj.style.display="";
			codeObj.style.display="none";
			quoteObj.style.display="none";
			
		}
	}
	function display(){
	  var val = document.getElementById("level").value;
	  var obj = document.getElementById("levelcode");
	  document.getElementById("true_level").value = val;
	  if(val !="") obj.style.display = "";
	  var tb = document.getElementById('tableid');
      val = parseInt(val)+2;
  	  var num = parseInt(tb.rows.length);
 	  for(var k=num-1;k>0;k--)
      {
  	  	  tb.deleteRow(k);
      }
      //显示行
      for(var j=1;j<val;j++)
      {
    	 if(j == val-1){
		     	//增加文章编码级
		    	 addrow(j,"final");
		     }else{
		    	 addrow(j,"");
		     }
      }
	}
	function addrow(num,type){
	        var tab=document.getElementById("tableid");
			var newRow = tab.insertRow();
		    newRow.align="center"; 
		    
		   	var cel1 = newRow.insertCell();
			if(type == "final"){
				cel1.innerHTML="文章编码";
			}else{
				cel1.innerHTML=num+"级";
			}
			
		   	var cell0 = newRow.insertCell();
			if(num != 1)cell0.innerHTML="<c:out value="${splitstr}" escapeXml="false"/>";	
			
			var cell2 = newRow.insertCell();
			cell2.innerHTML="<c:out value="${prestr}" escapeXml="false"/>";
			
			var cell3 = newRow.insertCell();
			cell3.innerHTML=" <input name=\"digit\" type=\"text\" size=\"5\" class=\"avp_number\">";
			
			//刷新样式
			setInputStyle();   
                
	   }
	    function displaylayer(){
	  	var type = document.getElementById("isquote").value;
	  	//增加文章类别
	  	if(type == "0"){
	  		quotechange(type);
	  		display();
	  	}
	  }
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>
		<html:form method="post" action="/businessmanager/t12_category/t12_category_add_do.do">

			 <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">类别管理
									- 新建类别</span>
                        </td>
                        <td align="right" nowrap>
                             
						    <html:button property="button4" value="返 回" styleClass="input"
							onclick="awpDoSubmit('t12_category_list.do','add')" />
                        </td>
                    </tr>
                </table>
            </div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<input type="hidden" name="true_level" id="true_level" value=""/>
			<table border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>

			<div class='awp_detail'>
				<table>
					<tr>
						<td>
							<font color="red">*</font>类别编码：
						</td>
						<td>
							<html:text property="categorytype" size="30" styleClass="text_white" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>类别名称：
						</td>
						<td>
							<html:text property="categorytypename" size="30" styleClass="text_white" />
						</td>
					</tr>
					
					<tr>
						<td>
							<font color="red">*</font>是否引用：
						</td>
						<td>
						  <html:select property="isquote" onchange="quotechange(this.value);">
                             <html:options collection="isMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
					
					<tr id="quote" style="display:none">
						<td>
							<font color="red">*</font>引用类型：
						</td>
						<td>
						 <html:select property="quotetype">
                             <html:options collection="categorytypeMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
					
					 <tr id="levelarea" >
		              <td> 类别层级：</td>
		              <td>
		                <html:text property="level"  size="10" styleClass="text_white" styleId="level"></html:text>
		                <input type="button" value="确定" onclick="display();"/>
		              </td>
		            </tr>
		            
		             <tr id="levelcode" style="display:none">
			              <td> 层级编码：</td>
			              <td id="code">
				             <div class='awp_detail_bgz'>
				               		<table id="tableid">
										<tr align="center">
											<td align="center" noWrap>
												层级
											</td>
											<td align="center" noWrap>
												分隔符
											</td>
											<td align="center" noWrap>
												前缀
											</td>
											<td align="center" noWrap>
												位数
											</td>
										</tr>
										<div id="add"></div>
									</table>
							</div>
					     </td>
           			 </tr>
           			 
					<tr>
						<td>
							<font color="red">*</font>状态：
						</td>
						<td>
						  <html:select property="flag">
                             <html:options collection="flagMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
				
					<tr>
						<td>
							类别描述：
						</td>
						<td>
							<html:textarea property="desc" cols="60" rows="6" />
							
						</td>
					</tr>
				    <tr>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" value="提 交" OnClick="checkForm('t12_category_add_do.do')">
							<html:reset styleClass="input" value="重 填"/>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
	<script language="JavaScript">
	displaylayer();
</script>
</body>
</html:html>
