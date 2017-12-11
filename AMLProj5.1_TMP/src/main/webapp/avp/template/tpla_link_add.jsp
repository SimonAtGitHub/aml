<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv=content-type content="text/html; charset=gb2312">
		
		<meta content="mshtml 6.00.2600.0" name=generator>
		 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
			
			<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		
		<script language="javascript">
		function checkForm(theUrl){
	   		var errMsg ="";
	   		//alert(document.forms[0].jumpmode.value);jumptplakey
	   		//alert('ddddd');
			if(document.forms[0].jumpmode.value!=3 && getLength(document.forms[0].jumptplakey.value)==0){
	        	
	        	//document.forms[0].tplaname.focus();
	        	if(document.forms[0].jumpmode.value != 4)
	        	{
	        		errMsg+="跳转模型不能为空！";
	        		alert(errMsg);
	        		return false; 
	        	} 
	        	
	    	}
	    	//alert('b');
	    	if(document.forms[0].jumpmode.value==3 || document.forms[0].jumpmode.value==4){
		    	    if(getLength(document.forms[0].jumpparm.value)==0){
		    	         errMsg+="跳转URL不能为空！";
		        	     document.forms[0].jumpparm.focus();  
		        	     alert(errMsg);
	        	         return false;
		    	    }else if(getLength(document.forms[0].jumpparm.value)> 1024){
		    	         errMsg+="跳转URL不能大于512个汉字！";
		        	     document.forms[0].jumpparm.focus();  
		        	     alert(errMsg);
	        	         return false;
		    	    }
	    	}
	    	
	    	//alert('c');
	    	if(errMsg!=""){
	        	alert(errMsg);
	        	return false;
	    	}else{
	        	document.forms[0].action=theUrl;
	        	document.forms[0].submit();
	    	}
		}
		
		function chmod(oElement){
			var selVal = oElement.value;
			var in_page = document.getElementById('in_page');
			var out_page = document.getElementById('out_page');
			
			if(selVal == '3' || selVal == '4'){//外部页面
				in_page.style.display = 'none';
				out_page.style.display = 'block';
			}else{
				in_page.style.display = 'block';
				out_page.style.display = 'none';
			}
		}
		
	
	</script>
	</head>
	<body >
	  <div id="content">
		<html:form method="post" action="/template/t02_jump_tp_add.do">
			<html:hidden property="tplakey" />

		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">模型管理 - 定义跳转模型 - 新建</span></td>
						<td align="right">
							<input type=button value="保 存" onClick="checkForm('t02_jump_tp_add_do.do');">          </td>
					</tr>
				</table>
			</div>  
		
			<div class='awp_detail'>
				<table>
					<tr>
						<td nowrap="nowrap">
							<font color="#FF0000">*</font>跳转列：
						</td>
						<td nowrap="nowrap" colspan="3">
							<html:select property="dispcolkey" style="width:160">
								<html:options collection="dispcolkeyMap" property="label" labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td nowrap="nowrap" >
							<font color="#FF0000">*</font>跳转方式：
						</td>
						<td nowrap="nowrap" colspan="3">
							<html:select property="jumpmode" style="width:160"
										onchange="chmod(this)">
								<html:options collection="jumpmodeMap" property="label"
											labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr id="in_page">
						<td nowrap="nowrap" >
							<font color="#FF0000">*</font>跳转模型：
						</td>
						<td nowrap="nowrap" colspan="3">
							<html:hidden property="jumptplakey" styleClass="text_white" />
							<html:text property="tplaname" styleClass="text_white" readonly="true" size="25" />
							<input type="button" name="locate" value="单 选" 
							 onClick="locate_pop_window('<%=request.getContextPath()%>','t02_TemplateLocation','radio','forms[0]','jumptplakey,tplaname','tplastat=\'1\'');" />
						   
						</td>
					</tr>
					
					<tr id="out_page" style="display: none;">
						<td nowrap="nowrap" align="right">
							<font color="#FF0000">*</font>跳转URL：<br>（最多512个汉字）
						</td>
						<td nowrap="nowrap" align="left">
						<textarea id="jumpparm" name="jumpparm" cols="40" rows="10" ></textarea>
							
						</td>
						<td nowrap="nowrap" align="center">参数列：</td>
						<td nowrap="nowrap" align="center" >
							<html:select property="colaliascd" size="10" style="width:160;" ondblclick="cpSelToText(this,'jumpparm','#')">
								<html:options collection="execColMap" property="label" labelProperty="value" />
							</html:select>
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	  </div>
	</BODY>
</HTML>
