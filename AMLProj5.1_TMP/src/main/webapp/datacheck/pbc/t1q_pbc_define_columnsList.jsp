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
		function dosubmit(theUrl){
		 document.forms[0].action=theUrl;
	     document.forms[0].submit();
		}

</script>
	</head>
<body leftmargin="0" topmargin="0" class="mainbg">
		<div id="main">
		
			<!-- conditions -->
			  <div class="conditions">
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/pbc/getT1q_apply_define_columns.do" method="post">
				<div class="cond_t">
						<span>详细信息查看</span>
					
						<span class="buttons">
	   <a href="#" onclick="dosubmit('getT1q_pbc_apply_definedList.do');"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	  </span>
					</div>
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
  							 <th>表英文名称</th>
  							 <th>字段名称</th>
  							 <th>字段说明</th>   
  							 <th>字段类型</th> 
  							 <th>字段长度</th>     
						</TR>
						<logic:iterate id="ta_pbc_apply" name="ta_pbc_define_columnsList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
							
								<TD>
									<bean:write name="ta_pbc_apply" property="table_ename" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="column_ename" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="column_cname" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="data_type" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="data_length" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			</html:form>
			</div>
		</div>
	</BODY>
</HTML>
