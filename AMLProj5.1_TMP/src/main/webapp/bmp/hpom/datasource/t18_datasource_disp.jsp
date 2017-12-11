<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
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
		
		document.getElementsByName("flaglocation")[0].value = "0";
		document.getElementsByName("flaglocation")[0].disabled = true;

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
		
		document.getElementsByName("flaglocation")[0].value = "0";
		document.getElementsByName("flaglocation")[0].disabled = true;

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
		document.getElementById("jdbc_con").style.display = "";			
		
	}
	
	function dosubmit(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	}
    </SCRIPT>
</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/hpom/t18_datasource_disp.do" method="post">
		<div id="main">
		    <div class="conditions">
				    <!-- title -->
					<div class="cond_t">
					  <span>业务数据源设置 - 查看</span>
					  <span class="buttons">
						<a href="javascript:void(0);" onClick="dosubmit('t18_datasource_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
					  
					  </span>
					</div>
					
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="cond_c2">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							数据源编码：
						</td>
						<td>
							<bean:write name="t18_datasource" property="dskey" scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							数据源名称：
						</td>
						<td>
							<bean:write name="t18_datasource" property="dsname" scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							ODS数据表前缀：
						</td>
						<td>
							<bean:write name="t18_datasource" property="odsprefix" scope="request" />
						</td>
					</tr>					
					<tr>
						<td>
							标识文件位置：
						</td>
						<td>
							<bean:write name="t18_datasource" property="flaglocation_disp" scope="request" />
							<input type="hidden" name="flaglocation" value="<bean:write name="t18_datasource" property="flaglocation"/>"/>
						</td>
					</tr>
					<tr>
						<td>
							标识类别：
						</td>
						<td>
							<bean:write name="t18_datasource" property="flagtype_disp" scope="request" />
							<input type="hidden" name="flagtype" value="<bean:write name="t18_datasource" property="flagtype"/>"/>
								<div style="display: none" id="file_div">
									<font color="red">FILE:{文件路径} /{文件前缀}YYYYMMDD{文件后缀}</font>
									<br>
									file：
									<bean:write name="t18_datasource" property="filepath" scope="request" />
									/
									<bean:write name="t18_datasource" property="filepre" scope="request" />
									YYYYMMDD
									<bean:write name="t18_datasource" property="fileend" scope="request" />
								</div>
								<div style="display: none" id="pemotefilepath">
									远程路径：
									<bean:write name="t18_datasource" property="remotefilepath" scope="request" />
								</div>
						</td>
					</tr>
					<tr>
						<td>
							是否需要取数：
						</td>
						<td>
							<bean:write name="t18_datasource" property="isget_disp" scope="request" />
							<input type="hidden" name="isget" value="<bean:write name="t18_datasource" property="isget"/>"/>
						</td>
					</tr>
					<tr id="fetch">
						<td>
							取数方式：
						</td>
						<td>
							<bean:write name="t18_datasource" property="getmode_disp" scope="request" />
							<input type="hidden" name="getmode" value="<bean:write name="t18_datasource" property="getmode"/>"/>
						</td>
					</tr>
					<tr id="unload">
							<td>
								卸载方式：
							</td>
							<td>
								<bean:write name="t18_datasource" property="fetchmethod_disp" scope="request" />
								<input type="hidden" name="fetchmethod" value="<bean:write name="t18_datasource" property="fetchmethod"/>"/>
							</td>
						</tr>
					<tr id="send" style="display: none">
						<td>
							送数方式：
						</td>
						<td>
							<bean:write name="t18_datasource" property="putmode_disp" scope="request" />
							<input type="hidden" name="putmode" value="<bean:write name="t18_datasource" property="putmode"/>"/>
						</td>
					</tr>
					<tr id="data_type">
						<td>
							数据源数据库类型：
						</td>
						<td>
							<bean:write name="t18_datasource" property="dbtype_disp" scope="request" />
						</td>
					</tr>
					<tr id="jdbc_con" style="display:none">
						<td>
							取数连接信息：
						</td>
						<td>
							&nbsp;&nbsp;DRIVER：
								<bean:write name="t18_datasource" property="driver" scope="request" />
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL：
								<bean:write name="t18_datasource" property="url" scope="request" />
								<br>
								USERNAME：
								<bean:write name="t18_datasource" property="username" scope="request" />
								<br>
								PASSWORD：
								<bean:write name="t18_datasource" property="password" scope="request" />
								<br>
								数据库别名：
								<bean:write name="t18_datasource" property="serveralias" scope="request" />
						</td>
					</tr>
					<tr id="jdbc_dblink" style="display: none">
							<td noWrap>
								dblink：
							</td>
							<td>
								<bean:write name="t18_datasource" property="getmethod" scope="request" />
							</td>
						</tr>
					<tr id="ftp_con" style="display:none">
						<td>
							取数连接信息：
						</td>
						<td>  	
						<font color="red">*FTP://IP地址:用户名:密码</font>
						<br>
						FTP://				
						<bean:write name="t18_datasource" property="ftp_url" scope="request" />
						:
						<bean:write name="t18_datasource" property="ftp_username" scope="request" />
						:
						<bean:write name="t18_datasource" property="ftp_password" scope="request" />
						<br>			
						</td>
					</tr>
					<tr id="filetype">
						<td>
							文件类型：
						</td>
						<td>
							<bean:write name="t18_datasource" property="db2filetype_disp" scope="request" />
							<input type="hidden" name="db2filetype" value="<bean:write name="t18_datasource" property="fetchmethod"/>"/>
						</td>
					</tr>
					<tr id="load_param" style="display: none">
							<td noWrap>
							</td>
							<td>
								<bean:write name="t18_datasource" property="loadparam" scope="request" />
							</td>
						</tr>
					<tr id="load_path" style="display: none">
							<td noWrap>
								装载命令路径：
							</td>
							<td>
								<bean:write name="t18_datasource" property="loadcmdpath" scope="request" />
							</td>
					</tr>
					<tr id="unload_path" style="display: none">
						<td noWrap>
							卸载命令路径：
						</td>
						<td>
							<bean:write name="t18_datasource" property="fetchcmdpath" scope="request" />
						</td>
					</tr>
					<tr id="jdbc_form">
						<td>
							单页大小：
						</td>
						<td>
							<bean:write name="t18_datasource" property="totalcount"  scope="request" />
						</td>
					</tr>
					<tr id="dspath">
						<td>
							数据文件临时目录：
						</td>
						<td>
							<bean:write name="t18_datasource" property="dspath" scope="request" />
						</td>
					</tr>
					<tr id="workpath">
						<td>
							本地文件导入的工作目录：
						</td>
						<td>
							<bean:write name="t18_datasource" property="workpath"  scope="request" />
						</td>
					</tr>	
					<tr>
						<td>
							备注：
						</td>
						<td>
							<bean:write name="t18_datasource" property="des" scope="request" />
						</td>
					</tr>				
				</table>
			</div>
			
			<input type="hidden" id="dst" value="<bean:write name="t18_datasourceActionForm" property="dstype"/>"/>
			</div>
			</div>
		</html:form>
	</BODY>
	<script type="text/javascript">
	displayAll();
	changEle(document.getElementById('dst').value);
	</script>
</html:html>
