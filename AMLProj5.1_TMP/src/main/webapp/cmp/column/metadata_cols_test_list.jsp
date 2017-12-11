<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.ist.common.metadata.dto.T01_mt_col_pro"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>


<html:html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl,type) {
		var f=document.forms[0];	   
	    f.action=theUrl;
	    f.submit();
	}

</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0">
<div id='content'>
	<html:form action="/column/metadata_cols_list.do"
		method="POST">

		<html:hidden property="tablekey" />
		<div class="conditions">
            <div class="cond_t">
               <span>元数据管理- 表 - 列测试</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit('metadata_cols_list.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />返 回</a>
			   </span>
            </div>	

		<table width="98%" align="center" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td height="30" valign="bottom">
					表英文名：
					<bean:write name="t01_mt_property" property="tableename" />
					表中文名：
					<bean:write name="t01_mt_property" property="tablecname" />
				</td>
			</tr>
		</table>
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>

		<div class='list'>
			<table>
		<tr align="center">

			    <logic:notEmpty name="metadata_colsList">
			      <th height=22 noWrap>
			          序号
			      </th>
			    </logic:notEmpty>
				<logic:iterate id="dto" name="metadata_colsList"
					type="com.ist.common.metadata.dto.T01_mt_col_pro">
					<th height=22 noWrap>
						<bean:write name="dto" property="colename" />
					</th>
				</logic:iterate>
			</TR>

			<%
			            int index = 0;
			            ArrayList dataList = (ArrayList) request
			                    .getAttribute("testDataList");
			            ArrayList testCols = (ArrayList) request
			                    .getAttribute("metadata_colsList");
			            Iterator listItor = dataList.iterator();
			            while (listItor.hasNext()) {
			                   index++;
			%>
			<TR align="center" bgcolor="#FFFFFF" height="22px">
			    <logic:notEmpty name="testDataList">
			      <TD noWrap>
			         <%=index %>
			      </TD>
			    </logic:notEmpty>
				<%
				                Map rd = (HashMap) listItor.next();
				                System.out.println(rd);
				                Iterator tIter = testCols.iterator();
				                while(tIter.hasNext()){
				                	T01_mt_col_pro bean = (T01_mt_col_pro)tIter.next();
				                	String key = bean.getColename().toUpperCase();
				%>
				<TD noWrap>
					<%=rd.get(key)%>
				</TD>
				<%
				}
				%>
			</TR>
			<%
			}
			%>	

		</TABLE>
		</div>
	</html:form>
	</div>
</body>
</html:html>
