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
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/pbc/performGetT1q_pbc_file_info.do" method="post">
			<div class="conditions">
				<div class="cond_t">
						<span>任务查看</span>
						<span class="buttons">
						 <a href="#" onclick="dosubmit('getT1q_pbc_apply_task_logList.do');"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
						</span>
					</div>
					</div>
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
 							 <th>表英文名称</th>     
  							 <th>表中文名称</th>
  							 <th>总记录数</th> 
  							 <th>文件名称</th>   
  							 <th>文件个数</th>   
  							 <th>文件大小</th>   
						</TR>
						<logic:iterate id="t1q_pbc_apply" name="t1q_pbc_applyList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
							
								<TD>
									<bean:write name="t1q_pbc_apply" property="table_ename" />
								</TD>
								<TD>
									<bean:write name="t1q_pbc_apply" property="table_cname" />
								</TD>
								<TD>
									<bean:write name="t1q_pbc_apply" property="table_count" />
								</TD>
								<TD>
									<bean:write name="t1q_pbc_apply" property="file_name" />
								</TD>
								<TD>
									<bean:write name="t1q_pbc_apply" property="file_count" />
								</TD>
								<TD>
									<bean:write name="t1q_pbc_apply" property="file_size" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
