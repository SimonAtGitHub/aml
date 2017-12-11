<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312"/>
		<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
	<script language="JavaScript">
	function dosubmit(theUrl){
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	}
	function checkForm(theUrl){
	    var errMsg ="";
	     
	    
	    if(getLength(trim(document.forms[0].dblinkname.value))==0){
	        errMsg+="连接名称不能为空！";
	        document.forms[0].dblinkname.focus();
	    }
	    else if(getLength(trim(document.forms[0].dburl.value))==0){
	        errMsg+="URL不能为空！";
	        document.forms[0].dburl.focus();
	    } 
	    else if(checkChinese(document.forms[0].dburl.value)){
	        errMsg+="URL不能含有双字节字符！";
	        document.forms[0].dburl.focus();
	    } 
	    <%--else if (getLength(document.forms[0].dbuser.value) == 0) {
			errMsg += "用户名不能为空！";
			document.forms[0].dbuser.focus();
		}   
	    else if (getLength(document.forms[0].dbuser.value) > 32) {
			errMsg += "用户名不能大于32个字符！";
			document.forms[0].dbuser.focus();
		}else if (getLength(document.forms[0].dbpass.value) == 0) {
			errMsg += "密码不能为空！";
			document.forms[0].dbpass.focus();
		}
		else if (getLength(document.forms[0].dbpass.value) > 32) {
			errMsg += "密码不能大于32个字符！";
			document.forms[0].dbpass.focus();
		}
		else if (checkChinese(document.forms[0].dbpass.value)) {
			errMsg += "密码不能含有双字节字符！";
			document.forms[0].dbpass.focus();
		}--%>
	    //显示序号
	    else if(getLength(document.forms[0].dispseq.value)==0){
	        errMsg+="显示序号不能为空！";
	        document.forms[0].dispseq.focus();
	    }
	    else if(document.forms[0].dispseq.value.replace(/[\d+]/ig,"").length>0){
	    	errMsg+="显示序号必须为数字";
	        document.forms[0].dispseq.focus();
	    }
	    else if (getLength(document.forms[0].itablespace.value) > 32) {
			errMsg += "表空间不能大于32个字符！";
			document.forms[0].itablespace.focus();
		}else if (getLength(document.forms[0].indexname.value) > 32) {
			errMsg += "索引空间不能大于32个字符！";
			document.forms[0].indexname.focus();
		}
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	</script>
</head>

<body leftmargin="0" topmargin="0">
	<html:form action="/dblink/metadata_link_modify_do" method="POST">
	<input type="hidden" name="dblinkkey_old" value="<bean:write name="T01_db_linkActionForm" property="dblinkkey"/>" />
		<div id="main">
			<!-- conditions --> 
			  <div class="conditions">
				<div class="awp_wrap">
				  <!-- 标题区域 -->
				    <div class="cond_t">
					  <span>内部数据库连接  - 新 建</span>
					  <span class="buttons">
					   <a href="#" onclick="dosubmit('metadata_link_list.do');"><img src="../../images/blue/b_back.png" />返回</a>
					  </span>
					</div>
				</div>
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class="cond_c2">
		  			<table border="0" cellpadding="0" cellspacing="0">
						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>Spring注入ID：
							</td>
							<td >
								<html:text property="dblinkkey" styleClass="text_white" size="32" />
							</td>
						</tr>

						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>连接名称：
							</td>
							<td >
								<html:text property="dblinkname" styleClass="text_white" size="32" />

							</td>
						</tr>

						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>显示序号：
							</td>
							<td >
								<html:text property="dispseq" styleClass="text_white" size="20" />
							</td>
						</tr>

						<tr >
							<td height="22" align="right" >
								<FONT color="#ff0000">*</FONT>数据库类型：
							</td>
							<td >
								<html:select property="dbtype">
									<html:options collection="link_typeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>


						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>URL：
							</td>
							<td >
								<html:text property="dburl" styleClass="text_white" size="64" />
							</td>
						</tr>

						<%--<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>用户名：
							</td>
							<td >
								<html:text property="dbuser" styleClass="text_white" size="32" />
								(无以空格代替)
							</td>
						</tr>

						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>密码：
							</td>
							<td >
								<html:text property="dbpass" styleClass="text_white"
									size="32" />
								(无以空格代替)
							</td>
						</tr>

						--%>
						<tr >
							<td height="22" align="right" >
								<FONT color="#ff0000">*</FONT>状态：
							</td>
							<td >
								<html:select property="flag">
									<html:options collection="stsMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr >
							<td  >
								表空间：
							</td>
							<td >
								<html:text property="itablespace" styleClass="text_white" size="32" />
							</td>
						</tr>
						<tr >
							<td  >
								索引空间：
							</td>
							<td >
								<html:text property="indexname" styleClass="text_white" size="32" />
							</td>
						</tr>
						<tr >
							<td  >
								描述：
							</td>
							<td >
								<html:textarea property="des" rows="4" cols="60"
									styleClass="text_white"></html:textarea>
							</td>
						</tr>
						<tr >
							<td  >
							</td>
							<td >
								<html:button property="button" styleClass="in_button1" value="提  交"
									onclick="checkForm('metadata_link_modify_do.do')" />
								<html:reset styleClass="in_button1" value="重  填" />
							</td>
						</tr>
					</table>
				</div>	
			</div>
		</div>
	</html:form>
</body>
</html>