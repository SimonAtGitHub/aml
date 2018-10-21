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
    <script type="text/javascript" src="../../js/calendar.js"></script>
     <script type="text/javascript" >
     </script>
</head>
<body>
<div id='content'>
<html:form  method="post" action="/pbc/getT1q_pbc_app_modify.do" >
 
 <!-- conditions -->
				<div class="conditions">
					 <!-- 标题区域 -->
  <div class='awp_title'>
         <table>
          <tr>
           <td width="23%"><span class="awp_title_td2"><strong>数据提取信息查看</strong></span></td>
            <td align="right">
            <span class="buttons"> 
				 <a href="#" onclick="window.close();">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />关 闭
				 </a> 
				</span>
			</td>
          </tr>
         </table>
	</div>
	<div class="awp_detail">
		<div class="cond_c2">
								<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>提取编号：</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="tb_id" />
									</td>
									</tr>
								<tr>
									<td>状态：</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_status_disp" />
									</td>
									</tr>
								  <tr>
									<td>提取日期范围：</td>
									<td>
									 <bean:write name="t1q_pbc_apply" property="apply_dt_start_disp" />
									--
									<bean:write name="t1q_pbc_apply" property="apply_dt_end_disp" />
									</td>
									</tr>
									<tr>
									<td>申请时间：</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_dt_disp" />
									</td>
									</tr>
									<tr>
									<td>提数机构：</td>
									<td bgcolor="F6F9FF">
									<bean:write name="t1q_pbc_apply" property="organName" />
									</td>
									</tr>
									<tr>
									<td>导出格式：</td>
									<td >
									<bean:write name="t1q_pbc_apply" property="file_type_disp" />
									</td>
									</tr>
									<tr>
									<td>申请机构：</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_organname" />
									</td>
									</tr>
									<tr>
									<td>数据提取原因：</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_reason" />
									</td>
									</tr>
									<logic:equal value="2" name="t1q_pbc_apply" property="apply_status">
									<tr>
									<td>退回原因：</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="return_advi" />
									</td>
									</tr>
									</logic:equal>
								</table>
							</div>
</div>
</div>
</html:form>
</div>
</body>
</html:html>