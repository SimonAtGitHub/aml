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
function dosubmit(theUrl,type){
	var isSub = false;
	var errMsg = "";
	if(type=='list'){
		isSub = true;
	}
	if(isSub && errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
	}else{
		if(errMsg!='')
			alert(errMsg);
		return false;
	}
}

</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<script type="text/javascript" src="../../js/calendar.js"></script>
			<html:form action="/pbc/getT1q_pbc_apply_definedList.do" method="post">
				<div class="conditions">
				<div class="cond_t">
						<span>数据检查规范定义列表</span>
					</div>
					</div>
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center>
 							 <th>序号</th>  
  							 <th>表英文名称</th>
  							 <th>表中文名称</th>
  							<!--  <th>说明</th>    -->
  							 <th>操作</th>   
						</TR>
						<logic:iterate id="ta_pbc_apply" name="ta_pbc_applyList" indexId="i"
							type="com.ist.bmp.pbc.dto.T1q_pbc_apply">
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
							    
							    <TD>
									  <%= i.intValue() + 1 %>

								</TD>
							
								<TD>
									<bean:write name="ta_pbc_apply" property="table_ename" />
								</TD>
								<TD>
									<bean:write name="ta_pbc_apply" property="table_cname" />
								</TD>
								<!-- 
								<TD>
									<bean:write name="ta_pbc_apply" property="table_desc" />
								</TD>
								 -->
								<TD>
								<a href="javascript:void(0);" onclick="dosubmit('getT1q_apply_define_columns.do?newsearchflag=1&table_ename=<bean:write name="ta_pbc_apply" property="table_ename" />','list')">查看<a>	
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>

				</div>

			</html:form>
		</div>
	</BODY>
</HTML>
