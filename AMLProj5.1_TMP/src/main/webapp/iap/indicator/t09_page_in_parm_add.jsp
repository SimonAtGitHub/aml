<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/avpfunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
	//码表单选
	function locate_dict_window(load_page_path ,type,localset){	
		 var whole_path = load_page_path+'/platform/dict/location_window_dict.do?newsearchflag=1&type='+type+'&localset='+localset;
		 var top =  (window.screen.availHeight-30-400)/2;
		 var left = (window.screen.availWidth-10-750)/2;
	     var	property = 'height=650, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	     window.open(whole_path,'',property);     
	}	
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	function checkForm(theUrl){
	   var errMsg ="";
	   var sel_type = document.getElementsByName("parmtype");
	   var sel_type_value = sel_type[0].value;
        
    if(getLength(document.forms[0].dispname.value)==0){
        errMsg+="显示名称不能为空！";
        document.forms[0].dispname.focus();    
    }else if(getLength(document.forms[0].dispname.value)>64){
        errMsg+="显示名称不能大于32个汉字！";
        document.forms[0].dispname.focus(); 
    }
    else if(getLength(document.forms[0].displen.value) == 0){
        errMsg+="显示长度不能为空！";
        document.forms[0].displen.focus();   
    }
     else if(getLength(document.forms[0].displen.value)>10){
        errMsg+="显示长度不能大于10位！";
        document.forms[0].displen.focus();   
    }else  if(getLength(document.forms[0].dispseq.value)>10){
          errMsg+="显示序号不能大于10位！";
          document.forms[0].dispseq.focus();   
    }else  if(getLength(document.forms[0].maxlen.value)>6){
        errMsg+="最大长度不能大于6位！";
        document.forms[0].maxlen.focus();   
    }
    
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }
    
     if(getLength(document.forms[0].minlen.value)>6){
        errMsg+="最小长度不能大于6位！";
        document.forms[0].minlen.focus();  
        alert(errMsg);
        return false;      
    }
    
    if(getLength(document.forms[0].des.value)>256){
        errMsg+="描述不能大于128个汉字！";
        document.forms[0].des.focus();  
         alert(errMsg);
        return false;  
    } 
    
    if(getLength(document.forms[0].warning.value)>256){
        errMsg+="错误信息提示不能大于128个汉字！";
        document.forms[0].des.focus();
         alert(errMsg);
        return false;    
    } 
    

    
    if(parseInt(document.forms[0].maxlen.value)<parseInt(document.forms[0].minlen.value)){
       // alert(document.forms[0].maxlen.value+'==========small'+document.forms[0].minlen.value);
        errMsg+="最大长度不能小于最小长度！";
        document.forms[0].maxlen.focus();
        alert(errMsg);
        return false;
    }
    	if(sel_type_value=="2"){
		    var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            
            //树定位
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'| sysinparmkey_user_temp_value == '250'){
            	 if(getLength(document.forms[0].targetcde_tree.value)==0){
		             errMsg+="对应定位树不能为空！";
		             //document.forms[0].targetcde_tree.focus(); 
		              alert(errMsg);
		            return false;   
		            }
            }else{
	            //列表定位  
				 if(getLength(document.forms[0].targetcde.value)==0){
		             errMsg+="对应定位不能为空！";
		            // document.forms[0].targetcde.focus(); 
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
		var user_disp_5 = document.getElementById('user_sel_5');
		var user_disp_6 = document.getElementById('user_sel_6');
		var user_disp_7 = document.getElementById('user_sel_7');
		var user_disp_8 = document.getElementById('user_sel_8');

		var sel_type_value = sel_type[0].value;
		
		if(sel_type_value=="1"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='none';
			
			sys_disp.style.display='block';
		}
        if(sel_type_value=="2"){
            var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            //树定位
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240' || sysinparmkey_user_temp_value == '250'){
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
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='block';
		}
	   if(sel_type_value=="3"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='block';
			user_sel_4.style.display='block';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none';
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='block';
		}
		if(sel_type_value=="4"){
		    user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='block';
			user_disp_6.style.display='block';
			user_disp_7.style.display='none';
			user_disp_8.style.display='block';
		}
		if(sel_type_value=="5"){
		    user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='block';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='none';
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
</SCRIPT>
	</HEAD>
 <BODY leftmargin="0" topmargin="0" >
 <div id="main">
 <html:form method="post" action="/t09_page_in_parm/t09_page_in_parm_add.do">
 	  	<html:hidden property="indickey"/>
		<html:hidden property="parmkey" name="t09_page_in_parmActionForm"/>
		<div class="conditions">			
			<div class='cond_t'>
			   <span>指标管理 - 新 建</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onClick="checkForm('t09_page_in_parm_add_do.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
							 	
				<a href="javascript:void(0);" onClick="dosubmit('t09_page_in_parm_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
			   </span>
				</div> 
		</div>	
			
			<div class='cond_c2'>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr >
									<td >
										<font color="#FF0000">*</font>参数编码：
									</td>
									<td bgcolor="F6F9FF" width="70%">
										p_<html:text property="sysinparmcd" size="25" readonly="true" />
									</td>
								</tr>
								<tr>
									<td>
										<font color="#FF0000">*</font>显示名称：
									</td>
									<td>
										<html:text property="dispname"  size="25" />（最多32个汉字）
									</td>
								</tr>
								<tr >
									<td   nowrap>
										<font color="#FF0000">*</font>输入参数类型：
									</td>
									<td >
										<html:select property="parmtype" onclick="chgInParmType()"  style="width:160">
							                 <html:options collection="parmtypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

								<tr   style="display:block" id="sys_sel" >
									<td  nowrap >
										<font color="#FF0000">*</font>系统定义输入参数：
									</td>
									<td >
										<html:select property="sysinparmkey_sys"  style="width:160">
							              <html:options collection="sysinparmkeyMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

								<tr   style="display:none" id="user_sel_1">
									<td nowrap  >
										<font color="#FF0000">*</font>定位输入类型：
									</td>
									<td >
										<html:select property="sysinparmkey_user"  style="width:160"  onclick="chgInParmTree()" >
							              <html:options collection="parmintypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr style="display:none" id="user_sel_2">
									<td  nowrap >
										<font color="#FF0000">*</font>对应定位：
									</td>
									<td >
									    <html:hidden property="targetcde"/>
										<html:text property="targetcde_disp" size="25" readonly="true"></html:text>
										<a href="#" onclick="locate_dict_window('<%=request.getContextPath()%>','location','targetcde,targetcde_disp');" ><span class="cond_buttons"><img
													src="../../images/blue/b_location.png"/>定位</span> </a>
									</td>
								</tr>
									<tr   style="display:none" id="user_sel_3">
									<td  nowrap >
										<font color="#FF0000">*</font>码表输入类型：
									</td>
									<td >
										<html:select property="sysinparmkey_user_m"  style="width:160">
							              <html:options collection="parmtypehashMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								
								<tr   style="display:none" id="user_sel_tree">
									<td  nowrap >
										<font color="#FF0000">*</font>对应树定位：
									</td>
									<td >
										 <html:hidden property="targetcde_tree"/>
										<html:text property="targetcde_tree_disp" size="25" readonly="true"></html:text>
										<a href="#" onclick="locate_dict_window('<%=request.getContextPath()%>','tree','targetcde_tree,targetcde_tree_disp');"><span class="cond_buttons"><img
													src="../../images/blue/b_location.png" />定位</span>
									</td>
								</tr>
                               <tr   style="display:none" id="user_sel_4">
									<td  nowrap >
										<font color="#FF0000">*</font>对应码表：
									</td>
									<td >
										<html:text property="targetcdehname"  size="25"/>
										<input type="hidden" name="targetcdeh"/>
										<a href="#" onclick="locate_dict_window('<%=request.getContextPath()%>', 'dict', 'targetcdeh,targetcdehname');"><span class="cond_buttons"><img
													src="../../images/blue/b_location.png" />定位</span>
									</td>
								</tr>
								<tr style="display:none" id="user_sel_5">
									<td nowrap>
										<font color="#FF0000">*</font>权限选择类型：
									</td>
									<td>
										<html:select property="sysinparmkey_right"  style="width:160">
							              <html:options collection="rightorgMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr style="display:none" id="user_sel_8">
									<td nowrap>
										是否显示键值：
									</td>
									<td>
									  <html:radio property="keyvisible" value="1">是</html:radio>
                                      <html:radio property="keyvisible" value="0">否</html:radio>
									</td>
								</tr>
							    <tr style="display:none" id="user_sel_6">
									<td>
										<font color="#FF0000">*</font>源业务系统：
									</td>
									<td>
										<html:select property="systemflag"  style="width:160">
							              <html:options collection="systemflagMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr style="display:block" id="user_sel_7">
									<td>
										是否必输：
									</td>
									<td >
									 <html:radio property="isness" value="1">是</html:radio>
                                     <html:radio property="isness" value="0">否</html:radio>
									</td>
								</tr>
								<tr >
									<td  >
										<font color="#FF0000">*</font>显示长度：
									</td>
									<td >
										 <html:text property="displen"  size="25" styleClass="awp_number"></html:text>（最多10位数字）
									</td>
								</tr>
								<tr >
									<td>
										显示序号：
									</td>
									<td >
										<html:text property="dispseq"  size="25" styleClass="awp_number"/>（最多10位数字）
									</td>
								</tr>
							
								<tr >
									<td  >
										<font color="#FF0000">*</font>输入数据类型：
									</td>
									<td >
													<html:select property="indatatype"   style="width:160">
										              <html:options collection="indatatypeMap" property="label" labelProperty="value" />
									                </html:select>
									</td>
								</tr>
								<tr >
									<td   >
										最大输入长度：
									</td>
									<td  >
										<html:text property="maxlen"  size="25" styleClass="awp_number"/>（最多6位数字）
									</td>
								</tr>
								<tr >
									<td   >
										最小输入长度：
									</td>
									<td  >
										<html:text property="minlen"  size="25" styleClass="awp_number"/>（最多6位数字）
									</td>
								</tr>
								<tr >
									<td   >
										错误信息提示：<br>（最多128个汉字）
									</td>
									<td  > 
										 <html:textarea property="warning" cols="70" rows="4"></html:textarea>
									</td>
								</tr>
								<tr >
									<td>
										描述：<br>（最多128个汉字）
									</td>
									<td >
									   <html:textarea property="des" cols="70" rows="4"></html:textarea>
									</td>
								</tr>
							</table>
						</div>
						
						
						
		</html:form>
		</div>
		<script type="text/javascript">
		  chgInParmType();
		  document.forms[0].dispname.focus(); 
		</script>
	</BODY>
</HTML>
