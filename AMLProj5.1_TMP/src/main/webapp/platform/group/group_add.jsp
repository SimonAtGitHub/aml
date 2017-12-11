<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/avpfunc.js"></script>
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script language="JavaScript" src="../../js/basefunc_report.js"></script>
	<script type="text/javascript" src="../../js/load_window.js"></script>
	<script type="text/javascript" src="../../js/jquery.validator.js"></script>
	
		<SCRIPT LANGUAGE="JavaScript">
			function dosubmit(theUrl){
			    document.forms[0].action=theUrl;
			    document.forms[0].submit();
			}
			function checkForm(theUrl){
			    var errMsg ="";
			    if(document.forms[0].groupname.value.indexOf('\'')!=-1||document.forms[0].groupname.value.indexOf('’')!=-1||document.forms[0].groupname.value.indexOf('‘')!=-1){
			    	 errMsg+="组名不能有特殊字符(如'’)！";
			    	 document.forms[0].groupname.focus();
			    }else if(getLength(document.forms[0].des.value)>256){
			        errMsg+="简短描述不能大于256个字符！";
			        document.forms[0].des.focus();
			    }
			    if(errMsg=='')
		        {       
		            document.forms[0].action=theUrl;
		            if(jQuery('#form0').validateAll()){
		            	document.forms[0].submit()
				    }
		        }else{
		            if(errMsg!='')
		                alert(errMsg);
		            return false;
		        }
			}
			
			function LocationGroupkey(){
				var currGroupkey = '<%=(String)request.getAttribute("currGroupkey") %>';
				var str = ' (grouplevel=\'1\' or grouplevel=\'2\' ) and (groupkey = ' + currGroupkey + ' or upgroupkey = ' + currGroupkey + ')';
				locate_pop_window('<%= request.getContextPath() %>','t00_groupLocation','radio','forms[0]','upgroupkey,upgroupname',str);
			}
			
	</SCRIPT>
	</HEAD>
	<body class="mainbg">
		<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
			<html:form method="post" action="/group/group_add_do.do" styleId="form0">
				<div class="awp_wrap">
				  <!-- 标题区域 -->
				    <div class="cond_t">
					  <span>权限 - 新 建</span>
					  <span class="buttons">
					   <a href="group_list.do?newsearchflag=1"><img src="../../images/blue/b_back.png" />返回</a>
					  </span>
					</div>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class="cond_c2">
					  <table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<font color="#FF0000">*</font>组名：
							</td>
							<td>
								<html:text property="groupname" styleClass="text_white" size="40" 
								require="true" datatype="require|limit" min="4" max="32" msg="组名不能为空|长度应在4到32个字符之间"/>
							</td>
						</tr>
						<tr>
							<td nowrap>
								<font color="#FF0000">*</font>状态：
							</td>
							<td>
								<html:select property="flag">
									<html:options collection="flagMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								简短描述：
							</td>
							<td>
								<html:textarea property="des" cols="30" rows="3" styleId="des"
									styleClass="text_white"></html:textarea>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<html:button property="button" styleClass="in_button1" value="提 交"
									onclick="checkForm('group_add_do.do')" />
								<html:reset styleClass="in_button1" value="重 填" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
			
		</div>
	</BODY>
	<script>
		jQuery('#form0').checkFormSearch();
    </script>
</HTML>
