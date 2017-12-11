<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>添加输入参数</title>
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
	function checkForm(theUrl){
	   var errMsg ="";
	   var isdefault = document.getElementsByName('isdefault');    
	   var defaultvalue = document.getElementsByName('defaultvalue');
	   var sel_type = document.getElementsByName("parmtype");
	   var sel_type_value = sel_type[0].value;

	   if(isdefault[0].checked == true){
			if(getLength(defaultvalue[0].value) == 0){
				errMsg+= "默认值不能为空！";
			}
		}else{
   	
    	if(sel_type_value=="2"){
		    var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            
            //树定位
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'|| sysinparmkey_user_temp_value == '250'){
            	 if(getLength(document.forms[0].targetcde_tree.value)==0){
		             errMsg+="对应定位树不能为空！";
		             document.forms[0].targetcde_tree.focus(); 
		              alert(errMsg);
		            return false;   
		            }
            }else{
	            //列表定位  
				 if(getLength(document.forms[0].targetcde.value)==0){
		             errMsg+="对应定位不能为空！";
		             document.forms[0].targetcde.focus(); 
		              alert(errMsg);
		            return false;   
		          }
			}
		}
	   if(sel_type_value=="3"){
		 if(getLength(document.forms[0].targetcdeh.value)==0){
             errMsg+="对应码表不能为空！";
              //document.forms[0].targetcdeh.focus();  
              alert(errMsg);
              return false;  
            }
		}
		if(sel_type_value=="5"){
			 if(getLength(document.forms[0].targetcdeh.value)==0){
	             errMsg+="对应码表不能为空！";
	              //document.forms[0].targetcdeh.focus();  
	              alert(errMsg);
	              return false;  
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
	
	function chgInParmType(){
	    var sel_type = document.getElementsByName("parmtype");
		var sys_disp = document.getElementById('sys_sel');
		var user_disp_1 = document.getElementById('user_sel_1');
		var user_disp_3 = document.getElementById('user_sel_3');
		var user_disp_2 = document.getElementById('user_sel_2');
		var user_disp_tree = document.getElementById('user_sel_tree');
		/*var user_disp_5 = document.getElementById('user_sel_5');
		var user_disp_6 = document.getElementById('user_sel_6');
		var user_disp_7 = document.getElementById('user_sel_7');*/
		var user_disp_8 = document.getElementById('user_sel_8');

		var sel_type_value = sel_type[0].value;
		if(sel_type_value=="1"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			user_disp_tree.style.display='none'; 
			/*user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';*/
			user_disp_8.style.display='none';
			sys_disp.style.display='block';
		}
        if(sel_type_value=="2"){
            var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            
            //树定位
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'|| sysinparmkey_user_temp_value == '250'){
            	user_disp_2.style.display='none'; 
            	user_disp_tree.style.display='block'; 
            }else{
	            //列表定位  
				user_disp_2.style.display='block'; 
				user_disp_tree.style.display='none'; 
			}
			user_disp_1.style.display='block'; 
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			sys_disp.style.display='none';
			/*user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';*/
			user_disp_8.style.display='block';
		}
	   if(sel_type_value=="3"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='block';
			user_sel_4.style.display='block';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			/*user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';*/
			user_disp_8.style.display='block';
		}
	 	if(sel_type_value=="5"){
		    user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='block';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			/*user_disp_5.style.display='block';
			user_disp_6.style.display='block';
			user_disp_7.style.display='none';*/
			user_disp_8.style.display='block';
		}
	}
	
	function chgInParmTree(){
		    var user_disp_tree = document.getElementById('user_sel_tree');
	    	var user_disp_2 = document.getElementById('user_sel_2');
		    var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            
            //树定位
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'|| sysinparmkey_user_temp_value == '250'){
            	user_disp_2.style.display='none'; 
            	user_disp_tree.style.display='block'; 
            }else{
	            //列表定位  
				user_disp_2.style.display='block'; 
				user_disp_tree.style.display='none'; 
			}
	
	}
	function changeDefault(){
		var isdefault = document.getElementsByName('isdefault');
		var default_value =  document.getElementById('default_value');
		var sys_disp = document.getElementById('sys_sel');
		var user_disp_1 = document.getElementById('user_sel_1');
		var user_disp_3 = document.getElementById('user_sel_3');
		var user_disp_2 = document.getElementById('user_sel_2');
		var user_disp_tree = document.getElementById('user_sel_tree');		
		var user_disp_4 = document.getElementById('user_sel_4');
		var user_disp_8 = document.getElementById('user_sel_8');
		var parm_type = document.getElementById('parm_type');
		if(isdefault[0].checked == true){
			default_value.style.display = 'block';
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_disp_4.style.display='none';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 			
			user_disp_8.style.display='none';
			parm_type.style.display = 'none';
		}else
		{
			default_value.style.display = 'none';
			parm_type.style.display = 'block';
			chgInParmType();
		}
	}
</SCRIPT>
	</HEAD>
 <BODY>
 <div id="content">
 <html:form method="post" action="/system_manager/t12_programa/t12_programa_colsExtendAttriModiy.do">
 	  <html:hidden property="tablecode"/>
 	  <html:hidden property="colkey"/> 
 	<div class='awp_title'>
				<table>
					<tr>						
						<td width="23%" nowrap>
							<span class="awp_title_td2">栏目管理 - 数据表管理 - 修改字段属性</span>
						</td>
						<td align="right">
							<input type=button value="保  存" onClick="checkForm('<%=request.getContextPath() %>/cms/system_manager/t12_programa/t12_programa_colsExtendAttriModiyDo.do');">
	      		<input type=button value="关  闭" name=Button223  onClick="window.close()">&nbsp;</td>
					</tr>
				</table>
			</div> 
			<logic:messagesPresent message="true">
				<html:messages id="msg" message="true">
					<bean:write name="msg" filter="false"/>
				</html:messages>
			</logic:messagesPresent>
        <div class="awp_detail">
        	<table>
		      					<tr>
									<td>
										字段编码：
									</td>
									<td >
										 <c:out value="${t12_programa_cols.colkey}" />
									</td>
								</tr>
								<tr>
									<td >
										显示名称：
									</td>
									<td >
										<c:out value="${t12_programa_cols.colname}" />
									</td>
								</tr>
								<tr>
									<td >
										是否默认数据：
									</td>
									<td >
										<html:radio property="isdefault" value="1" onclick="changeDefault();">是</html:radio>
										<html:radio property="isdefault" value="0" onclick="changeDefault();">否</html:radio>
									</td>
								</tr>
								<tr id="default_value" style="display:none">
									<td >
										<font color="#FF0000">*</font>默认值：
									</td>
									<td >
										<html:text property="defaultvalue" ></html:text>
									</td>
								</tr>
								<tr id="parm_type" style="display:none">
									<td nowrap>
										<font color="#FF0000">*</font>输入参数类型：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="parmtype" onclick="chgInParmType()">
							                 <html:options collection="parmtypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

								<tr    id="sys_sel" style="display:none">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>系统定义输入参数：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="sysinparmkey_sys">
							              <html:options collection="sysinparmkeyMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

									<tr   style="display:none" id="user_sel_1">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>定位输入类型：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="sysinparmkey_user"  onclick="chgInParmTree()"   style="width:160">
							              <html:options collection="parmintypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
							<tr   style="display:none" id="user_sel_3">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>码表输入类型：
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="sysinparmkey_user_m"  style="width:160">
							              <html:options collection="parmtypehashMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr   style="display:none" id="user_sel_2">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>对应定位：
									</td>
									<td bgcolor="F6F9FF">
<%--										<html:select property="targetcde" style="width:400" >
										<html:options collection="locationcacheMap" property="label"
											labelProperty="value" />
										</html:select>--%>
										<html:hidden property="targetcde"/>
										<html:text property="targetcde_disp" size="25" readonly="true"></html:text>
										<input type="button" name="locate" value="定 位" class="text_white" onclick="locate_dict_window('<%=request.getContextPath() %>','location','targetcde,targetcde_disp');"/>
									</td>
								</tr>
								<tr   style="display:none" id="user_sel_tree">
									<td   >
										<font color="#FF0000">*</font>对应树定位：
									</td>
									<td >
                                     <%--   <html:select property="targetcde_tree" style="width:400" >
											<html:options collection="user_sel_treeMap" property="label"
												labelProperty="value" />
										</html:select>--%>
										 <html:hidden property="targetcde_tree"/>
										<html:text property="targetcde_tree_disp" size="25" readonly="true"></html:text>
										<input type="button" name="locate" value="定 位" class="text_white" onclick="locate_dict_window('<%=request.getContextPath() %>','tree','targetcde_tree,targetcde_tree_disp');"/>
									</td>
								</tr>
                               <tr   style="display:none" id="user_sel_4">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>对应码表：
									</td>
									<td bgcolor="F6F9FF">
                                        <html:text property="targetcdehname" styleClass="text_white" size="25"/>
										<html:hidden  property="targetcdeh"/>
										<input type="button" name="locate" value="定 位" class="text_white" onclick="locate_dict_window('<%= request.getContextPath() %>','dict','targetcdeh,targetcdehname');"/>
									</td>
								</tr>
								<tr style="display:none" id="user_sel_8">
									<td>
										是否显示键值：
									</td>
									<td>
									  <html:radio property="keyvisible" value="1">是</html:radio>
                                      <html:radio property="keyvisible" value="0">否</html:radio>
									</td>
								</tr></table>
						</div>
		</html:form>
		</div>
	</BODY>
	<script>
	changeDefault();
	//document.forms[0].dispname.focus(); 
	</script>
</HTML>
