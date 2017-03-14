<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../js/basefunc.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].organkey)<0){
        errMsg+="请选择您要加入的机构！";
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
	<body class="mainbg">
<html:form action="/common/t00_organ_search.do" method="post">
<html:hidden property="input_name"/>
<html:hidden property="input_name_disp"/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>机构信息查询</span>
	  <span class="buttons">
	   <a href="#" onclick="checkForm('t00_organ_search_result.do')"><img src="../images/<%=session.getAttribute("style") %>/b_add.png" />选 定</a>
	  <a href="#" onclick="window.close()"><img src="../images/<%=session.getAttribute("style") %>/b_edit.png" />关 闭</a>
	  </span>
	</div>
  <!-- table content -->
	<div class="cond_c">
	  <table border="0" cellpadding="0" cellspacing="0">
	    <tr>
      <td>
        机构号：
        </td>
        <td>
        <html:text property="okey"  size="10"/>
        </td>
        <td>
        机构名称：
        </td>
        <td>
        <html:text property="oname" size="15"/>
        <input  type="button" name="" value="查  询" class="in_button1" onclick="dosubmit('t00_organ_search.do?newsearchflag=1')"/>
        <html:button property="s2" value="清  空" styleClass="in_button1" onclick="document.forms[0].okey.value='';document.forms[0].oname.value=''"/>
       </td>
    </tr>
    </table>
	</div>
  </div>	
  <html:errors/>
  <!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th>选择</th>
		<th>机构号</th>
		<th>机构名称</th>
		<th>状 态</th>
		<th>创建时间</th>

	  </tr>
  
<logic:iterate id="organ" name="t00_organList" type="com.ist.platform.dto.T00_organ">
    <tr>
      <td >
          <html:radio property="organkey" idName="organ" value="organkey"></html:radio>
      </td>
      <td><bean:write name="organ" property="organkey" scope="page"/></td>
      <td><bean:write name="organ" property="organname" scope="page"/></td>
      <td><bean:write name="organ" property="flag_disp" scope="page"/></td>
      <td><bean:write name="organ" property="createdate_disp" scope="page"/></td>
    </tr>
</logic:iterate>
   </table>
  </div>		
	<html:errors />
	<!-- list_page --> 
  <div class="list_page">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
    </div>
<!-- all end -->   
</div>
		</html:form>
</body>
</html>