<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������ȡ����</title>
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
					 <!-- �������� -->
  <div class='awp_title'>
         <table>
          <tr>
           <td width="23%"><span class="awp_title_td2"><strong>������ȡ��Ϣ�鿴</strong></span></td>
            <td align="right">
            <span class="buttons"> 
				 <a href="#" onclick="window.close();">
						      <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��
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
									<td>��ȡ��ţ�</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="tb_id" />
									</td>
									</tr>
								<tr>
									<td>״̬��</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_status_disp" />
									</td>
									</tr>
								  <tr>
									<td>��ȡ���ڷ�Χ��</td>
									<td>
									 <bean:write name="t1q_pbc_apply" property="apply_dt_start_disp" />
									--
									<bean:write name="t1q_pbc_apply" property="apply_dt_end_disp" />
									</td>
									</tr>
									<tr>
									<td>����ʱ�䣺</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_dt_disp" />
									</td>
									</tr>
									<tr>
									<td>����������</td>
									<td bgcolor="F6F9FF">
									<bean:write name="t1q_pbc_apply" property="organName" />
									</td>
									</tr>
									<tr>
									<td>������ʽ��</td>
									<td >
									<bean:write name="t1q_pbc_apply" property="file_type_disp" />
									</td>
									</tr>
									<tr>
									<td>���������</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_organname" />
									</td>
									</tr>
									<tr>
									<td>������ȡԭ��</td>
									<td>
									<bean:write name="t1q_pbc_apply" property="apply_reason" />
									</td>
									</tr>
									<logic:equal value="2" name="t1q_pbc_apply" property="apply_status">
									<tr>
									<td>�˻�ԭ��</td>
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