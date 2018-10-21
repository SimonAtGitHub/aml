<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>

		<script language="JavaScript">
	
function locate_order_window001(load_page_path){	
	//var whole_path = load_page_path+'/common/location_orderwindow.do?id='+id+'&name='+name+'&tablename='+tablename+'&keyname='+keyname+'&seqname='+seqname;
    var whole_path = load_page_path+'/common/location_orderwindow.do';
    var	property = 'height=450, width=600,left=370,top=100,scrollbars=yes,resizable=yes'; 
     window.open('<%=request.getContextPath()%>/platform/pub/blank.jsp', 'checktest', property);
     document.forms[0].action=whole_path;
     document.forms[0].target='checktest';
     document.forms[0].submit();
}
function dosubmit(theUrl){
    selectAllOptions(document.forms[0].list2);
	var errMsg = "";//提示信息
    var isSub = true;//确认操作
	if(getLength(document.forms[0].list2.value)==0){
        errMsg="提取字段不能为空！";
        isSub= false;
    }
     if(isSub && errMsg==''){
		 if(confirm('确认保存此信息！')){
			 selectAllOptions(document.forms[0].list2);
		     document.forms[0].action=theUrl+'?table_ename=<bean:write  name='t1q_pbc_applyActionForm' property='table_ename' />'+'&tb_id=<bean:write  name='t1q_pbc_applyActionForm' property='tb_id' />';
		     document.forms[0].submit();
		     window.close();
			}
	}else{
		alert(errMsg);
        return false;
	}		
}
</script>
	</head>
<body class="mainbg"><br />
	<html:form method="post" action="/pbc/t1q_pbc_apply_conf_save.do">
	<html:errors/>
	<div id="main">
  <!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>设置字段</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('t1q_pbc_apply_conf_save.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />保存</a>
	   <a href="#" onclick="javascript:window.close();return false;"><img src="../../images/<%=session.getAttribute("style") %>/closebtn.gif" />关闭</a>
	  </span>
	</div>
  <html:errors/>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	 <tr>
      <td>
      <font color="#FF0000">*</font>字段设置：</td>
      <td  colspan="3">
          <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
          <%=multiSeHTMLStr%>
      </td>
      
    </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</HTML>
