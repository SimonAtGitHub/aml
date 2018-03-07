<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>数据提取申请</title>
  <%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
	<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <link id="skincss" href="../../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
     <script type="text/javascript" >
   
     </script>
</head>
<body>
<div id='content'>
<html:form  method="post" action="/pbc/getT1q_pbc_applyList.do" >
 
 
  <!-- 标题区域 -->
  <div class='awp_title'>
         <table>
          <tr>
           <td width="23%"><span class="awp_title_td2"><strong>文件查看</strong></span></td>
            <td align="right">
			<span class="buttons">
				<a href="#" onclick="window.close();" ><img src="../../images/blue/b_shut.png" />关闭</a>
			</span>
			</td>
          </tr>
         </table>
	</div>
	<div class="awp_detail">
		<div class="cond_c2">
								<table border="0" cellpadding="0" cellspacing="0">
								  <tr>
									<td>压缩包名：</td>
									<td>
										<bean:write name="t1q_pbc_apply" property="zip_name"/>
									</td>
									</tr>
									<tr>
									<td>大小（KB）：</td>
									<td >
										<bean:write name="t1q_pbc_apply" property="zip_size"/>
									</td>
									</tr>
									<tr>
									<td>路径：</td>
									<td >
										<bean:write name="t1q_pbc_apply" property="file_path"/>
									</td>
									</tr>
															
								</table>
							</div>
</div>
</html:form>
</div>
</body>
</html:html>