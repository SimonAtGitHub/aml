<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>系统管理-关键字库</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 	
		function dosubmit(theUrl,type){
	      var errMsg = "";
	      var isSub = false;
	      if(type=='modi'){
	        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
	        isSub = true;
	      }else if(type=='del'){
		    errMsg = CheckBoxMustChecked(document.forms[0]);
		    if(errMsg==''){
			  if(confirm('确认进行删除操作？')){
				isSub = true;
			  }
		    }
	      }else if(type=='search'){
	       if(getLength(document.forms[0].keywordname.value)>64){
              errMsg="关键字名不能大于64个字符！";
              document.forms[0].keywordname.focus();
              }	        
		    isSub = true;
	      }else if(type=='add'){
	          isSub=true;
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
	</head>

	<body leftmargin="0" topmargin="0">
		<html:form  method="post"
			action="/system_manager/t12_keywords_library/t12_keywords_library_list.do">
			<table width="98%" border="0" align="center" cellpadding="2"
				cellspacing="0">
				<tr>
					<td class="td1">
						<span class="css014"> <strong><font color="0072BC">关键字库
									- 关键字列表</font>
						</strong> </span>
					</td>
					<td width="22%" align="right" nowrap class="td2">
						<input type=button value="新  建" name=Button22 class="input"
							onClick="awpDoSubmit('cms/system_manager/t12_keywords_library/t12_keywords_library_add.do','add')">						
						<input type=button value="删  除" name=Button3 class="input"
							onClick="awpDoSubmit('cms/system_manager/t12_keywords_library/t12_keywords_library_delete_do.do','del')">
					</td>
				</tr>
			</table>


			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8">

					</td>
				</tr>
			</table>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<TABLE align=center border=1 cellPadding=0 borderColor=333333
				cellSpacing=0 style="BORDER-COLLAPSE: collapse;" width="98%">
				<TBODY>
					<TR>
						<TD
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr class="deep">
									<td width="15%" align="right" class="deep">
										关键字类型：
									</td>
									<td width="35%" class="light">
									  <html:select property="keywordtype" styleClass="select">
						                 <html:options collection="keywordtypeMap" property="label" labelProperty="value"/>
					                  </html:select>
									</td>
									<td width="15%" align="right" class="deep">
										关键字名称：
									</td>
									<td width="35%" class="light">
										<html:text property="keywordname"/>
										<input type="button"  value="查 询"
											onClick="dosubmit('cms/system_manager/t12_keywords_library/t12_keywords_library_list.do?newsearchflag=1','search')"
											class="input">
									</td>
									<td width="35%" class="light">
										&nbsp;
									</td>
									<td width="35%" class="light">
										&nbsp;
									</td>

								</tr>

							</table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<TABLE width="98%" border=0 align="center" cellpadding="2"
				cellspacing="1" bgcolor="#000000">
				<TR align=center bgcolor="A3C0EE">
					<TD height=22 width="10%">
						<input type="checkbox" name="keywords" value="0"
							onClick="selectORClearBox(forms[0],this.checked)">
					</TD>
					<TD width="25%" noWrap >
						关键字类型
					</TD>
					<TD width="65%" nowrap>
						关键字名称
					</TD>
				</TR>
				
				<c:forEach var="dto" items="${resultList}" >
				<TR align="center" bgcolor="#FFFFFF">
					<TD height=22>
						<input type="checkbox" name="keywordtype" value="<c:out value="${dto[0]}" />"/>						
					</TD>
					<TD nowrap>
						<c:out value="${dto[1]}" />
					</TD>
					<TD noWrap>
						<c:out value="${dto[2]}" />
					</TD>
				</TR>
				</c:forEach>
				
			</TABLE>
			<!--
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
				<tr>
					<td align="center">
						<c:out value="${pageInfo}" escapeXml="false" />
					</td>
				</tr>
			</table>
			  -->
		</html:form>

	</body>
	
</html>
