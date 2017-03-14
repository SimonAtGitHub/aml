<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link  href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript"  src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
		
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='modi'){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);     
		        isSub = true;
		    }
		    else if(type=='del'){
		        errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('你真的要删除选择的列吗？')){
		                isSub = true;
		            }
		        }
		    }
		    else if(type=='add'){
		    	isSub = true;
		    }
		    else if(type=='search'){
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
	 
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/hpom/t18_dm_tabledisp.do" method="POST">

			 <div class='awp_title'>
				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">DM数据表管理- 表 - 列信息 
							</span>
						</td>
						<td align="right">
						<html:button property="button2" value="返 回" styleClass="input"
							onclick="dosubmit('t18_dmtable_list.do','search')" />
						</td>
					</tr>
				</table>
			</div>      
			<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle"/>
			</html:messages>
				
			<table width="98%" align="center" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30" valign="bottom">
						表英文名：
							<%=request.getAttribute("tableename") %>&nbsp;&nbsp;
						
						表中文名：
							<%=request.getAttribute("tablcname") %>
					</td>
				</tr>
			</table>
			 
		<div class='awp_list'>			   
			<table id="table1">
				<tr align="center">
					<TD noWrap>
						英文名称
					</TD>
					<TD noWrap>
						中文名称
					</TD>
					<TD noWrap>
						表达式
					</TD>
					 <TD noWrap>
						数据类型
					</TD>
					<TD noWrap>
						描述
					</TD>
				</TR>
				<logic:notEmpty name="list">
				 <logic:iterate id="dto" name="list"
					type="com.ist.common.metadata.dto.T01_mt_col_pro">

					<TR align="center" >
						<TD noWrap>
							<bean:write name="dto" property="colename" />
						</TD>
						
						<TD noWrap>
							<bean:write name="dto" property="colcname" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="colename" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="coltype_disp" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="colcname" />
						</TD>
					</TR>
				</logic:iterate>
				</logic:notEmpty>
			</TABLE>
		</div>
		</html:form>
	</div>
	</BODY>
</HTML>
