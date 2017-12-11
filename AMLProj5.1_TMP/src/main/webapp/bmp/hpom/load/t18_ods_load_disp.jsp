<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl){
	
        document.forms[0].action=theUrl;
        document.forms[0].submit();
	}
	
</SCRIPT>	
</head>

<body >
	<html:form action="/hpom/collist_transfer_order.do" method="POST">
	<div class="conditions">
	<div class="cond_t">
	   <span>列信息</span>
	   <span class="buttons">
	      <a href="javascript:void(0);" onClick="dosubmit('t18_ods_load_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
	   </span>
	</div>
   
	<table width="98%" align="center" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30" valign="bottom">
						表名：
							<%=request.getAttribute("tableename") %>
					</td>
				</tr>
	</table>
	<div  class='list'>
	<table border="0" cellpadding="0" cellspacing="0">
			<tr align="center">
				<td width="10%" nowrap>
					列英文名称			
				</td>
				<td width="10%" nowrap>
					列中文名称				
				</td>
				
				<td width="10%" nowrap>
					列表达式			
				</td>
				
				<td width="5%" nowrap>
					数据类型	
				</td>
				
				 <td width="5%" nowrap>
					列长度
				</td>
				<td width="5%" nowrap>
					列精度
				</td>
				<td width="5%" nowrap>
					函数表达式				
				</td>
			</tr>
			
			<logic:notEmpty name="list">
				 <logic:iterate id="dto" name="list"
					type="com.ist.bmp.hpom.dto.T18_col_pro">
					<TR align="center" >
						<TD noWrap>
							<bean:write name="dto" property="colename" />
						</TD>
						
						<TD noWrap>
							<bean:write name="dto" property="colcname" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="colexpress" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="coltype" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="colprecision" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="colscale" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="func_allname" />
						</TD>
					</TR>
				</logic:iterate>
				</logic:notEmpty>
		</table>
	</div>
	</div>
	</html:form>
</body>
</html>