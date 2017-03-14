<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		 <link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, type) {
		var errMsg = "";
		var isSub = false;
		if (type == 'back') {
			isSub = true;
		}
		if (isSub && errMsg == '') {
			document.forms[0].action = theUrl;
			document.forms[0].submit();

		} else {
			if (errMsg != '')
				alert(errMsg);
			return false;
		}
	}
	
		function checkForm(theUrl){
			
		
    var errMsg ="";
 	if(getLength(document.forms[0].dskey.value)==0){
        errMsg+="数据源编码不能为空！";
        document.forms[0].dskey.focus();
    }
 	 else if(checkChinese(document.forms[0].dskey.value)){
         errMsg+="数据源编码不能为双字节的字符！";
         document.forms[0].dskey.focus();
     }
    else if(getLength(document.forms[0].dskey.value)> 5){
        errMsg+="数据源编码不能多于5个字符！";
        document.forms[0].dskey.focus();
    }
    else if(getLength(trim(document.forms[0].dsname.value))==0){
        errMsg+="数据源名称不能为空！";
        document.forms[0].dsname.focus();  
    }
    else if(getLength(trim(document.forms[0].odsprefix.value))== 0){
        errMsg+="ODS数据表前缀不能为空！";
        document.forms[0].odsprefix.focus();
    }
    var isfile=document.getElementsByName("flagtype")[0].value;
	var islocal = document.getElementsByName("flaglocation")[0].value;
    if(isfile=="file" && islocal=="0"){
    	if(getLength(document.forms[0].filepath.value)==0){
    		errMsg+="文件路径不能为空！";
        	document.forms[0].filepath.focus();
    	}else if (getLength(document.forms[0].filepre.value)==0){
    		errMsg+="文件前缀不能为空！";
        	document.forms[0].filepre.focus();
    	}else if (getLength(document.forms[0].fileend.value)==0){
    		errMsg+="文件后缀不能为空！";
        	document.forms[0].fileend.focus();
    	}else if (getLength(document.forms[0].remotefilepath.value)==0){
    		errMsg+="远程路径不能为空！";
        	document.forms[0].remotefilepath.focus();
    	}
    }
    var isget=document.getElementsByName("isget")[0].value;
    var getmode=document.getElementsByName("getmode")[0].value;
    var fetchmethod=document.getElementsByName("fetchmethod")[0].value;
    //自己取
    if(isget=='1'){
	    if(getmode=='1'){//jdbc取
	       if(fetchmethod != '2'){
	    	if (getLength(document.forms[0].driver.value)==0){
	    		errMsg+="数据库的DRIVER不能为空！";
	        	document.forms[0].driver.focus();
	    	}
	    	else if(getLength(document.forms[0].url.value)==0){
	    		errMsg+="数据库的URL不能为空！";
	        	document.forms[0].url.focus();
	    	} 
	    	else if(getLength(document.forms[0].username.value)==0){
	    		errMsg+="数据库的USERNAME不能为空！";
	        	document.forms[0].username.focus();
	    	} 
	    	else if(getLength(document.forms[0].password.value)==0){
	    		errMsg+="数据库的PASSWORD不能为空！";
	        	document.forms[0].password.focus();
	    	}	    	 
	    	}
	    	else{
		    	if (getLength(document.forms[0].getmethod.value)==0){
		    		errMsg+="dblink不能为空！";
		        	document.forms[0].getmethod.focus();
		    	}
	    	}
	    }
	    if(getmode=='2'){//FTP取
	    	if (getLength(document.forms[0].ftp_url.value)==0){
	    		errMsg+="FTP的地址不能为空！";
	        	document.forms[0].ftp_url.focus();
	    	}
	    	else if(getLength(document.forms[0].ftp_username.value)==0){
	    		errMsg+="FTP的用户名不能为空！";
	        	document.forms[0].ftp_username.focus();
	    	} 
	    	else if(getLength(document.forms[0].ftp_password.value)==0){
	    		errMsg+="FTP的密码不能为空！";
	        	document.forms[0].ftp_password.focus();
	    	}
	    	else if(getLength(document.forms[0].loadcmdpath.value)==0){
	    		errMsg+="装载命令路径不能为空！";
	        	document.forms[0].loadcmdpath.focus();
	    	} 
	    	else if(getLength(document.forms[0].loadparam.value)==0){
	    		errMsg+="装载命令参数不能为空！";
	        	document.forms[0].loadparam.focus();
	    	} 
	    	else if (getLength(document.forms[0].dspath.value)==0){
	    		errMsg+="数据文件临时目录不能为空！";
	        	document.forms[0].dspath.focus();
		    }
		    else if (getLength(document.forms[0].workpath.value)==0){
		    		errMsg+="本地文件导入的工作目录不能为空！";
		        	document.forms[0].workpath.focus();
		    } 
	    }
    }//客户送
    else if(isget=='2'){
    	if(getLength(document.forms[0].putmode.value)==0){
    		errMsg+="送数方式不能为空！";
		    document.forms[0].putmode.focus();
    	}
    }
    var putmode=document.getElementsByName("putmode")[0].value;
    if(isget=='2' && putmode=='2'){
    	if (getLength(document.forms[0].dspath.value)==0){
	    		errMsg+="数据文件临时目录不能为空！";
	        	document.forms[0].dspath.focus();
	    }else if (getLength(document.forms[0].workpath.value)==0){
	    		errMsg+="本地文件导入的工作目录不能为空！";
	        	document.forms[0].workpath.focus();
	    }
    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{

			//提交前，把所用的下拉框的disabled 设为false；
			var selects = document.getElementsByTagName('select');
			for(var i = 0; i < selects.length; i++){
				selects[i].disabled = false;
			}

		   	
	   	 	document.forms[0].dsname.value=trim(document.forms[0].dsname.value);
	   	 	
	   	 	
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
}
		

		/** 1 - FTP自己取  / 2 - FTP客户送 / 3 - JDBC取  / 4 - DBLINK送 / 5 - DBLINK取  /**/
		function changEle(value){

			if(value){
				//隐藏所有的td
				displayAll();
			}
			
			if(value == '1'){
				isFtpGet();
			}else if(value == '2'){
				isFtpSend();
			}else if(value == '3'){
				isJdbc();
			}else if(value == '4'){
				isDblinkGet();
			}else if(value == '5'){
				isDblinkSend();
			}else {
				return false;
			}
	
		}
		function nodisableAll(){
			
			document.getElementsByName("flaglocation")[0].disabled = false;
			document.getElementsByName("flagtype")[0].disabled = false;
			document.getElementsByName("isget")[0].disabled = false;
			document.getElementsByName("getmode")[0].disabled = false;
			

			document.getElementsByName("putmode")[0].disabled = false;
			
			
	
			document.getElementsByName("fetchmethod")[0].disabled = false;
			
		}
		function displayAll(){
			
			document.getElementById("file_div").style.display = "none";
			document.getElementById("pemotefilepath").style.display = "none";
			document.getElementById("send").style.display = "none";
			document.getElementById("fetch").style.display = "none";
			document.getElementById("unload").style.display = "none";
			document.getElementById("data_type").style.display = "none";
			document.getElementById("jdbc_con").style.display = "none";
			document.getElementById("jdbc_dblink").style.display = "none";
			document.getElementById("ftp_con").style.display = "none";
			document.getElementById("filetype").style.display = "none";
			document.getElementById("load_param").style.display = "none";
			document.getElementById("load_path").style.display = "none";
			document.getElementById("unload_path").style.display = "none";
			document.getElementById("jdbc_form").style.display = "none";
			document.getElementById("dspath").style.display = "none";
			document.getElementById("workpath").style.display = "none";
		}
		function isFtpGet(){
			//远程 文件 自己取 ftp
			
			document.getElementsByName("flaglocation")[0].value = "0";
			document.getElementsByName("flaglocation")[0].disabled = true;

			document.getElementsByName("flagtype")[0].value = "file";
			document.getElementsByName("flagtype")[0].disabled = true;

			 
			document.getElementById("file_div").style.display = "";
			document.getElementById("pemotefilepath").style.display = "";

			document.getElementsByName("isget")[0].value = "1";
			document.getElementsByName("isget")[0].disabled = true;
			
			document.getElementById("fetch").style.display = "";
			document.getElementsByName("getmode")[0].value = "2";
			document.getElementsByName("getmode")[0].disabled = true;

			document.getElementById("ftp_con").style.display = "";
			document.getElementById("filetype").style.display = "";   
			document.getElementById("load_param").style.display = "";
			document.getElementById("load_path").style.display = "";
			document.getElementById("dspath").style.display = "";
			document.getElementById("workpath").style.display = "";		

		}

		function isFtpSend(){
			//本地 文件 客户送 ftp
			
			document.getElementsByName("flaglocation")[0].value = "1";
			document.getElementsByName("flaglocation")[0].disabled = true;

			document.getElementsByName("flagtype")[0].value = "file";
			document.getElementsByName("flagtype")[0].disabled = true;
			 
			document.getElementById("file_div").style.display = "";

			document.getElementsByName("isget")[0].value = "0";
			document.getElementsByName("isget")[0].disabled = true;

			document.getElementById("send").style.display = "";
			document.getElementsByName("putmode")[0].value = "2";
			document.getElementsByName("putmode")[0].disabled = true;

			document.getElementById("filetype").style.display = "";   
			document.getElementById("load_param").style.display = "";
			document.getElementById("load_path").style.display = "";
			document.getElementById("dspath").style.display = "";
			document.getElementById("workpath").style.display = "";		

		}

		function isJdbc(){
			//远程 表 自己取 jdbc
			
			//document.getElementsByName("flaglocation")[0].value = "0";
			//document.getElementsByName("flaglocation")[0].disabled = true;
			document.getElementsByName("flaglocation")[0].disabled = false;

			document.getElementsByName("flagtype")[0].value = "record";
			document.getElementsByName("flagtype")[0].disabled = true;

			document.getElementsByName("isget")[0].value = "1";
			document.getElementsByName("isget")[0].disabled = true;

			document.getElementById("fetch").style.display = "";
			document.getElementsByName("getmode")[0].value = "1";
			document.getElementsByName("getmode")[0].disabled = true;

			document.getElementById("unload").style.display = "";			
			document.getElementsByName("fetchmethod")[0].value = "1";
			document.getElementsByName("fetchmethod")[0].disabled = true;

			document.getElementById("data_type").style.display = "";
			document.getElementById("jdbc_con").style.display = "";
			
			document.getElementById("filetype").style.display = "";   
			document.getElementById("load_param").style.display = "";
			document.getElementById("load_path").style.display = "";
			document.getElementById("jdbc_form").style.display = "";			
			document.getElementById("dspath").style.display = "";
			document.getElementById("workpath").style.display = "";		

		}

		function isDblinkGet(){
			//本地 表 客户送 dblink
			
			document.getElementsByName("flaglocation")[0].value = "1";
			document.getElementsByName("flaglocation")[0].disabled = true;

			document.getElementsByName("flagtype")[0].value = "record";
			document.getElementsByName("flagtype")[0].disabled = true;

			document.getElementsByName("isget")[0].value = "0";
			document.getElementsByName("isget")[0].disabled = true;

			document.getElementById("send").style.display = "";
			document.getElementsByName("putmode")[0].value = "1";
			document.getElementsByName("putmode")[0].disabled = true;

			document.getElementById("fetch").style.display = "";
			document.getElementsByName("getmode")[0].value = "1";
			document.getElementsByName("getmode")[0].disabled = true;

<%--			document.getElementById("unload").style.display = "";			--%>
<%--			document.getElementsByName("fetchmethod")[0].value = "2";--%>
<%--			document.getElementsByName("fetchmethod")[0].disabled = true;--%>
<%--			--%>
<%--			document.getElementById("jdbc_dblink").style.display = "";--%>

		}

		function isDblinkSend(){
			//远程 表 自己取 dblink
			
			//document.getElementsByName("flaglocation")[0].value = "0";
			//document.getElementsByName("flaglocation")[0].disabled = true;
			document.getElementsByName("flaglocation")[0].disabled = false;
			
			document.getElementsByName("flagtype")[0].value = "record";
			document.getElementsByName("flagtype")[0].disabled = true;

			document.getElementsByName("isget")[0].value = "1";
			document.getElementsByName("isget")[0].disabled = true;

			document.getElementById("fetch").style.display = "";
			document.getElementsByName("getmode")[0].value = "1";
			document.getElementsByName("getmode")[0].disabled = true;

			document.getElementById("unload").style.display = "";			
			document.getElementsByName("fetchmethod")[0].value = "2";
			document.getElementsByName("fetchmethod")[0].disabled = true;
			
			document.getElementById("jdbc_dblink").style.display = "";

			document.getElementById("data_type").style.display = "";
			//document.getElementById("jdbc_con").style.display = "";			
			islocal_fun(document.getElementsByName("flaglocation")[0]);
		}
		function islocal_fun(obj){
			if(obj.value == '0'){
				document.getElementById("jdbc_con").style.display = "";
			}else{
				document.getElementById("jdbc_con").style.display = "none";
			}
		}
	
</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		
			<html:form action="/hpom/t18_datasource_add.do" method="POST">
			<div id='main'>
                <div class="conditions">
				    <!-- title -->
					<div class="cond_t">
					  <span>业务数据源设置 - 新建</span>
					  <span class="buttons">
					    <a href="#" onClick="checkForm('t18_datasource_add_do.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保 存</a>
						<a href="javascript:void(0);" onClick="dosubmit('t18_datasource_list.do','back');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					  
					  </span>
					</div>
				
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<div class='cond_c2'>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>数据源编码：
							</td>
							<td>
								<html:text property="dskey" styleClass="text_white" size="30" />
							</td>
						</tr>
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>数据源名称：
							</td>
							<td>
								<html:text property="dsname" styleClass="text_white" size="30" />
							</td>
						</tr>

						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>ODS数据表前缀：
							</td>
							<td>
								<html:text property="odsprefix" styleClass="text_white" size="30" />	
							</td>
						</tr>
						
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>数据源类别：
							</td>
							<td>
								<input type="hidden" id="dst" value="<bean:write name="t18_datasourceActionForm" property="dstype"/>"/>
								
								<html:radio property="dstype" value="1" onclick="changEle(this.value)">FTP自己取</html:radio>
								<html:radio property="dstype" value="2" onclick="changEle(this.value)">FTP客户送</html:radio>
								<html:radio property="dstype" value="3" onclick="changEle(this.value)">JDBC取</html:radio>
								<html:radio property="dstype" value="4" onclick="changEle(this.value)">DBLINK送</html:radio>
								<html:radio property="dstype" value="5" onclick="changEle(this.value)">DBLINK取</html:radio>
							</td>
						</tr>
						
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>标识文件位置：
							</td>
							<td>
								<html:select property="flaglocation"   onchange="islocal_fun(this)" disabled="">
									<html:options collection="flaglocationMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>

						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>标识类别：
							</td>
							<td>
								<html:select property="flagtype" onchange="isfile(this)">
									<html:options collection="flagtypeMap" property="label"
										labelProperty="value" />
								</html:select>
								<div style="display: none" id="file_div">
									<font color="red">FILE:{本地文件路径} /{文件前缀}YYYYMMDD{文件后缀}</font>
									<br>
									file：
									<html:text property="filepath" styleClass="text_white" size="10" /> 
									/
									<html:text property="filepre" styleClass="text_white" size="6" /> 
									YYYYMMDD
									<html:text property="fileend" styleClass="text_white" size="6" /> 
								</div>
								<div style="display: none" id="pemotefilepath">
									远程文件路径：
									<html:text property="remotefilepath" styleClass="text_white" size="30" /> 
								</div>
							</td>
						</tr>

						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>是否需要取数：
							</td>
							<td>
								<html:select property="isget" onchange="isFetch(this)">
									<html:options collection="isgetMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>

						<tr id="send" style="display: none">
							<td noWrap>
								<font color="#FF0000">*</font>送数方式：
							</td>
							<td>
								<html:select property="putmode" onchange="isods(this)">
									<html:options collection="putmodeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr id="fetch">
							<td noWrap>
								<font color="#FF0000">*</font>取数方式：
							</td>
							<td>
								<html:select property="getmode" onchange="iscon(this)">
									<html:options collection="getmodeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr  id="unload">
							<td noWrap>
								<font color="#FF0000">*</font>卸载方式：
							</td>
							<td>
								<html:select property="fetchmethod" onchange="isdblink(this)">
									<html:options collection="fetchMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr id="data_type">
							<td noWrap>
								<font color="#FF0000">*</font>数据源数据库类型：
							</td>
							<td>
								<html:select property="dbtype">
									<html:options collection="dbtypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>

						<tr id="jdbc_con">
							<td noWrap>
								<font color="#FF0000">*</font>取数连接信息：
							</td>
							<td>
								&nbsp;&nbsp;DRIVER：
								<html:text property="driver" styleClass="text_white" size="30" />
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL：
								<html:text property="url" styleClass="text_white" size="30" />
								<br>
								USERNAME：
								<html:text property="username" styleClass="text_white" size="30" />
								<br>
								PASSWORD：
								<html:password property="password" styleClass="text_white" size="30" />
								<br>
								数据库别名：
								<html:text property="serveralias" styleClass="text_white" size="28" />
								<br>
								<font color="red">ORACLE数据库：
									DRIVER:oracle.jdbc.driver.OracleDriver
									URL:jdbc:oracle:thin:@10.6.50.246:1521:awp <br> DB2数据库：
									DRIVER:com.ibm.db2.jcc.DB2Driver
									URL:jdbc:db2://10.6.50.246:50000/awp
								</font>
							</td>
						</tr>
						<tr id="jdbc_dblink" style="display: none">
							<td noWrap>
								<font color="#FF0000">*</font>dblink：
							</td>
							<td>
								<html:text property="getmethod" styleClass="text_white" size="10" />
							</td>
						</tr>

						<tr id="ftp_con" style="display: none">
							<td noWrap>
								<font color="#FF0000">*</font>取数连接信息：
							</td>
							<td>
								<font color="red">*FTP://IP地址:用户名:密码</font>
								<br>
								FTP://
								<html:text property="ftp_url" styleClass="text_white" size="10" />
								:
								<html:text property="ftp_username" styleClass="text_white" size="6" />
								:
								<html:text property="ftp_password" styleClass="text_white" size="6" />
								远端路径 :
								<html:text property="ftp_path" styleClass="text_white" size="10" /> 
							</td>
						</tr>
						<tr id="filetype">
							<td noWrap>
								<font color="#FF0000">*</font>文件扩展名：
							</td>
							<td>
								<html:select property="db2filetype" >
									<html:options collection="filetypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr id="load_param" style="display: none">
							<td noWrap>
								<font color="#FF0000">*</font>装载命令参数：
							</td>
							<td>
								<html:text property="loadparam" styleClass="text_white" size="30" />&nbsp;<font color="#FF0000">COLDEL|;COMMITCOUNT 50000;TIMESTAMPFORMAT="yyyy-mm-dd hh:mm:s"</font>
							</td>
						</tr>
						<tr id="load_path" style="display: none">
							<td noWrap>
								<font color="#FF0000">*</font>装载命令路径：
							</td>
							<td>
								<html:text property="loadcmdpath" styleClass="text_white" size="30" />&nbsp;<font color="#FF0000">例：d:/temp/cmdpath</font>
							</td>
						</tr>
						<tr id="unload_path" style="display: none">
							<td noWrap>
								<font color="#FF0000">*</font>卸载命令路径：
							</td>
							<td>
								<html:text property="fetchcmdpath" styleClass="text_white" size="30" />&nbsp;<font color="#FF0000">例：d:/temp/cmdpath</font>
							</td>
						</tr>
						<tr id="jdbc_form">
							<td noWrap>
								<font color="#FF0000">*</font>单页大小：
							</td>
							<td>
								<html:text property="totalcount" styleClass="text_white" size="30" />
							</td>
						</tr>

						<tr id="dspath">
							<td noWrap>
								<font color="#FF0000">*</font>数据文件临时目录：
							</td>
							<td>
								<html:text property="dspath" styleClass="text_white" size="30" />&nbsp;<font color="#FF0000">例：d:/temp/datapath</font>
							</td>
						</tr>

						<tr id="workpath">
							<td noWrap>
								<font color="#FF0000">*</font>本地文件导入的工作目录：
							</td>
							<td>
								<html:text property="workpath" styleClass="text_white" size="30" />&nbsp;<font color="#FF0000">例：d:/workpath</font>
							</td>
						</tr>
						<tr>
							<td noWrap>
								备注：
							</td>
							<td>
								<html:textarea property="des" rows="3" cols="70" styleClass="text_white"></html:textarea>
							</td>
						</tr>

					</TABLE>
					</div>
					</div>
					</div>
			</html:form>
		
	</BODY>
	<script type="text/javascript">
		displayAll();
		changEle(document.getElementById('dst').value);
	</script>
</HTML>
