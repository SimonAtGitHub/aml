<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>

<script language="JavaScript">


</script>
</head>

<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/pbc/t1q_apply_result_file.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>数据提取详细信息</span>
	   <span class="buttons">
			<a href="#" onclick="window.close();" ><img src="../../images/blue/b_shut.png" />关闭</a>
	   </span>
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	   <TR align=center>
			   	<th>文件名</th> 
			  	<th>表名</th> 
 				<th>文件类型</th>     
  				<th>文件大小(KB)</th> 
  				<th>文件路径</th>   
  				<th>压缩包名</th>   
  		</TR>
		<logic:iterate id="t1q_pbc_apply" name="t1q_pbc_applyList" indexId="i"
				type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
		<TR align="center" class="interval"
			onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
		<TD>
			<bean:write name="t1q_pbc_apply" property="file_name" />
		</TD>
		<TD>
			<bean:write name="t1q_pbc_apply" property="table_ename" />
		</TD>
		<TD>
			<bean:write name="t1q_pbc_apply" property="file_type_disp" />
		</TD>
		<TD>
			<bean:write name="t1q_pbc_apply" property="file_size" />
		</TD>
		<TD>
			<bean:write name="t1q_pbc_apply" property="file_path" />
		</TD>
		<TD>
			<bean:write name="t1q_pbc_apply" property="zip_name" />
		</TD>
		</TR>
		</logic:iterate>
	  </table>
	</div>
  </div>
</html:form>
</div>
</BODY>
</HTML>