<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>

	<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl){
	
        document.forms[0].action=theUrl;
        document.forms[0].submit();
	}
	
	function appendfunc(fn,t){
		 //将下拉框中的key值存入 func_key
		 var td = fn.parentNode;
		 var eles = td.getElementsByTagName("input");
		 for(var i=0;i<eles.length;i++){
		 	if(eles[i].type==="hidden" && eles[i].name.indexOf("func_key")==0){
		 		if(fn.value===""){
		 			eles[i].value = "";
		 		}else{
		 			if(eles[i].value.indexOf(fn.value)==-1){
		 				if(eles[i].value===""){
		 					eles[i].value=fn.value;
		 				}else{
		 					eles[i].value+=","+fn.value;
		 				}
		 			}
		 		}
		 	}else if(eles[i].type==="text" && eles[i].name.indexOf("func_allname")==0){
		 		if(fn.value===""){
		 			eles[i].value = "";
		 		}else{
		 			if(eles[i].value.indexOf(fn.options[fn.selectedIndex].text)==-1){
		 				if(eles[i].value===""){
		 					eles[i].value=fn.options[fn.selectedIndex].text;
		 				}else{
		 					eles[i].value+=","+fn.options[fn.selectedIndex].text;
		 				}
		 			
		 			}
		 			
		 		}
		 		
		 	}
		 } 
	}
	
</SCRIPT>	
</head>

<body >

	<html:form action="/hpom/maintain_cols.do" method="POST">
	<div class="conditions">
	 <div class="cond_t">
	   <span>列信息管理</span>
	   <span class="buttons">
	      <a href="javascript:void(0);" onClick="dosubmit('maintain_cols_do.do?tableename=<%=request.getAttribute("tableename") %>');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
		  <a href="javascript:void(0);" onClick="dosubmit('t18_ods_load_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	   </span>
	</div>
  
	<table width="98%" align="center" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30" valign="bottom">
						表名：
							<%=request.getAttribute("tableename") %>
					</td>
				</tr>
	</table>
	<div  class='list'>
	<table border="0" cellpadding="0" cellspacing="0">
			<tr align="center">
				<th width="10%" nowrap>
					列英文名称			
				</th>
				<th width="10%" nowrap>
					列中文名称				
				</th>
				
				<th width="10%" nowrap>
					列表达式			
				</th>
				
				<th width="5%" nowrap>
					数据类型	
				</th>
				
				 <th width="5%" nowrap>
					列长度
				</th>
				<th width="5%" nowrap>
					列精度
				</th>
				<th width="5%" nowrap>
					函数表达式				
				</th>
			</tr>
			
			<logic:notEmpty name="list">
				 <logic:iterate id="dto" name="list"
					type="com.ist.common.metadata.dto.T01_mt_col_pro">
					<TR align="center" >
						<TD>
							<bean:write name="dto" property="colename" />
							<input type="hidden" name="colename" value="<bean:write name="dto" property="colename" />" />
						</TD>
						
						<TD>
							<bean:write name="dto" property="colcname" />
							<input type="hidden" name="colcname_<bean:write name="dto" property="colename" />" value="<bean:write name="dto" property="colcname" />" />
						</TD>

						<TD>
							<bean:write name="dto" property="colexpress" />
						</TD>

						<TD>
							<bean:write name="dto" property="coltype" />
							<input type="hidden" name="coltype_<bean:write name="dto" property="colename" />" value="<bean:write name="dto" property="coltype" />" />
						</TD>
						<TD>
							<bean:write name="dto" property="colprecision" />
							<input type="hidden" name="length_<bean:write name="dto" property="colename" />" value="<bean:write name="dto" property="colprecision" />" />
						</TD>
						<TD>
							<bean:write name="dto" property="scale" />
							<input type="hidden" name="scale_<bean:write name="dto" property="colename" />" value="<bean:write name="dto" property="scale" />" />
						</TD>
					
						<TD>
							<input type="hidden" name="func_key_<bean:write name="dto" property="colename" />" value="<bean:write name="dto" property="func_key" />"/>
							<input type="text"  name="func_allname_<bean:write name="dto" property="colename" />"  value="<bean:write name="dto" property="func_allname" />"  size="20" readonly="readonly"/>
							<html:select property="funccnname"  onchange="appendfunc(this);">
								<html:options collection="funmap" property="label"
									labelProperty="value" />
							</html:select>
						</TD>
					</TR>
				</logic:iterate>
				</logic:notEmpty>
		</table>
	</div>
	</div>
	</html:form>
</body>
</html>