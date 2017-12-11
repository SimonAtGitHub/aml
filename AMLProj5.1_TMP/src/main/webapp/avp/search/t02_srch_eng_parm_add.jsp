<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%String contextPath = request.getContextPath(); %>
<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gbk">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>添加输入参数</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
  		<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
 	    <script src="<%=contextPath%>/js/load_window.js"></script>
		<script language="JavaScript">
		/** 提交 */
		function add(theUrl){
				var result=checkform();
				if(result){
		       		document.forms[0].action=theUrl;
		        	document.forms[0].submit();
				}
				return false;
		}
		/** 返回 */
      function goBacks(theUrl){
      	 document.forms[0].action=theUrl;
		 document.forms[0].submit();
      
      }
      /** 输入类型选择后触发*/
      	function chgInParmType(){
	    var sel_type = document.getElementsByName("parmcate");
		var sys_disp = document.getElementById('sys_sel');
		var user_disp_1 = document.getElementById('user_sel_1');
		var user_disp_3 = document.getElementById('user_sel_3');
		var user_disp_2 = document.getElementById('user_sel_2');
		var user_sel_4 =  document.getElementById('user_sel_4');
		var user_disp_tree = document.getElementById('user_sel_tree');
		//var user_disp_5 = document.getElementById('user_sel_5');
		//var user_disp_6 = document.getElementById('user_sel_6');
		var user_disp_7 = document.getElementById('user_sel_7');
		var user_disp_8 = document.getElementById('user_sel_8');

		var sel_type_value = sel_type[0].value;
		if(sel_type_value=="1"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			user_disp_tree.style.display='none';
			//user_disp_5.style.display='none';
			//user_disp_6.style.display='none';
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
			//user_disp_5.style.display='none';
			//user_disp_6.style.display='none';
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
			//user_disp_5.style.display='none';
			//user_disp_6.style.display='none';
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
			//user_disp_5.style.display='block';
			//user_disp_6.style.display='block';
			user_disp_7.style.display='none';
			user_disp_8.style.display='block';
			changeOrganRightType();
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
    // 平台机构权限设定
	var oOption = document.createElement("<option value='pfm'><option>");
	function changeOrganRightType() {
		var oSelect = document.forms[0].systemflag;
		if (document.forms[0].sysinparmkey_right.value == '401') {
			document.getElementById("user_sel_6").style.display="none";
			if (!oSelect.contains(oOption)) {
				document.forms[0].systemflag.add(oOption);
			}
			oSelect.selectedIndex = oOption.index;
		} else {
			document.getElementById("user_sel_6").style.display="";
			if (oSelect.contains(oOption)) {
				oSelect.remove(oOption.index);
			}
		}
	}

</script>
	</head>
	<body>
		<div id="content">
			<html:form method="post" action="/search/t02_srch_eng_parm_add.do">
				<html:hidden property="srchengkey"/>
				<div class='awp_title'>
					<table>
						<tr>
							<td width="23%"><span class="awp_title_td2">视图管理 - 定义视图参数</span></td>
							<td align="right">
								<input type=button value="保 存" onClick="add('t02_srch_eng_parm_add_do.do')">
								<input type="button" value="返 回" onclick="goBacks('t02_srch_eng_parm_list.do');">   
							</td>
						</tr>
					</table>
				</div>

				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<div class="awp_detail">
					<table>
						<tr>
							<td>
								<font color="#FF0000">*</font>显示名称：
							</td>
							<td>
								<html:text property="parmname" minlength="1" maxlength="64" warning="显示名称"/>（最多32个汉字）
							</td>
						</tr>
						<tr>
							<td>
								<font color="#FF0000">*</font>参数输入类型：
							</td>
							<td>
								<html:select property="parmcate" onclick="chgInParmType()">
								<html:options collection="cateMap" property="label"
									labelProperty="value" />
							</html:select>
							</td>
						</tr>
						<tr style="display:block" id="sys_sel" >
									<td   >
										<font color="#FF0000">*</font>系统定义输入参数：
									</td>
									<td >
										<html:select property="sysinparmkey_sys"  style="width:160">
							              <html:options collection="sysinparmkeyMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

								<tr   style="display:none" id="user_sel_1">
									<td   >
										<font color="#FF0000">*</font>定位输入类型：
									</td>
									<td >
										<html:select property="sysinparmkey_user"  style="width:160"  onclick="chgInParmTree()" >
							              <html:options collection="parmintypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
									<tr   style="display:none" id="user_sel_3">
									<td   >
										<font color="#FF0000">*</font>码表输入类型：
									</td>
									<td >
										<html:select property="sysinparmkey_user_m"  style="width:160">
							              <html:options collection="parmtypehashMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr   style="display:none" id="user_sel_2">
									<td   >
										<font color="#FF0000">*</font>对应定位：
									</td>
									<td >
                                        <html:select property="tagetcod" style="width:400" >
											<html:options collection="locationcacheMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								<tr   style="display:none" id="user_sel_tree">
									<td   >
										<font color="#FF0000">*</font>对应树定位：
									</td>
									<td >
                                        <html:select property="targetcde_tree" style="width:400" >
											<html:options collection="user_sel_treeMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
                               <tr   style="display:none" id="user_sel_4">
									<td   >
										<font color="#FF0000">*</font>对应码表：
									</td>
									<td >
										<html:text property="targetcdehname"  size="25"/>
										<input type="hidden" name="targetcdeh"/>
										<input type="button" name="locate" value="定 位" class="text_white" onclick="locate_pop_window('<%= request.getContextPath() %>','v00_categoryLocation','radio','forms[0]','targetcdeh,targetcdehname','');"/>
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
						</tr>
						<tr style="display:none" id="user_sel_7">
							<td>
								是否必输：
							</td>
							<td>
								<html:select property="isness">
								<html:options collection="isnessMap" property="label"
									labelProperty="value" />
							</html:select>
							</td>
						</tr>
						
						<tr>
							<td>
								<font color="#FF0000">*</font>显示长度：
							</td>
							<td>
								<html:text property="displen" styleClass="awp_number" minlength="1" maxlength="6" warning="显示长度" />（最多6位数字）
							</td>
						</tr>
						
						
						<tr>
							<td>
								显示序号：
							</td>
							<td>
								<html:text property="dispseq" styleClass="awp_number" minlength="0" maxlength="3" warning="显示序号" />（最多3位数字）
							</td>
						</tr>
						
						<tr>
							<td>
								<font color="#FF0000">*</font>参数数据类型：
							</td>
							<td>
								<html:select property="parmtype">
								<html:options collection="typeMap" property="label"
									labelProperty="value" />
							</html:select>
							</td>
						</tr>
						
						
						<tr>
							<td>
								最大输入长度：
							</td>
							<td>
								<html:text property="maxlen" styleClass="awp_number" minlength="0" maxlength="6" warning="最大输入长度"/>（最多6位数字）
							</td>
						</tr>
						
						<tr>
							<td>
								最小输入长度：
							</td>
							<td>
								<html:text property="minlen" styleClass="awp_number" minlength="0" maxlength="6" warning="最小输入长度"/>（最多6位数字）
							</td>
						</tr>
						
						
						<tr>
							<td>
								错误信息提示：<br>（最多128个汉字）
							</td>
							<td><html:textarea property="warning"  rows="6"  cols="80" minlength="0" maxlength="256" warning="错误信息提示"/>
							</td>
						</tr>
						<tr>
							<td>
								描述：<br>（最多128个汉字）
								<br>
							</td>
							<td>
								<html:textarea property="parmdes" 
									rows="6" cols="80" minlength="0" maxlength="256" warning="描述" />
								<br>
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>
<script type="text/javascript">
		  chgInParmType();
		  document.forms[0].parmname.focus(); 
		</script>
	</body>
</html>
