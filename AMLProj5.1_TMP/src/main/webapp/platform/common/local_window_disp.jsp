<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
	/**
	 * 客户选择公共页面：
	 * 权限：公共页面没有权限控制
	 * 接口参数：
	 * form_name form框的名字
	 * input_name 客户号的文本框的名字
	 * input_name1 客户名称的文本框的名字
	 * 例如：<input type=button value="查 询" name=Button52 class="text_white" onClick="window.open('/pub/cp_host_cust_id_search.jsp?form_name=form1&input_name=s_host_cust_id','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
	 *         <html:button property="b2" value="查 询" styleClass="input" onclick="window.open('/common/t00_user_search.do?input_name=username&input_name_disp=realname','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"/>
	 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>定位</title>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/awp_base.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].selectedkey)<0){
        errMsg+="请选择您要加入机构号！";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
//全选切换
function selectORClearBox(_setval){
   var _form=document.forms[0];
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	
</SCRIPT>
	</HEAD>
	<body class="mainbg">
		<html:form action="/t00_category/category.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">	
					<!-- title -->
						<div class="cond_t">
	  					
	 						 <span class="buttons">
							<a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />关闭</a> 
							</span>
				</div>
				</div>
				<!-- list -->
				<div class="list">
					<TABLE width="98%" border=0 align="center" cellpadding="2"
						cellspacing="1">
						<TR align=center>
							<Th width="20%">
								代码
							</Th>
							<Th width="20%">
								描述
							</Th>


						</TR>
						<logic:iterate id="list" name="categoryList"
							type="com.ist.platform.dto.T00_category">

							<TR align="center" bgcolor="#FFFFFF">

								<TD height=22 noWrap>
									<bean:write name="list" property="categorykey" scope="page" />
								</TD>
								<TD height=22 noWrap>
									<bean:write name="list" property="categoryname" scope="page" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
			</div>
		</html:form>
	</BODY>

</HTML>


